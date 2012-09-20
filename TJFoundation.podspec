Pod::Spec.new do |s|
  s.name         = "TJFoundation"
  s.version      = "0.0.1"
  s.summary      = "A short description of TJFoundation."
  s.description  = "TJFoundation aims to extend Core Foundation by providing base classes and extending core classes with useful features that most iOS project would need."
  s.homepage     = "https://github.com/thomasjoulin/TJFoundation"
  s.license      = {
    :type => 'MIT',
    :text => <<-LICENSE
              Copyright (C) <2012> <Thomas Joulin>
              All rights reserved.
    LICENSE
  }

  s.author       = { "Thomas Joulin" => "toutankharton@gmail.com" }
  s.source       = { :git => "https://github.com/thomasjoulin/TJFoundation.git", :commit => "c39d6c47483dc275b127c7cf3c56008f780d0d5f" }
  s.platform     = :ios
  s.source_files = 'TJFoundation', 'TJFoundation/**/*.{h,m}'
  s.resource  = "TJFoundationResources/Images"
  s.frameworks = 'MapKit', 'QuartzCore'
  # s.requires_arc = true
  s.dependency 'TBXML', '1.5'
#  s.dependency 'AFNetworking', 
end
