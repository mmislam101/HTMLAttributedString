Pod::Spec.new do |s|
  s.name         = "HTMLAttributedString"
  s.version      = "1.0.0"
  s.summary     = "Style your UILabel in seconds!"
  s.description = "HTMLAttributedString uses the power of iOS 7.0's initWithData:options:documentAttributes:error: to bring you the power of HTML and CSS into your everyday iOS development needs."
  s.author = {
    "Mohammed Islam" => "https://github.com/mmislam101"
  }

  s.homepage     = "https://github.com/mmislam101/HTMLAttributedString"

  s.license      = { :type => "Public Domain", :file => "LICENSE" }

  s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"

  s.source = {
    :git => "https://github.com/mmislam101/HTMLAttributedString.git",
    :tag => "1.0.0"
  }
  s.source_files = "HTMLAttributedString/*.{h,m}"

  s.framework  = "UIKit"
end