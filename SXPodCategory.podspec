
Pod::Spec.new do |s|
  s.name             = 'SXPodCategory' #pod名称
  s.version          = '1.0.8' #pod版本
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
    # https://guides.cocoapods.org/syntax/podspec.html#subspec
    s.subspec 'Source' do |sp|
        sp.source_files = 'SXPodCategory/Classes/SXPodCategory.h'
        
        
        sp.subspec 'NS' do |ssp|
            ssp.source_files = 'SXPodCategory/Classes/NS/*'
        end
        sp.subspec 'UI' do |ssp|
            ssp.source_files = 'SXPodCategory/Classes/UI/*'
            ssp.dependency 'SXPodCategory/Source/NS'
        end
        # s.subspec 'BaseModel' do |ss|
        # ss.source_files = 'SXPodCategory/Classes/BaseModel/*'
        # ss.dependency 'YYModel', '~> 1.0.4'
        # end
        sp.subspec 'CustomView' do |ssp|
            ssp.source_files = 'SXPodCategory/Classes/CustomView/*'
        end
        sp.subspec 'BaseModel' do |ssp|
            ssp.source_files = 'SXPodCategory/Classes/BaseModel/*'
            ssp.dependency 'YYModel'
            
        end
    end
    
#    s.subspec 'Framework' do |ss|
#        ss.ios.vendored_framework = 'SXPodCategory-1.0.8/ios/SXPodCategory.framework'
#        ss.dependency 'YYModel'
#    end
    
    s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

    s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
#资源目录
#   s.resource_bundles = {
#     'SXPodCategory' => ['SXPodCategory/Assets/*.png']
#   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
#依赖的framework
  # s.frameworks = 'UIKit', 'MapKit'
# 依赖的第三方库
  # s.dependency 'AFNetworking', '~> 2.3'
end
