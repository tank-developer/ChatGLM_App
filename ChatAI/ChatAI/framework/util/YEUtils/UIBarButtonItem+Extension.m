//
//  UIBarButtonItem+Extension.m
//  MessageDemo
//
//  Created by Youe on 2022/1/26.
//

#import "UIBarButtonItem+Extension.h"

@import ObjectiveC.runtime;

static const void *YEBarButtonItemBlockKey = &YEBarButtonItemBlockKey;

@implementation UIBarButtonItem (Extension)

- (instancetype)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem
                                    handler:(void (^)(id sender))action {
    
    self = [self initWithBarButtonSystemItem:systemItem
                                      target:self
                                      action:@selector(handleAction:)];
    if (!self) return nil;
    objc_setAssociatedObject(self,
                             YEBarButtonItemBlockKey,
                             action,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    return self;
}

- (instancetype)initWithImage:(UIImage *)image
                        style:(UIBarButtonItemStyle)style
                      handler:(void (^)(id sender))action {
    
    self = [self initWithImage:image
                         style:style
                        target:self
                        action:@selector(handleAction:)];
    if (!self) return nil;
    objc_setAssociatedObject(self,
                             YEBarButtonItemBlockKey,
                             action,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                        style:(UIBarButtonItemStyle)style
                      handler:(void (^)(id sender))action {
    
    self = [self initWithTitle:title
                         style:style
                        target:self
                        action:@selector(handleAction:)];
    if (!self) return nil;
    objc_setAssociatedObject(self,
                             YEBarButtonItemBlockKey,
                             action,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    return self;
}

- (void)handleAction:(UIBarButtonItem *)sender {
    
    void (^block)(id) = objc_getAssociatedObject(self, YEBarButtonItemBlockKey);
    if (block) block(sender);
}

@end
