//
//  NSObject+MBProgressHUD.m
//  MessageDemo
//
//  Created by Youe on 2022/3/8.
//

#import "NSObject+MBProgressHUD.h"

__weak MBProgressHUD * _sharedHud;

@implementation UIView (toast)
- (MBProgressHUD *)showHud:(NSString *)message sutoHude:(BOOL)autoHude {
    UIView *container = self;
    if (container) {
        if (_sharedHud) {
            [_sharedHud hideAnimated:NO];
        }
        UIView *view = self;
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.detailsLabel.text = message;
        hud.detailsLabel.font = [UIFont systemFontOfSize:15];
        _sharedHud = hud;
        
        if (autoHude) {
            [hud hideAnimated:YES afterDelay:1.5];
        }
    }
    return _sharedHud;
}

- (MBProgressHUD *)showTipsWithYOffset:(NSString *)message
                              autoHide:(BOOL)autoHide {
    
    UIView * container = self;
    if ( container ) {
        
        if ( nil != _sharedHud ) {
            [_sharedHud hideAnimated:NO];
        }
        
        UIView * view = self;
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.detailsLabel.text = message;
        hud.detailsLabel.font = [UIFont systemFontOfSize:15];
        hud.offset = CGPointMake(hud.offset.x, hud.offset.y - 50);
        _sharedHud = hud;
        
        if (autoHide) {
            [hud hideAnimated:YES afterDelay:2.f];
        }
    }
    return _sharedHud;
}
- (MBProgressHUD *)showMessageHud:(NSString *)message {
    return [self showHud:message sutoHude:YES];
}

- (MBProgressHUD *)showSuccessHud:(NSString *)message {
    return [self showUpImageSuccessHud:message];
}

- (MBProgressHUD *)showFailureHud:(NSString *)message {
    UIView * container = self;
    
    if ( container ) {
        if ( nil != _sharedHud ) {
            [_sharedHud hideAnimated:NO];
        }
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:container animated:YES];
        hud.mode = MBProgressHUDModeCustomView;
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"create_close"]];
        hud.detailsLabel.text = message;
        hud.detailsLabel.font = [UIFont systemFontOfSize:15];
        _sharedHud = hud;
        
        [hud hideAnimated:YES afterDelay:2.f];
    }
    
    return _sharedHud;
}

- (MBProgressHUD *)showFailureHudWithYOffset:(NSString *)message {
    return [self showTipsWithYOffset:message autoHide:YES];
}

- (MBProgressHUD *)showUpImageSuccessHud:(NSString *)message {
    UIView * container = self;
    
    if ( container )
    {
        if ( nil != _sharedHud )
        {
            [_sharedHud hideAnimated:NO];
        }
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:container animated:YES];
        hud.mode = MBProgressHUDModeCustomView;
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"create_ok"]];
        hud.detailsLabel.text = message;
        hud.detailsLabel.font = [UIFont systemFontOfSize:15];
        _sharedHud = hud;
        
        hud.offset = CGPointMake(hud.offset.x,
                                 -0.1 * [UIScreen mainScreen].bounds.size.width);
        hud.square = YES;
        
        [hud hideAnimated:YES afterDelay:2.f];
    }
    return _sharedHud;
}

- (MBProgressHUD *)showLoadingHud:(NSString *)message {
    UIView * container = self;
    
    if ( container ) {
        if ( nil != _sharedHud ) {
            [_sharedHud hideAnimated:NO];
        }
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:container animated:YES];
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.detailsLabel.text = message;
        hud.detailsLabel.font = [UIFont systemFontOfSize:15];
        
        hud.square = YES;
        _sharedHud = hud;
    }
    
    return _sharedHud;
}

- (void)dismissHud {
    [_sharedHud hideAnimated:YES];
    _sharedHud = nil;
}

@end


@implementation UIViewController (toast)


- (MBProgressHUD *)showMessageHud:(NSString *)message {
    return [self.view showMessageHud:message];
}

- (MBProgressHUD *)showSuccessHud:(NSString *)message {
    return [self.view showSuccessHud:message];
}

- (MBProgressHUD *)showFailureHud:(NSString *)message {
    return [self.view showFailureHud:message];
}

- (MBProgressHUD *)showFailureHudWithYOffset:(NSString *)message {
    return [self.view showFailureHudWithYOffset:message];
}

- (MBProgressHUD *)showUpImageSuccessHud:(NSString *)message {
    return [self.view showUpImageSuccessHud:message];
}

- (MBProgressHUD *)showLoadingHud:(NSString *)message {
    return [self.view showLoadingHud:message];
}

- (void)dismissHud {
    [self.view dismissHud];
}
 
@end

