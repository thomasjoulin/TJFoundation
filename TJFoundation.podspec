Pod::Spec.new do |s|
  s.name         = "TJFoundation"
  s.version      = "0.0.1"
  s.summary      = "A Core Foundation extension."
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
  s.source       = { :git => "https://github.com/thomasjoulin/TJFoundation.git", :commit => "641bcbf4100615748136bd95807d0c48418b6ec8" }
  s.platform     = :ios
  s.source_files = 'TJFoundation', 'TJFoundation/**/*.{h,m}'
  s.frameworks 	 = 'MapKit', 'QuartzCore'
  s.requires_arc = true
end
