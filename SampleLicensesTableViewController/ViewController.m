//
//  ViewController.m
//  SampleLicensesTableViewController
//
//  Created by 三好 良和 on 12/02/11.
//  Copyright (c) 2012年 Yoshikazu Miyoshi. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "ViewController.h"

@interface ViewController()
- (void)showLicencesTableViewController;
@end

enum { LICENSE };

@implementation ViewController

@synthesize licencesTableViewController = licencesTableViewController_;

- (id)init{
  if ((self = [super initWithStyle:UITableViewStyleGrouped])) {
  }
  return self;
}

- (void)didReceiveMemoryWarning
{
  DBG_HERE
  [super didReceiveMemoryWarning];
}

- (void)dealloc{
  DBG_HERE
  self.licencesTableViewController = nil;
  [super dealloc];
}

#pragma mark - View lifecycle

- (void)loadView{
  DBG_HERE
  [super loadView];
}

- (void)viewDidLoad
{
  DBG_HERE
  [super viewDidLoad];
}

- (void)viewDidUnload
{
  DBG_HERE
  [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
  DBG_HERE
  [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
  DBG_HERE
  [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
  DBG_HERE
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
  DBG_HERE
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  DBG_HERE
    // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

#pragma mark - TableViewController
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return 5;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  DBG_HERE
  UITableViewCell *cell = [[[UITableViewCell alloc]init]autorelease];
  if (indexPath.row==LICENSE) {
    cell.textLabel.text = NSLocalizedString(@"Legal Notice", nil);
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  }
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  DBG_HERE
  if (indexPath.row==LICENSE) {
    [self showLicencesTableViewController];
  }
}

#pragma mark - Private Methods

- (void)showLicencesTableViewController{
  DBG_HERE
  if (self.licencesTableViewController==nil) {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"licenses" ofType:@"plist"];
    NSDictionary *licenses = [NSDictionary dictionaryWithContentsOfFile:path];
    self.licencesTableViewController = [[[LicensesTableViewController alloc]initWithDictionary:licenses]autorelease];
  }
  [self.navigationController pushViewController:self.licencesTableViewController animated:YES];
}
@end
