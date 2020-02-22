//
//  Model.swift
//  MapNYCSchools
//
//  Created by Amy Alsaydi on 2/21/20.
//  Copyright © 2020 Amy Alsaydi. All rights reserved.
//

import Foundation

struct School: Codable {
    let school_name: String
    let latitude: String
    let longitude: String
    let overview_paragraph: String
    let website: String
    let school_email: String
    let fax_number: String?
    let phone_number: String
    let location: String
}
