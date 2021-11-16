//
//  Address.swift
//  SwiftUI-PostRequestExample
//
//  Created by Kürşat Şimşek on 16.11.2021.
//

import Foundation

struct Address: Codable {
    var street: String?
    var city: String?
    var region: String?
    var postalCode: String?
    var country: String?
    var phone: String?
}
