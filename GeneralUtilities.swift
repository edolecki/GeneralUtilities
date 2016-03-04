//
//  GeneralUtilities.swift
//  NightOwl
//
//  Created by Leela Keshavan on 11/12/15.
//  Copyright © 2015 Leela Keshavan All rights reserved.
//

import Foundation

public class GeneralUtilities {
	
	public class func getIntervalBetweenDates(date1: NSDate, date2: NSDate) ->NSTimeInterval
    {
 
        let elapsedTime = date1.timeIntervalSinceDate(date2)
        return elapsedTime; //NSTimeInterval is in seconds
        
    }
}