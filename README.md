# SXPodCategory

[![CI Status](http://img.shields.io/travis/dfpo/SXPodCategory.svg?style=flat)](https://travis-ci.org/dfpo/SXPodCategory)
[![Version](https://img.shields.io/cocoapods/v/SXPodCategory.svg?style=flat)](http://cocoapods.org/pods/SXPodCategory)
[![License](https://img.shields.io/cocoapods/l/SXPodCategory.svg?style=flat)](http://cocoapods.org/pods/SXPodCategory)
[![Platform](https://img.shields.io/cocoapods/p/SXPodCategory.svg?style=flat)](http://cocoapods.org/pods/SXPodCategory)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SXPodCategory is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SXPodCategory"
```

## Author

dfpo, songxing10000@live.cn

## License

SXPodCategory is available under the MIT license. See the LICENSE file for more info.

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

五、发布到`CocoaPods`

```ruby
pod trunk push SXPodCategory.podspec
pod repo push 你的私有库名字 SXLoginModule.podspec
```

最后，更详细请参数

[使用Cocoapods制作自己的pod](http://www.bijishequ.com/detail/228610?p=)

在加载资源文件时：
```objc
// xib
NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[self class]]
                                                 pathForResource:@"SXPodCategory"
                                                 ofType:@"bundle"]];
    self=[[bundle loadNibNamed:@"WJNetWorkFailureView" owner:nil options:nil] lastObject];


// image
NSInteger scale = [UIScreen mainScreen].scale;
    NSString *imageName = [NSString stringWithFormat:@"Payment30@%zdx.png", scale];
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[self class]]
                                                 pathForResource:@"SXPodCategory"
                                                 ofType:@"bundle"]];
    NSString *imagePath = [bundle pathForResource:imageName ofType:nil];
    self.imgV.image = [UIImage imageWithContentsOfFile:imagePath];
```
