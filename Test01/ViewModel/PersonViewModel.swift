//
//  PersonViewModel.swift
//  Test01
//
//  Created by Max Pavlov on 10.01.22.
//

import Foundation

class PersonViewModel: PersonViewModelType {

    private var profile: MainModel
    
    var name: String {
        return profile.name
    }
    
    var age: String {
        return String(describing: profile.age)
    }
    
    var gender: String {
        return profile.gender
    }
    
    var phoneAddressEmail: String {
        return String(describing: "Adress: \(profile.address)\nPhone: \(profile.phone)\nEmail: \(profile.email)")
    }

    init(profile: MainModel) {
        self.profile = profile
    }

}
