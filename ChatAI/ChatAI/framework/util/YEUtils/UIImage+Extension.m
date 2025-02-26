//
//  UIImage+Extension.m
//  MessageDemo
//
//  Created by Youe on 2022/3/8.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+ (void)image:(UIImage *)image
didFinishSavingWitherror:(NSError *)error
  contextInfo:(void *)contextInfo {
    void(^block)(NSError *) = (__bridge_transfer id)contextInfo;
    if (!block) return;
    block(error);
}

+ (void)videoAtPath:(NSString *)videoPath
didFinishSavingWithError:(NSError *)error
        contextInfo:(void *)contextInfo {
    
    void(^block)(NSError *) = (__bridge_transfer id)contextInfo;
    if (!block) return;
    block(error);
}

//这里的压缩和Android类似，尽可能保留最小尺寸，也不会导致图片变形 范围压缩
- (UIImage *)scaleToSize:(CGSize)size {
    CGSize imageSize = self.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat scaleFactor = 0.0;
    //先得到应该缩放的比例
    CGFloat widthFactor = size.width / width;
    CGFloat heightFactor = size.height / height;
    //如果两个范围一样 就不需要压缩了 否者按比例压缩
    if (CGSizeEqualToSize(imageSize, size) == NO) {
        //看高度和宽度是否超出了最大范围 决定是否还需要进一步压缩
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor;
        else
            scaleFactor = heightFactor;
    } else {
        scaleFactor = 1.0;
    }
    //得到理论上压缩后的高度和宽度
    CGFloat scaledWidth= width * scaleFactor;
    CGFloat scaledHeight = height * scaleFactor;
    CGSize scaleSize = CGSizeMake(scaledWidth, scaledHeight);
    UIGraphicsBeginImageContext(scaleSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    /**********************************************************/
    //这3行可以实现批量压缩的时候不至于出现OOM内存溢出，他的作用是把图片同样进行尺寸缩小
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformScale(transform,1,1);
    CGContextConcatCTM(context, transform);
    /**********************************************************/
    [self drawInRect:CGRectMake(0, 0, scaleSize.width, scaleSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (NSData *)dataInNoSacleLimitBytes:(NSInteger)bytes {
    @autoreleasepool {
        CGFloat scale = 0.5f;
        NSData *data = UIImageJPEGRepresentation(self, scale);
        while (data.length > bytes) {
            scale -= 0.05;
            //这里限制下压缩比例 最小为0.05 之后就不再压缩了
            if(scale < 0.05) break;
            data = UIImageJPEGRepresentation(self, scale);
        }
        return data;
    }
}

- (UIImage *)cutToSize:(CGSize)size {
    CGFloat width = self.size.width;
    CGFloat height = self.size.height;
    
    //按宽度等比例缩放，保证高度，裁剪上中部 根据我们的需要调整
    if (width != size.width) {
        height = height * size.width / width;
        width = size.width;
    }
    if (height < size.height) {
        width = width * size.height / height;
        height = size.height;
    }
    
    UIGraphicsBeginImageContext(size);
    
    CGRect imageRect = CGRectMake((width - size.width) / 2, 0.0, width, height);
    [self drawInRect:imageRect];
    UIImage *cutImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return cutImage;
}

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0){return  nil;};
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end

void imageWriteToSavedPhotosAlbum(UIImage *image,
                                  void(^completionBlock)(NSError *))
{
    void *blockAsContext = (__bridge_retained void *)[completionBlock copy];
    
    UIImageWriteToSavedPhotosAlbum(image,
                                   UIImage.class,
                                   @selector(image:didFinishSavingWitherror:contextInfo:),
                                   blockAsContext);
}

void saveVideoAtURLToSavedPhotosAlbum(NSURL *videoURL,
                                      void(^completetionBlock)(NSError *))
{
    
    void *blockAscontext = (__bridge_retained void *)[completetionBlock copy];
    UISaveVideoAtPathToSavedPhotosAlbum(videoURL.path,
                                        UIImage.class,
                                        @selector(videoAtPath:didFinishSavingWithError:contextInfo:),
                                        blockAscontext);
    
    
}
