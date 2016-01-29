#
# Be sure to run `pod lib lint JJMaterialTextField.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "JJMaterialTextField"
  s.version          = "0.1.3"
  s.summary          = "A Subclass of UITextfield based on Material Design"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = "This CocoaPod provides a UITextfield with Material Design appearance"

  s.homepage         = "https://github.com/juanjoguevara/JJMaterialTextField"
  # s.screenshots     = "http://imgur.com/dQVlPlu.jpg"
  s.license          = 'MIT'
  s.author           = { "Juanjo Guevara" => "juanjoguevara@gmail.com" }
  s.source           = { :git => "https://github.com/juanjoguevara/JJMaterialTextField.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/juanjoguevara>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'JJMaterialTextField' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit'
end
