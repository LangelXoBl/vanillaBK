//
//  Movement.swift
//  vanillaBK
//
//  Created by imac_01 on 01/06/23.
//

import Foundation

struct movement: Codable, Identifiable {
    let id = UUID()
    var ori_account: String
    var amount: String
    var des_account: String
    var description: String
}

struct LoginReq: Codable {
    var username: String
    var password: String
}

struct LoginRes: Codable {
    var status: String
    var message: String
    var token: String
}
