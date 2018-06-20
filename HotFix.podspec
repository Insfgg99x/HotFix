Pod::Spec.new do |s|
s.name         = "HotFix"
s.version      = "1.0.0"
s.summary      = "HotFix轻量级的热修复框架，可以替换JSPatch并且上架App Store."
s.homepage     = "https://github.com/Insfgg99x/HotFix"
s.license      = "MIT"
s.authors      = { "CGPointZero" => "newbox0512@yahoo.com" }
s.source       = { :git => "https://github.com/Insfgg99x/HotFix.git", :tag => "1.0"}
s.ios.deployment_target = '7.0'
s.source_files = 'HotFix/*.{h,m}'
s.requires_arc = true
s.dependency 'Aspects'
end

