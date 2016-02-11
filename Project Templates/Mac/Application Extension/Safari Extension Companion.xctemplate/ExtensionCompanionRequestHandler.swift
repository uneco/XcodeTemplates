//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import Foundation

class ___FILEBASENAME___: NSObject, NSExtensionRequestHandling {

    static var messageNameKey = "messageName"
    static var messageDataKey = "messageData"

    func beginRequestWithExtensionContext(context: NSExtensionContext) {
        guard let message = context.inputItems.first as? NSExtensionItem else {
            context.completeRequestReturningItems(nil, completionHandler: nil)
            return
        }
        
        let userInfo = message.userInfo!
        let messageName = userInfo[ExtensionCompanionRequestHandler.messageNameKey]
        let messageData = userInfo[ExtensionCompanionRequestHandler.messageDataKey]
        
        NSLog("Companion App Extension: We got a message named: \(messageName) with data \(messageData)")
        
        let response = NSExtensionItem()
        let responseName = "Response to \(messageName)"
        
        var responseUserInfo = [NSObject : AnyObject]()
        responseUserInfo[ExtensionCompanionRequestHandler.messageNameKey] = responseName
        if let data = messageData {
            responseUserInfo[ExtensionCompanionRequestHandler.messageDataKey] = data
        }
        response.userInfo = responseUserInfo
        
        context.completeRequestReturningItems([ response ], completionHandler: { expired in
            NSLog("Companion App Extension: Our completion handler was called")
        })
    }

}
