import Foundation

enum NordComponent: String, CaseIterable, Color {
    var hexValue: String { self.rawValue }
    
     case polarNight0 = "#2E3440",
          polarNight1 = "#3B4252",
          polarNight2 = "#434C5E",
          polarNight3 = "#4C566A",
          snowStorm4 = "#ECEFF4",
          snowStorm5 = "#E5E9F0",
          snowStorm6 = "#D8DEE9",
          frost7 = "#8FBCBB",
          frost8 = "#88C0D0",
          frost9 = "#81A1C1",
          frost10 = "#5E81AC",
          aurora11 = "#BF616A",
          aurora12 = "#D08770",
          aurora13 = "#EBCB8B",
          aurora14 = "#A3BE8C",
          aurora15 = "#B48EAD"
 }

func convertFileToPolar(fileContent: String, colorScheme: ColorScheme, port: Port) -> String {
    var output = fileContent
    
    // Convert all cases of the nord components
    NordComponent.allCases.forEach { nordComponent in
        if let replacementColor = colorScheme.colorSet[nordComponent] {
            output = output.replacingOccurrences(
                of: nordComponent.get(as: port.colorStyle),
                with: replacementColor.get(as: port.colorStyle)
            )
            if port.colorStyle == .hex {
                // Need to account for the lowercase / uppercase issue
                output = output.replacingOccurrences(
                    of: nordComponent.get(as: port.colorStyle).lowercased(),
                    with: replacementColor.get(as: port.colorStyle).lowercased()
                )
            }
        }
    }
    
    // Convert extra cases
    port.extraReplacements.forEach { replacement in
        output = output.replacingOccurrences(of: replacement.find, with: replacement.replace)
    }
    
    // Convert Nord titling
    output = output.replacingOccurrences(of: "Nord", with: "Polar")
    output = output.replacingOccurrences(of: "nord", with: "polar")
    
    return output
}
