//
//  taikoViewController.h
//  taiko
//
//  Created by gérald chablowski on 10/12/2013.
//  Copyright (c) 2013 Les marqueurs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Tune;

typedef enum TapType {
    TAP_ONE,
    TAP_TWO,
    TAP_LONG_ONE,
    TAP_LONG_TWO,
    ROTATION
} TapType;

@interface taikoViewController : UIViewController{
    UIImageView *repereDroit;
    UIImageView *repereGuauche;
    CABasicAnimation *fadeInOut;
    int currentNoteIndex;
    UIScrollView *scrollView;
}
@property (strong, nonatomic) IBOutlet UIImageView *instruments;
@property (strong, nonatomic) Tune* tune;


- (IBAction)TapOneDetected:(UITapGestureRecognizer *)sender;
- (IBAction)TapTwoDetected:(UITapGestureRecognizer *)sender;
- (IBAction)LongOne:(UILongPressGestureRecognizer *)sender;
- (IBAction)LongTwo:(UILongPressGestureRecognizer *)sender;
- (IBAction)rotation:(UIRotationGestureRecognizer *)sender;
- (IBAction)Buttontouch:(id)sender;
- (void)createScrollMenu;
- (void)addScrollMenu;
- (void)removeNote:(UIButton *)sender;
- (void)porte:(float)xcoordinate musical:(float)ycoordinate typetap:(TapType)tap;

@end
