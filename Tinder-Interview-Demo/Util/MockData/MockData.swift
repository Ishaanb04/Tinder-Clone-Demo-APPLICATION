//
//  MockData.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/25/24.
//

import Foundation

struct MockData {
    static let users: [User] = [
        .init(
            id: NSUUID().uuidString,
            fullName: "Salena Gomez",
            age: 39,
            profileImageURLs: [
                "sgomez",
                "sgomez-1",
                "sgomez-2"
            ]
        ),
        .init(
            id: NSUUID().uuidString,
            fullName: "Megan Fox",
            age: 39,
            profileImageURLs: [
                "megan-fox-1",
                "megan-fox-2"
            ]
        ),
        .init(
            id: NSUUID().uuidString,
            fullName: "Kelly Johnson",
            age: 39,
            profileImageURLs: [
                "kelly1",
                "kelly2",
                "kelly3"
            ]
        ),
        .init(
            id: NSUUID().uuidString,
            fullName: "Jane Doe",
            age: 39,
            profileImageURLs: [
                "jane1",
                "jane2",
                "jane3"
            ]
        ),
        .init(
            id: NSUUID().uuidString,
            fullName: "David Beckam",
            age: 32,
            profileImageURLs: [
                "david-beckham-1",
                "david-beckham-2"
            ]
        ),
        .init(
            id: NSUUID().uuidString,
            fullName: "Conor Mcregor",
            age: 39,
            profileImageURLs: [
                "conor-mcgregor-1",
                "conor-mcgregor-2",
                "conor-mcgregor-3"
            ]
        )
    ]
}

extension MockData {
    static var matches: [Match] = [
        .init(id: NSUUID().uuidString, userId: users[0].id, timestamp: Date(), user: users[0]),
        .init(id: NSUUID().uuidString, userId: users[2].id, timestamp: Date(), user: users[2]),
        .init(id: NSUUID().uuidString, userId: users[3].id, timestamp: Date(), user: users[3]),
        .init(id: NSUUID().uuidString, userId: users[5].id, timestamp: Date(), user: users[5])
    ]
}
