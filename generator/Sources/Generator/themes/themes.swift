import Foundation

public struct Themes {
    static let polar: ColorScheme = ColorScheme(
        title: "Polar", 
        folderName: "polar", 
        colorSet: [
            .polarNight0: CustomColor("#FFFFFF"),
            .polarNight1: NordComponent.snowStorm6,
            .polarNight2: NordComponent.snowStorm5,
            .polarNight3: NordComponent.snowStorm4,
            .snowStorm4: NordComponent.polarNight2,
            .snowStorm5: NordComponent.polarNight1,
            .snowStorm6: NordComponent.polarNight0
        ]
    )
}
