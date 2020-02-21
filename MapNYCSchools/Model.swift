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
    let latitude: Double
    let longitude: Double
}
