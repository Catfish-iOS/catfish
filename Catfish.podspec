Pod::Spec.new do |s|
  s.name         = "Catfish"
  s.version      = "0.1.1-beta"
  s.summary      = "Catfish is a group of classes and categories useful for iOS developers"

  s.description  = <<-DESC
                   Catfish was created for group common functionalities needed for iOS dev process. 
                   DESC

  s.homepage     = "https://github.com/jairobjunior/Catfish"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Jairo Junior" => "jairobjunior@gmail.com" }
  
  s.source       = { :git => "https://github.com/jairobjunior/Catfish.git", :tag => "0.1.1-beta" }
  s.source_files  = 'Catfish', 'Catfish/**/*.{h,m}'
  s.resources = "Catfish/Resources/*.png"

  s.requires_arc = true
  s.ios.deployment_target = '7.0'

  s.frameworks  = 'QuartzCore', 'UIKit'
  
  s.xcconfig = { 'LIBRARY_SEARCH_PATHS' => '"$(PODS_ROOT)/Catfish"' }

end