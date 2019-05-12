import UIKit

var address = "http://maps.apple.com/?address=1016,North+Davidson+Street,Charlotte,North+Carolina"

func parseAddress(addressLink: String) -> String {
    
    let cleanedAddress = addressLink.replacingOccurrences(of: "+", with: " ")
    let addressArray = cleanedAddress.components(separatedBy: ",")
    
    guard let equalsSign = addressArray[0].firstIndex(of: "=") else {
        return "Missing street number, address could not be parsed"
    }
    
    //        var streetNumber = addressArray[0].substring(from: equalsSign)
    var streetNumber = addressArray[0][equalsSign...]
    
    streetNumber.remove(at: streetNumber.startIndex)
    return "\(streetNumber) \(addressArray[1]) \r\(addressArray[2]), \(addressArray[3])"
    
}

print(parseAddress(addressLink: address))

