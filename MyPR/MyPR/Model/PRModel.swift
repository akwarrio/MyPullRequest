//
//  Model.swift
//
//  Created by Aftab Khan on 28/07/22.
//

import Foundation

struct PR: Codable {
    var title: String?
    var created_at: String?
    var closed_at: String?
    var user: User?
}

typealias PullRequests = [PR]

struct User: Codable {
    var login: String?
    var avatar_url: String?
}
