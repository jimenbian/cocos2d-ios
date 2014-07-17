//
//  HelloWorldLayer.m
//  Controlwalk
//
//  Created by 博 李 on 13-10-19.
//  Copyright 博 李 2013年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "ZJoystick.h"
#pragma mark - HelloWorldLayer
@interface HelloWorldLayer()
//-(void) initPhysics;
-(void) initJoystick;
@end
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
		//  以下的内容会在此处添加代码，以生成动画效果。
        //  1.使用plist文件将精灵帧和纹理添加到精灵帧缓存中
        [[CCSpriteFrameCache sharedSpriteFrameCache]addSpriteFramesWithFile:@"panda.plist"];
        
        
        //  2.创建一个CCSpriteBatchNode（精灵表单）对象
        CCSpriteBatchNode *batchNode = [CCSpriteBatchNode batchNodeWithFile:@"panda.png"];
        [self addChild:batchNode];
        
        //  3.创建图片帧列表
        
        NSMutableArray *walkAnimFrames = [NSMutableArray array];
        
        for(int i=1; i<3;i++){
            [walkAnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache]spriteFrameByName:[NSString stringWithFormat:@"pandawalk%d.png",i]]];
            //  4.创建动画对象
            
            CCAnimation *walkAnim =[CCAnimation animationWithSpriteFrames:walkAnimFrames delay:0.6f];
            //  5.创建精灵对象，并运行动画动作
            CGSize size = [CCDirector sharedDirector].winSize;
            CCSprite *panda = [CCSprite spriteWithSpriteFrameName:@"pandawalk3.png"];
            
            panda.position = ccp(size.width*0.5,size.height*0.4);
            _player=panda;
            
            id walkAction = [CCRepeatForever actionWithAction:
                             [CCAnimate actionWithAnimation:walkAnim restoreOriginalFrame:YES]];
            
            [panda runAction:walkAction];
            //前移
            //id moveAction =[CCMoveTo actionWithDuration:20.0f position:ccp(size.width*0.2,size.height*0.4)];
            
            //[panda runAction:moveAction];
            
            [batchNode addChild:panda];
            self.isTouchEnabled = YES;
            [self initJoystick];

        }

	}
	return self;
}
-(void) initJoystick{
    
    ZJoystick *_joystick2		 = [ZJoystick joystickNormalSpriteFile:@"JoystickContainer_norm.png"
                                               selectedSpriteFile:@"JoystickContainer_trans.png"
                                             controllerSpriteFile:@"Joystick_norm.png"];
    _joystick2.position          = ccp(_joystick2.contentSize.width/2 + 10,
                                       _joystick2.contentSize.height/2 + 10);
    _joystick2.delegate          = self;    //Joystick Delegate
    _joystick2.controlledObject  = _player;
    _joystick2.speedRatio        = 2.0f;
    _joystick2.joystickRadius    = 50.0f;   //added in v1.2
    _joystick2.joystickTag       = 999;
    [self addChild:_joystick2];
    
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

#pragma mark - zJoystick delegate methods
-(void)joystickControlBegan {
    //	CCLOG(@"Joystick Began Controlling");
	
}

-(void)joystickControlMoved {
    //	CCLOG(@"Joystick Move Controlling");
	
}

-(void)joystickControlEnded {
    //	CCLOG(@"Joystick End Controlling");
	
}

-(void)joystickControlDidUpdate:(id)joystick toXSpeedRatio:(CGFloat)xSpeedRatio toYSpeedRatio:(CGFloat)ySpeedRatio{
    
    ZJoystick *zJoystick = (ZJoystick *)joystick;
    
    if (zJoystick.joystickTag == 999) {
        CGFloat xPos = _player.position.x;
        CGFloat yPos = _player.position.y;
        _player.position = ccp(xPos + xSpeedRatio, yPos + ySpeedRatio);
    }
}
@end
