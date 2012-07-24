//
//  NPEmotionPack.m
//  niupai
//
//  Created by Ryan Wang on 7/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NPEmoticonPack.h"
#import "NPEmotion.h"

#define BASE_INFO_PLIST_NAME            @"BaseInfo.plist"

#define BASE_INFO_NAME_KEY              @"DisplayName"
#define BASE_INFO_VERSION_KEY           @"Version"
#define BASE_INFO_SELECT_TO_SEND_KEY    @"SelectToSend"
#define BASE_INFO_SMALL_SIZE_KEY        @"SmallSize"
#define BASE_INFO_MAP_FILE_KEY          @"MapFileName"

@implementation NPEmoticonPack

@synthesize identifer = _identifer;
@synthesize path = _path;
@synthesize version = _version;
@synthesize name = _name;
@synthesize emoticons = _emoticons;
@synthesize selectToSend = _selectToSend;

- (id)initWithFolder:(NSString *)folder {
    if (self = [super init]) {
        _path = [folder retain];
        NSLog(@"Pack Folder :%@",folder);
    }
    
    return self;
}

- (NSString *)version {
    if (!_version) {
        [self _readBaseInfo];
    }
    return _version;
}

- (NSString *)name {
    if (!_name) {
        [self _readBaseInfo];
    }
    return _name;
}

- (BOOL)selectToSend {
    if (!_version) {
        [self _readBaseInfo];
    }

    return _selectToSend;
}


- (void)_readBaseInfo {
    NSString *baseInfoPath = [_path stringByAppendingPathComponent:BASE_INFO_PLIST_NAME];
    NSDictionary *baseInfo = [NSDictionary dictionaryWithContentsOfFile:baseInfoPath];
    
    _name = [[baseInfo objectForKey:BASE_INFO_NAME_KEY]retain];
    _version = [[baseInfo objectForKey:BASE_INFO_VERSION_KEY] retain];
    _selectToSend = [[baseInfo objectForKey:BASE_INFO_SELECT_TO_SEND_KEY] boolValue];
    
    _emoticons = [[NSMutableArray alloc] init];
    
    NSString *mapFileName = [baseInfo objectForKey:BASE_INFO_MAP_FILE_KEY];
    NSString *mapFile = [_path stringByAppendingPathComponent:mapFileName];
    
    NSDictionary *maps = [NSDictionary dictionaryWithContentsOfFile:mapFile];
        
    for(NSString *key in [maps allKeys]) {
        NSString *value = [maps objectForKey:key];
        NPEmotion *emotion = [NPEmotion emoticonWithIconPath:[_path stringByAppendingPathComponent:value] equivalent:key name:key pack:self];
        
        [_emoticons addObject:emotion];
    }
    
    
}

- (void)load {
    
}

- (void)unload {
    
}

- (void)flushEmoticonImageCache {
    
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Name : %@ Version : %@ _emoticons count : %d",self.name,self.version,[self.emoticons count]];
}


- (void)dealloc {
    [_identifer release];
    [_name release];
    [_path release];
    [_emoticons release];
    [super dealloc];
}

@end
