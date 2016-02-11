//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import Cocoa

class ___FILEBASENAME___: NSViewController {

    @IBOutlet var myTextView: NSTextView!
    
    override var nibName: String? {
        return "___FILEBASENAME___"
    }

    override func loadView() {
        super.loadView()
    
        // Insert code here to customize the view
        NSLog("Input Items = %@", self.extensionContext!.inputItems as NSArray)
    
        let sharedItem = self.extensionContext!.inputItems[0] as! NSExtensionItem
        let text = sharedItem.attributedContentText?.string
        
        if text != nil && !text!.isEmpty {
            self.myTextView.string = text!
        }
    }

    @IBAction func send(sender: AnyObject?) {
        let outputItem = NSExtensionItem()
        outputItem.attributedContentText = self.myTextView.attributedString()
    
        let outputItems = [outputItem]
        self.extensionContext!.completeRequestReturningItems(outputItems, completionHandler: nil)
    }

    @IBAction func cancel(sender: AnyObject?) {
        let cancelError = NSError(domain: NSCocoaErrorDomain, code: NSUserCancelledError, userInfo: nil)
        self.extensionContext!.cancelRequestWithError(cancelError)
    }

}
