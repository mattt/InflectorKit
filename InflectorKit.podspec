Pod::Spec.new do |s|
  s.name     = 'InflectorKit'
  s.version  = '1.0.0'
  s.license  = { type: 'MIT', file: 'LICENSE' }
  s.summary  = 'Get the singular and plural forms of English words.'
  s.homepage = 'https://github.com/mattt/InflectorKit'
  s.social_media_url = 'https://twitter.com/mattt'
  s.authors  = { 'Mattt' => 'mattt@me.com' }
  s.source   = { git: 'https://github.com/mattt/InflectorKit.git', tag: "#{s.version}" }
  s.source_files = 'Sources/**/*.{swift,h,m}'
  s.public_header_files = [
    'Sources/InflectorKit/include/InflectorKit.h',
    'Sources/InflectorKit/include/NSString+InflectorKit.h',
    'Sources/InflectorKit/include/TTTStringInflector.h'
  ]
  s.requires_arc = true
  s.framework = "Foundation"
  s.pod_target_xcconfig = {
    'APPLICATION_EXTENSION_API_ONLY' => 'YES',
    'DEFINES_MODULE' => 'YES',
    'ENABLE_BITCODE' => 'NO',
    'ENABLE_TESTING_SEARCH_PATHS' => 'YES',
    'OTHER_LDFLAGS' => '$(inherited) -Xlinker -no_application_extension',
  }

  s.ios.deployment_target = "9.0"
  s.osx.deployment_target = "10.10"
  s.tvos.deployment_target = '9.0'

  s.cocoapods_version = '>= 1.4.0'
  if s.respond_to?(:swift_versions) then
    s.swift_versions = ['5.0']
  else
    s.swift_version = '5.0'
  end
end
