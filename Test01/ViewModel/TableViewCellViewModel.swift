//
//  TableViewCellViewModel.swift
//  Test01
//
//  Created by Max Pavlov on 9.01.22.
//

import Foundation

class TableViewCellViewModel: TableViewCellViewModelType {
    
    private var profile: MainModel
    
    var name: String {
        return profile.name
    }
    
    var genderAge: String {
        return String(describing: "gender: \(profile.gender), \(profile.age) years old")
    }
    
    init(profile: MainModel) {
        self.profile = profile
    }
}
