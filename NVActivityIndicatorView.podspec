Pod::Spec.new do |s|
  s.name         = "NVActivityIndicatorView"
  s.version      = "2.9"
  s.summary      = "A collection of nice loading animations"
  s.homepage     = "https://github.com/ninjaprox/NVActivityIndicatorView"
  s.screenshots  = "https://raw.githubusercontent.com/ninjaprox/NVActivityIndicatorView/master/Demo.gif"
  s.license      = { :type => "MIT" }
  s.author             = { "Nguyen Vinh" => "ninjaprox@gmail.com" }
  s.social_media_url   = "http://twitter.com/ninjaprox"

  s.platform     = :ios, '8.0'

  s.source       = { :git => "https://github.com/ninjaprox/NVActivityIndicatorView.git", :tag => "v#{s.version}" }
  s.source_files  = "NVActivityIndicatorView/**/*.swift"

  s.frameworks = "UIKit", "QuartzCore"
  s.requires_arc = true
end
