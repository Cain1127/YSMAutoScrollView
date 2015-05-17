#
#  Be sure to run `pod spec lint YSMAutoScrollView.podspec.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "YSMAutoScrollView"
  s.version      = "1.0.1"
  s.summary      = "Since the advertisement scroll view"

  s.description  = <<-DESC
                    1、Since the advertisement scroll view;
                    2、On the four directions;
                    3、UITableView design。
                   DESC

  s.homepage     = "https://github.com/Cain1127/YSMAutoScrollView"
  s.license      = "MIT"

  s.author       = { "ysmeng" => "49427823@163.com" }
  s.platform     = :ios, "7.1"
  s.source       = { :git => "https://github.com/Cain1127/YSMAutoScrollView.git", :tag => "1.0.1" }
  s.source_files  = "Classes/*"

end
