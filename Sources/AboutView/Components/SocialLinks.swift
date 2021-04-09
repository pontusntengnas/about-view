//
// Created by Tengnäs Nilsson Pontus on 2021-03-26.
//

import SwiftUI

internal struct SocialLinks: View {
    var socialLinks: [SocialLink]

    var body: some View {
        Text("Contact")
            .padding(4)

        HStack {
            ForEach(socialLinks, id: \.name) { socialLink in
                if let url = URL(string: socialLink.url) {
                    Link(socialLink.name, destination: url)
                }
            }
        }
    }
}

struct SocialLinks_Previews: PreviewProvider {
    static var previews: some View {
        SocialLinks(
                socialLinks: [
                    SocialLink(name: "Github", icon: "", url: ""),
                    SocialLink(name: "LinkedIn", icon: "", url: ""),
                    SocialLink(name: "Stackoverflow", icon: "", url: ""),
                    SocialLink(name: "AppStore", icon: "", url: "")])
    }
}
