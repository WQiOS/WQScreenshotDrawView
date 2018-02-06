
Pod::Spec.new do |s|

s.name         = "WQScreenshotDrawView"
s.version      = "0.0.5"
s.summary      = "弹幕小插件"

s.description  = <<-DESC
自己总结的弹幕小插件，欢迎使用。
DESC

s.homepage     = "https://github.com/WQiOS/WQScreenshotDrawView"
s.license      = "MIT"
s.author             = { "王强" => "1570375769@qq.com" }
s.platform     = :ios, "8.0" #平台及支持的最低版本
s.requires_arc = true # 是否启用ARC
s.source       = { :git => "https://github.com/WQiOS/WQScreenshotDrawView.git", :tag => "#{s.version}" }
core.source_files = "WQScreenshotDrawView/WQScreenshotDrawView/*.{h,m}"
s.ios.framework  = 'UIKit'

end

