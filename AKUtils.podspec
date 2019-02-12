Pod::Spec.new do |s|
  s.name             = 'AKUtils'
  s.version          = '1.0.5'
  s.summary          = 'Utils for different things'

  s.homepage         = 'https://github.com/Artem-Kalmykov/AKUtils'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Artem Kalmykov' => 'ar.kalmykov@yahoo.com' }
  s.source           = { :git => 'https://github.com/Artem-Kalmykov/AKUtils.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.swift_version = '4.2'

  s.source_files = 'AKUtils/AKUtils/**/*.{m,h,mm,hpp,cpp,c,swift}'

  s.public_header_files = 'AKUtils/AKUtils/AKUtils.h'
  s.frameworks = 'UIKit'
end
