//
// Created by Tengnäs Nilsson Pontus on 2021-03-26.
//

import Foundation

struct ProfileMock {
    // swiftlint:disable:next function_body_length
    public static func getMockProfile() -> Profile {
        let profileJson = """
              {
                  "details": {
                    "name": "Pontus",
                    "lastName": "Schuster Tengnäs",
                    "pictureUrl": "",
                    "resumeUrl": "",
                    "location": "Gothenburg, Sweden",
                    "description": "Flexible full-stack developer with a primary focus on .NET and web\\ndevelopment."
                  },
                  "socialLinks": [
                    {
                      "name": "LinkedIn",
                      "icon": "",
                      "url": ""
                    },
                    {
                      "name": "GitHub",
                      "icon": "",
                      "url": ""
                    },
                    {
                      "name": "StackOverflow",
                      "icon": "",
                      "url": ""
                    },
                    {
                      "name": "Apple App Store",
                      "icon": "",
                      "url": ""
                    }
                  ],
                  "skills": [
                    {
                      "name": "Swift",
                      "orderOfPreference": 2,
                      "url": ""
                    },
                    {
                      "name": "iOS",
                      "orderOfPreference": 2,
                      "url": ""
                    },
                    {
                      "name": "Android",
                      "orderOfPreference": 3,
                      "url": ""
                    },
                    {
                      "name": "Xamarin.Forms",
                      "orderOfPreference": 2,
                      "url": ""
                    },
                    {
                      "name": "C#",
                      "orderOfPreference": 1,
                      "url": ""
                    },
                    {
                      "name": ".NET",
                      "orderOfPreference": 1,
                      "url": ""
                    },
                    {
                      "name": "Node.js",
                      "orderOfPreference": 1,
                      "url": ""
                    },
                    {
                      "name": "GraphQL",
                      "orderOfPreference": 2,
                      "url": ""
                    },
                    {
                      "name": "JavaScript",
                      "orderOfPreference": 2,
                      "url": ""
                    },
                    {
                      "name": "TypeScript",
                      "orderOfPreference": 1,
                      "url": ""
                    },
                    {
                      "name": "SQL",
                      "orderOfPreference": 2,
                      "url": ""
                    },
                    {
                      "name": "HTML",
                      "orderOfPreference": 2,
                      "url": ""
                    },
                    {
                      "name": "CSS",
                      "orderOfPreference": 2,
                      "url": ""
                    },
                    {
                      "name": "Golang",
                      "orderOfPreference": 1,
                      "url": ""
                    },
                    {
                      "name": "Git",
                      "orderOfPreference": 2,
                      "url": ""
                    },
                    {
                      "name": "Unit testing",
                      "orderOfPreference": 1,
                      "url": ""
                    },
                    {
                      "name": "UI testing",
                      "orderOfPreference": 2,
                      "url": ""
                    },
                    {
                      "name": "Docker",
                      "orderOfPreference": 1,
                      "url": ""
                    },
                    {
                      "name": "React JS",
                      "orderOfPreference": 1,
                      "url": ""
                    },
                    {
                      "name": "CI/CD",
                      "orderOfPreference": 1,
                      "url": ""
                    }
                  ]
                }
"""
        let jsonData = Data(profileJson.utf8)
        let decoder = JSONDecoder()
        // swiftlint:disable:next force_try
        return try! decoder.decode(Profile.self, from: jsonData)
    }
}
