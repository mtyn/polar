import Foundation

struct RGB {
    let r: Double
    let g: Double
    let b: Double
}

func hexCodeToRGB(hex: String) -> RGB {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        fatalError("Invalid hex code provided (\(hex)) - check your theme files!")
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return RGB(
        r: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        g: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        b: CGFloat(rgbValue & 0x0000FF) / 255.0
    )
}

func hexToXcodeString(_ hex: String, alpha: Double = 1) -> String {
    let rgb = hexCodeToRGB(hex: hex)
    return "\(rgb.r) \(rgb.g) \(rgb.b) \(alpha)"
}