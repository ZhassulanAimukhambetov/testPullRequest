//
//  PersonViewModelType.swift
//  Test01
//
//  Created by Max Pavlov on 10.01.22.
//

import Foundation

protocol PersonViewModelType: AnyObject {
    var name: String { get }
    var gender: String { get }
    var age: String { get }
    var phoneAddressEmail: String { get }
}
