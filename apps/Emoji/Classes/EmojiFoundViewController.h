//
//  EmojiFoundViewController.h
//  Emoji
//
//  Created by Boisy Pitre on 1/21/16.
//  Copyright © 2016 Affectiva. All rights reserved.
//

#import <Affdex/Affdex.h>

@interface EmojiFoundViewController : UIViewController

@property (strong) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *settingsView;
@property (strong) IBOutlet UIImageView *emojiView;
@property (strong) IBOutlet UILabel *emojiLabel;
@property (weak, nonatomic) IBOutlet UIButton *tryAgainButton;
@property (strong) AFDXFace *face;

- (IBAction)cameraButtonTouched:(id)sender;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *poweredByViewTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *poweredByViewBottomConstraint;

@end
