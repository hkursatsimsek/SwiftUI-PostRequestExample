//
//  Supplier.swift
//  SwiftUI-PostRequestExample
//
//  Created by Kürşat Şimşek on 16.11.2021.
//

import Foundation

struct Supplier: Codable, Identifiable {
    var id:Int?
    var companyName: String?
    var contactName: String?
    var contactTitle: String?
//    var address: Address?
}
