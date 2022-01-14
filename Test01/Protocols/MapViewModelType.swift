//
//  MapViewModelType.swift
//  Test01
//
//  Created by Max Pavlov on 12.01.22.
//

import Foundation

protocol MapViewModelType: AnyObject {
    var name: String { get }
    var adress: String { get }
    var latitude: Double { get }
    var longitude: Double { get }
}
