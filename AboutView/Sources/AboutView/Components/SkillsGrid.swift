//
// Created by Tengnäs Nilsson Pontus on 2021-03-26.
//

import SwiftUI

struct SkillsGrid: View {
    var skills: [Skill]

    static let skillColumnSpacing: CGFloat = 2
    let skillColumns: [GridItem] = [
        GridItem(
            .flexible(minimum: 10, maximum: 100),
            spacing: CGFloat.random(in: 0...4),
            alignment: .center),
        GridItem(
            .flexible(minimum: 10, maximum: 100),
            spacing: CGFloat.random(in: 0...4),
            alignment: .center),
        GridItem(
            .flexible(minimum: 10, maximum: 100),
            spacing: CGFloat.random(in: 0...4),
            alignment: .center),
        GridItem(
            .flexible(minimum: 10, maximum: 100),
            spacing: CGFloat.random(in: 0...4),
            alignment: .center)]

    var body: some View {
        Text("Skills")
                .padding(4)

        LazyVGrid(
                columns: skillColumns,
                alignment: .center,
                spacing: 12) {
            ForEach(skills, id: \.name) { skill in
                Text(skill.name)
                        .padding(10)
                        .fixedSize()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color("aboutMain"), lineWidth: 2))
            }
        }
    }
}

struct SkillsGrid_Previews: PreviewProvider {
    static var previews: some View {
        SkillsGrid(skills: [Skill(name: "C#", orderOfPreference: 3, url: "")])
    }
}
