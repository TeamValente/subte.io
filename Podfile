# Uncomment this line to define a global platform for your project
source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/Artsy/Specs.git'

platform :ios, '9.0'
use_frameworks!

target 'Subte.io' do

    pod 'UIColor_Hex_Swift', '~> 3.0'
    pod 'Alamofire', '~> 4.0'
    pod 'SwiftyJSON', :git => 'https://github.com/acegreen/SwiftyJSON.git', :branch => 'swift3'
    
    #pod 'Spring', :git => 'https://github.com/MengTo/Spring.git'
    #pod 'Fabric'
    #pod 'Crashlytics'
    
    # Firebase
    #pod 'Firebase'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
