//
//  LicensesTableViewController.m
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

#import "LicensesTableViewController.h"

@interface LicensesTableViewController()
- (UITableViewCell *)dequeueCell:(NSIndexPath *)indexPath;
- (UITableViewCell *)createLicenseCell:(NSString *)title 
                           description:(NSString *)description;
@property (nonatomic, retain) NSDictionary *licensesDictionary;
@end

@implementation LicensesTableViewController

@synthesize licensesDictionary = licensesDictionary_;

- (id)initWithDictionary:(NSDictionary *)licensesDictionary{
  DBG_HERE
  if ((self=[super initWithStyle:UITableViewStylePlain])) {
    self.title = NSLocalizedString(@"Legal Notice", nil);
  }
  self.licensesDictionary = licensesDictionary;
  return self;
}

- (void)didReceiveMemoryWarning
{
  DBG_HERE
  [super didReceiveMemoryWarning];
}

- (void)dealloc{
  DBG_HERE
  self.licensesDictionary = nil;
  [super dealloc];
}

#pragma mark - View lifecycle

- (void)loadView
{
  DBG_HERE
  [super loadView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
  DBG_HERE
  [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  DBG_HERE
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - TableViewController
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  DBG_HERE
  if (self.licensesDictionary==nil) {
    return 0;
  }
  return [self.licensesDictionary count];
}

- (CGFloat)tableView:(UITableView *)tableView 
  heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  DBG_HERE
  UITableViewCell *cell = [self dequeueCell:indexPath];
  return cell.frame.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  DBG_HERE
  return [self dequeueCell:indexPath];
}

#pragma mark - Private Methods

- (UITableViewCell *)dequeueCell:(NSIndexPath *)indexPath{
  DBG_HERE
  NSArray *nameArray = [self.licensesDictionary allKeys];
  NSString *name = [nameArray objectAtIndex:indexPath.row]; 
  NSString *cellIdentifier = [NSString stringWithFormat:@"license:%@", name];
  
  UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  if (cell==nil) {
    NSString *description = [self.licensesDictionary objectForKey:name];
    cell = [self createLicenseCell:name description:description];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
  }else{
    return cell;
  }
  return cell;
}

- (UITableViewCell *)createLicenseCell:(NSString *)title 
                           description:(NSString *)description{
  DBG_HERE
  DEBUG_LOG(@"title: %@, desc: %@", title, description);
  UITableViewCell *cell = [[[UITableViewCell alloc]init]autorelease];
  UILabel *titleLabel = 
    [[[UILabel alloc]initWithFrame:CGRectMake(10,
                                              10,
                                              self.tableView.frame.size.width-20,
                                              20)]autorelease];
  [titleLabel setText:title];
  [titleLabel setFont:[UIFont boldSystemFontOfSize:13]];
  [cell addSubview:titleLabel];
  
  UILabel *descriptionLabel = 
    [[[UILabel alloc]initWithFrame:
      CGRectMake(10,
                 titleLabel.frame.origin.y+ titleLabel.frame.size.height+ 10,
                 self.tableView.frame.size.width-20,
                 0)]autorelease];
  [descriptionLabel setText:description];
  [descriptionLabel setFont:[UIFont systemFontOfSize:10]];
  [descriptionLabel setNumberOfLines:0];
  [descriptionLabel sizeToFit];
  [cell addSubview:descriptionLabel];
  
  CGFloat cellHeight =  10 + 10 + 10 +
                        titleLabel.frame.size.height + 
                        descriptionLabel.frame.size.height;
  
  cell.frame = CGRectMake(0, 0, self.tableView.frame.size.width, cellHeight);
  
  return cell;
}

@end
