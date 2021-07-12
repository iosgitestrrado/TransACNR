# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'TransACNR' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
pod 'Alamofire', '~> 4.0'
pod 'IQKeyboardManagerSwift', '5.0.0'
pod 'SDWebImage', '~>3.8'
pod 'DropDown', '~>2.0'
pod 'NVActivityIndicatorView'
pod 'Toast-Swift', '~> 2.0.0'
pod 'SkyFloatingLabelTextField', '~> 3.0'
pod 'Siren'
  # Pods for TransACNR
 
end
post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
end
