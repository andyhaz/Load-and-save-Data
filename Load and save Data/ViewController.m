//
//  ViewController.m
//  Load and save Data
//
//  Created by andrew hazlett on 3/29/15.
//  Copyright (c) 2015 andrew hazlett. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize textField;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)laodButton:(id)sender {
    // Get the main window for the document.
    // get the url of a .txt file
    NSOpenPanel * zOpenPanel = [NSOpenPanel openPanel];
    NSArray * zAryOfExtensions = [NSArray arrayWithObject:@"txt"];
    [zOpenPanel setAllowedFileTypes:zAryOfExtensions];
    
    NSInteger zIntResult = [zOpenPanel runModal];
    if (zIntResult == NSFileHandlingPanelCancelButton) {
        NSLog(@"readUsingOpenPanel cancelled");
        return;
    }
    NSURL *zUrl = [zOpenPanel URL];
    
    // read the file
    NSString * zStr = [NSString stringWithContentsOfURL:zUrl
                                               encoding:NSASCIIStringEncoding
                                                  error:NULL];
   // NSLog(@"zStr=\n%@",zStr);
    
    [textField setStringValue:zStr];
}

- (IBAction)saveButton:(id)sender {
    // create the string to be written
    NSString *zStr = [textField stringValue];
    // get the file url
    NSSavePanel * zSavePanel = [NSSavePanel savePanel];
    NSArray * zAryOfExtensions = [NSArray arrayWithObject:@"txt"];
    [zSavePanel setAllowedFileTypes:zAryOfExtensions];
    
    NSInteger zResult = [zSavePanel runModal];
    
    if (zResult == NSFileHandlingPanelCancelButton) {
        NSLog(@"writeUsingSavePanel cancelled");
        return;
    }
    NSURL *zUrl = [zSavePanel URL];
    
    NSString *writeData = [NSString stringWithFormat:@"%@",zStr];
    
    //write
    BOOL zBoolResult = [writeData writeToURL:zUrl
                             atomically:YES
                               encoding:NSASCIIStringEncoding
                                  error:NULL];
    if (! zBoolResult) {
        NSLog(@"writeUsingSavePanel failed");
    }
    NSLog(@"zStr=\n%@",writeData);
}
@end
