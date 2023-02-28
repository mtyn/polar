import Foundation

public struct ColorSet {
    // Background == Equivalent to Polar Night from Nord
    let background0: String 
    let background1: String
    let background2: String
    let background3: String

    // Foreground == Equivalent to Snow Storm from Nord
    let foreground0: String
    let foreground1: String
    let foreground2: String
    let foreground3: String

    // Frost == Same semantics as in Nord
    let frost7: String
    let frost8: String
    let frost9: String
    let frost10: String

    // Aurora == Same semantics as in Nord
    let auroraRed11: String
    let auroraOrange12: String
    let auroraYellow13: String
    let auroraGreen14: String
    let auroraPurple15: String
}



public struct ColorScheme {
    let title: String
    let folderName: String
    let colorSet: [NordComponent: Color]
}

