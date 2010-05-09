//
//  oibconfigAppDelegate.m
//  oibconfig
//
//  Created by Neonkoala on 02/05/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "oibconfigAppDelegate.h"
#import "oibconfigViewController.h"

@implementation oibconfigAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    id initnvramutils;
	initnvramutils=[nvramutils new];
	int gotconfig = [initnvramutils grabNVRAM];
    // Override point for customization after app launch
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
	if (gotconfig==-3) {
		UIAlertView* wrongnvramalert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Openiboot is not installed or NVRAM is corrupt." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[wrongnvramalert show];
		[wrongnvramalert release];
	} else if (gotconfig!=0) {
		UIAlertView* getconfigalert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"NVRAM configuration could not be read." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[getconfigalert show];
		[getconfigalert release];
	}
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
