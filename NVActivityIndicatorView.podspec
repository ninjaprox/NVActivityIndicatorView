Pod::Spec.new do |s|
  s.name              = 'NVActivityIndicatorView'
  s.version           = '5.1.1'
  s.summary           = 'A collection of awesome loading animations'
  s.homepage          = 'https://github.com/ninjaprox/NVActivityIndicatorView'
  s.screenshot        = 'https://raw.githubusercontent.com/ninjaprox/NVActivityIndicatorView/master/Demo.gif'
  s.license           = { type: 'MIT', file: 'LICENSE' }
  s.author            = { 'Vinh Nguyen' => 'ninjaprox@gmail.com' }
  s.social_media_url  = 'http://twitter.com/ninjaprox'
  s.documentation_url = 'https://nvactivityindicatorview.vinhis.me'

  s.ios.deployment_target  = '9.0'
  s.tvos.deployment_target = '9.0'
  s.swift_version          = '5.0'

  s.source = { git: 'https://github.com/ninjaprox/NVActivityIndicatorView.git',
               tag: s.version }

  s.subspec 'Base' do |ss|
    ss.source_files = 'Sources/Base/**/*.swift'
  end
  s.subspec 'Extended' do |ss|
    ss.dependency 'NVActivityIndicatorView/Base'
    ss.source_files = 'Sources/Extended/**/*.swift'
  end
  s.default_subspec = 'Base'

  s.frameworks = 'UIKit', 'QuartzCore'
end
