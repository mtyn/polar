import Foundation

public class StarkPolarColorScheme: PolarColorScheme {
    override var title: String { "Stark Polar" }
    override var folderName: String { "stark-polar" }
    
    override func getColorComponent(forNordComponent component: NordComponent) -> Color {
        // TODO
        print("NOT IMPLEMENTED")
        return super.getColorComponent(forNordComponent: component)
    }
}
