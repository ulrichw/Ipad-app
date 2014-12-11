//
//  PuzzleMenu.m
//  NewParisZoo
//
//  Created by sebastien couvidat on 12/30/11.
//  Copyright 2011 Sebastien Couvidat and Hilda Karugabira. All rights reserved.
//

#import "MainMenu.h"
#import "PuzzleMenu.h"
#import "GamesMenu.h"
#import "Confirmation.h"

@implementation PuzzleMenu

@synthesize caller,caller2,bannerAnimation;
@synthesize listOfPieces,successSound,applauseSound;
@synthesize hintImageView1,hintImageView2;
@synthesize puzzleCompleteView,confirmationCalled,titleImage;
@synthesize backButton,imageBkng,hint1Button,hint2Button,clearPuzzle,hintView,audioButton;

- (void)viewDidLoad {

    [super viewDidLoad];

    srand(time(NULL));

    widthRef   =768;//[[UIScreen mainScreen] bounds].size.width;
    heightRef  =1024;//[[UIScreen mainScreen] bounds].size.height;

	listOfPieces = [[NSArray alloc] initWithObjects:
					@"A1",@"A2",@"A3",@"A4",@"A5",@"A6",@"A7",@"A8",@"A9",@"A10",
					@"B1",@"B2",@"B3",@"B4",@"B5",@"B6",@"B7",@"B8",@"B9",@"B10",
					@"C1",@"C2",@"C3",@"C4",@"C5",@"C6",@"C7",@"C8",@"C9",@"C10",
					@"D1",@"D2",@"D3",@"D4",@"D5",@"D6",@"D7",@"D8",@"D9",@"D10",
					@"E1",@"E2",@"E3",@"E4",@"E5",@"E6",@"E7",@"E8",@"E9",@"E10",
					@"F1",@"F2",@"F3",@"F4",@"F5",@"F6",@"F7",@"F8",@"F9",@"F10",
					nil];
	
	maxDistance = 20.0;
		
	hintImage[0] = [UIImage imageNamed:@"Jigsaw_Puzzle_Hints_01.png"];
	hintImage[1] = [UIImage imageNamed:@"Jigsaw_Puzzle_Hints_02.jpg"];
		
	hintImageView1 = [[UIImageView alloc] initWithImage:hintImage[0]];
	hintImageView2 = [[UIImageView alloc] initWithImage:hintImage[1]];
	self.hintImageView1.hidden = YES;
	self.hintImageView2.hidden = YES;
	self.hintImageView1.frame  = CGRectMake(0.,10.,hintImage[0].size.width,hintImage[0].size.height);
	self.hintImageView2.frame  = CGRectMake(0.,10.,hintImage[1].size.width,hintImage[1].size.height);

    CGPoint center = CGPointMake(heightRef/2.-7,widthRef/2.+2);
    self.hintImageView2.center=center;
	
    [self.view addSubview:self.hintImageView1];
	[self.view addSubview:self.hintImageView2];
	[self.view addSubview:self.puzzleCompleteView];

	[self.view sendSubviewToBack:self.hintImageView1];
	[self.view sendSubviewToBack:self.hintImageView2];
	[self.view sendSubviewToBack:self.imageBkng];

	correctPieces = 0;
	
	//create the animation for the "puzzle complete!" banner
	self.bannerAnimation          = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
	self.bannerAnimation.keyTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0] ,[NSNumber numberWithFloat:0.6] ,[NSNumber numberWithFloat:1.0],nil];
	self.bannerAnimation.values   = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.01],[NSNumber numberWithFloat:1.15],[NSNumber numberWithFloat:1.0],nil];
	
	//create sound of successful piece		
    self.successSound =[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"CLICK_A" ofType: @"mp3"]];
    self.applauseSound=[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: @"applause2_x" ofType: @"mp3"]];

	preferences = [NSUserDefaults standardUserDefaults];
	
    self.confirmationCalled = NO;
    buttonToAnimate=nil;
    
    //set the appropriate title image (in English or French)
    
    if([preferences boolForKey:@"language"]) //if it's in English
	{
        titleImageFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"English_Title_JigsawPuzzle" ofType:@"png" ]];
        startOverImageFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Button_Start_Over" ofType:@"png" ]];
        hintImageFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Button_Hints" ofType:@"png" ]];
        puzzleCompleteFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"PuzzleComplete" ofType:@"png" ]];
    }else{
        titleImageFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"French_Title_Puzzle" ofType:@"png" ]];
        startOverImageFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"French_Button_Recommence" ofType:@"png" ]];
        hintImageFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Button_Indices" ofType:@"png" ]];
        puzzleCompleteFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"PuzzleComplete_FR" ofType:@"png" ]];
    }
    
    [self.titleImage  setImage:titleImageFrEn];
    [self.clearPuzzle setImage:startOverImageFrEn forState:UIControlStateNormal];
    [self.hintView    setImage:hintImageFrEn];

    puzzleCompleteView =[[UIImageView alloc] initWithImage:puzzleCompleteFrEn];
	self.puzzleCompleteView.hidden = YES;
    center= CGPointMake(heightRef/2.,widthRef/2.);
    self.puzzleCompleteView.center  = center;
    [self.view addSubview:self.puzzleCompleteView];

    nullImage  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"NULL" ofType:@"png"]];
    
    BKGDImage  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Jigsaw_Puzzle_Bkgd" ofType:@"jpg"]];
    [self.imageBkng setImage:BKGDImage];
    
    self.backButton.exclusiveTouch =YES;
	self.hint1Button.exclusiveTouch=YES;
	self.hint2Button.exclusiveTouch=YES;
	self.clearPuzzle.exclusiveTouch=YES;
	self.audioButton.exclusiveTouch=YES;
    
    CGFloat listOfX[] = {
        161.0,228.0,307.0,386.0,455.5,545.5,625.0,705.0,784.5,851.5,
        151.0,218.5,297.5,387.5,465.5,545.0,635.5,705.0,784.0,861.0,
        160.0,227.0,308.0,386.0,466.5,545.5,615.0,695.0,773.5,851.0,
        159.0,236.0,307.0,376.0,466.0,555.5,625.5,694.5,782.0,861.0,
        150.5,217.0,297.5,386.0,466.0,535.5,625.0,705.0,773.5,851.5,
        161.0,237.5,306.5,376.0,455.0,545.0,625.5,695.0,784.0,860.5};
	CGFloat listOfY[] = {
        148.0,137.5,138.0,149.0,137.0,148.5,151.0,147.5,148.5,138.5,
        231.0,231.5,221.5,243.0,231.0,242.0,243.0,231.0,243.0,232.5,
        314.0,340.5,327.0,339.5,339.0,327.5,327.5,327.5,327.5,338.5,
        423.5,435.0,424.5,436.0,424.0,423.5,424.5,435.0,423.5,426.5,
        531.0,520.5,522.0,532.5,509.0,532.0,520.5,532.5,521.0,523.0,
        614.0,603.5,615.5,614.5,603.5,614.5,603.0,614.5,604.0,615.5};
    
    for(i=0;i<nPiecePuzzle;i++)
	{
		//correct locations of puzzle pieces
		centerX[i]=listOfX[i];
		centerY[i]=listOfY[i]+10.0;
    }
    
    for(i=0;i<nPiecePuzzle;i++)
	{
		puzzleImage[i]   = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[self.listOfPieces objectAtIndex:i] ofType:@"png"]];
		puzzleElement[i] = [[UIImageView alloc] initWithImage:puzzleImage[i]];
 		puzzleElement[i].userInteractionEnabled = YES;
		puzzleElement[i].frame = CGRectMake(listOfX[i]-puzzleImage[i].size.width/2.,listOfY[i]-puzzleImage[i].size.height/2.0,puzzleImage[i].size.width,puzzleImage[i].size.height);
		[self.view addSubview:puzzleElement[i]];
        puzzleElement[i].hidden= YES;
		puzzleElement[i].alpha = 1.0;
    }
    
    isInitialized = 1001;

	[self.caller setImageForAudioButtons];
    [self createPieces];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
	return (interfaceOrientation == UIInterfaceOrientationLandscapeRight || interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

- (void) createPieces{

    if(isInitialized == 1001)
    {

        CGFloat listOfX[nPiecePuzzle];
        CGFloat listOfY[nPiecePuzzle];
        
		//generate random initial locations
        for(i=0;i<nPiecePuzzle;i++)
        {
            listOfX[i] = rand() % 900 +50 ;
            listOfY[i] = rand() % 600 +50 ;
            if(listOfX[i] <= 250 && listOfY[i] <= 250) listOfX[i]= 250; //to avoid the home button
            if(listOfX[i] >= 820 && listOfY[i] <= 200) listOfX[i]= 820; //to avoid the sound button
            puzzleElement[i].frame = CGRectMake(listOfX[i]-puzzleImage[i].size.width/2.,listOfY[i]-puzzleImage[i].size.height/2.0,puzzleImage[i].size.width,puzzleImage[i].size.height);
            puzzleElement[i].hidden=NO;
        }
	}

}

- (void) changeTitleLanguage: (BOOL) inEnglish{
	
    if(isInitialized == 1001){
        
        for(i=0;i<nPiecePuzzle;i++) [puzzleImage[i] release];
        [titleImageFrEn     release];
        [startOverImageFrEn release];
        [hintImageFrEn      release];
        [puzzleCompleteFrEn release];
        [BKGDImage          release];

        if(inEnglish) //if it's in English
        {
            titleImageFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"English_Title_JigsawPuzzle" ofType:@"png" ]];
            startOverImageFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Button_Start_Over" ofType:@"png" ]];
            hintImageFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Button_Hints" ofType:@"png" ]];
            puzzleCompleteFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"PuzzleComplete" ofType:@"png" ]];
         }
        else {
            titleImageFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"French_Title_Puzzle" ofType:@"png" ]];
            startOverImageFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"French_Button_Recommence" ofType:@"png" ]];
            hintImageFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Button_Indices" ofType:@"png" ]];
            puzzleCompleteFrEn=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"PuzzleComplete_FR" ofType:@"png" ]];
         }
        [self.titleImage  setImage:titleImageFrEn];
        [self.clearPuzzle setImage:startOverImageFrEn forState:UIControlStateNormal];
        [self.hintView    setImage:hintImageFrEn];
        [self.puzzleCompleteView setImage:puzzleCompleteFrEn];
        BKGDImage  = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Jigsaw_Puzzle_Bkgd" ofType:@"jpg"]];
        [self.imageBkng setImage:BKGDImage];
        for(i=0;i<nPiecePuzzle;i++)
        {
            puzzleImage[i]   = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[self.listOfPieces objectAtIndex:i] ofType:@"png"]];
            [puzzleElement[i] setImage:puzzleImage[i]];
        }
    }
    
}

- (IBAction) backButtonClicked{
    [self deactivateAllButtons];
    buttonToAnimate=self.backButton;
    [player stop];
    [player release];
    player=nil;
    [self animateView];
}
-(void) endAnimationBackButton{
    
    self.confirmationCalled=YES;
    self.caller.confirmation.start=NO; //we do not want to start over, we want to exit the game
    self.caller.confirmation.caller = self;
    [self.caller.confirmation createConfirmation];
}

-(void) enableAllButtons{
    self.hint1Button.userInteractionEnabled=YES;
    self.hint2Button.userInteractionEnabled=YES;
    self.audioButton.userInteractionEnabled=YES;
    self.clearPuzzle.userInteractionEnabled=YES;
    self.backButton.userInteractionEnabled =YES;
}

-(void) deactivateAllButtons{
    self.hint1Button.userInteractionEnabled=NO;
    self.hint2Button.userInteractionEnabled=NO;
    self.audioButton.userInteractionEnabled=NO;
    self.clearPuzzle.userInteractionEnabled=NO;
    self.backButton.userInteractionEnabled =NO;
}

-(void) confirmationCalled:(BOOL)isCalled withExit:(BOOL)exiting{
    self.confirmationCalled = isCalled;
    if(exiting)
    {
        [puzzleCompleteFrEn release];
        puzzleCompleteFrEn=nil;
        [puzzleCompleteView setImage:nullImage];
        for(i=0;i<nPiecePuzzle;i++)
        {
            [puzzleImage[i]   release];
            puzzleImage[i]=nil;
            [puzzleElement[i] setImage:nullImage];
            [BKGDImage        release];
            BKGDImage=nil;
            [self.imageBkng setImage:nullImage];
        }
    }
}
- (void) pauseTimers{}
- (void) pauseLayers{}
- (void) resumeTimers{}
- (void) resumeLayers{}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if(self.confirmationCalled)[self.caller.confirmation touchesBegan:touches withEvent:event];
}


- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	
	UITouch *touch=[touches anyObject];
		
    if(!(self.confirmationCalled)){
	for(i=0;i<nPiecePuzzle;i++)
	{
		if ([touch view] == puzzleElement[i])
		{		
			puzzleElement[i].center = [touch locationInView:[puzzleElement[i] superview]];
			[self.view bringSubviewToFront:puzzleElement[i]];
		}
	}
	}
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	
	UITouch *touch=[touches anyObject];
	
	CGPoint centerPoint;
	CGFloat distance;
	
    if(!(self.confirmationCalled)){
	for(i=0;i<nPiecePuzzle;i++)
	{
		if ([touch view] == puzzleElement[i])
		{		
			centerPoint.x = puzzleElement[i].center.x;
			centerPoint.y = puzzleElement[i].center.y;
			distance=(centerPoint.x-centerX[i])*(centerPoint.x-centerX[i])+(centerPoint.y-centerY[i])*(centerPoint.y-centerY[i]);
			//if the piece is correctly located
			if(distance < maxDistance*maxDistance)
			{
				if([preferences boolForKey:@"audio"])
                {
                    [player stop];
                    [player release];
                    player=nil;
                    player = [[AVAudioPlayer alloc] initWithContentsOfURL:successSound error:&error];
                    player.delegate=(id)self;
                    player.volume = 1.0f;
                    if([player prepareToPlay])[player play];
                }
                
				centerPoint.x = centerX[i];
				centerPoint.y = centerY[i];
				puzzleElement[i].center = centerPoint;
				puzzleElement[i].userInteractionEnabled = NO;
				[self.view sendSubviewToBack:puzzleElement[i]];
				[self.view sendSubviewToBack:self.hintImageView1];
				[self.view sendSubviewToBack:self.hintImageView2];
				[self.view sendSubviewToBack:self.imageBkng];
				
				correctPieces += 1;
				if(correctPieces == nPiecePuzzle)
				{
                    if([preferences boolForKey:@"audio"])
                    {
                        [player stop];
                        [player release];
                        player=nil;
                        player = [[AVAudioPlayer alloc] initWithContentsOfURL:applauseSound error:&error];
                        player.delegate=(id)self;
                        player.volume = 1.0f;
                        if([player prepareToPlay])[player play];
                    }
					[self bannerWillAppear];
				}

			}
		}
	}
	}
}
	
- (IBAction) hint1ButtonClicked: (id) sender{
    [self deactivateAllButtons];
    buttonToAnimate=self.hint1Button;
    [self animateView];
}
-(void) endAnimationHint1Button{
    
	if(self.hintImageView1.hidden == YES)
	{
		self.hintImageView1.hidden = NO;
		self.hintImageView2.hidden = YES;
	} 
	else 
	{
		self.hintImageView1.hidden = YES;
		self.hintImageView2.hidden = YES;
	}

    [self enableAllButtons];
}

- (IBAction) hint2ButtonClicked: (id) sender{
    [self deactivateAllButtons];
    buttonToAnimate=self.hint2Button;
    [self animateView];
}
-(void) endAnimationHint2Button{

	if(self.hintImageView2.hidden == YES)
	{
		self.hintImageView2.hidden = NO;
		self.hintImageView1.hidden = YES;	
	}
	else 
	{
		self.hintImageView1.hidden = YES;
		self.hintImageView2.hidden = YES;
	}
    
	[self enableAllButtons];
		
}

- (IBAction) clearPuzzleClicked: (id) sender{
    [self deactivateAllButtons];
    self.confirmationCalled=YES;
    self.caller.confirmation.start=YES; //we do not want to start over, we want to exit the game
    self.caller.confirmation.caller = self;
    [self.caller.confirmation createConfirmation];
}
- (void) startOverCalled{
    buttonToAnimate=self.clearPuzzle;
    [self animateView];
}
-(void) endAnimationClearPuzzle{
	
	CGPoint centerPoint;
		
	for(i=0;i<nPiecePuzzle;i++)
	{
		//generate random locations
		centerPoint.x = rand() % 900 +50;
		centerPoint.y = rand() % 600 +50;
        if(centerPoint.x <= 250 && centerPoint.y <= 250) centerPoint.x= 250; //to avoid the home button
        if(centerPoint.x >= 820 && centerPoint.y <= 200) centerPoint.x= 820; //to avoid the sound button
		puzzleElement[i].center = centerPoint;
		puzzleElement[i].userInteractionEnabled = YES;
	}
	correctPieces = 0;
	self.puzzleCompleteView.hidden = YES;
    [self enableAllButtons];
}

- (void) bannerAnimate: (UIImageView *)imageView{
	imageView.hidden = NO;
    [self.view bringSubviewToFront:imageView];
	[[imageView layer] addAnimation:bannerAnimation forKey:@"transform.scale"];
}

- (void) bannerWillAppear{
	[self.bannerAnimation setDuration:0.65];
	[self performSelector:@selector(bannerAnimate:) withObject:self.puzzleCompleteView afterDelay:0];
}

- (IBAction) buttonAudioClicked: (id) sender{
	
	[self.caller buttonAudioClicked:sender];
}

- (void) animateView
{
    CGAffineTransform affineTransform = CGAffineTransformMakeScale(1.0,1.0);
    [UIView beginAnimations:@"buttonTouched" context:nil];
    [UIView setAnimationDuration:0.15];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    buttonToAnimate.transform = CGAffineTransformScale(affineTransform,0.8,0.8);
    [UIView setAnimationDidStopSelector:@selector(animateViewDone)];
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
}

- (void) animateViewDone
{
    CGAffineTransform affineTransform = CGAffineTransformMakeScale(1.0,1.0);
	[UIView beginAnimations:@"buttonTouchedDone" context:nil];
	[UIView setAnimationDuration:0.15];
	[UIView setAnimationCurve:UIViewAnimationCurveLinear];
    buttonToAnimate.transform = CGAffineTransformScale(affineTransform,1.0,1.0);
    if([buttonToAnimate isEqual:self.backButton])    [UIView setAnimationDidStopSelector:@selector(endAnimationBackButton) ];
    if([buttonToAnimate isEqual:self.hint1Button])   [UIView setAnimationDidStopSelector:@selector(endAnimationHint1Button)];
    if([buttonToAnimate isEqual:self.hint2Button])   [UIView setAnimationDidStopSelector:@selector(endAnimationHint2Button)];
    if([buttonToAnimate isEqual:self.audioButton])   [UIView setAnimationDidStopSelector:@selector(endAnimationAudioButton)];
    if([buttonToAnimate isEqual:self.clearPuzzle])   [UIView setAnimationDidStopSelector:@selector(endAnimationClearPuzzle)];
    [UIView setAnimationDelegate:self];
	[UIView commitAnimations];
}

- (void) doneWithMessage{}

- (void)didReceiveMemoryWarning {
		
	[super didReceiveMemoryWarning];
	
}

- (void) viewDidUnload{
    
	self.bannerAnimation   = nil;
	self.listOfPieces      = nil;
	self.hintImageView1    = nil;
	self.hintImageView2    = nil;
	self.puzzleCompleteView= nil;
	self.successSound      = nil;
	self.backButton        = nil;
	self.imageBkng         = nil;
	self.hint1Button       = nil;
	self.hint2Button       = nil;
	self.clearPuzzle       = nil;
	self.hintView          = nil;
	self.audioButton       = nil;
    self.titleImage        = nil;
    self.applauseSound     = nil;
    [titleImageFrEn     release];
    [startOverImageFrEn release];
    [hintImageFrEn      release];
    [puzzleCompleteFrEn release];
    titleImageFrEn         = nil;
    startOverImageFrEn     = nil;
    hintImageFrEn          = nil;
    puzzleCompleteFrEn     = nil;
    for(i=0;i<nPiecePuzzle;i++)
	{
    [puzzleImage[i]     release];
    puzzleImage[i]         = nil;
    [puzzleElement[i]   release];
    puzzleElement[i]       = nil;
    }
    [BKGDImage          release];
    BKGDImage              = nil;
    [nullImage          release];
    nullImage              = nil;
    [player release];
    player=nil;
    isInitialized=0;
    [super viewDidUnload];
}


- (void) dealloc{
	
    for(i=0;i<nPiecePuzzle;i++) [puzzleElement[i] release];
    for(i=0;i<nPiecePuzzle;i++) [puzzleImage[i] release];
    [listOfPieces       release];
	[caller             release];
	[caller2            release];
	[hintImageView1     release];
	[hintImageView2     release];
	[puzzleCompleteView release];
	[bannerAnimation    release];
	[backButton         release];
	[imageBkng          release];
	[hint1Button        release];
	[hint2Button        release];
	[clearPuzzle        release];
	[hintView           release];
	[successSound		release];
	[audioButton        release];
    [player             release];
    [titleImage         release];
    [titleImageFrEn     release];
    [startOverImageFrEn release];
    [hintImageFrEn      release];
    [puzzleCompleteFrEn release];
    [BKGDImage          release];
    [nullImage          release];
    [applauseSound      release];
    [super dealloc];
}

@end
