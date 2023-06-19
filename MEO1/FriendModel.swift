//
//  FriendModel.swift
//  MEO1
//
//  Created by Thành Mai on 19/06/2023.
//

import Foundation

enum FriendModelStatus: String {
    case NONE
    case FRIEND
    case REQUEST
    case RESPONSE
    case SEFT
}

struct FriendModel: Decodable {
    var id: String?
    var uid: String?
    var username: String?
    var avatar: String?
    var phoneNumber: String?
    var email: String?
    var status: String? {
        didSet {
            guard let status = FriendModelStatus(rawValue: status ?? "NONE") else {
                return
            }
            statusType = status
        }
    }
    var statusType: FriendModelStatus = .NONE
    
    enum CodingKeys: CodingKey {
        case id
        case uid
        case username
        case avatar
        case phoneNumber
        case email
//        case status
    }
  //  func toGroupMember() -> GroupMember {
    //    return GroupMember(id: id, uid: uid, avatar: avatar, username: username)
   // }
}

class SearchFriendResponce: Decodable {
    var count: Int?
    var data: [FriendModel] = []
    var pageCount: Int?
    var total: Int?
    var totalInvitation: Int?
}
