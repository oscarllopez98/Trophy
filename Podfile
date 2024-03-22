source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '8.0'
use_frameworks!

target 'Trophy' do
	pod 'AWSAPIGateway', '~> 2.6.33'
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