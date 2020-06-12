//
//  PError.swift
//  Placezz
//
//  Created by Russell Archer on 11/06/2020.
//  Copyright © 2020 Russell Archer. All rights reserved.
//

import Foundation

enum PError: String, Error {
    case badUrl             = "Unable to create valid URL"
    case unableToComplete   = "Unable to complete your request. Please check your internet connection"
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data received from the server was invalid. Please try again."
}
