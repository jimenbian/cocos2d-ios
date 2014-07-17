//
//  HelloWorldLayer.h
//  ScreenMove
//
//  Created by 博 李 on 13-10-19.
//  Copyright 博 李 2013年. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    
    CCParallaxNode *backgroundNode;
    CCSprite *mainBg;
    CCSprite *mainBg2;
    CCSprite *cloud1;
    CCSprite *cloud2;
    CCSprite *cloud3;
    
    CCSprite *player;
    
    CCLabelBMFont * titleLabel1;
    CCLabelBMFont * titleLabel2;
    CCMenuItemLabel *playItem;
    
    CCSpriteBatchNode *batchNode;
    
    
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
