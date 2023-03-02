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
    
    func placeholder() -> String {
        switch self {
        case .polarNight0:
            return "<<POLAR_NIGHT_0>>"
        case .polarNight1:
            return "<<POLAR_NIGHT_1>>"
        case .polarNight2:
            return "<<POLAR_NIGHT_2>>"
        case .polarNight3:
            return "<<POLAR_NIGHT_3>>"
        case .snowStorm4:
            return "<<SNOW_STORM_4>>"
        case .snowStorm5:
            return "<<SNOW_STORM_5>>"
        case .snowStorm6:
            return "<<SNOW_STORM_6>>"
        case .frost7:
            return "<<FROST_7>>"
        case .frost8:
            return "<<FROST_8>>"
        case .frost9:
            return "<<FROST_9>>"
        case .frost10:
            return "<<FROST_10>>"
        case .aurora11:
            return "<<AURORA_11>>"
        case .aurora12:
            return "<<AURORA_12>>"
        case .aurora13:
            return "<<AURORA_13>>"
        case .aurora14:
            return "<<AURORA_14>>"
        case .aurora15:
            return "<<AURORA_15>>"
        }
    }
 }

@available(macOS 13.0, *)
func convertFileToPolar(fileContent: String, colorScheme: PolarColorScheme, port: Port) -> String {
    var output = fileContent
    
    // First, replace all Nord base components with placeholders so we don't accidentally re-convert already converted colors
    NordComponent.allCases.forEach { nordComponent in
        output = output.replacing(nordComponent.get(as: port.colorStyle), with: nordComponent.placeholder())
        if port.colorStyle == .hex {
            output = output.replacing(nordComponent.get(as: port.colorStyle).lowercased(), with: nordComponent.placeholder())
        }
    }
    
    // Then, replace all placeholders with the required color
    NordComponent.allCases.forEach { nordComponent in
        let replacementColor = colorScheme.getColorComponent(forNordComponent: nordComponent)
        print("POLAR: -- Replacing \(nordComponent.get(as: port.colorStyle)) with \(replacementColor.get(as: port.colorStyle))")
        output = output.replacing(nordComponent.placeholder(), with: replacementColor.get(as: port.colorStyle))
    }
    
    // Convert extra cases
    port.extraReplacements(forTheme: colorScheme).forEach { replacement in
        print("POLAR: -- Running extra replacement \(replacement.find) -> \(replacement.replace) for \(colorScheme.title)")
        output = output.replacingOccurrences(of: replacement.find, with: replacement.replace)
        if replacement.doInverseCapitalisation {
            print("POLAR: -- Running extra replacement \(replacement.find.lowercased()) -> \(replacement.replace.lowercased()) for \(colorScheme.title)")
            output = output.replacingOccurrences(of: replacement.find.lowercased(), with: replacement.replace.lowercased())
        }
    }
    
    // Convert Nord titling
    output = output.replacingOccurrences(of: "Nord", with: colorScheme.title)
    output = output.replacingOccurrences(of: "nord", with: colorScheme.title.lowercased()) // TODO: will likely cause problems with variable names and Stark Polar
    
    return output
}
