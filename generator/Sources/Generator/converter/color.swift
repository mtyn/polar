protocol Color {
    var hexValue: String { get }
    
    func get(as style: ColorStyle) -> String
}

extension Color {
    func get(as style: ColorStyle) -> String {
        switch style {
        case .hex:
            return self.hexValue
        case .rgbXML:
            return hexToXcodeString(self.hexValue)
        case .base64:
            print("POLAR: ERROR: Base64 encoding not yet implemented")
            return ""
        }
    }
}

public struct CustomColor: Color {
    public var hexValue: String
    
    init(_ hexValue: String) {
        self.hexValue = hexValue
    }
}
