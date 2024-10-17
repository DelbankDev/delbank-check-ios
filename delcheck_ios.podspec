Pod::Spec.new do |spec|

  spec.name         = "delcheck_ios"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of delcheck_ios."
  spec.homepage     = "https://github.com/DelbankDev/delbank-check-ios"


  s.author            = { 'Douglas Abreu' => 'douglasabrel97@gmail.com'}
  s.license           = 'MIT'


  spec.platform     = :ios


  s.ios.deployment_target = '11.0'
  s.ios.vendored_frameworks = 'delcheck_ios.framework'
  spec.source       = { :git => "https://github.com/DelbankDev/delbank-check-ios.git", :tag => s.version.to_s }

  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  
  s.dependency 'GoogleMLKit/FaceDetection', '4.0.0'
end
