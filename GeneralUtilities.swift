//
//  GeneralUtilities.swift
//

import Foundation

public class GeneralUtilities {
	
	public class func getIntervalBetweenDates(date1: NSDate, date2: NSDate) ->NSTimeInterval
    {
 
        let elapsedTime = date1.timeIntervalSinceDate(date2)
        return elapsedTime; //NSTimeInterval is in seconds
        
    }
}