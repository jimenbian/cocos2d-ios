//
//  HelloWorldLayer.h
//  Controlwalk
//
//  Created by 博 李 on 13-10-19.
//  Copyright 博 李 2013年. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "ZJoystick.h"
// HelloWorldLayer
@interface HelloWorldLayer : CCLayer<ZJoystickDelegate>
{
	CCTexture2D *spriteTexture_;	// weak ref
	//b2World* world;					// strong ref
	//GLESDebugDraw *m_debugDraw;		// strong ref
    
    CCTMXTiledMap *_gameMap;
    CCSprite    *_player;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
