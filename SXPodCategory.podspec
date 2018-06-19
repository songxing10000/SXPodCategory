
Pod::Spec.new do |s|
  s.name             = 'SXPodCategory' #pod名称
  s.version          = '1.0.2' #pod版本
  s.summary          = '积累自己项目里常用的一些分类，简化一些系统的方法调用'#简介，需要更改，不然会报警告

  s.description      = <<-DESC #详细介绍，要比简介长
TODO: Add long description of the pod here.
                       DESC
# 项目主页
  s.homepage         = 'https://github.com/songxing10000/SXPodCategory.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
#协议
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
# 开发者信息
  s.author           = { 'dfpo' => 'songxing10000@live.cn' }
#仓库地址
  s.source           = { :git => 'https://github.com/songxing10000/SXPodCategory.git', :tag => s.version.to_s }
# 最低版本
  s.ios.deployment_target = '8.0'
# 库文件
    s.source_files = 'SXPodCategory/Classes/**/*'

    s.subspec 'SXPodCategoryNS' do |ss|
    ss.source_files = 'SXPodCategory/Classes/NS/*'
    end
    s.subspec 'SXPodCategoryUI' do |ss|
    ss.source_files = 'SXPodCategory/Classes/UI/*'
    ss.dependency 'SXPodCategory/SXPodCategoryNS'
    end
#资源目录
  # s.resource_bundles = {
  #   'SXPodCategory' => ['SXPodCategory/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
#依赖的framework
  # s.frameworks = 'UIKit', 'MapKit'
# 依赖的第三方库
  # s.dependency 'AFNetworking', '~> 2.3'
end
