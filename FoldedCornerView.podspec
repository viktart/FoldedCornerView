#
#  Be sure to run `pod spec lint FoldedCornerView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "FoldedCornerView"
  spec.version      = "1.0.0"
  spec.summary      = "A view with rounded corners with an ability to make some corners look folded."

  spec.description  = <<-DESC
  A view with rounded corners with an ability to make some corners look folded. It's typically used as a container for text to show tag labels.

  DESC

  spec.homepage     = "https://github.com/viktart/FoldedCornerView"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Viktar Tsialitsyn" => "meandmymouse@gmail.com" }
  spec.platform     = :ios, "10.0"
  spec.source       = { :git => "https://github.com/viktart/FoldedCornerView.git", :tag => "#{spec.version}" }

  spec.source_files  = "Classes", "Classes/**/*"

end
