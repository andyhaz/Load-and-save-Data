//
//  ViewController.m
//  Load and save Data
//
//  Created by andrew hazlett on 3/29/15.
//  Copyright (c) 2015 andrew hazlett. All rights reserved.
//

#import "ViewController.h"
#import "LoadSaveInterface.h"
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
    LoadSaveInterface *lsi = [[LoadSaveInterface alloc]init];
    [textField setStringValue:[lsi loadFileData]];
}

- (IBAction)saveButton:(id)sender {
    // create the string to be written
    LoadSaveInterface *lsi = [[LoadSaveInterface alloc]init];
    NSString *stringData = [textField stringValue];
    [lsi saveFileSata:stringData];
}
@end
