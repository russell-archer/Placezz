//
//  Place.swift
//  Placezz
//
//  Created by Russell Archer on 11/06/2020.
//  Copyright © 2020 Russell Archer. All rights reserved.
//

final class Place: Codable {

    var id: Int?
    var title: String

    init(id: Int? = nil, title: String) {
        self.id = id
        self.title = title
    }
}

