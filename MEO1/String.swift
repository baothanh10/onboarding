//
//  String.swift
//  MEO1
//
//  Created by Thành Mai on 19/06/2023.
//

import Foundation

extension String {
    func isNullOrEmpty() -> Bool {
        if self == "" || self == nil {
            return true
        }
        
        return false
    }
    
    func localition() -> String {
        let ns = NSLocalizedString(self, comment: self)
        let langCode = Bundle.main.preferredLocalizations[0]
        let usLocale = Locale(identifier: "en-US")
        var langName = ""
        if let languageName = usLocale.localizedString(forLanguageCode: langCode) {
            langName = languageName
        }
        if  let languageCode = UserDefaultStored.language,
            let path = Bundle.main.path(forResource: languageCode, ofType: "lproj"), let bundle = Bundle(path: path) {
            return NSLocalizedString(self, tableName: nil, bundle: bundle, comment: "")
        }
        return NSLocalizedString(self, comment: "")
    }
}

extension String {
    func stringToDate(format: String = "yyyy-MM-dd'T'HH:mm:ss.SZ") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        return dateFormatter.date(from: self)
    }
}

extension String {
    func subStringStart(to offsetBy: Int) -> String {
        if offsetBy < self.count {
            return String(self[self.startIndex ..< self.index(self.startIndex, offsetBy: offsetBy)])
        }
        
        return ""
    }
    
    func subStringFromToEnd(from offsetBy: Int) -> String {
        if offsetBy < self.count {
            return StringLiteralType(self[self.index(self.startIndex, offsetBy: offsetBy) ..< self.endIndex])
        }
        return ""
    }
}

