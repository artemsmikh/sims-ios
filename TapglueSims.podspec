#
# Be sure to run `pod lib lint sims-ios.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TapglueSims'
  s.version          = '0.1.0'
  s.summary          = 'A short description of TapglueSims.'

  s.homepage         = 'https://github.com/<GITHUB_USERNAME>/sims-ios'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'John Nilsen' => 'nilsen340@gmail.com' }
  s.source           = { :git => 'https://github.com/<GITHUB_USERNAME>/sims-ios.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'sims-ios/Classes/**/*'
  
  # s.resource_bundles = {
  #   'sims-ios' => ['sims-ios/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Alamofire', '~> 3.4'
  s.dependency 'Tapglue', '1.1.8'
end
