//
//  NPEmotion.m
//  niupai
//
//  Created by Ryan Wang on 7/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NPEmotion.h"
#import "NPEmoticonPack.h"

@implementation NPEmotion

@synthesize version;
@synthesize pack;
@synthesize path;
@synthesize name;

+ (id)emoticonWithIconPath:(NSString *)inPath equivalent:(NSString *)inTextEquivalent name:(NSString *)inName pack:(NPEmoticonPack *)inPack {
    
    return [[[self alloc] initWithIconPath:inPath equivalent:inTextEquivalent name:inName pack:inPack] autorelease];
}

- (NPEmotion *)initWithIconPath:(NSString *)inPath equivalent:(NSString *)inTextEquivalent name:(NSString *)inName pack:(NPEmoticonPack *)inPack
{
    if ((self = [super init])) {
		path = [inPath retain];
		name = [inName retain];
		_textEquivalent = [inTextEquivalent retain];
		pack = [inPack retain];
		imageLoaded = NO;
    }
    
    return self;
}



- (NSString *)HTMLStringWithTextEquivalent:(NSString *)textEquivalent {
    
    return @"";
}


- (void)flushEmoticonImageCache {
    
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name : %@ path : %@, equivalent : %@",name,path,_textEquivalent];
}

- (void)dealloc {
    [version release];
    [pack release];
    [path release];
    [name release];
    [super dealloc];
}

@end
