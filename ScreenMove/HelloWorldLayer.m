//
//  HelloWorldLayer.m
//  ScreenMove
//
//  Created by 博 李 on 13-10-19.
//  Copyright 博 李 2013年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		CGSize winSize = [CCDirector sharedDirector].winSize;
        
        // 1) 创建 CCParallaxNode视差滚动节点
        backgroundNode = [CCParallaxNode node];
        [self addChild:backgroundNode z:-2];
        
        // 2) 创建需要添加到CCParallaxNode视差滚动节点的精灵对象
        
        mainBg = [CCSprite spriteWithFile:@"bg.png"];
        // 3) 设置云彩的浮动速度 和背景速度
       
        CGPoint bgSpeed = ccp(0.05, 0.05);
        
        
        // 4) 将精灵对象添加为CCParallaxNode视差滚动节点的子节点
        [backgroundNode addChild:mainBg z:-1
                   parallaxRatio:bgSpeed
                  positionOffset:ccp(200,winSize.height*0.5)];
        
         [self scheduleUpdate];
        	}
	return self;
}
- (void)updateBackground:(ccTime)dt {
    CGSize size = [CCDirector sharedDirector].winSize;
    
    CGPoint backgroundScrollVel = ccp(-size.width, 0);
    backgroundNode.position =
    ccpAdd(backgroundNode.position,
           ccpMult(backgroundScrollVel, dt));
    CGSize winSize = [CCDirector sharedDirector].winSize;
    
    
    NSArray *backgrounds = [NSArray arrayWithObjects:mainBg,nil];
    for (CCSprite *background in backgrounds) {
        if ([backgroundNode convertToWorldSpace:background.position].x < -background.contentSize.width) {
            
            backgroundNode.position = ccp(winSize.width*4,0);
        }
    }
}


//实时更新
- (void)update:(ccTime)dt {
    
    [self updateBackground:dt];
   }



// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
