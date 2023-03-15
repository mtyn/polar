import Foundation

// MARK: - Polar Scheme

public class PolarColorScheme {
    var title: String { "Polar" }
    var folderName: String { title.lowercased() }
    
    func getColorComponent(forNordComponent component: NordComponent) -> Color {
        switch component {
        case .polarNight0:
            return CustomColor("FFFFFF")
        case .polarNight1:
            return NordComponent.snowStorm6
        case .polarNight2:
            return NordComponent.snowStorm5
        case .polarNight3:
            return NordComponent.snowStorm4
        case .snowStorm4:
            return NordComponent.polarNight2
        case .snowStorm5:
            return NordComponent.polarNight1
        case .snowStorm6:
            return NordComponent.polarNight0
        default:
            print("POLAR: ELEMENT UNCHANGED")
            return component
        }
    }
}
