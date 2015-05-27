
Pod::Spec.new do |s|

  s.name         = "GNGeneralNullValue"
  s.version      = "1.0"
  s.summary      = "Forwarding messages sent to NSNull, in order to fix crash with them."
  s.homepage     = "https://github.com/zhzhy/GNGeneralNullValue"
  s.license      = "MIT"
  s.author       = { "zhzhy" => "zhzhy158@163.com" }
  s.platform     = :ios, "4.0"
  s.source       = { :git => "https://github.com/zhzhy/GNGeneralNullValue.git", :tag => "1.0" }
  s.source_files =  "GNGeneralNullValue/Source/*.{h,m}"
  s.requires_arc = true
end
