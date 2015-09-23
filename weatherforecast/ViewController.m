//
//  ViewController.m
//  weatherforecast
//
//  Created by student on 9/21/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *teamperature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UILabel *degreetype;

@end

@implementation ViewController

{
    BOOL ischeck;
    NSArray* quotes;
    NSArray* locations;
    NSArray* photoFiles;
    NSArray* degreetypes;
    float nhietdo;
}



- (void)viewDidLoad {
    [super viewDidLoad];

    quotes = @[@"Một con ngựa đau cả tàu bỏ cỏ", @"Có công mài sắt có ngày nên kim", @"Chớ thấy sóng cả mà ngã tay chèo", @"Không có gì quý hơn độc lập tự do hạnh phúc", @"Đi một ngày đàng học một sàng không"];
    locations = @[@"Hai Ba Trung, Hanoi", @"Sydney, Australia", @"New York, USA"];
    
    photoFiles = @[@"rain", @"sunny", @"thunder", @"wind"];
    
    degreetypes = @[@"C",@"F"];



}
- (IBAction)updateweather:(id)sender {
    int quoteIndex = arc4random_uniform(quotes.count);
    NSLog(@"Update weather :%d", quoteIndex);
    self.quote.text = quotes[quoteIndex];
    
    int locationIndex = arc4random_uniform(locations.count);
    self.location.text = locations[locationIndex];
    
    int photoIndex = arc4random_uniform(photoFiles.count);
    self.weatherIcon.image = [UIImage imageNamed:photoFiles[photoIndex]];
    nhietdo =  [self getTeamperature];
    NSString* string = [NSString stringWithFormat:@"%2.1f", nhietdo];
 
    [self.teamperature setTitle:string forState:UIControlStateNormal];
   
}



- (float) getTeamperature {
    return 14.0 + arc4random_uniform(18) + (float)arc4random() /(float) INT32_MAX;
}
- (IBAction)change:(id)sender {
    NSLog(@"Change dregree type!");
    if (ischeck) {
        NSString* string = [NSString stringWithFormat:@"%2.1f", nhietdo];
        [self.teamperature setTitle:string forState:UIControlStateNormal];
        self.degreetype.text = @"C";
        ischeck = false;
    }
    
    else
    {
        NSString* string = [NSString stringWithFormat:@"%2.1f", nhietdo*1.8 +32];
        [self.teamperature setTitle:string forState:UIControlStateNormal];
        self.degreetype.text = @"F";
        ischeck = true;
    }
    
    
    
}

@end
