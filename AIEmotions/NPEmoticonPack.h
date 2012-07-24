//
//  NPEmoticonPack.h
//  niupai
//
//  Created by Ryan Wang on 7/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NPEmoticonPack : NSObject

@property (nonatomic,readonly) NSString *identifer;
@property (nonatomic,readonly) NSString *version;
@property (nonatomic,readonly) NSString *name;
@property (nonatomic,readonly) NSString *path;
@property (nonatomic,readonly) NSMutableArray *emoticons;
@property (nonatomic,readonly) BOOL selectToSend;

- (id)initWithFolder:(NSString *)folder;

- (void)flushEmoticonImageCache;


@end
