# GeneralUtilities
A series of Class methods to speed development in Swift when using NSDate(s), etc.

####To use the Class, you can do things like this:
```
let now: NSDate = NSDate()
let sValue: String = GeneralUtilities.shortDateStringNoYearFromDate(now)
print(sValue) //Example: FRI MAR 4
```
or
```
print("8 days later: \(8.days.fromNow)")
print("2 weeks before: \(2.weeks.ago)")
print("5 days, 3 months later: \((5.days + 3.months).fromNow)")
```