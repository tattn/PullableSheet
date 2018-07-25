Pod::Spec.new do |s|
  s.name             = 'PullableSheet'
  s.version          = '0.0.1'
  s.summary          = 'Pullable sheet like a default map app or bottom sheets (Android).'

  s.description      = <<-DESC
Pullable sheet like a default map app or bottom sheets (Android).
https://github.com/tattn/PullableSheet
                       DESC

  s.homepage         = 'https://github.com/tattn/PullableSheet'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'git' => 'tanakasan2525@gmail.com' }
  s.source           = { :git => 'https://github.com/tattn/PullableSheet.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/tanakasan2525'

  s.ios.deployment_target = '10.0'

  s.source_files = 'Sources/**/*'
  
  s.public_header_files = 'Sources/**/*.h'
  s.frameworks = 'UIKit'
end
