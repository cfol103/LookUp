//
//  MentorProfileViewController.h
//  Lookup
//
//  Created by Carlos Folgar on 8/3/13.
//
//

#import <UIKit/UIKit.h>

@interface MentorProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *mentorImage;
@property (weak, nonatomic) IBOutlet UILabel *mentorEmail;

@property (weak, nonatomic) IBOutlet UILabel *mentorAbout;

@property (weak, nonatomic) IBOutlet UILabel *mentorLabel;
@property (weak, nonatomic) IBOutlet UILabel *mentorInterest;


@end
