//
//  UserProfileModel.swift
//  MEO1
//
//  Created by Thành Mai on 19/06/2023.
//

import Foundation


struct UserProfileModel: Codable {
    var username: String?
    var email: String?
    var phoneNumber: String?
    var firstName: String?
    var lastName: String?
    var gender: Int?
    var uid: String?
    var avatar: String?
    var id: String?
    var birthDate: String?
    var isFirst: Bool?
    
    func toFriendModel() -> FriendModel? {
        return FriendModel(id: id, uid: uid, username: username, avatar: avatar, phoneNumber: phoneNumber, email: email, status: "SEFT")
    }
}

extension UserProfileModel: Equatable {
    static func == (lhs: UserProfileModel, rhs: UserProfileModel) -> Bool {
        return lhs.username == rhs.username &&
                lhs.email == rhs.email &&
                lhs.phoneNumber == rhs.phoneNumber &&
                lhs.firstName == rhs.firstName &&
                lhs.lastName == rhs.lastName &&
                lhs.gender == rhs.gender &&
                lhs.uid == rhs.uid &&
                lhs.avatar == rhs.avatar &&
                lhs.id == rhs.id &&
                lhs.birthDate == rhs.birthDate
    }
}

