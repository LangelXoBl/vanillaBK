//
//  Entitys.swift
//  vanillaBK
//
//  Created by IMac_01_Invitado on 13/07/23.
//

import Foundation

struct Transfer: Codable, Identifiable {
    var id: Int
    var amount: Int
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

struct responseTransferList: Codable {
    var status: String
    var data: [Transfer]
    var message: String?
}

struct updateUserResp: Codable {
    var affected: Int
}
