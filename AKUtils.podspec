Pod::Spec.new do |s|
  s.name = 'AKUtils'
  s.version = '2.0.2'
  s.license = 'MIT'
  s.summary = 'Various utils for easy life'
  s.homepage = 'https://github.com/Artem-Kalmykov/AKUtils'
  s.authors = { 'Artem Kalmykov' => 'ar.kalmykov@gmail.com' }
  s.source = { :git => 'https://github.com/Artem-Kalmykov/AKUtils.git', :tag => s.version }
  s.documentation_url = 'https://github.com/Artem-Kalmykov/AKUtils/blob/master/README.md'

  s.ios.deployment_target = '8.0'
  #s.tvos.deployment_target = '9.0'
  #s.watchos.deployment_target = '3.0'

  s.swift_versions = ['5.0', '5.1']

  s.source_files = 'Sources/**/*.swift'
  s.frameworks = ['UIKit']
end
