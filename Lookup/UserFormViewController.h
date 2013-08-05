//
//  UserFormViewController.h
//  Lookup
//
//  Created by Carlos Folgar on 8/3/13.
//
//

#import <UIKit/UIKit.h>

@interface UserFormViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *genderText;

@property (strong, nonatomic) NSArray *genderNames;
@property (strong, nonatomic) NSArray *langNames;
@property (strong, nonatomic) NSArray *ethnicityNames;
@property (strong, nonatomic) NSArray *professionNames;
@property (strong, nonatomic) NSArray *all_components;
@property (strong, nonatomic) NSArray *validAges;

@property (weak, nonatomic) IBOutlet UIPickerView *mainPicker;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end
