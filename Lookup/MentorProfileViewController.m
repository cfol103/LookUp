//
//  MentorProfileViewController.m
//  Lookup
//
//  Created by Carlos Folgar on 8/3/13.
//
//

#import "MentorProfileViewController.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"

@interface MentorProfileViewController ()

@end

@implementation MentorProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


/*
 https://s3-us-west-1.amazonaws.com/media.grouptie.com/media/uploads/code2040__dcampos__904156_10151427947253401_724465930_o.jpg
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mentorLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClicked:)];
    [tapGestureRecognizer setNumberOfTapsRequired:1];
    [self.mentorLabel addGestureRecognizer:tapGestureRecognizer];

	// Do any additional setup after loading the view.
    [self refresh];

}

-(IBAction)labelClicked:(UITapGestureRecognizer*)tapGestureRecognizer
{
    [self.navigationController popToRootViewControllerAnimated:YES];    
}



- (IBAction)nextMentor:(id)sender {
    [self refresh];
}

- (void)refresh
{
    NSURL *url = [NSURL URLWithString:@"http://lukup.herokuapp.com/random_mentor"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        NSDictionary *dictionary = (NSDictionary * )JSON;
        self.mentorAbout.text = [NSString stringWithFormat:@"About: %@", [dictionary objectForKey:@"about"]];
        self.mentorEmail.text = [NSString stringWithFormat:@"Email: %@",[dictionary objectForKey:@"email"]];
        self.mentorInterest.text = [NSString stringWithFormat:@"Interest: %@",[dictionary objectForKey:@"interest"]];
        
        NSString *image_url = [dictionary objectForKey:@"image_url"];
        self.mentorLabel = [dictionary objectForKey:@"name"];
        [self.mentorImage setImageWithURL:[NSURL URLWithString:image_url]];
        
    } failure:nil];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [queue addOperation:operation];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
