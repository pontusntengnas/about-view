//
//  AboutDeveloper.swift
//  AboutView
//
//  Created by Tengnäs Nilsson Pontus on 2021-03-12.
//

import SwiftUI
import HttpRequestHook
import OSLog

public struct AboutDeveloper: View {
    @State var loadingProfile = false
    @State var profile: Profile?
    @State var error = true

    func getProfile() {
        guard let aboutApiUrl = ProcessInfo.processInfo.environment["ABOUT_API_URL"] else {
            Logger().error("Missing required environment variable ABOUT_API_URL")
            return
        }

        let httpRequest = RequestWithoutBody(url: aboutApiUrl)
        let hook = HttpRequestHook()

        hook.get(request: httpRequest) { (callback: Callback<Profile>) in
            loadingProfile = callback.loading
            error = callback.error != nil
            profile = callback.result
        }
    }

    var content: some View {
        VStack {
            if loadingProfile {
                ProgressView("Loading")
            } else if error {
                Text("An error occurred")
            }
            if let profile = profile {
                Header(details: profile.details)
                Spacer()
                SkillsGrid(skills: profile.skills)
                Spacer()
                SocialLinks(socialLinks: profile.socialLinks)
                Spacer()
            }
        }
        .navigationTitle("About me")
        .onAppear(perform: {
            getProfile()
        })
    }

    public var body: some View {
        #if os(macOS)
        content
            .frame(maxHeight: 700, alignment: .center)
        #else
        content
        #endif
    }
}

struct AboutDeveloper_Previews: PreviewProvider {
    static var previews: some View {
        AboutDeveloper(
            loadingProfile: false,
            profile: ProfileMock.getMockProfile(),
            error: false)
    }
}
