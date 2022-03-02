Pod::Spec.new do |s|
  s.name = "SXPodCategory"
  s.version = "1.0.8"
  s.summary = "\u79EF\u7D2F\u81EA\u5DF1\u9879\u76EE\u91CC\u5E38\u7528\u7684\u4E00\u4E9B\u5206\u7C7B\uFF0C\u7B80\u5316\u4E00\u4E9B\u7CFB\u7EDF\u7684\u65B9\u6CD5\u8C03\u7528"
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"dfpo"=>"songxing10000@live.cn"}
  s.homepage = "https://github.com/songxing10000/SXPodCategory.git"
  s.description = "TODO: Add long description of the pod here."
  s.source = { :path => '.' }

  s.ios.deployment_target    = '8.0'
  s.ios.vendored_framework   = 'ios/SXPodCategory.framework'
end
