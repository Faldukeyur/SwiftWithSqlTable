//
//  Client.swift
//  MUFG-Swift

import UIKit

class Client: SQLTable {
    
    var Id = 0
    var ClientName = ""
    var AboutCompany = ""
    var Logo = ""
    var Address = ""
    var Latitude = 0.0
    var Longitude = 0.0
    var RevenueYrToDate = 0
    var Assets = 0
    var CustomerSince = ""
    var CreatedBy = 0
    var CountryName = ""
    var CountryId = 0
    var CreatedDate = ""
    var IsActive = ""
    var ModifiedDate = ""
    var EncryptedId = 0
    var ModifiedBy = ""
    
   
    
    override var description: String {
        return "Id: \(Id), ClientName: \(ClientName), AboutCompany: \(AboutCompany), Logo: \(Logo), Address: \(Address), Latitude: \(Latitude), Longitude: \(Longitude), RevenueYrToDate: \(RevenueYrToDate),Assets: \(Assets), CustomerSince: \(CustomerSince), CreatedBy: \(CreatedBy),CountryName: \(CountryName),CountryId: \(CountryId), CreatedDate: \(CreatedDate), IsActive: \(IsActive),ModifiedDate: \(ModifiedDate), EncryptedId: \(EncryptedId), ModifiedBy: \(ModifiedBy)"
    }
}
