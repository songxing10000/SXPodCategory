 
 

## Developer
一、编辑podspec文件，同步s.version

```ruby
 s.version          = '0.0.9'   #pod版本
```
二、在本地打个新的tag，可用`git tag`查看本地之前所有的tag

```ruby
git tag -a 0.0.9 -m "tag release 0.0.9" #打tag
```
三、提交刚在本地打的tag到github

```ruby
git push --tags #提交tag
```


四、验证podspec文件是否可用。如果有Error和Warning是无法添加到spec repo中的。但是Warning可以存在，可以使用选项`--allow-warnings`忽略警告。

```ruby
pod lib lint
pod spec lint --use-libraries --allow-warnings --verbose
pod spec lint ??.podspec --sources='git@????.git,https://github.com/CocoaPods/Specs.git' --allow-warnings


```
如果lint有问题时，可加入`--use-libraries`

五、发布到`CocoaPods`

```ruby
pod trunk push SXPodCategory.podspec  --allow-warnings
pod repo push 你的私有库名字 SXLoginModule.podspec
```

 

删除一个版本：
```sh
pod trunk delete SXPodCategory 1.0.4
``` 
---
### 子库语法：https://guides.cocoapods.org/syntax/podspec.html#subspec
 
---
### 图片和xib
 一定要使用`resource_bundles`
```ruby
s.source_files = 'imgZipReName/Classes/**/*.{h,m,swift}'
s.resource_bundles = {
 'imgZipReName' => ['imgZipReName/Assets/**/*.{storyboard,xib,xcassets}']}
 ```
 这样设置图片，在sb或者xib能填上图片能直接显示出来，不用设置宽高。

```swift
func getLibBundle() -> Bundle? {

	let fb = Bundle(for: ReNameVC.self)
	guard let path = fb.path(forResource: "imgZipReName", ofType: "bundle") else  {	return nil }
	return Bundle(path: path)
}

func getImg(_ imgName: String?) -> NSImage? {
	
	guard let imgName = imgName else {return nil}
	return getLibBundle()?.image(forResource: imgName)
}
```
图：
 ![](https://gitee.com/songxing10000/imgs/raw/master/2021/imgs/20220222141517.png)

---
### 组件二进制化
https://developers.weixin.qq.com/community/develop/article/doc/000eeefb894e009741fb1768051813

要点：`Cocopods-packager`打包
```sh
pod package  XYPublicClasses.podspec --no-mangle --force --exclude-deps  --spec-sources=依赖的私有库地址
```
```code
-no-mangle：即Do not mangle symbols of depedendant Pods。
            如果组件有其他依赖项，必须填写，否则会报Undefined symbols for architecture 错误
--force：强制覆盖之前打包好的Framework
--exclude-deps：不包含依赖的符号表。动态库不能加，但我们项目中使用的是静态库，需加上。
--spec-sources：依赖的私有库地址，注意官方源https://github.com/CocoaPods/Specs.git也需要加上
--subspecs：批量生成subspec的二进制库，每一个subspec的库名就是podspecName+subspecName
```