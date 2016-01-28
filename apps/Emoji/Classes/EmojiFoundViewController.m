//
//  EmojiFoundViewController.m
//  Emoji
//
//  Created by Boisy Pitre on 1/21/16.
//  Copyright © 2016 Affectiva. All rights reserved.
//

#import "EmojiFoundViewController.h"

@interface UIImage (test)

+ (UIImage *)imageFromText:(NSString *)text size:(CGFloat)size;
+ (UIImage *)imageFromView:(UIView *)view;

@end

@implementation UIImage (test)

+ (UIImage *)imageFromText:(NSString *)text size:(CGFloat)size;
{
    // set the font type and size
    UIFont *font = [UIFont systemFontOfSize:size];
    CGSize imageSize  = [text sizeWithAttributes:@{ NSFontAttributeName : font }];
    
    // check if UIGraphicsBeginImageContextWithOptions is available (iOS is 4.0+)
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    // optional: add a shadow, to avoid clipping the shadow you should make the context size bigger
    //
    // CGContextRef ctx = UIGraphicsGetCurrentContext();
    // CGContextSetShadowWithColor(ctx, CGSizeMake(1.0, 1.0), 5.0, [[UIColor grayColor] CGColor]);
    
    // draw in context, you can use also drawInRect:withFont:
    [text drawAtPoint:CGPointMake(0.0, 0.0) withAttributes:@{ NSFontAttributeName : font }];
    
    // transfer image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageFromView:(UIView *)view withSize:(CGSize)size;
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snapshotImage;
}

+ (UIImage *)imageFromView:(UIView *)view
{
    return [UIImage imageFromView:view withSize:view.bounds.size];
}

- (UIImage *)drawImages:(NSArray *)inputImages inRects:(NSArray *)frames;
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    [self drawInRect:CGRectMake(0.0, 0.0, self.size.width, self.size.height)];
    NSUInteger inputImagesCount = [inputImages count];
    NSUInteger framesCount = [frames count];
    if (inputImagesCount == framesCount) {
        for (int i = 0; i < inputImagesCount; i++) {
            UIImage *inputImage = [inputImages objectAtIndex:i];
            CGRect frame = [[frames objectAtIndex:i] CGRectValue];
            [inputImage drawInRect:frame];
        }
    }
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end

@interface EmojiFoundViewController ()

@property (strong) NSArray *emojis;

@end

@implementation EmojiFoundViewController

- (id)initWithCoder:(NSCoder *)aDecoder;
{
    if (self = [super initWithCoder:aDecoder])
    {
        CGFloat emojiFontSize = 80.0;
        
        self.emojis = @[@{@"name" : @"Laughing",
                          @"score": @"emojis.laughing",
                          @"image": [UIImage imageFromText:@"😆" size:emojiFontSize],
                          @"code": [NSNumber numberWithInt:AFDX_EMOJI_LAUGHING]
                          },
                        @{@"name" : @"Smiley",
                          @"score": @"emojis.smiley",
                          @"image": [UIImage imageFromText:@"😀" size:emojiFontSize],
                          @"code": [NSNumber numberWithInt:AFDX_EMOJI_SMILEY]
                          },
                        @{@"name" : @"Relaxed",
                          @"score": @"emojis.relaxed",
                          @"image": [UIImage imageFromText:@"☺️" size:emojiFontSize],
                          @"code": [NSNumber numberWithInt:AFDX_EMOJI_RELAXED]
                          },
                        @{@"name" : @"Wink",
                          @"score": @"emojis.wink",
                          @"image": [UIImage imageFromText:@"😉" size:emojiFontSize],
                          @"code": [NSNumber numberWithInt:AFDX_EMOJI_WINK]
                          },
                        @{@"name" : @"Kiss",
                          @"score": @"emojis.kissing",
                          @"image": [UIImage imageFromText:@"😗" size:emojiFontSize],
                          @"code": [NSNumber numberWithInt:AFDX_EMOJI_KISSING]
                          },
                        @{@"name" : @"Tongue Wink",
                          @"score": @"emojis.stuckOutTongueWinkingEye",
                          @"image": [UIImage imageFromText:@"😜" size:emojiFontSize],
                          @"code": [NSNumber numberWithInt:AFDX_EMOJI_STUCK_OUT_TONGUE_WINKING_EYE]
                          },
                        @{@"name" : @"Tongue Out",
                          @"score": @"emojis.stuckOutTongue",
                          @"image": [UIImage imageFromText:@"😛" size:emojiFontSize],
                          @"code": [NSNumber numberWithInt:AFDX_EMOJI_STUCK_OUT_TONGUE]
                          },
                        @{@"name" : @"Flushed",
                          @"score": @"emojis.flushed",
                          @"image": [UIImage imageFromText:@"😳" size:emojiFontSize],
                          @"code": [NSNumber numberWithInt:AFDX_EMOJI_FLUSHED]
                          },
                        @{@"name" : @"Disappointed",
                          @"score": @"emojis.disappointed",
                          @"image": [UIImage imageFromText:@"😞" size:emojiFontSize],
                          @"code": [NSNumber numberWithInt:AFDX_EMOJI_DISAPPOINTED]
                          },
                        @{@"name" : @"Rage",
                          @"score": @"emojis.rage",
                          @"image": [UIImage imageFromText:@"😡" size:emojiFontSize],
                          @"code": [NSNumber numberWithInt:AFDX_EMOJI_RAGE]
                          },
                        @{@"name" : @"Scream",
                          @"score": @"emojis.scream",
                          @"image": [UIImage imageFromText:@"😱" size:emojiFontSize],
                          @"code": [NSNumber numberWithInt:AFDX_EMOJI_SCREAM]
                          },
                        @{@"name" : @"Smirk",
                          @"score": @"emojis.smirk",
                          @"image": [UIImage imageFromText:@"😏" size:emojiFontSize],
                          @"code": [NSNumber numberWithInt:AFDX_EMOJI_SMIRK]
                          }
                        ];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.image = [self.face.userInfo objectForKey:@"image"];
    Emoji dominantEmoji = self.face.emojis.dominantEmoji;
    if (dominantEmoji != AFDX_EMOJI_NONE) {
        for (NSDictionary *emojiDictionary in self.emojis) {
            NSNumber *code = [emojiDictionary objectForKey:@"code"];
            if (dominantEmoji == [code intValue]) {
                // match!
                UIImage *emojiImage = [emojiDictionary objectForKey:@"image"];
                if (nil != emojiImage) {
                    self.emojiView.image = emojiImage;
                    self.emojiLabel.text = [emojiDictionary objectForKey:@"name"];
                    break;
                }
            }
        }
    } else {
        self.emojiView.image = nil;
        self.emojiLabel.text = @"No Emoji!";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
