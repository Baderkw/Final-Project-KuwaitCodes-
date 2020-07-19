
import Foundation
import FirebaseFirestore
import class Firebase.User
typealias FirebaseUser = Firebase.User


/// DONT edit this part
protocol User: Codable{
    var uid: String? {get set}
    var name: String {get set}
    var email: String {get set}
    var userType: String {get set}
    var array: [String]? {get set}
}

extension User{
}


/// You can customize your user here. 
struct CubeUser: User{
    var uid: String? = nil
    var name: String = ""
    var email: String = ""
    var userType: String = ""
    var array: [String]? = nil
}


struct SignInCredentials: Encodable
{
    var email: String
    var password: String
}
