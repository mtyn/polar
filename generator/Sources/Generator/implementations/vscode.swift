import Foundation

struct VSCode: Port {
    var nordGitUrl: String = "git@github.com:arcticicestudio/nord-visual-studio-code.git"
    var directory: String = "vscode"
    var colorStyle: ColorStyle = .hex
    
    var relevantComponents: [PortComponent] = [
        .file(path: "themes/Nord-color-theme.json", renameTo: "themes/<<THEME_NAME>>-color-theme.json")
    ]
    
    var extraReplacements: [Replacement] = [
        Replacement(find: "\"type\": \"dark\",", replace: "\"type\": \"light\",")
    ]
}
