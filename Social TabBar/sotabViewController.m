//
//  sotabViewController.m
//  Social TabBar
//
//  Created by Eduardo Sierra on 6/24/13.
//  Copyright (c) 2013 Eduardo Sierra. All rights reserved.
//

#import "sotabViewController.h"

@interface sotabViewController ()

@end

@implementation sotabViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //Adding a bar on top of the keyboard to post to a social network
    UIToolbar *socialtabbar = [[UIToolbar alloc]init];
    [socialtabbar setBarStyle:UIBarStyleBlackOpaque];
    [socialtabbar sizeToFit];
    
    UIBarButtonItem *Facebook = [[UIBarButtonItem alloc]initWithTitle:@"Facebook" style:UIBarButtonItemStyleDone target:self action:@selector(Facebook)];
    
    UIBarButtonItem *Twitter = [[UIBarButtonItem alloc]initWithTitle:@"Twitter" style:UIBarButtonItemStyleDone target:self action:@selector(Twitter)];
    
    UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [socialtabbar setItems: [NSArray arrayWithObjects:Facebook, space, Twitter, nil]];
    [[self post]setInputAccessoryView:socialtabbar];
    
    self.post.delegate = self;

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)Facebook
{
    if(NSClassFromString(@"SLComposeViewController") != nil) {
        
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
            
            SLComposeViewController *facebook = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            
            //NSString *textfield = self.post.text;
            
            //If you want to add the textfield text
            //[facebook setInitialText:textfield];
            
            //Add your text
            [facebook setInitialText:@"ADD YOUR TEXT"];
            //Add an image
            [facebook addImage:[UIImage imageNamed:@"YOUR IMAGE"]];
            //Add a URL
            NSURL *url = [NSURL URLWithString:@"URL"];
            [facebook addURL:url];
            
            [self presentViewController:facebook animated:YES completion:nil];
        } else {
            // Show Alert View When The Application Cannot Post
            NSString *message1 = @"FACEBOOK NOT AVAILABLE";
            UIAlertView *alertView1 = [[UIAlertView alloc] initWithTitle:@"WARNING" message:message1 delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView1 show];}
    } else {
        NSString *message1 = @"FACEBOOK NOT AVAILABLE";
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"WARNING" message:message1 delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];}

}

- (void)Twitter
{
    if ([TWTweetComposeViewController canSendTweet]) {
    
        TWTweetComposeViewController *twitter = [[TWTweetComposeViewController alloc] init];
        
        //NSString *textfield = self.post.text;
        
        //If you want to add the textfield text
        //[twitter setInitialText:textfield];

        
        //Add your text
        [twitter setInitialText:@"ADD YOUR TEXT"];
        //Add an Image
        [twitter addImage:[UIImage imageNamed:@"YOUR IMAGE"]];
        //Add a URL
        NSURL *url = [NSURL URLWithString:@"URL"];
        [twitter addURL:url];
    
        [self presentViewController:twitter animated:YES completion:nil];
    } else {
        // Show Alert View When The Application Cannot Send Tweets
        NSString *message = @"TWITTER NOT AVAILABLE";
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"WARNING" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];}

}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [textField resignFirstResponder];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
    
}


- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}



@end
