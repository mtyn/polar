import Foundation

struct JetBrains: Port {
    var nordGitUrl: String = "git@github.com:arcticicestudio/nord-jetbrains.git"
    
    var directory: String = "polar-jetbrains"
    
    var colorStyle: ColorStyle = .hex
    
    var relevantComponents: [PortComponent] = [
        .file(path: "resources/themes/nord.xml", renameTo: "resources/theme/polar.xml"),
        .file(path: "src/nord.theme.json", renameTo: "resources/theme/polar.theme.json")
    ]
    
    func extraReplacements(forTheme theme: PolarColorScheme) -> [Replacement] {
        [
            Replacement(find: "Arctic Ice Studio", replace: "Tim Hull", doInverseCapitalisation: false),
            Replacement(find: "\"dark\": true", replace: "\"dark\": false", doInverseCapitalisation: false),
            Replacement(find: "/themes/", replace: "/theme/", doInverseCapitalisation: false),
            Replacement(find: "Darcula", replace: "Default", doInverseCapitalisation: false),
            Replacement(find: "323846", replace: theme.getColorComponent(forNordComponent: .polarNight1).get(as: .hex).lowercased(), doInverseCapitalisation: false),
            Replacement(
                find: "616E88",
                replace: theme.getColorComponent(forNordComponent: .polarNight3).hexValue,
                doInverseCapitalisation: true
            )
        ]
    }
}
