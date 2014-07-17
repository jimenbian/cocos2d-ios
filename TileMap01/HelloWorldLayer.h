//
//  HelloWorldLayer.h
//  TileMap01
//
//  Created by 博 李 on 13-10-12.
//  Copyright 博 李 2013年. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    CCTMXTiledMap *tileMap;
    CCTMXLayer *background;
}

@property(nonatomic,retain)CCTMXTiledMap *tileMap;
@property(nonatomic,retain)CCTMXLayer *background;
// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
