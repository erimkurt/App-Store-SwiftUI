//
//  String.swift
//  App Store
//
//  Created by Erim Kurt on 1/11/2563 BE.
//

import Foundation
import SwiftUI

extension String {
    var sizeWithUnit: String {
        let fileSizeWithUnit = ByteCountFormatter.string(fromByteCount: Int64(self) ?? 0, countStyle: .file)
        return fileSizeWithUnit
    }
}
