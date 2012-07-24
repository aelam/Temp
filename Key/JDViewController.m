//
//  JDViewController.m
//  Key
//
//  Created by Ryan Wang on 7/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JDViewController.h"
#import "NPEmoticonManager.h"

@interface JDViewController ()

@end

@implementation JDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"face" ofType:@"plist"];
//    NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:path];
//    NSLog(@"%@",dic);
//    
//
//    NSLog(@"%@",[dic objectForKey:@"NO"]);
//
//    NSLog(@"%@",[dic objectForKey:@"乒乓"]);
//    NSLog(@"%@",[dic objectForKey:@"大兵"]);
    
//    NSLog(@"%@",[[NPEmoticonManager sharedManager] defaultPacks]);
//    [self write];
//    NSString
    
    NSString *testSting = @"[OK]fsdfdsfs [No][dfsdfsdl][]";
    
    NSString *new = [[NPEmoticonManager sharedManager] styleStringWithString:testSting];
    NSLog(@"old = %@",testSting);
    NSLog(@"output = %@",new);
}

- (void)write {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    NSMutableArray *niuniuNames = [NSMutableArray arrayWithCapacity:0];
    NSString *imagesPath = [[NSBundle mainBundle] resourcePath];
    NSString *niuniuPath = [imagesPath stringByAppendingPathComponent:@"SmallNiuEmoji.bundle"];
    NSFileManager *fmanager=[NSFileManager defaultManager];
    NSArray *directoryContents=[fmanager contentsOfDirectoryAtPath:niuniuPath error:NULL];
    
    for(NSString *fileName in directoryContents) {
        if([[fileName pathExtension] caseInsensitiveCompare:@"png"]==NSOrderedSame) {
//            [niuniuNames addObject:fileName];
            
            [dic setObject:fileName forKey:[NSString stringWithFormat:@"[%@]",[fileName stringByDeletingPathExtension]]];
        }
    }
    
    [dic writeToFile:@"/Users/ryan/Desktop/hello.plist" atomically:YES];
    

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
