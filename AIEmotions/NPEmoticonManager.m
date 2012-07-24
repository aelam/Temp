//
//  NPEmoticonManager.m
//  niupai
//
//  Created by Ryan Wang on 7/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NPEmoticonManager.h"
#import "NPEmoticonPack.h"

#define DEFAULT_PACK_1  @"SmallNiuEmoji.bundle"
#define DEFAULT_PACK_2  @"BigNiuEmoji.bundle"

@interface NPEmoticonManager ()

+ (NSString *)newPacksSearchPath;

@end

@implementation NPEmoticonManager

+ (NPEmoticonManager *)sharedManager {
    static NPEmoticonManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[NPEmoticonManager alloc] init];
    });
    return _sharedManager;
}

+ (NSString *)newPacksSearchPath {
    return [NSHomeDirectory() stringByAppendingFormat:@"/Emojis/"];
}

- (NSArray *)defaultPacks {
    if (_defaultPacks == nil) {
        
        [self _loadPacks];
    }
    

    return _defaultPacks;
}

- (NSArray *)availablePacks {
    if (_availablePacks == nil) {
        [self _loadPacks];
    }
    
    return _availablePacks;
}

- (void)_loadPacks {
    
    NSMutableArray *packs = [[NSMutableArray alloc] initWithCapacity:0];
    
    NSString *resoucePath = [[NSBundle mainBundle] resourcePath];
    
    NSString *pack1Path = [resoucePath stringByAppendingPathComponent:DEFAULT_PACK_1];
    NPEmoticonPack *pack = [[NPEmoticonPack alloc] initWithFolder:pack1Path];
    [packs addObject:pack];
    [pack release];
    
    NSString *pack2Path = [resoucePath stringByAppendingPathComponent:DEFAULT_PACK_2];
    NPEmoticonPack *pack2 = [[NPEmoticonPack alloc] initWithFolder:pack2Path];
    
    [packs addObject:pack2];
    [pack2 release];  
    
    _defaultPacks = packs;

}



- (NSString *)styleStringWithString:(NSString *)string {
    [string rangeOfCharacterFromSet:<#(NSCharacterSet *)#>]
    
    return string;
}

- (void)dealloc {
    
    [_availablePacks release];
    [_defaultPacks release];
    [super dealloc];
}

@end
