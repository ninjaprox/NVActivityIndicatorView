Pod::Spec.new do |s|
  s.name         = "SCLAlertView"
  s.version      = "0.6.0"
  s.summary      = "Beautiful Alert View. Written in Swift"
  s.homepage     = "https://github.com/vikmeup/SCLAlertView-Swift"
  s.screenshots  = "https://raw.githubusercontent.com/vikmeup/SCPopUpView/master/errorScreenshot.png", "https://raw.githubusercontent.com/vikmeup/SCPopUpView/master/successScreenshot.png"
  s.license      = { :type => "MIT", :file => "LICENCE" }
  s.author             = { "Viktor" => "yazexel@gmail.com" }
  s.social_media_url   = "http://twitter.com/vikmeup"
  s.platform     = :ios
  s.ios.deployment_target = '8.0'
  s.source       = { :git => "https://github.com/vikmeup/SCLAlertView-Swift.git", :tag => s.version }
  s.source_files  = "SCLAlertView/*.{swift}"
  #s.framework  = "QuartzCore"
  s.requires_arc = true
end
