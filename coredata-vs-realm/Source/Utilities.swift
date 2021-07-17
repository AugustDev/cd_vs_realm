//
//  Utilities.swift
//  coredata-vs-realm
//
//  Created by Augustinas Malinauskas on 17/07/2021.
//

import Foundation

final class Utilities {
    static func measure(_ title: String, block: (@escaping () -> ())) {
        let startTime = CFAbsoluteTimeGetCurrent()
        block()
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        print("[\(title)] Duration: \(timeElapsed)s")
    }
}
