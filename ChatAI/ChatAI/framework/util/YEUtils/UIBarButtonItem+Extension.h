//
//  UIBarButtonItem+Extension.h
//  MessageDemo
//
//  Created by Youe on 2022/1/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (Extension)

- (instancetype)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem
                                    handler:(void (^)(id sender))action;


- (instancetype)initWithImage:(UIImage *)image
                        style:(UIBarButtonItemStyle)style
                      handler:(void (^)(id sender))action;


- (instancetype)initWithTitle:(NSString *)title
                        style:(UIBarButtonItemStyle)style
                      handler:(void (^)(id sender))action;

@end

NS_ASSUME_NONNULL_END
