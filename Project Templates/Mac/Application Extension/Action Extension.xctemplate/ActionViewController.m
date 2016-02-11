//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___FILEBASENAME___.h"

@interface ___FILEBASENAME___ ()
@property IBOutlet NSTextView *myTextView;

@end

@implementation ___FILEBASENAME___

- (NSString *)nibName {
    return @"___FILEBASENAME___";
}

- (void)loadView {
    [super loadView];
    
    // Insert code here to customize the view
    NSLog(@"Input Items = %@", self.extensionContext.inputItems);
    
    NSExtensionItem *sharedItem = [self.extensionContext.inputItems firstObject];
    NSString *text = sharedItem.attributedContentText.string;
    
    if (text.length > 0) {
        self.myTextView.string = text;
    }
}

- (IBAction)send:(id)sender {
    NSExtensionItem *outputItem = [[NSExtensionItem alloc] init];
    outputItem.attributedContentText = self.myTextView.attributedString;
    
    NSArray *outputItems = @[outputItem];
    [self.extensionContext completeRequestReturningItems:outputItems completionHandler:nil];
}

- (IBAction)cancel:(id)sender {
    NSError *cancelError = [NSError errorWithDomain:NSCocoaErrorDomain code:NSUserCancelledError userInfo:nil];
    [self.extensionContext cancelRequestWithError:cancelError];
}

@end

