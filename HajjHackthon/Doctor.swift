//
//  Doctor.swift
//  HajjHackthon
//
//  Created by 3bdelsalam on 8/2/18.
//  Copyright © 2018 3bdelsalam. All rights reserved.
//

import Foundation


class Doctor: NSObject {
    
    // MARK: Properties
    public var name: String?
    public var speciality: String?
    public var lat: String?
    public var longitude: String?
    
    // MARK: SwiftyJSON Initializers
    /// Initiates the instance based on the object.
    ///
    /// - parameter object: The object of either Dictionary or Array kind that was passed.
    /// - returns: An initialized instance of the class.

    
    public required init(name:String,spec:String,long:String,lat:String) {

        self.name = name
        self.speciality = spec
        self.longitude = long
        self.lat = lat
    }

    
}
