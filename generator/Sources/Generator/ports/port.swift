enum ColorStyle {
    case hex, rgbXML, base64
}

enum PortComponent {
    case file(path: String, renameTo: String)
    case directory(path: String, renameTo: String)
}

struct Replacement {
    let find: String
    let replace: String
    let doInverseCapitalisation: Bool
    let firstReplacementOnly: Bool
    
    init(find: String, replace: String, doInverseCapitalisation: Bool, firstReplacementOnly: Bool = false) {
        self.find = find
        self.replace = replace
        self.doInverseCapitalisation = doInverseCapitalisation
        self.firstReplacementOnly = firstReplacementOnly
    }
}

protocol Port {
    /**
    The URL of the Nord port project that we're using as a template.
    */
    var nordGitUrl: String { get }

    /**
    The directory in the theme repo where this should be stored.
    */
    var directory: String { get }

    /**
    Whether this Port expects a hex / RGB or some other ungodly monstrosity like Terminal.app that wants Base64 encoded color data. WTF Apple!
    */
    var colorStyle: ColorStyle { get }

    /**
    The relevant files and folders needed to copy across. 
    The `directory` field will be appended to these later, so it's just relative to the base of the color scheme.
    **NOTE**: It is assumed that the constant files (i.e. the ones we don't need to generate) already exist
              in the repo, so it's just a case of slotting in these ones where they fit.
    */
    var relevantComponents: [PortComponent] { get }
    
    /**
     Extra replacements that are required for the theme to work (e.g. where extra non-base Nord elements have been added)
     */
    func extraReplacements(forTheme theme: PolarColorScheme) -> [Replacement]

    /**
    By default, an implementation will be created by doing find and replace on the colors from the Nord pallette.
    However, some implementations will need customisation of particular elements, for that use this function
    */
    func applyCustomisations(using input: String) -> String
}

extension Port {
    func applyCustomisations(using input: String) -> String {
        input
    }

    func getPortBaseDir(forScheme scheme: String) -> String {
        "\(scheme)/\(directory)/"
    }
}
