//
//  GeneralUtilities.swift
//

import Foundation

/**
	print("8 days from now \(8.days.fromNow)")
	print("2 weeks before \(2.weeks.ago)")
	print("5 days, 2 months later \((5.days + 3.months).fromNow")
*/
extension NSDateComponents
{
	/** returns the current date plus the receiver's interval */

	var fromNow: NSDate {
	    let cal = NSCalendar.currentCalendar()
	    return cal.dateByAddingComponents(self, toDate: NSDate(), options:NSCalendarOptions())!
	}

	/** returns the current date minus the receiver's interval */

	var ago: NSDate {
	    let cal = NSCalendar.currentCalendar()
	    return cal.dateByAddingComponents(-self, toDate: NSDate() ,options:NSCalendarOptions())!
	}

	func fromDate(inputDate: NSDate) -> NSDate {

	        let cal = NSCalendar.currentCalendar()
	        return cal.dateByAddingComponents(self, toDate: inputDate, options:NSCalendarOptions())!
	}

	func beforeDate(inputDate: NSDate) -> NSDate {
	    let cal = NSCalendar.currentCalendar()
	    return cal.dateByAddingComponents(-self, toDate:inputDate ,options:NSCalendarOptions())!
	}
}

/** helper method to DRY the code a little, adds or subtracts two sets of date components */
func combineComponents(left: NSDateComponents,
    right: NSDateComponents,
    multiplier: Int) -> NSDateComponents
{
    let comps = NSDateComponents()
    comps.second = ((left.second != NSDateComponentUndefined ? left.second : 0) +
        (right.second != NSDateComponentUndefined ? right.second : 0) * multiplier)
    comps.minute = ((left.minute != NSDateComponentUndefined ? left.minute : 0) +
        (right.minute != NSDateComponentUndefined ? right.minute : 0) * multiplier)
    comps.hour = ((left.hour != NSDateComponentUndefined ? left.hour : 0) +
        (right.hour != NSDateComponentUndefined ? right.hour : 0) * multiplier)
    comps.day = ((left.day != NSDateComponentUndefined ? left.day : 0) +
        (right.day != NSDateComponentUndefined ? right.day : 0) * multiplier)
    comps.month = ((left.month != NSDateComponentUndefined ? left.month : 0) +
        (right.month != NSDateComponentUndefined ? right.month : 0) * multiplier)
    comps.year = ((left.year != NSDateComponentUndefined ? left.year : 0) +
        (right.year != NSDateComponentUndefined ? right.year : 0) * multiplier)
    return comps
}

/** adds the two sets of date components */
func +(left: NSDateComponents, right: NSDateComponents) -> NSDateComponents {
    return combineComponents(left, right:right, multiplier:1)
}

/** subtracts the two sets of date components */
func -(left: NSDateComponents, right: NSDateComponents) -> NSDateComponents {
    return combineComponents(left, right:right, multiplier:-1)
}

/** negates the two sets of date components */
prefix func -(comps: NSDateComponents) -> NSDateComponents {
    let result = NSDateComponents()
    if(comps.second != NSDateComponentUndefined) { result.second = -comps.second }
    if(comps.minute != NSDateComponentUndefined) { result.minute = -comps.minute }
    if(comps.hour != NSDateComponentUndefined) { result.hour = -comps.hour }
    if(comps.day != NSDateComponentUndefined) { result.day = -comps.day }
    if(comps.month != NSDateComponentUndefined) { result.month = -comps.month }
    if(comps.year != NSDateComponentUndefined) { result.year = -comps.year }
    return result
}

/** functions to convert integers into various time intervals */
extension Int {
    var minutes: NSDateComponents {
        let comps = NSDateComponents()
        comps.minute = self;
        return comps
    }
    
    var seconds: NSDateComponents {
        let comps = NSDateComponents()
        comps.second = self
        return comps
    }
    
    var hours: NSDateComponents {
        let comps = NSDateComponents()
        comps.hour = self;
        return comps
    }
    
    var days: NSDateComponents {
        let comps = NSDateComponents()
        comps.day = self;
        return comps
    }
    
    var weeks: NSDateComponents {
        let comps = NSDateComponents()
        comps.day = 7 * self;
        return comps
    }
    
    var months: NSDateComponents {
        let comps = NSDateComponents()
        comps.month = self;
        return comps
    }
    
    var years: NSDateComponents {
        let comps = NSDateComponents()
        comps.year = self;
        return comps
    }
}

extension NSDate {
    func yearsFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(NSCalendarUnit.Year, fromDate: date, toDate: self, options: []).year
    }
    func monthsFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(NSCalendarUnit.Month, fromDate: date, toDate: self, options: []).month
    }
    func weeksFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(NSCalendarUnit.WeekOfYear, fromDate: date, toDate: self, options: []).weekOfYear
    }
    func daysFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(NSCalendarUnit.Day, fromDate: date, toDate: self, options: []).day
    }
    func hoursFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(NSCalendarUnit.Hour, fromDate: date, toDate: self, options: []).hour
    }
    func minutesFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(NSCalendarUnit.Minute, fromDate: date, toDate: self, options: []).minute
    }
    func secondsFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(NSCalendarUnit.Second, fromDate: date, toDate: self, options: []).second
    }
    func offsetFrom(date:NSDate) -> String {
        if yearsFrom(date)   > 0 { return "\(yearsFrom(date))y"   }
        if monthsFrom(date)  > 0 { return "\(monthsFrom(date))M"  }
        if weeksFrom(date)   > 0 { return "\(weeksFrom(date))w"   }
        if daysFrom(date)    > 0 { return "\(daysFrom(date))d"    }
        if hoursFrom(date)   > 0 { return "\(hoursFrom(date))h"   }
        if minutesFrom(date) > 0 { return "\(minutesFrom(date))m" }
        if secondsFrom(date) > 0 { return "\(secondsFrom(date))s" }
        return ""
        
    }
    func after(date:NSDate) -> Bool
    {
        
        let result = date.compare(self)
        return (result == NSComparisonResult.OrderedAscending )
        
    }
    
    func before(date:NSDate) -> Bool
    {
        
        let result = date.compare(self)
        return (result == NSComparisonResult.OrderedDescending )
        
    }
    func sameAs(date:NSDate) -> Bool
    {
        
        let result = date.compare(self)
        return (result == NSComparisonResult.OrderedSame    )
        
    }
}

extension String {
    
    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        return substringWithRange(Range(start: startIndex.advancedBy(r.startIndex), end: startIndex.advancedBy(r.endIndex)))
    }
}


public class GeneralUtilities {

	//MARK: - Class Methods -

	// i.e.
	// let now: NSDate = NSDate()
	// let sValue: String = GeneralUtilities.shortDateStringNoYearFromDate(now)

	public class func getIntervalBetweenDates(date1: NSDate, date2: NSDate) ->NSTimeInterval
    {
        let elapsedTime = date1.timeIntervalSinceDate(date2)
        return elapsedTime; //NSTimeInterval is in seconds
    }

    // NSDate -> THU FEB 4, 2016
    class func shortDateStringFromDate(theDate: NSDate ) -> String {
        let form = NSDateFormatter()
        form.locale = NSLocale(localeIdentifier: "US_en");
        form.timeZone = NSTimeZone.localTimeZone()
        form.dateFormat = "EE MMM d, yyyy"
        let dayString = form.stringFromDate(theDate).uppercaseString
        return dayString
    }

    // NSDate -> 2016
    class func longyearfromDate(theDate:NSDate) -> String {
        let form = NSDateFormatter()
        form.locale = NSLocale(localeIdentifier: "US_en");
        form.timeZone = NSTimeZone.localTimeZone()
        form.dateFormat = "yyyy"
        let dayString = form.stringFromDate(theDate).uppercaseString
        return dayString
    }

     // NSDate -> THU FEB 4
    class func shortDateStringNoYearFromDate(theDate: NSDate) -> String {
        let form = NSDateFormatter()
        form.locale = NSLocale(localeIdentifier: "US_en");
        form.timeZone = NSTimeZone.localTimeZone()
        form.dateFormat = "EE MMM d"
        let dayString = form.stringFromDate(theDate).uppercaseString
        return dayString
    }

    // NSDate -> 10:39 PM
    class func easyTimeWithAMPM(theDate: NSDate) -> String {
        let form = NSDateFormatter()
        form.locale = NSLocale(localeIdentifier: "US_en");
        form.timeZone = NSTimeZone.localTimeZone()
        form.dateFormat = "h:mm a"
        let dayString = form.stringFromDate(theDate).uppercaseString
        return dayString
    }

    // NSDate -> 10:39:06 AM
    class func easyTimeWithSecondsAMPM(theDate: NSDate) -> String {
        let form = NSDateFormatter()
        form.locale = NSLocale(localeIdentifier: "US_en");
        form.timeZone = NSTimeZone.localTimeZone()
        form.dateFormat = "h:mm:ss a"
        let dayString = form.stringFromDate(theDate).uppercaseString
        return dayString
    }

    // 2 dates -> 7h 14m difference.
    class func hoursAndMinutesBetweenDates(startDate:NSDate, endDate:NSDate) -> String {
        let difference = endDate.timeIntervalSinceDate(startDate)
        let hours = Int(difference) / 3600
        let minutes = (Int(difference) / 60) % 60
        var m = "\(minutes)"
        if minutes < 10 {
            m = "0\(minutes)"
        }
        return "\(hours)h \(m)m difference"
    }

    class func getDayOfWeekForToday()->Int? {
        // Weekday is an integer - Sunday = 1
        let formatter  = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let today = NSDate()
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let myComponents = myCalendar.components(.Weekday, fromDate: today)
        let weekDay = myComponents.weekday
        return weekDay
    }

    public class func nsdateFromAMPMTimeString(timeString: String) ->NSDate?{
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "US_en");
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        dateFormatter.dateFormat = "hh:mm a"
        let date = dateFormatter.dateFromString(timeString)
        return date
    }

    public class func nsdateFromMilitaryAMPMTimeString(timeString: String) ->NSDate?{
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "US_en");
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        dateFormatter.dateFormat = "HH:mm"
        let date = dateFormatter.dateFromString(timeString)
        return date
    }
    
    public class func nsDateFromDateAndHHMMSS(timeString: String) ->NSDate?{
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "US_en");
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        dateFormatter.dateFormat = "yyyy-MM-dd HHmmss"
        let date = dateFormatter.dateFromString(timeString)
        return date
    }
}