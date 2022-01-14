//
//  MapViewModel.swift
//  Test01
//
//  Created by Max Pavlov on 12.01.22.
//

import Foundation

class MapViewModel: MapViewModelType {
    
    private var profile: MainModel
    
    var name: String {
        return profile.name
    }
    
    var adress: String {
        return profile.address
    }
    
    var latitude: Double {
        return profile.latitude
    }
    
    var longitude: Double {
        return profile.longitude
    }
    
    init(profile: MainModel) {
        self.profile = profile
    }
}
