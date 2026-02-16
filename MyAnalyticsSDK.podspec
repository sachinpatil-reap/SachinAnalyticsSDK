Pod::Spec.new do |spec|

  spec.name         = "MyAnalyticsSDK"
  spec.version      = "1.0.2"
  spec.summary      = "Zero-code Firebase analytics SDK"
  spec.description  = "Automatic global Firebase analytics wrapper for iOS"

  spec.homepage     = "https://github.com/sachinpatil-reap/SachinAnalyticsSDK"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Sachin Patil" => "p.sachin@reapmind.com" }

  spec.source       = {
    :git => "https://github.com/sachinpatil-reap/SachinAnalyticsSDK.git",
    :tag => spec.version.to_s
  }

  spec.ios.deployment_target = "15.0"
  spec.swift_version = "5.0"

  spec.static_framework = true

  spec.source_files = "Sources/**/*.swift"

  spec.dependency "Firebase/Analytics"

  spec.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES'
  }

end
