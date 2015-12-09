Pod::Spec.new do |s|

s.name         = "ZHHttpManager"
s.version      = "0.0.1"
s.summary      = "对AFN框架进行封装"
s.homepage     = "https://github.com/ZHDeveloper/HTTP-AFNetworking-"
s.license      = "MIT"
s.author       = { "ZHCoder" => "zhcoder2011@gmail.com" }
s.platform     = :ios, "7.0"
s.source       = { :git => "https://github.com/ZHDeveloper/HTTP-AFNetworking-.git", :tag => "0.0.1" }
s.source_files  = "ZHHttpManager", "*.{h,m}"
s.requires_arc = true
s.dependency "AFNetworking", "~> 2.6.3"