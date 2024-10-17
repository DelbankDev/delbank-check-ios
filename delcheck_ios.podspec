Pod::Spec.new do |spec|

  spec.name         = "delcheck_ios"
  spec.version      = "0.0.2"
  spec.summary      = "A short description of delcheck_ios."
  spec.homepage     = "https://github.com/DelbankDev/delbank-check-ios"


  spec.author            = { 'Douglas Abreu' => 'douglasabrel97@gmail.com'}
  spec.license           = 'MIT'


  spec.platform     = :ios


  spec.ios.deployment_target = '11.0'
  spec.ios.vendored_frameworks = 'delcheck_ios.framework'
  spec.source       = { :git => "https://github.com/DelbankDev/delbank-check-ios.git", :tag => spec.version.to_s }

  spec.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  
  spec.dependency 'GoogleMLKit/FaceDetection', '4.0.0'
end
