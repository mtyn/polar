import Foundation



@available(macOS 13.0, *)
func convertFileToPolar(fileContent: String, colorScheme: PolarColorScheme, port: Port) -> String {
    var output = fileContent
    
    // First, replace all Nord base components with placeholders so we don't accidentally re-convert already converted colors
    NordComponent.allCases.forEach { nordComponent in
        print("POLAR: -- Replacing \(output.matches(of: nordComponent.get(as: port.colorStyle)).count) instances of \(nordComponent.placeholder())")
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
        print("POLAR: --- Replacing \(output.matches(of: replacement.find).count) instances of replacement")
        output = output.replacing(replacement.find, maxReplacements: replacement.firstReplacementOnly ? 1 : .max, with: { _ in replacement.replace })
        
//        output = output.replacingOccurrences(of: replacement.find, with: replacement.replace)
        if replacement.doInverseCapitalisation {
            print("POLAR: -- Running extra replacement \(replacement.find.lowercased()) -> \(replacement.replace.lowercased()) for \(colorScheme.title)")
            output = output.replacingOccurrences(of: replacement.find.lowercased(), with: replacement.replace.lowercased())
        }
    }
    
    // Convert Nord titling
    output = output.replacingOccurrences(of: "Nord", with: colorScheme.title)
    output = output.replacingOccurrences(of: "nord", with: colorScheme.title.lowercased()) // TODO: will likely cause problems with variable names and Stark Polar
    
    output = port.applyCustomisations(using: output)
    
    return output
}
