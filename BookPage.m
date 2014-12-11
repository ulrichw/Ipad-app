//
//  BookPage.m
//  NewParisZoo
//
//  Created by sebastien couvidat on 10/23/11.
//  Copyright 2011 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import "BookPage.h"
#import "MainMenu.h"
#import "BalloonRedView.h"
#import "BalloonBlueView.h"
#import "BalloonYellowView.h"

@implementation BookPage

@synthesize backButton,previous,next,imageView,caller,textView,listOfPages;
@synthesize page1Animation,resize1Animation,group1Animation,page2Animation,resize2Animation,group2Animation,page3Animation,resize3Animation,group3Animation,page4Animation,resize4Animation,group4Animation,page5Animation,resize5Animation,group5Animation,page6Animation,resize6Animation,group6Animation;
@synthesize ballon1,ballon2,ballon3,ballon4,ballon5,ballon6;

- (void)viewDidLoad {
	
    [super viewDidLoad];
        
	preferences = [NSUserDefaults standardUserDefaults];
	
    widthRef   =768;
    heightRef  =1024;
    
	listOfPages = [[NSArray alloc] initWithObjects:@"Paris_Zoo_Page_01",@"Paris_Zoo_Page_02",@"Paris_Zoo_Page_03",
				   @"Paris_Zoo_Page_04",@"Paris_Zoo_Page_05",@"Paris_Zoo_Page_06",@"Paris_Zoo_Page_07",
				   @"Paris_Zoo_Page_08",@"Paris_Zoo_Page_09",@"Paris_Zoo_Page_10",@"Paris_Zoo_Page_11",
				   @"Paris_Zoo_Page_12",@"Paris_Zoo_Page_13",@"Paris_Zoo_Page_14",@"Paris_Zoo_Page_15",
                   @"Paris_Zoo_Page_16",@"Paris_Zoo_Page_17",@"Paris_Zoo_Page_18",@"Paris_Zoo_Page_19",
                   @"Paris_Zoo_Page_20",@"Paris_Zoo_Page_21",@"Paris_Zoo_Page_22",@"Paris_Zoo_Page_23",
                   @"Paris_Zoo_Page_24",@"Paris_Zoo_Page_25",@"Paris_Zoo_Page_26",nil];
    
	// English Audio files
    soundPageURL[0][0] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_01_01" ofType: @"mp3"]] retain];
    soundPageURL[1][0] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_02_01" ofType: @"mp3"]] retain];
    soundPageURL[1][1] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_02_02" ofType: @"mp3"]] retain];
    soundPageURL[1][2] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_02_03" ofType: @"mp3"]] retain];
	soundPageURL[2][0] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_03_01" ofType: @"mp3"]] retain];
	soundPageURL[3][0] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_04_01" ofType: @"mp3"]] retain];
	soundPageURL[4][0] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_05_01" ofType: @"mp3"]] retain];
	soundPageURL[5][0] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_06_01" ofType: @"mp3"]] retain];
	soundPageURL[6][0] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_07_01" ofType: @"mp3"]] retain];
	soundPageURL[7][0] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_08_01" ofType: @"mp3"]] retain];
	soundPageURL[7][1] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_08_02" ofType: @"mp3"]] retain];
	soundPageURL[8][0] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_09_01" ofType: @"mp3"]] retain];
	soundPageURL[9][0] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_10_01" ofType: @"mp3"]] retain];
	soundPageURL[9][1] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_10_02" ofType: @"mp3"]] retain];
	soundPageURL[10][0]=  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_11_01" ofType: @"mp3"]] retain];
	soundPageURL[11][0]=  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_12_01" ofType: @"mp3"]] retain];
	soundPageURL[12][0]=  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_13_01" ofType: @"mp3"]] retain];
	soundPageURL[13][0]=  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_14_01" ofType: @"mp3"]] retain];
	soundPageURL[14][0]=  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_15_01" ofType: @"mp3"]] retain];
	soundPageURL[15][0]=  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_16_01" ofType: @"mp3"]] retain];
	soundPageURL[16][0]=  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_17_01" ofType: @"mp3"]] retain];
	soundPageURL[17][0]=  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_18_01" ofType: @"mp3"]] retain];
	soundPageURL[18][0]=  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_19_01" ofType: @"mp3"]] retain];
	soundPageURL[19][0]=  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_20_01" ofType: @"mp3"]] retain];
	soundPageURL[20][0]=  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_21_01" ofType: @"mp3"]] retain];
	soundPageURL[21][0]=  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_22_01" ofType: @"mp3"]] retain];
	soundPageURL[22][0]=  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_23_01" ofType: @"mp3"]] retain];
	soundPageURL[23][0]=  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_24_01" ofType: @"mp3"]] retain];
	soundPageURL[23][1]=  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page_24_02" ofType: @"mp3"]] retain];
	soundPageURL[24][0]=  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"applause2_x" ofType: @"mp3"]] retain];

	
	//French Audio Files
	soundPageURLFr[0][0]  =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page1_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[1][0]  =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page2_a_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[1][1]  =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page2_b_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[1][2]  =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page2_c_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[2][0]  =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page3_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[3][0]  =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page4_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[4][0]  =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page5_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[5][0]  =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page6_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[6][0]  =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page7_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[7][0]  =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page8_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[7][1]  =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page8_b_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[8][0]  =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page9_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[9][0]  =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page10_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[9][1]  =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page10_audio_2" ofType:@"mp3"]] retain];
	soundPageURLFr[10][0] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page11_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[11][0] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page12_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[12][0] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page13_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[13][0] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page14_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[14][0] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page15_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[15][0] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page16_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[16][0] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page17_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[17][0] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page18_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[18][0] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page19_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[19][0] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page20_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[20][0] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page21_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[21][0] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page22_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[22][0] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page23_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[23][0] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page24_audio_2" ofType:@"mp3"]] retain];
	soundPageURLFr[23][1] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"page24_audio" ofType:@"mp3"]] retain];
	soundPageURLFr[24][0] =  [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"applause2_x" ofType: @"mp3"]] retain];

	currentPage=0; //set the current page
	currentText=0; //set text number on current page
	
    image=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[self.listOfPages objectAtIndex:currentPage] ofType:@"jpg"]];
	[self.imageView setImage:image];
	
	//English texts
	textImage[0][0] =[[NSString alloc] initWithString:@"Paris_Zoo_Page_01_text_01"];
	textImage[1][0] =[[NSString alloc] initWithString:@"Paris_Zoo_Page_02_text_01"];
	textImage[1][1] =[[NSString alloc] initWithString:@"Paris_Zoo_Page_02_text_02"];
	textImage[1][2] =[[NSString alloc] initWithString:@"Paris_Zoo_Page_02_text_03"];
	textImage[2][0] =[[NSString alloc] initWithString:@"Paris_Zoo_Page_03_text_01"];
	textImage[3][0] =[[NSString alloc] initWithString:@"Paris_Zoo_Page_04_text_01"];
	textImage[4][0] =[[NSString alloc] initWithString:@"Paris_Zoo_Page_05_text_01"];
	textImage[5][0] =[[NSString alloc] initWithString:@"Paris_Zoo_Page_06_text_01"];
	textImage[6][0] =[[NSString alloc] initWithString:@"Paris_Zoo_Page_07_text_01"];
	textImage[7][0] =[[NSString alloc] initWithString:@"Paris_Zoo_Page_08_text_01"];
	textImage[7][1] =[[NSString alloc] initWithString:@"Paris_Zoo_Page_08_text_02"];
	textImage[8][0] =[[NSString alloc] initWithString:@"Paris_Zoo_Page_09_text_01"];
	textImage[9][0] =[[NSString alloc] initWithString:@"Paris_Zoo_Page_10_text_01"];
	textImage[9][1] =[[NSString alloc] initWithString:@"Paris_Zoo_Page_10_text_02"];
	textImage[10][0]=[[NSString alloc] initWithString:@"Paris_Zoo_Page_11_text_01"];
	textImage[11][0]=[[NSString alloc] initWithString:@"Paris_Zoo_Page_12_text_01"];
	textImage[12][0]=[[NSString alloc] initWithString:@"Paris_Zoo_Page_13_text_01"];
	textImage[13][0]=[[NSString alloc] initWithString:@"Paris_Zoo_Page_14_text_01"];
	textImage[14][0]=[[NSString alloc] initWithString:@"Paris_Zoo_Page_15_text_01"];
	textImage[15][0]=[[NSString alloc] initWithString:@"Paris_Zoo_Page_16_text_01"];
	textImage[16][0]=[[NSString alloc] initWithString:@"Paris_Zoo_Page_17_text_01"];
	textImage[17][0]=[[NSString alloc] initWithString:@"Paris_Zoo_Page_18_text_01"];
	textImage[18][0]=[[NSString alloc] initWithString:@"Paris_Zoo_Page_19_text_01"];
	textImage[19][0]=[[NSString alloc] initWithString:@"Paris_Zoo_Page_20_text_01"];
	textImage[20][0]=[[NSString alloc] initWithString:@"Paris_Zoo_Page_21_text_01"];
	textImage[21][0]=[[NSString alloc] initWithString:@"Paris_Zoo_Page_22_text_01"];
	textImage[22][0]=[[NSString alloc] initWithString:@"Paris_Zoo_Page_23_text_01"];
	textImage[23][0]=[[NSString alloc] initWithString:@"Paris_Zoo_Page_24_text_01"];
    textImage[23][1]=[[NSString alloc] initWithString:@"Paris_Zoo_Page_24_text_02"];
    textImage[24][0]=[[NSString alloc] initWithString:@"NULL"];
    textImage[25][0]=[[NSString alloc] initWithString:@"NULL"];
    

	//French texts
	textImageFr[0][0] =[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_01_text_01"];
	textImageFr[1][0] =[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_02_text_01"];
	textImageFr[1][1] =[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_02_text_02"];
	textImageFr[1][2] =[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_02_text_03"];
	textImageFr[2][0] =[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_03_text_01"];
	textImageFr[3][0] =[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_04_text_01"];
	textImageFr[4][0] =[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_05_text_01"];
	textImageFr[5][0] =[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_06_text_01"];
	textImageFr[6][0] =[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_07_text_01"];
	textImageFr[7][0] =[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_08_text_01"];
	textImageFr[7][1] =[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_08_text_02"];
	textImageFr[8][0] =[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_09_text_01"];
	textImageFr[9][0] =[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_10_text_01"];
	textImageFr[9][1] =[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_10_text_02"];
	textImageFr[10][0]=[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_11_text_01"];
	textImageFr[11][0]=[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_12_text_01"];
	textImageFr[12][0]=[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_13_text_01"];
	textImageFr[13][0]=[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_14_text_01"];
	textImageFr[14][0]=[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_15_text_01"];
	textImageFr[15][0]=[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_16_text_01"];
	textImageFr[16][0]=[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_17_text_01"];
	textImageFr[17][0]=[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_18_text_01"];
	textImageFr[18][0]=[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_19_text_01"];
	textImageFr[19][0]=[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_20_text_01"];
	textImageFr[20][0]=[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_21_text_01"];
	textImageFr[21][0]=[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_22_text_01"];
	textImageFr[22][0]=[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_23_text_01"];
	textImageFr[23][0]=[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_24_text_01"];
	textImageFr[23][1]=[[NSString alloc] initWithString:@"FR_Paris_Zoo_Page_24_text_02"];
    textImageFr[24][0]=[[NSString alloc] initWithString:@"NULL"];
    textImageFr[25][0]=[[NSString alloc] initWithString:@"NULL"];
    
    if([preferences boolForKey:@"language"]) {
        textImageI=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:textImage[0][0] ofType:@"png"]];
        textView  =[[UIImageView alloc] initWithImage:textImageI]; //language=1 for English
    }
	else{
        textImageI=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:textImageFr[0][0] ofType:@"png"]];
        textView  =[[UIImageView alloc] initWithImage:textImageI];
    }
	self.textView.hidden= YES;
	self.textView.frame = CGRectMake(147.56,650.13,textImageI.size.width,textImageI.size.height);
	[self.imageView addSubview:self.textView];
	
	//CREATE ANIMATIONS

	CGPoint Pa  = CGPointMake(600,384); //origin balloon1
	CGPoint P0  = CGPointMake(625,300);
	CGPoint P1  = CGPointMake(650,250);
	CGPoint P2  = CGPointMake(700,100);
	CGPoint P3  = CGPointMake(750,-20);
    
	CGPoint Pa2 = CGPointMake(600,384);  //origin balloon2
	CGPoint P02 = CGPointMake(625,300);
	CGPoint P12 = CGPointMake(675,200);
	CGPoint P22 = CGPointMake(725,50);
	CGPoint P32 = CGPointMake(800,-20);

	CGPoint Pa3 = CGPointMake(600,384);  //origin balloon3
	CGPoint P03 = CGPointMake(625,300);
	CGPoint P13 = CGPointMake(675,200);
	CGPoint P23 = CGPointMake(725,50);
	CGPoint P33 = CGPointMake(800,-20);
    
    CGPoint Pa4 = CGPointMake(600,384); //origin balloon4
	CGPoint P04 = CGPointMake(555,300);
	CGPoint P14 = CGPointMake(500,200);
	CGPoint P24 = CGPointMake(450,50);
	CGPoint P34 = CGPointMake(425,-20);

	CGPoint Pa5 = CGPointMake(600,384);  //origin balloon5
	CGPoint P05 = CGPointMake(500,300);
	CGPoint P15 = CGPointMake(450,200);
	CGPoint P25 = CGPointMake(400,50);
	CGPoint P35 = CGPointMake(350,-20);

	CGPoint Pa6 = CGPointMake(600,384);  //origin balloon6
	CGPoint P06 = CGPointMake(500,300);
	CGPoint P16 = CGPointMake(425,200);
	CGPoint P26 = CGPointMake(375,50);
	CGPoint P36 = CGPointMake(300,-20);

	//images to animate
    imageBalloon1=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"balloon_blue_1" ofType:@"png"]];
    imageBalloon2=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"balloon_red_1" ofType:@"png"]];
    imageBalloon3=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"balloon_yellow_1" ofType:@"png"]];

	ballon1                = [[BalloonRedView alloc] initWithImage:imageBalloon2];
	self.ballon1.layer.position = Pa;
	self.ballon1.hidden         = YES;
	ballon2                = [[BalloonBlueView alloc] initWithImage:imageBalloon1];
	self.ballon2.layer.position = Pa2;
	self.ballon2.hidden         = YES;
	ballon3                = [[BalloonYellowView alloc] initWithImage:imageBalloon3];
	self.ballon3.layer.position = Pa3;
	self.ballon3.hidden         = YES;
	ballon4                = [[BalloonRedView alloc] initWithImage:imageBalloon2];
	self.ballon4.layer.position = Pa4;
	self.ballon4.hidden         = YES;
	ballon5                = [[BalloonBlueView alloc] initWithImage:imageBalloon1];
	self.ballon5.layer.position = Pa5;
	self.ballon5.hidden         = YES;
	ballon6                = [[BalloonYellowView alloc] initWithImage:imageBalloon3];
	self.ballon6.layer.position = Pa6;
	self.ballon6.hidden         = YES;
    [self.ballon1 initBalloonAnim];
    [self.ballon2 initBalloonAnim];
    [self.ballon3 initBalloonAnim];
    [self.ballon4 initBalloonAnim];
    [self.ballon5 initBalloonAnim];
    [self.ballon6 initBalloonAnim];
    
	//animations that move the balloons
	self.page1Animation          = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	self.page1Animation.keyTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.3],[NSNumber numberWithFloat:0.6],[NSNumber numberWithFloat:0.9],[NSNumber numberWithFloat:1.0],nil];
	self.page1Animation.values   = [NSArray arrayWithObjects:[NSValue  valueWithCGPoint:Pa],[NSValue  valueWithCGPoint:P0],[NSValue  valueWithCGPoint:P1],[NSValue  valueWithCGPoint:P2],[NSValue  valueWithCGPoint:P3],nil];
	self.page1Animation.calculationMode = kCAAnimationPaced;
	self.page1Animation.fillMode = kCAFillModeForwards;
	self.page1Animation.removedOnCompletion = NO;
	self.page2Animation          = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	self.page2Animation.keyTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.3],[NSNumber numberWithFloat:0.6],[NSNumber numberWithFloat:0.9],[NSNumber numberWithFloat:1.0],nil];
	self.page2Animation.values   = [NSArray arrayWithObjects:[NSValue  valueWithCGPoint:Pa2],[NSValue  valueWithCGPoint:P02],[NSValue  valueWithCGPoint:P12],[NSValue  valueWithCGPoint:P22],[NSValue  valueWithCGPoint:P32],nil];
	self.page2Animation.calculationMode = kCAAnimationPaced;
	self.page2Animation.fillMode = kCAFillModeForwards;
	self.page2Animation.removedOnCompletion = NO;
    self.page3Animation          = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	self.page3Animation.keyTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.3],[NSNumber numberWithFloat:0.6],[NSNumber numberWithFloat:0.9],[NSNumber numberWithFloat:1.0],nil];
	self.page3Animation.values   = [NSArray arrayWithObjects:[NSValue  valueWithCGPoint:Pa3],[NSValue  valueWithCGPoint:P03],[NSValue  valueWithCGPoint:P13],[NSValue  valueWithCGPoint:P23],[NSValue  valueWithCGPoint:P33],nil];
	self.page3Animation.calculationMode = kCAAnimationPaced;
	self.page3Animation.fillMode = kCAFillModeForwards;
	self.page3Animation.removedOnCompletion = NO;
	self.page4Animation          = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	self.page4Animation.keyTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.3],[NSNumber numberWithFloat:0.6],[NSNumber numberWithFloat:0.9],[NSNumber numberWithFloat:1.0],nil];
	self.page4Animation.values   = [NSArray arrayWithObjects:[NSValue  valueWithCGPoint:Pa4],[NSValue  valueWithCGPoint:P04],[NSValue  valueWithCGPoint:P14],[NSValue  valueWithCGPoint:P24],[NSValue  valueWithCGPoint:P34],nil];
	self.page4Animation.calculationMode = kCAAnimationPaced;
	self.page4Animation.fillMode = kCAFillModeForwards;
	self.page4Animation.removedOnCompletion = NO;
	self.page5Animation          = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	self.page5Animation.keyTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.3],[NSNumber numberWithFloat:0.6],[NSNumber numberWithFloat:0.9],[NSNumber numberWithFloat:1.0],nil];
	self.page5Animation.values   = [NSArray arrayWithObjects:[NSValue  valueWithCGPoint:Pa5],[NSValue  valueWithCGPoint:P05],[NSValue  valueWithCGPoint:P15],[NSValue  valueWithCGPoint:P25],[NSValue  valueWithCGPoint:P35],nil];
	self.page5Animation.calculationMode = kCAAnimationPaced;
	self.page5Animation.fillMode = kCAFillModeForwards;
	self.page5Animation.removedOnCompletion = NO;
    self.page6Animation          = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	self.page6Animation.keyTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.3],[NSNumber numberWithFloat:0.6],[NSNumber numberWithFloat:0.9],[NSNumber numberWithFloat:1.0],nil];
	self.page6Animation.values   = [NSArray arrayWithObjects:[NSValue  valueWithCGPoint:Pa6],[NSValue  valueWithCGPoint:P06],[NSValue  valueWithCGPoint:P16],[NSValue  valueWithCGPoint:P26],[NSValue  valueWithCGPoint:P36],nil];
	self.page6Animation.calculationMode = kCAAnimationPaced;
	self.page6Animation.fillMode = kCAFillModeForwards;
	self.page6Animation.removedOnCompletion = NO;

    //animation that change the size of the balloon
	self.resize1Animation = [CABasicAnimation animationWithKeyPath:@"bounds.size"];
	[self.resize1Animation setToValue:[NSValue valueWithCGSize:CGSizeMake(20.0f, imageBalloon1.size.height * (20.0f / imageBalloon1.size.width))]];
	self.resize1Animation.fillMode = kCAFillModeForwards;
	self.resize1Animation.removedOnCompletion = NO;
	self.resize2Animation = [CABasicAnimation animationWithKeyPath:@"bounds.size"];
	[self.resize2Animation setToValue:[NSValue valueWithCGSize:CGSizeMake(10.0f, imageBalloon2.size.height * (10.0f / imageBalloon2.size.width))]];
	self.resize2Animation.fillMode = kCAFillModeForwards;
	self.resize2Animation.removedOnCompletion = NO;
	self.resize3Animation = [CABasicAnimation animationWithKeyPath:@"bounds.size"];
	[self.resize3Animation setToValue:[NSValue valueWithCGSize:CGSizeMake(30.0f, imageBalloon3.size.height * (30.0f / imageBalloon2.size.width))]];
	self.resize3Animation.fillMode = kCAFillModeForwards;
	self.resize3Animation.removedOnCompletion = NO;
	self.resize4Animation = [CABasicAnimation animationWithKeyPath:@"bounds.size"];
	[self.resize4Animation setToValue:[NSValue valueWithCGSize:CGSizeMake(20.0f, imageBalloon1.size.height * (20.0f / imageBalloon1.size.width))]];
	self.resize4Animation.fillMode = kCAFillModeForwards;
	self.resize4Animation.removedOnCompletion = NO;
	self.resize5Animation = [CABasicAnimation animationWithKeyPath:@"bounds.size"];
	[self.resize5Animation setToValue:[NSValue valueWithCGSize:CGSizeMake(10.0f, imageBalloon2.size.height * (10.0f / imageBalloon2.size.width))]];
	self.resize5Animation.fillMode = kCAFillModeForwards;
	self.resize5Animation.removedOnCompletion = NO;
	self.resize6Animation = [CABasicAnimation animationWithKeyPath:@"bounds.size"];
	[self.resize6Animation setToValue:[NSValue valueWithCGSize:CGSizeMake(30.0f, imageBalloon3.size.height * (30.0f / imageBalloon2.size.width))]];
	self.resize6Animation.fillMode = kCAFillModeForwards;
	self.resize6Animation.removedOnCompletion = NO;
	
	//group the two animations
	self.group1Animation = [CAAnimationGroup animation];
	self.group1Animation.fillMode = kCAFillModeForwards;
	self.group1Animation.removedOnCompletion = NO;
	[self.group1Animation setAnimations:[NSArray arrayWithObjects:self.page1Animation, self.resize1Animation, nil]];
	self.group2Animation = [CAAnimationGroup animation]; 
	self.group2Animation.fillMode = kCAFillModeForwards;
	self.group2Animation.removedOnCompletion = NO;
	[self.group2Animation setAnimations:[NSArray arrayWithObjects:self.page2Animation, self.resize2Animation, nil]];
	self.group3Animation = [CAAnimationGroup animation]; 
	self.group3Animation.fillMode = kCAFillModeForwards;
	self.group3Animation.removedOnCompletion = NO;
	[self.group3Animation setAnimations:[NSArray arrayWithObjects:self.page3Animation, self.resize3Animation, nil]];
	self.group4Animation = [CAAnimationGroup animation];
	self.group4Animation.fillMode = kCAFillModeForwards;
	self.group4Animation.removedOnCompletion = NO;
	[self.group4Animation setAnimations:[NSArray arrayWithObjects:self.page4Animation, self.resize4Animation, nil]];
	self.group5Animation = [CAAnimationGroup animation];
	self.group5Animation.fillMode = kCAFillModeForwards;
	self.group5Animation.removedOnCompletion = NO;
	[self.group5Animation setAnimations:[NSArray arrayWithObjects:self.page5Animation, self.resize5Animation, nil]];
	self.group6Animation = [CAAnimationGroup animation];
	self.group6Animation.fillMode = kCAFillModeForwards;
	self.group6Animation.removedOnCompletion = NO;
	[self.group6Animation setAnimations:[NSArray arrayWithObjects:self.page6Animation, self.resize6Animation, nil]];
	
    //for the CAEmitter animation
    mortor   = [[CAEmitterLayer layer] retain];
    const char* fileName = [[[NSBundle mainBundle] pathForResource:@"starburst2" ofType:@"png"] UTF8String];
    CGDataProviderRef dataProvider = CGDataProviderCreateWithFilename(fileName);
    img      = (id) CGImageCreateWithPNGDataProvider(dataProvider, NULL, NO, kCGRenderingIntentDefault);
    CGDataProviderRelease(dataProvider);
    
    rocket   = [[CAEmitterCell emitterCell] retain];
    flare    = [[CAEmitterCell emitterCell] retain];
    firework = [[CAEmitterCell emitterCell] retain];
    preSpark = [[CAEmitterCell emitterCell] retain];
    spark    = [[CAEmitterCell emitterCell] retain];
    
    photo=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Paris_Zoo_Page_24b_photo" ofType:@"png"]];
    photoView=[[UIImageView alloc] initWithImage:photo];
    
    affineTransform = CGAffineTransformMakeScale(1.0,1.0);

    animalSound[0]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"elephant" ofType: @"aiff"]]  retain];
    animalSound[1]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"roar" ofType: @"aiff"]]      retain];
	animalSound[2]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"bear" ofType: @"mp3"]]       retain];
	animalSound[3]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"chimpanzee" ofType: @"mp3"]] retain];
	animalSound[4]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"bats" ofType: @"mp3"]]       retain];
	animalSound[5]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"wildebeest" ofType: @"mp3"]] retain];
	animalSound[6]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"otter" ofType: @"mp3"]]      retain];
	animalSound[7]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"tiger" ofType: @"mp3"]]      retain];
	animalSound[8]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"giraffe" ofType: @"mp3"]]    retain];
	animalSound[9]  = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"gorilla" ofType: @"mp3"]]    retain];
	animalSound[10] = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"peacock" ofType: @"mp3"]]    retain];
	animalSound[11] = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"rattlesnake" ofType: @"mp3"]]retain];
	animalSound[12] = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"penguin" ofType: @"mp3"]]    retain];
	animalSound[13] = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"Lamb" ofType: @"mp3"]]       retain];
	animalSound[14] = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"Duckling" ofType: @"mp3"]]   retain];
	animalSound[15] = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"Kid" ofType: @"mp3"]]        retain];
	animalSound[16] = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"Piglet" ofType: @"mp3"]]     retain];

    randomsounds[2] = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"kids-walk" ofType: @"mp3"]]         retain];
    randomsounds[3] = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"classroom" ofType: @"mp3"]]         retain];
    randomsounds[1] = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"small-honk" ofType: @"mp3"]]        retain];
    randomsounds[0] = [[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"zoo-waitinginline" ofType: @"mp3"]] retain];

    self.backButton.exclusiveTouch=YES;
	self.previous.exclusiveTouch=YES;
	self.next.exclusiveTouch=YES;
    deactivateSwipe=NO;
    self.view.multipleTouchEnabled=NO;
    self.view.exclusiveTouch=YES;
    isInitialized = 1001;
}

- (void) addSubViewText{
	self.textView.hidden= NO;	
}


- (void) changeTextLanguageToEnglish: (BOOL) English{

    if(isInitialized == 1001){ //we make sure the object textView has already been instanced
    [textImageI release];
	if(English){
        textImageI=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:textImage[currentPage][currentText] ofType:@"png"]];
    }
    else{
        textImageI=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:textImageFr[currentPage][currentText] ofType:@"png"]];
    }
    [self.textView setImage:textImageI];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);	
}


- (IBAction) backButtonClicked
	{
        [self deactivateAllButtons];
        buttonToAnimate=self.backButton;
        [self animateView];
    }
-(void) endAnimationBackButton{

     //stop playing all sounds
    [player stop];
    [player release];
    player=nil;
    [player2 stop];
    [player2 release];
    player2=nil;
    if(mortor.superlayer)   [mortor removeFromSuperlayer]; //to make sure the fireworks animation stops when we change pages
    if(photoView.superview) [photoView removeFromSuperview];
    if(theEnd.superview)
    {
        [theEndFrEn release];
        theEndFrEn=nil;
        [theEnd removeFromSuperview];
        [theEnd release];
        theEnd=nil;
    }
    
    [self.caller deactivateAllButtons];
    //animation
	[UIView beginAnimations:@"NavigatingMenu" context:nil];
	[UIView setAnimationDuration:1];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view.superview cache:NO];
	[self.view removeFromSuperview];
    [UIView setAnimationDidStopSelector:@selector(enableAllButtons)];
    [UIView setAnimationDelegate:self];
	[UIView commitAnimations];
	[self.ballon1 removeFromSuperview];
	[self.ballon2 removeFromSuperview];
	[self.ballon3 removeFromSuperview];
	[self.ballon4 removeFromSuperview];
	[self.ballon5 removeFromSuperview];
	[self.ballon6 removeFromSuperview];
	[self.caller bannerAnimation];
}

-(void) enableAllButtons{
    deactivateSwipe=NO;
    self.backButton.userInteractionEnabled=YES;
    self.previous.userInteractionEnabled  =YES;
    self.next.userInteractionEnabled      =YES;
}

-(void) deactivateAllButtons{
    deactivateSwipe=YES;
    self.backButton.userInteractionEnabled=NO;
    self.previous.userInteractionEnabled  =NO;
    self.next.userInteractionEnabled      =NO;
}


- (IBAction) previousButtonClicked: (id) sender{
    [self deactivateAllButtons];
    buttonToAnimate=self.previous;
    [self animateView];
}
-(void) endAnimationPreviousButton{

    [self.ballon1 stopBalloonAnim];
    [self.ballon2 stopBalloonAnim];
    [self.ballon3 stopBalloonAnim];
    [self.ballon4 stopBalloonAnim];
    [self.ballon5 stopBalloonAnim];
    [self.ballon6 stopBalloonAnim];
    [self.ballon1 removeFromSuperview];
	[self.ballon1.layer removeAllAnimations];
	[self.ballon2 removeFromSuperview];
	[self.ballon2.layer removeAllAnimations];
	[self.ballon3 removeFromSuperview];
	[self.ballon3.layer removeAllAnimations];
    [self.ballon4 removeFromSuperview];
	[self.ballon4.layer removeAllAnimations];
	[self.ballon5 removeFromSuperview];
	[self.ballon5.layer removeAllAnimations];
	[self.ballon6 removeFromSuperview];
	[self.ballon6.layer removeAllAnimations];
    [photoView removeFromSuperview];
    [mortor removeFromSuperlayer]; //to make sure the fireworks animation stops when we change pages
    [image release];
    [textImageI release];
    [theEndFrEn release];
    theEndFrEn=nil;
    [theEnd release];
    theEnd=nil;
    [player stop]; //stop playing the fireworks sound
    [player2 stop];
    
	int i = currentPage; //i is the index of the current page
	
	if(currentText > 0)
	{		
		if(textImage[currentPage][currentText-1]) currentText -= 1;
		else
		{
			currentPage -= 1;
			if(currentPage < 0) currentPage = Npage-1;
			currentText  = 2;
			while(!textImage[currentPage][currentText]) currentText -= 1;
		}
	}
	else
	{
		currentPage -= 1;
		if(currentPage < 0) currentPage = Npage-1;		
		currentText  = 2;
		while(!textImage[currentPage][currentText]) currentText -= 1;
	}

        if(currentPage != i && currentPage == Npage-1) self.textView.hidden=YES;
        else self.textView.hidden=NO;
    
    image=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[self.listOfPages objectAtIndex:currentPage] ofType:@"jpg"]];
	if([preferences boolForKey:@"language"]){
        textImageI=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:textImage[currentPage][currentText] ofType:@"png"]];
    }else{
        textImageI=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:textImageFr[currentPage][currentText] ofType:@"png"]];
    }
    
        [self.view.layer removeAllAnimations];
        [UIView beginAnimations:@"ChangePage" context:nil];
		[UIView setAnimationDuration:1];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		if(currentPage != i && i != Npage-1) [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.imageView cache:NO];
		else [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.imageView cache:NO];
        [self.imageView setImage:image];
        [self.textView setImage:textImageI];
		[UIView setAnimationDelegate:self];
        if(currentPage == 0) [UIView setAnimationDidStopSelector:@selector(page1Animated)];
        else if(currentPage == Npage-3 && currentText == 1)[UIView setAnimationDidStopSelector:@selector(page24Animated)];
        else if(currentPage == Npage-2)[UIView setAnimationDidStopSelector:@selector(page25Animated)];
        else [UIView setAnimationDidStopSelector:@selector(endPageAnimated)];
        [UIView commitAnimations];
}
- (void) endTurningPage{
    if([preferences boolForKey:@"audio"]) [self playPageSound:currentPage andText:currentText];
}


- (IBAction) nextButtonClicked: (id) sender{
    [self deactivateAllButtons];
    buttonToAnimate=self.next;
    [self animateView];
}
-(void) endAnimationNextButton{

    [self.ballon1 stopBalloonAnim];
    [self.ballon2 stopBalloonAnim];
    [self.ballon3 stopBalloonAnim];
    [self.ballon4 stopBalloonAnim];
    [self.ballon5 stopBalloonAnim];
    [self.ballon6 stopBalloonAnim];
    [self.ballon1 removeFromSuperview];
	[self.ballon1.layer removeAllAnimations];
	[self.ballon2 removeFromSuperview];
	[self.ballon2.layer removeAllAnimations];
	[self.ballon3 removeFromSuperview];
	[self.ballon3.layer removeAllAnimations];
    [self.ballon4 removeFromSuperview];
	[self.ballon4.layer removeAllAnimations];
	[self.ballon5 removeFromSuperview];
	[self.ballon5.layer removeAllAnimations];
	[self.ballon6 removeFromSuperview];
	[self.ballon6.layer removeAllAnimations];
    [photoView removeFromSuperview];
    [mortor    removeFromSuperlayer]; //to make sure the fireworks animation stops when we change pages
    [image      release];
    [textImageI release];
    [theEndFrEn release];
    theEndFrEn=nil;
    [theEnd     release];
    theEnd=nil;
    [player  stop]; //stop playing the fireworks sound
    [player2 stop];
    
	int i = currentPage; //i is the index of the current page
	
	if(currentText < 2)
	{		
		if(textImage[currentPage][currentText+1]) currentText += 1;
		else
		{
			currentPage += 1;
			if(currentPage == Npage) currentPage = 0;
			currentText  = 0;
		}
	}
	else
	{
		currentPage += 1;
		if(currentPage == Npage) currentPage = 0;		
		currentText  = 0;
	}
		
        if(currentPage != i && currentPage == Npage-1) self.textView.hidden=YES;
        else self.textView.hidden=NO;
        
    image=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[self.listOfPages objectAtIndex:currentPage] ofType:@"jpg"]];
	if([preferences boolForKey:@"language"]){
        textImageI=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:textImage[currentPage][currentText] ofType:@"png"]];
    }else{
        textImageI=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:textImageFr[currentPage][currentText] ofType:@"png"]];
    }
    
        [self.view.layer removeAllAnimations];
        [UIView beginAnimations:@"ChangePage2" context:nil];
		[UIView setAnimationDuration:1];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		if(currentPage != i && i != Npage-2) [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.imageView cache:NO];
		else [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.imageView cache:NO];
		[self.imageView setImage:image];
        [self.textView setImage:textImageI];
		[UIView setAnimationDelegate:self];
		if(currentPage == 0) [UIView setAnimationDidStopSelector:@selector(page1Animated)];
        else if(currentPage == Npage-3 && currentText == 1)[UIView setAnimationDidStopSelector:@selector(page24Animated)];
        else if(currentPage == Npage-2)[UIView setAnimationDidStopSelector:@selector(page25Animated)];
        else [UIView setAnimationDidStopSelector:@selector(endPageAnimated)];
		[UIView commitAnimations];
}
																										 
- (void) playPageSound: (int) playPage andText: (int) playText{
    if(playPage != Npage-1){ //the last page is the only one with no sound
    [player2 stop];
    [player2 release];
    player2=nil;
    if([preferences boolForKey:@"language"]) player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundPageURL[playPage][playText] error:&error];
    else player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundPageURLFr[playPage][playText] error:&error];
    player2.volume = 1.0f;
    player2.delegate=(id)self;
    if([player2 prepareToPlay]) [player2 play];}
}


- (int) currentPage{
	return currentPage;
}

- (int) currentText{
	return currentText;
}


- (void) page1Animated{
    [self deactivateAllButtons];
    //blue balloons
    [self.view addSubview:self.ballon1];
    [self.ballon1.layer removeAllAnimations];
    self.ballon1.hidden = NO;
    self.group1Animation.duration = 8.0;
    self.group1Animation.delegate = self;
    [self.group1Animation setValue:self.ballon1 forKey:@"imageViewBeingAnimated1"];
    [self.ballon1.layer addAnimation:group1Animation forKey:@"moveAndResizeBalloon1"];

    [self.view addSubview:self.ballon4];
    [self.ballon4.layer removeAllAnimations];
    self.ballon4.hidden = NO;
    self.group4Animation.duration = 9.0;
    self.group4Animation.delegate = self;
    [self.group4Animation setValue:self.ballon4 forKey:@"imageViewBeingAnimated4"];
    [self.ballon4.layer addAnimation:group4Animation forKey:@"moveAndResizeBalloon4"];
	
    //red balloons
    [self.view addSubview:self.ballon2];
    [self.ballon2.layer removeAllAnimations];
    self.ballon2.hidden = NO;
    self.group2Animation.duration = 7.0;
    self.group2Animation.delegate = self;
    [self.group2Animation setValue:self.ballon2 forKey:@"imageViewBeingAnimated2"];
    [self.ballon2.layer addAnimation:group2Animation forKey:@"moveAndResizeBalloon2"];

    [self.view addSubview:self.ballon5];
    [self.ballon5.layer removeAllAnimations];
    self.ballon5.hidden = NO;
    self.group5Animation.duration = 6.5;
    self.group5Animation.delegate = self;
    [self.group5Animation setValue:self.ballon5 forKey:@"imageViewBeingAnimated5"];
    [self.ballon5.layer addAnimation:group5Animation forKey:@"moveAndResizeBalloon5"];

    //yellow balloons
    [self.view addSubview:self.ballon3];
    [self.ballon3.layer removeAllAnimations];
    self.ballon3.hidden = NO;
    self.group3Animation.duration = 4.0;
    self.group3Animation.delegate = self;
    [self.group3Animation setValue:self.ballon3 forKey:@"imageViewBeingAnimated3"];
    [self.ballon3.layer addAnimation:group3Animation forKey:@"moveAndResizeBalloon3"];
        
    [self.view addSubview:self.ballon6];
    [self.ballon6.layer removeAllAnimations];
    self.ballon6.hidden = NO;
    self.group6Animation.duration = 4.5;
    self.group6Animation.delegate = self;
    [self.group6Animation setValue:self.ballon6 forKey:@"imageViewBeingAnimated6"];
    [self.ballon6.layer addAnimation:group6Animation forKey:@"moveAndResizeBalloon6"];

    [self.ballon1 balloonAnim];
    [self.ballon4 balloonAnim];
    [self.ballon2 balloonAnim];
    [self.ballon5 balloonAnim];
    [self.ballon3 balloonAnim];
    [self.ballon6 balloonAnim];

    [self endPageAnimated];
}

-(void) page24Animated{
    [self deactivateAllButtons];
    [image release];
    image=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Paris_Zoo_Page_24b"ofType:@"jpg"]];
    [self.imageView setImage:image];
    CGPoint center = CGPointMake(heightRef/2.,widthRef/2.);
    photoView.center=center;
    photoView.transform = CGAffineTransformScale(affineTransform,0.95,0.95);
    [self.view addSubview:photoView];
    [UIView beginAnimations:@"AddPhoto" context:nil];
    [UIView setAnimationDuration:0.15];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    photoView.transform = CGAffineTransformScale(affineTransform,0.85,0.85);
    if([preferences boolForKey:@"audio"])
    {
        [player stop];
        [player release];
        player=nil;
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"camera-shutter" ofType:@"mp3"]] error:&error];
        player.delegate=(id)self;
        player.volume = 1.0f;
        if([player prepareToPlay]) [player play];
    }
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(endPageAnimated)];
    [UIView commitAnimations];
}

-(void) page25Animated{
    [self deactivateAllButtons];
    if([preferences boolForKey:@"language"]) theEndFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Paris_Zoo_Page_25_The_End" ofType:@"png"]];
    else theEndFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Paris_Zoo_Page_25_Fin" ofType:@"png"]];
    CGPoint center = CGPointMake(heightRef/2.,146);
    theEnd = [[UIImageView alloc] initWithImage:theEndFrEn];
    theEnd.alpha=0.0;
    theEnd.center=center;
    [self.view addSubview:theEnd];
    
    [UIView beginAnimations:@"AddTheEnd1" context:nil];
    [UIView setAnimationDuration:2.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    theEnd.alpha=1.0;
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(endPage25Animated2)];
    [UIView commitAnimations];
}
- (void) endPage25Animated2{
    
    [self fireWorksAnimation];
    [theEnd     removeFromSuperview];
    [theEndFrEn release];
    theEndFrEn=nil;
    [theEnd     release];
    theEnd=nil;
    if([preferences boolForKey:@"audio"])
        {
            //setup the AV player for fireworks sounds
            [player stop];
            [player release];
            player=nil;
            player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"3553b" ofType:@"mp3"]] error:&error];
            player.delegate=(id)self;
            player.volume = 1.0f;
            [player setNumberOfLoops:-1];
            if([player prepareToPlay]) [player play];
        }
    [self endPageAnimated];
}

-(void) endPageAnimated{
    [self endTurningPage];
    [self enableAllButtons];
}

- (void) animateView{
    [UIView beginAnimations:@"buttonTouched" context:nil];
    [UIView setAnimationDuration:0.15];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    buttonToAnimate.transform = CGAffineTransformScale(affineTransform,0.8,0.8);
    [UIView setAnimationDidStopSelector:@selector(animateViewDone)];
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
}

- (void) animateViewDone{
    [UIView beginAnimations:@"buttonTouchedDone" context:nil];
	[UIView setAnimationDuration:0.15];
	[UIView setAnimationCurve:UIViewAnimationCurveLinear];
    buttonToAnimate.transform = CGAffineTransformScale(affineTransform,1.0,1.0);
    if([buttonToAnimate isEqual:self.previous])     [UIView setAnimationDidStopSelector:@selector(endAnimationPreviousButton)];
    if([buttonToAnimate isEqual:self.next])         [UIView setAnimationDidStopSelector:@selector(endAnimationNextButton)];
    if([buttonToAnimate isEqual:self.backButton])   [UIView setAnimationDidStopSelector:@selector(endAnimationBackButton)];
    [UIView setAnimationDelegate:self];
	[UIView commitAnimations];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
 
    UITouch *touch = [touches anyObject];
    startPosition = [touch locationInView:self.view];
    
    int playIndex=-1;

    if(currentPage == 1 && startPosition.x > 0   && startPosition.x <456 && startPosition.y > 418 && startPosition.y < 768)playIndex=-5;
    if(currentPage == 2 && startPosition.x > 114 && startPosition.x <1024&& startPosition.y > 236 && startPosition.y < 612)playIndex=-4;
    if(currentPage == 2 && startPosition.x > 64  && startPosition.x <234 && startPosition.y > 148 && startPosition.y < 294)playIndex=-3;
    if(currentPage == 3 && startPosition.x > 420 && startPosition.x <822 && startPosition.y > 198 && startPosition.y < 568)playIndex=-2;
    if(currentPage == 4 && startPosition.x > 45  && startPosition.x <436 && startPosition.y > 62  && startPosition.y < 304)playIndex=7;
    if(currentPage == 5 && startPosition.x > 441 && startPosition.x <978 && startPosition.y > 63  && startPosition.y < 458)playIndex=8;
    if(currentPage == 6 && startPosition.x > 54  && startPosition.x <378 && startPosition.y > 465 && startPosition.y < 620)playIndex=10;
    if(currentPage == 6 && startPosition.x > 334 && startPosition.x <513 && startPosition.y > 339 && startPosition.y < 562)playIndex=10;
    if(currentPage == 7 && startPosition.x > 503 && startPosition.x <878 && startPosition.y > 166 && startPosition.y < 633)playIndex=5;
    if(currentPage == 8 && startPosition.x > 687 && startPosition.x <994 && startPosition.y > 16  && startPosition.y < 378)playIndex=1;
    if(currentPage == 8 && startPosition.x > 279 && startPosition.x <526 && startPosition.y > 74  && startPosition.y < 210)playIndex=1;
    if(currentPage == 8 && startPosition.x > 510 && startPosition.x <672 && startPosition.y > 333 && startPosition.y < 450)playIndex=1;
    if(currentPage == 9 && startPosition.x > 162 && startPosition.x <514 && startPosition.y > 188 && startPosition.y < 441)playIndex=2;
    if(currentPage == 10&& startPosition.x > 202 && startPosition.x <882 && startPosition.y > 51  && startPosition.y < 636)playIndex=0;
    if(currentPage == 11&& startPosition.x > 560 && startPosition.x <962 && startPosition.y > 165 && startPosition.y < 478)playIndex=9;
    if(currentPage == 12&& startPosition.x > 244 && startPosition.x <846 && startPosition.y > 201 && startPosition.y < 490)playIndex=3;
    if(currentPage == 13&& startPosition.x > 15  && startPosition.x <957 && startPosition.y > 28  && startPosition.y < 254)playIndex=11;
    if(currentPage == 14&& startPosition.x > 255 && startPosition.x <765 && startPosition.y > 0   && startPosition.y < 270)playIndex=4;
    if(currentPage == 15&& startPosition.x > 218 && startPosition.x <714 && startPosition.y > 0   && startPosition.y < 250)playIndex=4;
    if(currentPage == 16&& startPosition.x > 332 && startPosition.x <1018&& startPosition.y > 90  && startPosition.y < 374)playIndex=12;
    if(currentPage == 17&& startPosition.x > 21  && startPosition.x <408 && startPosition.y > 64  && startPosition.y < 585)playIndex=6;
    if(currentPage == 18&& startPosition.x > 476 && startPosition.x <574 && startPosition.y > 272 && startPosition.y < 351)playIndex=14;
    if(currentPage == 18&& startPosition.x > 338 && startPosition.x <502 && startPosition.y > 81  && startPosition.y < 213)playIndex=15;
    if(currentPage == 18&& startPosition.x > 668 && startPosition.x <778 && startPosition.y > 46  && startPosition.y < 123)playIndex=16;
    if(currentPage == 18&& startPosition.x > 150 && startPosition.x <224 && startPosition.y > 112 && startPosition.y < 218)playIndex=16;
    if(currentPage == 18&& startPosition.x > 806 && startPosition.x <928 && startPosition.y > 138 && startPosition.y < 237)playIndex=13;
    if(currentPage == 19&& startPosition.x > 246 && startPosition.x <424 && startPosition.y > 116 && startPosition.y < 286)playIndex=16;
    if(currentPage == 19&& startPosition.x > 387 && startPosition.x <574 && startPosition.y > 300 && startPosition.y < 429)playIndex=16;
    if(currentPage == 19&& startPosition.x > 484 && startPosition.x <664 && startPosition.y > 24  && startPosition.y < 160)playIndex=13;
    if(currentPage == 19&& startPosition.x > 580 && startPosition.x <807 && startPosition.y > 206 && startPosition.y < 338)playIndex=15;
    if(currentPage == 19&& startPosition.x > 390 && startPosition.x <453 && startPosition.y > 512 && startPosition.y < 591)playIndex=14;
    if(currentPage == 19&& startPosition.x > 567 && startPosition.x <670 && startPosition.y > 542 && startPosition.y < 602)playIndex=14;
    if(currentPage == 20&& startPosition.x > 356 && startPosition.x <672 && startPosition.y > 348 && startPosition.y < 610)playIndex=13;
    if(currentPage == 21&& startPosition.x > 462 && startPosition.x <642 && startPosition.y > 382 && startPosition.y < 646)playIndex=16;
    if(currentPage == 22&& startPosition.x > 144 && startPosition.x <231 && startPosition.y > 63  && startPosition.y < 118)playIndex=16;
    if(currentPage == 22&& startPosition.x > 908 && startPosition.x <968 && startPosition.y > 34  && startPosition.y < 122)playIndex=16;
    if(currentPage == 22&& startPosition.x > 189 && startPosition.x <254 && startPosition.y > 14  && startPosition.y < 57 )playIndex=15;
    if(currentPage == 22&& startPosition.x > 254 && startPosition.x <338 && startPosition.y > 57  && startPosition.y < 98 )playIndex=15;
    if(currentPage == 22&& startPosition.x > 183 && startPosition.x <208 && startPosition.y > 104 && startPosition.y < 140)playIndex=14;
    if(currentPage == 22&& startPosition.x > 231 && startPosition.x <278 && startPosition.y > 96  && startPosition.y < 130)playIndex=14;
    if(currentPage == 22&& startPosition.x > 794 && startPosition.x <909 && startPosition.y > 69  && startPosition.y < 164)playIndex=13;

    if(playIndex != -1)
        {
            if([preferences boolForKey:@"audio"])
            {
            [player stop];
            [player release];
            player=nil;
            if(playIndex >= 0) player = [[AVAudioPlayer alloc] initWithContentsOfURL:animalSound[playIndex] error:&error];
            else player = [[AVAudioPlayer alloc] initWithContentsOfURL:randomsounds[-playIndex-2] error:&error];
            player.delegate=(id)self;
            player.volume = 1.0f;
            if([player prepareToPlay])[player play];
            }
        }
    
    if([preferences boolForKey:@"audio"] && startPosition.x > 160 && startPosition.x <886 && startPosition.y > 660  && startPosition.y <760) [self playPageSound:currentPage andText:currentText];
}
    
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

    UITouch *touch = [touches anyObject];
    CGPoint endPosition = [touch locationInView:self.view];
    
    if (endPosition.x > startPosition.x + 100) {
        if(!deactivateSwipe)[self previousButtonClicked:self.previous];
    }
    if (endPosition.x < startPosition.x - 100) {
        if(!deactivateSwipe)[self nextButtonClicked:self.next];
    }
}


- (void)didReceiveMemoryWarning {
		
	[super didReceiveMemoryWarning];
	
}

-(void) fireWorksAnimation{
    
rootLayer = self.view.layer;

mortor.emitterPosition = CGPointMake(512, 1024);
mortor.renderMode = kCAEmitterLayerAdditive;

//Invisible particle representing the rocket before the explosion
rocket.emissionLongitude = M_PI / 2;
rocket.emissionLatitude = -M_PI;
rocket.lifetime = 1.6;
rocket.birthRate = 1;
rocket.velocity = 400;
rocket.velocityRange = 50;
rocket.yAcceleration = -100;
rocket.emissionRange = M_PI / 4;
rocket.color = [[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0] CGColor];
rocket.redRange = 0.5;
rocket.greenRange = 0.5;
rocket.blueRange = 0.5;

//Name the cell so that it can be animated later using keypath
[rocket setName:@"rocket"];

//Flare particles emitted from the rocket as it flies
flare.contents = img;
flare.emissionLongitude = (4 * M_PI) / 2;
flare.scale = 0.4;
flare.velocity = 100;
flare.birthRate = 45;
flare.lifetime = 1.5;
flare.yAcceleration = -350;
flare.emissionRange = M_PI / 7;
flare.alphaSpeed = -0.7;
flare.scaleSpeed = -0.1;
flare.scaleRange = 0.1;
flare.beginTime = 0.01;
flare.duration = 0.7;

//The particles that make up the explosion
firework.contents = img;
firework.birthRate = 9999;
firework.scale = 0.6;
firework.velocity = 130;
firework.lifetime = 2;
firework.alphaSpeed = -0.2;
firework.yAcceleration = -80;
firework.beginTime = 1.5;
firework.duration = 0.1;
firework.emissionRange = 2 * M_PI;
firework.scaleSpeed = -0.1;
firework.spin = 2;

//Name the cell so that it can be animated later using keypath
[firework setName:@"firework"];

//preSpark is an invisible particle used to later emit the spark
preSpark.birthRate = 80;
preSpark.velocity = firework.velocity * 0.70;
preSpark.lifetime = 1.7;
preSpark.yAcceleration = firework.yAcceleration * 0.85;
preSpark.beginTime = firework.beginTime - 0.2;
preSpark.emissionRange = firework.emissionRange;
preSpark.greenSpeed = 100;
preSpark.blueSpeed = 100;
preSpark.redSpeed = 100;

//Name the cell so that it can be animated later using keypath
[preSpark setName:@"preSpark"];

//The 'sparkle' at the end of a firework
spark.contents = img;
spark.lifetime = 0.05;
spark.yAcceleration = -250;
spark.beginTime = 0.8;
spark.scale = 0.4;
spark.birthRate = 10;

preSpark.emitterCells = [NSArray arrayWithObjects:spark, nil];
rocket.emitterCells   = [NSArray arrayWithObjects:flare, firework, preSpark, nil];
mortor.emitterCells   = [NSArray arrayWithObjects:rocket, nil];

[rootLayer addSublayer:mortor];
}



- (void)viewDidUnload {
	
	int i,j;
    
    self.backButton       = nil;
	self.previous         = nil;
	self.next             = nil;
	self.imageView        = nil;
	self.ballon1          = nil;
	self.ballon2          = nil;
	self.ballon3          = nil;
	self.ballon4          = nil;
	self.ballon5          = nil;
	self.ballon6          = nil;
	self.page1Animation   = nil;
	self.resize1Animation = nil;
	self.group1Animation  = nil;
	self.page2Animation   = nil;
	self.resize2Animation = nil;
	self.group2Animation  = nil;
	self.page3Animation   = nil;
	self.resize3Animation = nil;
	self.group3Animation  = nil;
	self.listOfPages      = nil;
	self.page4Animation   = nil;
	self.page5Animation   = nil;
	self.page6Animation   = nil;
    self.resize4Animation = nil;
	self.group4Animation  = nil;
	self.resize5Animation = nil;
	self.group5Animation  = nil;
	self.resize6Animation = nil;
	self.group6Animation  = nil;

    [image release];
    image=nil;
    [textImageI release];
    textImageI=nil;
	for(i=0;i<Npage;i++)
	{
		for(j=0;j<3;j++)
		{
            [soundPageURL[i][j] release];
			[soundPageURLFr[i][j] release];
            soundPageURL[i][j]=nil;
            soundPageURLFr[i][j]=nil;
			[textImage[i][j] release];
			[textImageFr[i][j] release];
            textImage[i][j]=nil;
            textImageFr[i][j]=nil;
		}
	}
	
	self.textView = nil;
	
	[mortor release];
	mortor   = nil;
    [rocket   release];
    [flare    release];
    [firework release];
    [spark    release];
    [preSpark release];
    rocket   = nil;
    flare    = nil;
    firework = nil;
    spark    = nil;
    preSpark = nil;
    CGImageRelease((CGImageRef)img);
    img      = nil;
 
    [imageBalloon1 release];
    [imageBalloon2 release];
    [imageBalloon3 release];
    imageBalloon1 = nil;
    imageBalloon2 = nil;
    imageBalloon3 = nil;
    
    [photoView release];
    photoView = nil;
    [photo release];
    photo=nil;
    
    [player  release];
    [player2 release];
    player=nil;
    player2=nil;
    
    for(i=0;i<nAnimals;i++)
    {
        [animalSound[i] release];
        animalSound[i]=nil;
    }
    for(i=0;i<4;i++)
    {
        [randomsounds[i] release];
        randomsounds[i]=nil;
    }
    isInitialized = 0;
    [super viewDidUnload];
 }


- (void)dealloc {
	
	int i,j;
	
	[caller           release];
	[listOfPages      release];
	[backButton       release];
	[previous         release];
	[next             release];
	[imageView        release];
	[textView         release];
	[page1Animation   release];
	[resize1Animation release];
	[group1Animation  release];
	[page2Animation   release];
	[resize2Animation release];
	[group2Animation  release];
	[page3Animation   release];
	[resize3Animation release];
	[group3Animation  release];
	[ballon1          release];
	[ballon2          release];
	[ballon3          release];
    [ballon4          release];
	[ballon5          release];
	[ballon6          release];
    [image            release];
    [textImageI      release];

    for(i=0;i<Npage;i++)
	{
 		for(j=0;j<3;j++)
		{
			[soundPageURL[i][j]   release];
			[soundPageURLFr[i][j] release];
			[textImage[i][j]      release];
			[textImageFr[i][j]    release];
		}
	}
    	
	[mortor        release];
	[rocket        release];
    [flare         release];
    [firework      release];
    [spark         release];
    [preSpark      release];
    CGImageRelease((CGImageRef)img);
    [player        release];
    [player2       release];
    [imageBalloon1 release];
    [imageBalloon2 release];
    [imageBalloon3 release];
    [photoView     release];
    [photo         release];
    [theEndFrEn    release];
    [theEnd        release];
    for(i=0;i<nAnimals;i++) [animalSound[i] release];
    for(i=0;i<4;i++) [randomsounds[i] release];
	[super dealloc];
}


@end
