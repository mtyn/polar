import Foundation

struct JetBrains: Port {
    var nordGitUrl: String = "git@github.com:arcticicestudio/nord-jetbrains.git"
    
    var directory: String = "jetbrains"
    
    var colorStyle: ColorStyle = .hex
    
    var relevantComponents: [PortComponent] = [
        .file(path: "resources/themes/nord.xml", renameTo: "resources/themes/polar.xml"),
        .file(path: "src/nord.theme.xml", renameTo: "src/polar.theme.xml")
    ]
    
    func extraReplacements(forTheme theme: PolarColorScheme) -> [Replacement] {
        [
        
        ]
    }
}
