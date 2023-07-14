//
//  Entitys.swift
//  vanillaBK
//
//  Created by IMac_01_Invitado on 13/07/23.
//

import Foundation

struct Transfer: Codable {
var id: Int
}

struct NewTransfer: Codable {
    var user_account: String
    var receptor_account: String
    var amount: Int
}

struct Responsetransfer: Codable {
    var status: String
    var message: String
    var data: DataResponseTransfer?
    var error: String?
}

struct DataResponseTransfer: Codable {
    var amount: Int
}
