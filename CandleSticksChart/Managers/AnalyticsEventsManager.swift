//
//  AnalyticsEventsManager.swift
//  CandleSticksChart
//
//  Created by Geddawy on 03/11/2022.
//

import Foundation
import Firebase

class AnalyticsEventsManager {
    
    // MARK:- Singleton
    private static let sharedInstance = AnalyticsEventsManager()
    
    class func shared() -> AnalyticsEventsManager {
        return AnalyticsEventsManager.sharedInstance
    }
    
    func track(event: String, properties: [String:Any]? = nil) {
        Analytics.logEvent(event, parameters: properties)
    }
    
}
