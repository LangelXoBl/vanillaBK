//
//  Movement.example.swift
//  vanillaBK
//
//  Created by imac_01 on 12/06/23.
//

import Foundation

struct MovementExample: Codable, Identifiable {
    var id = UUID()
    var ori_account: String
    var amount: String
    var des_account: String
    var description: String
}
