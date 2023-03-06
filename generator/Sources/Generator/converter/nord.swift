import Foundation

enum NordComponent: String, CaseIterable, Color {
    var hexValue: String { self.rawValue }
    
    case polarNight0 = "#2E3440",
         polarNight1 = "#3B4252",
         polarNight2 = "#434C5E",
         polarNight3 = "#4C566A",
         snowStorm4 = "#ECEFF4",
         snowStorm5 = "#E5E9F0",
         snowStorm6 = "#D8DEE9",
         frost7 = "#8FBCBB",
         frost8 = "#88C0D0",
         frost9 = "#81A1C1",
         frost10 = "#5E81AC",
         aurora11 = "#BF616A",
         aurora12 = "#D08770",
         aurora13 = "#EBCB8B",
         aurora14 = "#A3BE8C",
         aurora15 = "#B48EAD"
    
    func placeholder() -> String {
        switch self {
        case .polarNight0:
            return "<<POLAR_NIGHT_0>>"
        case .polarNight1:
            return "<<POLAR_NIGHT_1>>"
        case .polarNight2:
            return "<<POLAR_NIGHT_2>>"
        case .polarNight3:
            return "<<POLAR_NIGHT_3>>"
        case .snowStorm4:
            return "<<SNOW_STORM_4>>"
        case .snowStorm5:
            return "<<SNOW_STORM_5>>"
        case .snowStorm6:
            return "<<SNOW_STORM_6>>"
        case .frost7:
            return "<<FROST_7>>"
        case .frost8:
            return "<<FROST_8>>"
        case .frost9:
            return "<<FROST_9>>"
        case .frost10:
            return "<<FROST_10>>"
        case .aurora11:
            return "<<AURORA_11>>"
        case .aurora12:
            return "<<AURORA_12>>"
        case .aurora13:
            return "<<AURORA_13>>"
        case .aurora14:
            return "<<AURORA_14>>"
        case .aurora15:
            return "<<AURORA_15>>"
        }
    }
    
    func get(as style: ColorStyle) -> String {
        switch style {
        case .hex:
            return self.hexValue
        case .rgbXML:
            // Need to manually override the RGB XML for the base Nord components as it won't match on long floats
            switch self {
            case .polarNight0:
                return "0.138852 0.15161 0.193536"
            case .polarNight1:
                return "0.207823 0.228868 0.298817"
            case .polarNight2:
                return "0.239159 0.263378 0.343876"
            case .polarNight3:
                return "0.307666 0.352597 0.459645"
            case .snowStorm4:
                return "0.816187 0.837374 0.894673"
            case .snowStorm5:
                print("INFO: Unknown Nord RGB Code, returning estimated string")
                return hexToXcodeString(self.hexValue)
            case .snowStorm6:
                print("INFO: Unknown Nord RGB Code, returning estimated string")
                return hexToXcodeString(self.hexValue)
            case .frost7:
                return "0.506519 0.684472 0.678581"
            case .frost8:
                return "0.48763 0.698625 0.777955"
            case .frost9:
                return "0.450991 0.556703 0.711154"
            case .frost10:
                return "0.320664 0.420666 0.61863"
            case .aurora11:
                print("INFO: Unknown Nord RGB Code, returning estimated string")
                return hexToXcodeString(self.hexValue)
            case .aurora12:
                return "0.748739 0.455574 0.357075"
            case .aurora13:
                print("INFO: Unknown Nord RGB Code, returning estimated string")
                return hexToXcodeString(self.hexValue)
            case .aurora14:
                return "0.574309 0.70253 0.464919"
            case .aurora15:
                return "0.638894 0.47419 0.620239"
            }
        case .base64:
            print("BASE 64 NOT YET SUPPORTED IN NORD COMPONENT")
            return ""
        }
    }
}

