import Foundation

struct VSCode: Port {
    var nordGitUrl: String = "git@github.com:arcticicestudio/nord-visual-studio-code.git"
    var directory: String = "vscode"
    var colorStyle: ColorStyle = .hex
    
    var relevantComponents: [PortComponent] = [
        .file(path: "themes/Nord-color-theme.json", renameTo: "themes/<<THEME_NAME>>-color-theme.json")
    ]
    
    func extraReplacements(forTheme theme: PolarColorScheme) -> [Replacement] {
        [
            replacementForStringJSONValue(key: "type", oldValue: "dark", newValue: "light"),
            // TODO: Check if these colors are used in other ports, and make Nord components for them if so
            Replacement(
                find: "#3B4252",
                replace: "\(theme.getColorComponent(forNordComponent: .polarNight1).hexValue)AA",
                doInverseCapitalisation: true
            ),
            Replacement(
                find: "#616E88",
                replace: theme.getColorComponent(forNordComponent: .polarNight3).hexValue,
                doInverseCapitalisation: true
            )
        ]
    }
    
    private func replacementForStringJSONValue(key: String, oldValue: String, newValue: String, inverse: Bool = false) -> Replacement {
        Replacement(find: "\"\(key)\": \"\(oldValue)\",", replace: "\"\(key)\": \"\(newValue)\",", doInverseCapitalisation: inverse)
    }
}


