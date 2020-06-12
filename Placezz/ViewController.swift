//
//  ViewController.swift
//  Placezz
//
//  Created by Russell Archer on 26/05/2020.
//  Copyright © 2020 Russell Archer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkHelper.shared.getAllPlaces { result in
            switch result {
            case .failure(let error):
                print("Error: \(error)")
                break
            case .success(let places):
                places.forEach { place in
                    print("id: \(place.id!), title: \(place.title)")
                }
                break
            }
        }
    }
}

