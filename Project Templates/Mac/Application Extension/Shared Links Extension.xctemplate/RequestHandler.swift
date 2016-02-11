//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import Foundation

class ___FILEBASENAME___: NSObject, NSExtensionRequestHandling {

    func beginRequestWithExtensionContext(context: NSExtensionContext) {
        let extensionItem = NSExtensionItem()
        
        // The keys of the user info dictionary match what data Safari is expecting for each Shared Links item.
        // For the date, use the publish date of the content being linked
        extensionItem.userInfo = [ "uniqueIdentifier": "uniqueIdentifierForSampleItem", "urlString": "http://apple.com", "date": NSDate() ]
        
        extensionItem.attributedTitle = NSAttributedString(string: "Sample title")
        extensionItem.attributedContentText = NSAttributedString(string: "Sample description text")
        
        // You can supply a custom image to be used with your link as well. Use the NSExtensionItem's attachments property.
        // extensionItem.attachments = [ NSItemProvider(contentsOfURL: NSBundle.mainBundle().URLForResource("customLinkImage", withExtension: "png"))! ]

        context.completeRequestReturningItems([extensionItem], completionHandler: nil)
    }

}
