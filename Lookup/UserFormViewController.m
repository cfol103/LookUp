//
//  UserFormViewController.m
//  Lookup
//
//  Created by Carlos Folgar on 8/3/13.
//
//

#import "UserFormViewController.h"
#import "AFNetworking.h"

@interface UserFormViewController ()

@end

@implementation UserFormViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.genderNames = @[@"Male", @"Female"];
    self.langNames = @[@"English", @"Spanish", @"French", @"German", @"Japanse"];
    self.ethnicityNames = @[@"Black", @"Latino", @"Caucasian", @"Native American", @"Asian", @"Middle Eastern"];
    self.professionNames = @[@"Hacking",@"Design",@"Writing"];
    self.validAges = @[@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27"];
        
    self.all_components = [[NSArray alloc] initWithObjects: self.professionNames, self.ethnicityNames, nil];
    self.genderText.returnKeyType = UIReturnKeyDone; 
    
    
}








- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.genderText resignFirstResponder];
    return NO;
}


- (IBAction)submitForm:(id)sender {
    
    
    
    int first_index = [self.mainPicker selectedRowInComponent:0];
    int second_index = [self.mainPicker selectedRowInComponent:1];
    
    NSString *interestString = self.professionNames[first_index];
    NSString *ethnicityString = self.ethnicityNames[second_index];
    NSString *genderString = self.genderText.text;
    
    
    NSURL *url = [NSURL URLWithString:@"https://lukup.herokuapp.com"];
    
    
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    
    
    
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            genderString, @"gender",
                            interestString, @"interest",
                            ethnicityString, @"ethnicity",
                            nil];
    [httpClient postPath:@"/suggest_mentor" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *responseStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"[HTTPClient Error]: %@", error.localizedDescription);
    }];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [[self.all_components objectAtIndex:(NSUInteger)component] count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSArray* target_arr = [self.all_components objectAtIndex:component];
    return [target_arr objectAtIndex:row];
}
- (IBAction)submitUserForm:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
