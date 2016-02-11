//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___FILEBASENAME___.h"

@interface ___FILEBASENAME___ ()

@end

static NSString * const messageNameKey = @"messageName";
static NSString * const messageDataKey = @"messageData";

@implementation ___FILEBASENAME___

- (void)beginRequestWithExtensionContext:(NSExtensionContext *)context {
    NSExtensionItem *message = context.inputItems.firstObject;
    if (!message) {
        // Ignore requests without a message.
        [context completeRequestReturningItems:nil completionHandler:nil];
        return;
    }
    
    NSDictionary *userInfo = message.userInfo;
    NSString *messageName = userInfo[messageNameKey];
    id messageData = userInfo[messageDataKey];
    
    NSLog(@"Companion App Extension: We got a message named: %@ with data %@", messageName, messageData);
    
    NSExtensionItem *response = [[NSExtensionItem alloc] init];
    NSString *responseName = [NSString stringWithFormat:@"Response to '%@'", messageName];
    
    NSMutableDictionary *responseUserInfo = [NSMutableDictionary dictionary];
    responseUserInfo[messageNameKey] = responseName;
    if (messageData) {
        responseUserInfo[messageDataKey] = messageData;
    }
    response.userInfo = responseUserInfo;
    
    [context completeRequestReturningItems:@[ response ] completionHandler:^(BOOL expired) {
        NSLog(@"Companion App Extension: Our completion handler was called");
    }];
}

@end
