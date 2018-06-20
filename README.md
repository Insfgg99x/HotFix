# HotFix
一种轻量级的可以通过苹果审核的热修复方案，可以替代JSPatch。

-----------------------------------

## 使用 Usage

- 1.App启动时，用同步的方式调用接口，从服务器请求下发的JavaScript字符串

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //sync downloading js here
    //App启动时，主动同步请求服务端修复脚本，并执行修复方案
    //do something else
    return YES;
}
```
- 2.执行修复
下载完成后，同步的方式执行修复：
```
[[HotFix shared] fix:js];
```

两步合到一起：
```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //sync downloading js here
    //App启动时，主动同步请求服务端修复脚本，并执行修复方案
    //这个里的js应该是通过同步的方式请求接口得到的，如:
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://xxxx/hotfix?access_token=xxxx"]];//调用获取修复脚本的接口
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSString *js = json[@"hotfix_js"];//这里只是举个例子
    if(js) {
        [[HotFix shared] fix:js];
    }
    //do something else
    return YES;
}
```

## 举个栗子🌰 For Example
ViewController里有一个这样的调用，参数为nil时会导致崩溃。
```
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self join:@"Steve" b:nil];
}
- (void)join:(NSString *)a b:(NSString *)b {
    NSArray *tmp = @[a,b,@"Good Job!"];
    NSString *c = [tmp componentsJoinedByString:@" "];
    printf("%s\n",[c UTF8String]);
}

@end
```
我们从服务器下发这段脚本来修复这个闪退（替换`join:b:`这个方法）:
```
"fixInstanceMethodReplace('ViewController', 'join:b:', function(instance, originInvocation, originArguments){ 
    if (!originArguments[0] || !originArguments[1]) { 
        console.log('nil goes here'); 
    } else { 
        runInvocation(originInvocation); 
    } 
});"
```
App重新启动的时候，会以同步的方式加载到该脚本，并执行修复：
```
[[HotFix shared] fix:js];
```
这样原来的`jion:b:`方法就会被替换，当参数为nil时，就会打印`nil gose here`，若部位nil则正常执行。这样崩溃就解决了~

## 安装 Installation

```
pod repo update
pod `HotFix`
```

- 更多信息请参考该[链接](http://limboy.me/tech/2018/03/04/ios-lightweight-hotfix.html)
