//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___FILEBASENAME___.h"

@implementation ___FILEBASENAME___

- (void)beginRequestWithExtensionContext:(NSExtensionContext *)context {
    NSExtensionItem *extensionItem = [[NSExtensionItem alloc] init];
    
    // The keys of the user info dictionary match what data Safari is expecting for each Shared Links item.
    // For the date, use the publish date of the content being linked
    extensionItem.userInfo = @{ @"uniqueIdentifier": @"uniqueIdentifierForSampleItem", @"urlString": @"http://apple.com", @"date": [NSDate date] };
    
    extensionItem.attributedTitle = [[NSAttributedString alloc] initWithString:@"Sample title"];
    extensionItem.attributedContentText = [[NSAttributedString alloc] initWithString:@"Sample description text"];
    
    // You can supply a custom image to be used with your link as well. Use the NSExtensionItem's attachments property.
    // extensionItem.attachments = @[ [[NSItemProvider alloc] initWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"customLinkImage" withExtension:@"png"]] ];

    [context completeRequestReturningItems:@[ extensionItem ] completionHandler:nil];
}

@end
