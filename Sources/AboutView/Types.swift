//
//  Types.swift
//  AboutView
//
//  Created by Tengnäs Nilsson Pontus on 2021-03-12.
//

import Foundation

public struct Profile: Decodable {
    public var details: Details
    public var socialLinks: [SocialLink]
    public var skills: [Skill]
}

public struct Details: Decodable {
    public var name: String
    public var lastName: String
    public var pictureUrl: String
    public var resumeUrl: String
    public var location: String
    public var description: String
}

public struct Skill: Decodable {
    public var name: String
    public var orderOfPreference: Int32
    public var url: String
}

public struct SocialLink: Decodable {
    public var name: String
    public var icon: String
    public var url: String
}
