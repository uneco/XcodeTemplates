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
        // Get the input item
        let item = context.inputItems[0] as! NSExtensionItem
        let content = item.attributedContentText
        NSLog("Content %@", content!)
        
        // Transform the content
        let newContent = (content == nil) ? NSMutableAttributedString() : content!.mutableCopy() as! NSMutableAttributedString
        
        if newContent.length > 0 {
            newContent.mutableString.appendString("ABC")
            item.attributedContentText = newContent
            
            // Notify the action is done with success
            context.completeRequestReturningItems([item], completionHandler: nil)
        } else {
            // Notify the action failed to complete, use an appropriate error
            context.cancelRequestWithError(NSError(domain: NSCocoaErrorDomain, code: NSUserCancelledError, userInfo: nil))
        }
    }

}
