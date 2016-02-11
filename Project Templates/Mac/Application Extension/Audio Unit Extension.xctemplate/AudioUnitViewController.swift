//
//  ___FILENAME___
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import CoreAudioKit

public class ___FILEBASENAME___: AUViewController, AUAudioUnitFactory {
    var audioUnit: AUAudioUnit?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        if audioUnit == nil {
            return
        }
        
        // Get the parameter tree and add observers for any parameters that the UI needs to keep in sync with the AudioUnit
    }
    
    public func createAudioUnitWithComponentDescription(componentDescription: AudioComponentDescription) throws -> AUAudioUnit {
        audioUnit = try MyAudioUnit(componentDescription: componentDescription, options: [])
        
        return audioUnit!
    }
    
}
