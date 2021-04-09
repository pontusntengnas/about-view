//
// Created by Tengnäs Nilsson Pontus on 2021-03-26.
//

import SwiftUI
import HttpRequestHook

#if os(macOS)
import Cocoa
typealias UIImage = NSImage
#endif

internal struct Header: View {
    var details: Details

    @State var picture: UIImage?
    @State var loadingPicture = true
    @State var error = false

    private let pictureDimension: CGFloat = 150

    func loadPicture(pictureUrl: String) {
        let hook = HttpRequestHook()
        hook.rawRequest(request: RequestWithoutBody(url: pictureUrl), type: .get) { (callback) in
            loadingPicture = callback.loading
            error = callback.error != nil
            if let pictureData = callback.result {
                picture = UIImage(data: pictureData)
            }
        }
    }

    var body: some View {
        if loadingPicture {
            ProgressView()
                .frame(height: pictureDimension)
        } else if error {
            Text("Failed to load image")
        } else if let pictureImage = picture {
            #if os(macOS)
            Image(nsImage: pictureImage)
                .resizable()
                .frame(width: pictureDimension, height: pictureDimension)
            #else
            Image(uiImage: pictureImage)
                .resizable()
                .frame(width: pictureDimension, height: pictureDimension)
            #endif
        }

        Text("\(details.name) \(details.lastName)")
            .font(.title)
            .padding(.bottom, 4)

        Text(details.location)

        Text(details.description)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)

        .onAppear(perform: {
            loadPicture(pictureUrl: details.pictureUrl)
        })
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(details: Details(
                    name: "Pontus",
                    lastName: "Tengnäs",
                    pictureUrl: "",
                    resumeUrl: "",
                    location: "",
                    description: ""),
                picture: nil)
    }
}
