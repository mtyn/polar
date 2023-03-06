import Foundation
import RegexBuilder

@available(macOS 13.0, *)
struct XCode: Port {
    var nordGitUrl: String = "git@github.com:arcticicestudio/nord-xcode.git"
    var directory: String = "xcode"
    var colorStyle: ColorStyle = .rgbXML
    
    var relevantComponents: [PortComponent] = [
        .file(path: "src/Nord.xccolortheme", renameTo: "Polar.xccolortheme")
    ]
    
    func extraReplacements(forTheme theme: PolarColorScheme) -> [Replacement] {
        [
            Replacement(
                find: """
<!--
Copyright (C) 2017-present Arctic Ice Studio <development@arcticicestudio.com>
Copyright (C) 2017-present Sven Greb <development@svengreb.de>

Project:    Polar Xcode
Version:    0.2.0
Repository: https://github.com/arcticicestudio/polar-xcode
License:    MIT
References
  https://developer.apple.com/xcode
-->
""",
                replace: """
<!-- Polar Xcode Theme, based on Nord (https://github.com:arcticicestudio/nord-xcode) -->
""",
                doInverseCapitalisation: false
            ),
            Replacement(
                find: "<key>xcode.syntax.identifier.class</key>",
                replace: """
        <key>xcode.syntax.declaration.other</key>
        <string>\(theme.getColorComponent(forNordComponent: .frost8).get(as: self.colorStyle)) 1</string>
        <key>xcode.syntax.declaration.type</key>
        <string>\(theme.getColorComponent(forNordComponent: .frost7).get(as: self.colorStyle)) 1</string>
        <key>xcode.syntax.identifier.class</key>
""",
                doInverseCapitalisation: false,
                firstReplacementOnly: true
            )
        ]
    }
    
    func applyCustomisations(using input: String) -> String {
        // Cut off the initial
        var prefix = ""
        var output = input.trimmingPrefix(while: {
            prefix.append($0)
            return !prefix.hasSuffix("-->\n")
        })
        return "<!-- Polar Xcode Theme by @mtyn, based on the Nord theme found at https://github.com/arcticicestudio/nord-xcode -->\n" + output
    }
}
