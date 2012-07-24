//
//  NPEmotion.h
//  niupai
//
//  Created by Ryan Wang on 7/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NPEmoticonPack;

@interface NPEmotion : NSObject {
    BOOL        imageLoaded;
    NSString    *_textEquivalent;
}

@property (nonatomic,readonly) NSString *version;
@property (nonatomic,readonly) NPEmoticonPack *pack;
@property (nonatomic,readonly) NSString *name;
@property (nonatomic,readonly) NSString *path;

+ (id)emoticonWithIconPath:(NSString *)inPath equivalent:(NSString *)inTextEquivalent name:(NSString *)inName pack:(NPEmoticonPack *)inPack;

- (NSString *)HTMLStringWithTextEquivalent:(NSString *)textEquivalent;

- (void)flushEmoticonImageCache;


@end
