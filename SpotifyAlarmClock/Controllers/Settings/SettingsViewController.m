//
//  SettingsViewController.m
//  SpotifyAlarmClock
//
//  Created by Niels Vroegindeweij on 24-10-14.
//  Copyright (c) 2014 Niels Vroegindeweij. All rights reserved.
//

#import "SettingsViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@import AVFoundation;

@interface SettingsViewController ()

@property (nonatomic, strong) NSUserDefaults * userDefaults;

@property (weak, nonatomic) IBOutlet UISwitch *swBlinkSecondsMarker;
@property (weak, nonatomic) IBOutlet UISwitch *swShowBackgroundGlow;
@property (weak, nonatomic) IBOutlet UISlider *slMaxVolume;
@property (weak, nonatomic) IBOutlet UISlider *slBrightness;

- (IBAction)blinkSecondsMarkerSettingChanged:(id)sender;
- (IBAction)showBackgroundGlowSettingChanged:(id)sender;
- (IBAction)maxVolumeSettingChanged:(id)sender;
- (IBAction)brightnessSettingChanged:(id)sender;


@end

@implementation SettingsViewController
@synthesize userDefaults;
@synthesize swBlinkSecondsMarker;
@synthesize swShowBackgroundGlow;
@synthesize slMaxVolume;
@synthesize slBrightness;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.userDefaults = [NSUserDefaults standardUserDefaults];
   

    //Apply settings in view
    [swBlinkSecondsMarker setOn:[userDefaults boolForKey:@"BlinkSecondsMarker"]];
    [swShowBackgroundGlow setOn:[userDefaults boolForKey:@"ShowBackgroundGlow"]];
    [slMaxVolume setValue:[userDefaults floatForKey:@"MaxVolume"]];
    [slBrightness setValue:[userDefaults floatForKey:@"Brightness"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)blinkSecondsMarkerSettingChanged:(id)sender
{
    [userDefaults setBool:[swBlinkSecondsMarker isOn] forKey:@"BlinkSecondsMarker"];
    [userDefaults synchronize];
}

- (IBAction)showBackgroundGlowSettingChanged:(id)sender
{
    [userDefaults setBool:[swShowBackgroundGlow isOn] forKey:@"ShowBackgroundGlow"];
    [userDefaults synchronize];
}

- (IBAction)maxVolumeSettingChanged:(id)sender
{
    [userDefaults setFloat:[slMaxVolume value] forKey:@"MaxVolume"];
    [userDefaults synchronize];
}

- (IBAction)brightnessSettingChanged:(id)sender
{
    [[UIScreen mainScreen] setBrightness:[slBrightness value]];
    
    [userDefaults setFloat:[slBrightness value] forKey:@"Brightness"];
    [userDefaults synchronize];
}
@end