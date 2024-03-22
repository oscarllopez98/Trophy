source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '8.0'
use_frameworks!


# There are no targets called "Shows" in any Xcode projects
abstract_target 'TrophyGroup' do
  pod 'AWSAPIGateway', '~> 2.6.33'
  pod 'AWSCore'

  # Has its own copy of ShowsKit + ShowWebAuth
  target 'Trophy' do
    #
  end

  # Has its own copy of ShowsKit + ShowTVAuth
  target 'TrophyTests' do
    #
  end
end



post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
            end
        end
    end
end