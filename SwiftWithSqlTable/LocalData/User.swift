//
//  User.swift
//  MUFG-Swift
//

import UIKit

class User: SQLTable {
    
    var Id = 0
    var IsClient = ""
    var Name = ""
    var PhoneNumber = ""
    var PositionId = 0
    var PositionName = ""
    var ProfilePic = ""
    var Address = ""
    var ClientId = 0
    var ClientLogo = ""
    var ClientName = ""
    var CountryId = 0
    var CountryName = ""
    var EmailId = ""
    var FunctionColor = ""
    var FunctionId = 0
    var FunctionName = ""
    
    override var description: String {
        return "Id: \(Id), IsClient: \(IsClient), Name: \(Name), PhoneNumber: \(PhoneNumber), PositionId: \(PositionId), PositionName: \(PositionName), ProfilePic: \(ProfilePic), Address: \(Address),ClientId: \(ClientId), ClientLogo: \(ClientLogo), ClientName: \(ClientName),CountryId: \(CountryId),CountryName: \(CountryName), EmailId: \(EmailId), FunctionColor: \(FunctionColor),FunctionId: \(FunctionId), FunctionName: \(FunctionName)"
    }
}

