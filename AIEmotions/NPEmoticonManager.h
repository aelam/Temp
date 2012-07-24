//
//  NPEmoticonManager.h
//  niupai
//
//  Created by Ryan Wang on 7/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NPEmoticonManager : NSObject {
    NSArray *_defaultPacks;
    NSArray *_availablePacks;
}

+ (NPEmoticonManager *)sharedManager;

- (NSArray *)availablePacks;
- (NSArray *)defaultPacks;

- (NSString *)styleStringWithString:(NSString *)string;

@end
