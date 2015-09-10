//
//  taikoViewController.m
//  taiko
//
//  Created by gérald chablowski on 10/12/2013.
//  Copyright (c) 2013 Les marqueurs. All rights reserved.
//

#import "taikoViewController.h"
#import "Tune.h"
#import "Notes.h"

#define REPERE_SIZE 20
#define REPERE_SIZE_MIDDLE 30
#define REPERE_SIZE_BIG 50


@interface taikoViewController ()

@end

@implementation taikoViewController

@synthesize tune;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    currentNoteIndex = 1;
    [self setTune:[Tune new]];
    
    // addp repere to instruments
    CGRect repereDroitRect = CGRectMake(150, 150, 50, 50);
    
    repereDroit = [[UIImageView alloc] initWithFrame:repereDroitRect ];
    [repereDroit setImage:[UIImage imageNamed:@"pointRight.png"]];
    [_instruments addSubview:repereDroit];
    repereDroit.alpha = 0;
    
    repereGuauche = [[UIImageView alloc] initWithFrame:repereDroitRect ];
    [repereGuauche setImage:[UIImage imageNamed:@"pointLeft.png"]];
    [_instruments addSubview:repereGuauche];
    repereGuauche.alpha = 0;
    
    //create aniamtion
    //within the animation we will adjust the "opacity"
    fadeInOut=[CABasicAnimation animationWithKeyPath:@"opacity"];
    //animation lasts 0.4 seconds
    fadeInOut.duration=0.4;
    //justify the opacity as you like (1=fully visible, 0=unvisible)
    fadeInOut.fromValue=[NSNumber numberWithFloat:1.0];
    fadeInOut.toValue=[NSNumber numberWithFloat:0];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 17, self.view.frame.size.width, 37)];
    scrollView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:scrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)TapOneDetected:(UITapGestureRecognizer *)sender {
    if(sender.state == UIGestureRecognizerStateRecognized)
    {
        CGPoint point = [sender locationInView:sender.view];
        NSLog(@"point:%@", NSStringFromCGPoint(point));
        [self porte:point.x musical:point.y typetap:TAP_ONE];
    }
}

- (IBAction)TapTwoDetected:(UITapGestureRecognizer *)sender {
    if(sender.state == UIGestureRecognizerStateRecognized)
    {
        CGPoint point = [sender locationInView:sender.view];
        NSLog(@"point:%@", NSStringFromCGPoint(point));
        [self porte:point.x musical:point.y typetap:TAP_TWO];
    }
}

- (IBAction)LongOne:(UILongPressGestureRecognizer *)sender {
    if(sender.state == UIGestureRecognizerStateRecognized)
    {
        CGPoint point = [sender locationInView:sender.view];
        NSLog(@"point:%@", NSStringFromCGPoint(point));
        [self porte:point.x musical:point.y typetap:TAP_LONG_ONE];
    }
}

- (IBAction)LongTwo:(UILongPressGestureRecognizer *)sender {
    if(sender.state == UIGestureRecognizerStateRecognized)
    {
        CGPoint point = [sender locationInView:sender.view];
        NSLog(@"point:%@", NSStringFromCGPoint(point));
        [self porte:point.x musical:point.y typetap:TAP_LONG_TWO];
    }
    
}
- (IBAction)rotation:(UIRotationGestureRecognizer *)sender {
    [self porte:150 musical:150 typetap:ROTATION];
}

- (IBAction)Buttontouch:(id)sender {
    NSLog(@"Button pressed: %@", [sender currentTitle]);
    NSLog(@"Button pressed: %ld", (long)[sender tag]);
    switch ([sender tag]) {
        case 0:
            //don
            [self porte:150 musical:150 typetap:TAP_LONG_ONE];
            break;
        case 1:
            //do-ko
            [self porte:150 musical:150 typetap:TAP_LONG_TWO];
            break;
        case 2:
            //tsu
            [self porte:150 musical:150 typetap:TAP_ONE];
            break;
        case 3:
            //tsu-ku
            [self porte:150 musical:150 typetap:TAP_TWO];
            break;
        case 4:
            //Ka
            [self porte:0 musical:0 typetap:TAP_ONE];
            break;
        case 5:
            //Ka-Ra
            [self porte:0 musical:0 typetap:TAP_TWO];
            break;
        case 6:
            //Su
            [self porte:150 musical:150 typetap:ROTATION];
            break;
    }
}



-(void) porte:(float)xcoordinate musical:(float)ycoordinate typetap:(TapType )tap{
    
    BOOL move = false;
    TapName name = TSU;
    TapSide side = RIGHT;
    float intensity = 0.5;
    float duration = 1;
    CGRect newFrameDroite = CGRectMake(0,0,0,0);
    CGRect newFrameGuauche = CGRectMake(0,0,0,0);
    
    NSLog(@"point: x - %f , y - %f", xcoordinate, ycoordinate);
    float hypotenuse = hypotf((xcoordinate-150), (ycoordinate-150));
    NSLog(@"hypotenuse:%f", hypotenuse);
    if (hypotenuse > 100) {
        if(tap==TAP_ONE){
            newFrameDroite = CGRectMake(50-REPERE_SIZE/2, 100-REPERE_SIZE/2, REPERE_SIZE, REPERE_SIZE);
            name = KA;
        }else if(tap==TAP_TWO){
            newFrameDroite = CGRectMake(50-REPERE_SIZE/2, 100-REPERE_SIZE/2, REPERE_SIZE, REPERE_SIZE);
            newFrameGuauche = CGRectMake(45-REPERE_SIZE/2, 130-REPERE_SIZE/2, REPERE_SIZE, REPERE_SIZE);;
            move=TRUE;
            name = KA_RA;
        }
    }else{
        if(tap==TAP_ONE){
            newFrameDroite = CGRectMake(150-REPERE_SIZE/2, 150-REPERE_SIZE/2, REPERE_SIZE, REPERE_SIZE);
            name = TSU;
        }else if(tap==TAP_TWO){
            newFrameDroite = CGRectMake(138-REPERE_SIZE/2, 150-REPERE_SIZE/2, REPERE_SIZE, REPERE_SIZE);
            newFrameGuauche = CGRectMake(162-REPERE_SIZE/2, 150-REPERE_SIZE/2, REPERE_SIZE, REPERE_SIZE);
            move=TRUE;
            name = TSU_KU;
        }else if(tap==TAP_LONG_ONE){
            newFrameDroite = CGRectMake(150-REPERE_SIZE_BIG/2, 150-REPERE_SIZE_BIG/2, REPERE_SIZE_BIG, REPERE_SIZE_BIG);
            name = DON;
        }else if(tap==TAP_LONG_TWO){
            newFrameDroite = CGRectMake(135-REPERE_SIZE_MIDDLE/2, 150-REPERE_SIZE_MIDDLE/2, REPERE_SIZE_MIDDLE, REPERE_SIZE_MIDDLE);
            newFrameGuauche = CGRectMake(165-REPERE_SIZE_MIDDLE/2, 150-REPERE_SIZE_MIDDLE/2, REPERE_SIZE_MIDDLE, REPERE_SIZE_MIDDLE);
            move=TRUE;
            name = DO_KO;
        } else if(tap==ROTATION){
            name = SU;
        }
    }
    
    if (move==FALSE) {
        repereDroit.frame = newFrameDroite;
        [repereDroit.layer addAnimation:fadeInOut forKey:@"animateOpacity"];
        
        if(currentNoteIndex == 1){
            side = LEFT;
            currentNoteIndex = 0;
            [repereDroit setImage:[UIImage imageNamed:@"pointRight.png"]];
        }else{
            side = RIGHT;
            currentNoteIndex = 1;
            
            [repereDroit setImage:[UIImage imageNamed:@"pointLeft.png"]];
        }
        if(tap==ROTATION){
            currentNoteIndex = 1;
            [repereDroit setImage:[UIImage imageNamed:@"pointRight.png"]];
        }
    }else{
        [repereDroit setImage:[UIImage imageNamed:@"pointRight.png"]];
        repereDroit.frame = newFrameDroite;
        [repereDroit.layer addAnimation:fadeInOut forKey:@"animateOpacity"];
        repereGuauche.frame = newFrameGuauche;
        [repereGuauche.layer addAnimation:fadeInOut forKey:@"animateOpacity"];
        side = TWO;
        currentNoteIndex = 1;
    }
    
    
    Notes* currentNote = [[Notes alloc] initWithName:name
                                             andSide:side
                                        andIntensity:intensity
                                         andDuration: duration];
    NSLog(@"side:%u", side);
    
    [tune addNotesToTune:currentNote];
    [self addScrollMenu];
}

- (void)addScrollMenu
{
    Notes *note = (Notes*) [tune.tuneNotes lastObject];
    NSString *name = nil;
    UIColor *side = [UIColor greenColor];
    switch(note.side) {
        case LEFT:
            side= [UIColor greenColor];
            break;
        case RIGHT:
            side = [UIColor redColor];
            break;
        case TWO:
            side = [UIColor yellowColor];
            break;
        default:
            [NSException raise:NSGenericException format:@"Unexpected FormatType."];
    }
    switch(note.name) {
        case DON:
            name = @"Don";
            break;
        case DO_KO:
            name = @"Do-Ko";
            break;
        case TSU:
            name = @"Tsu";
            break;
        case TSU_KU:
            name = @"Tsu-Ku";
            break;
        case KA:
            name = @"Ka";
            break;
        case KA_RA:
            name = @"Ka-Ra";
            break;
        case SU:
            name = @"Su";
            side =[UIColor blackColor];
            break;
        default:
            [NSException raise:NSGenericException format:@"Unexpected FormatType."];
    }
    
    int position = 70*([tune.tuneNotes count]);
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(position-70, 0, 70, 37)];
    [button setTitle:name forState:UIControlStateNormal];
    button.backgroundColor = side;
    button.tag = [tune.tuneNotes count]-1;
    [button addTarget:self
               action:@selector(removeNote:)
     forControlEvents:UIControlEventTouchDown];
    [scrollView addSubview:button];
    
    scrollView.contentSize = CGSizeMake(position, scrollView.frame.size.height);
    
    CGPoint bottomOffset = CGPointMake(scrollView.contentSize.width - scrollView.bounds.size.width, 0);
    if(scrollView.contentSize.width - scrollView.bounds.size.width > 0){
        [scrollView setContentOffset:bottomOffset animated:YES];
    }
}
- (void)removeNote:(UIButton *)sender{
    [sender removeFromSuperview];
    [tune removeNotesFromTune:(int)sender.tag];
    int x = 0;
    int i = 0;
    UIButton *getButton;
    for (id subview in scrollView.subviews){
        if ([subview isMemberOfClass:[UIButton class]]) {
            getButton =(UIButton*) subview;
            CGPoint position = getButton.frame.origin;
            CGSize size = getButton.frame.size;
            getButton.tag = i;
            x += getButton.frame.size.width;
            i++;
            getButton.frame = CGRectMake(x-70,position.y,size.width,size.height);
        }
    }
    int width = 70*([tune.tuneNotes count]);
    scrollView.contentSize = CGSizeMake(width, scrollView.frame.size.height);
}

- (void)createScrollMenu
{
    int x = 0;
    
    for (int i = 0; i < [tune.tuneNotes count]; i++) {
        Notes *note = (Notes*) [tune.tuneNotes objectAtIndex:i];
        NSString *name = nil;
        switch(note.name) {
            case DON:
                name = @"Don";
                break;
            case DO_KO:
                name = @"Do-Ko";
                break;
            case TSU:
                name = @"Tsu";
                break;
            case TSU_KU:
                name = @"Tsu-Ku";
                break;
            case KA:
                name = @"Ka";
                break;
            case KA_RA:
                name = @"Ka-Ra";
                break;
            case SU:
                name = @"Su";
                break;
            default:
                [NSException raise:NSGenericException format:@"Unexpected FormatType."];
        }
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, 0, 70, 50)];
        [button setTitle:name forState:UIControlStateNormal];
        
        [scrollView addSubview:button];
        
        x += button.frame.size.width;
    }
    
    scrollView.contentSize = CGSizeMake(x, scrollView.frame.size.height);
    
    CGPoint bottomOffset = CGPointMake(scrollView.contentSize.width - scrollView.bounds.size.width, 0);
    if(scrollView.contentSize.width - scrollView.bounds.size.width > 0){
        [scrollView setContentOffset:bottomOffset animated:YES];
    }
    
    
}


@end
