# YSMAutoScrollView
# Author
ysmeng Email:49427823@163.com
# 说明
类广告自滚动，类UITabelView的设计模式，可以上下左右四个方向滚动，滚动子view为UIView的子类即可

# cocoaPod导入
cocoaPod导入：pod 'YSMAutoScrollView', '~> 1.0.1'

# 使用说明
1、导入头文件：QSAutoScrollView.h
2、初始化
参数说明
/**
*  @author                 yangshengmeng, 15-03-26 17:03:14
*
*  @brief                  创建一个类广告自滚动的展示view
*
*  @param frame            大小和位置
*  @param delegate         代理
*  @param directionType    滚动方向的类型
*  @param pageIndexFlag    是否显示页码指示器
*  @param currentPage      当前页
*  @param isAutoScroll     是否自滚动
*  @param showTime         自滚动时，每一页的显示时间
*  @param callBack         点击当前显示页时的回调
*
*  @return                 返回当前创建的自滚动view
*
*  @since                  1.0.0
*/

样例
QSAutoScrollView *scrollView = [[QSAutoScrollView alloc] initWithFrame:CGRectMake(0.0f, 64.0f, deviceWidth, deviceHeight - 64.0f) andDelegate:self andScrollDirectionType:aAutoScrollDirectionTypeRightToLeft andShowPageIndex:YES isAutoScroll:YES andShowTime:2.0f andTapCallBack:^(id params) {

///点击滚动页事件
NSLog(@"点击滚动页:%@",params);

}];

3、持有代理
@interface ViewController () <QSAutoScrollViewDelegate>

4、代理设置
- (int)numberOfScrollPage:(QSAutoScrollView *)autoScrollView
{

return (int)[self.dataSource count];

}

- (id)autoScrollViewTapCallBackParams:(QSAutoScrollView *)autoScrollView viewForShowAtIndex:(int)index
{

return [NSString stringWithFormat:@"当前滚动页下标：%d",index];

}

- (UIView *)autoScrollViewShowView:(QSAutoScrollView *)autoScrollView viewForShowAtIndex:(int)index
{

///获取图片
UIImage *tempImage = [UIImage imageNamed:self.dataSource[index]];

UIImageView *currentView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, autoScrollView.frame.size.width, autoScrollView.frame.size.width * tempImage.size.height / tempImage.size.width)];
currentView.image = tempImage;
currentView.userInteractionEnabled = YES;

return currentView;

}

# License
YSMAutoScrollView is available under the MIT license. See the LICENSE file for more info.