import Foundation

public class StarkPolarColorScheme: PolarColorScheme {
    override var title: String { "Polar Winter" }
    override var folderName: String { "polar-winter" }
    
    override func getColorComponent(forNordComponent component: NordComponent) -> Color {
        // TODO
        print("NOT IMPLEMENTED")
        return super.getColorComponent(forNordComponent: component)
    }
}
