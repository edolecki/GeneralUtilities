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