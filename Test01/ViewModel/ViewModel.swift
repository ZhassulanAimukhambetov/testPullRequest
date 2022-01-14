//
//  ViewModel.swift
//  Test01
//
//  Created by Max Pavlov on 9.01.22.
//

import Foundation

class ViewModel: NSObject, TableViewViewModelType {

    @IBOutlet weak var networkManager: NetworkManager!
    
    private var selectedIndexPath: IndexPath?
    
    var profiles = [MainModel]()
    var filteredData: [MainModel] = []
    var isFiltered = 0
    
    func fetchProfile(completion: @escaping() -> ()) {
        networkManager.getData { [weak self] profiles in
            self?.profiles = profiles
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        return profiles.count 
    }
    
    func cellViewModel(for indexPath: IndexPath) -> TableViewCellViewModelType? {
        let profile = profiles[indexPath.row]
        return TableViewCellViewModel(profile: profile)
    }
    
    func viewModelForSelectedRow(for indexPath: IndexPath) -> PersonViewModelType? {
        return PersonViewModel(profile: profiles[indexPath.row])
    }
    
    func viewModelFiltredlForSelectedRow(for indexPath: IndexPath) -> PersonViewModelType? {
        return PersonViewModel(profile: filteredData[indexPath.row])
    }
    
    func cellFiltredViewModel(for indexPath: IndexPath) -> TableViewCellViewModelType? {
        let profile = filteredData[indexPath.row]
        return TableViewCellViewModel(profile: profile)
    }
    
    func selectRow(indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    func viewModelMap(for indexPath: IndexPath) -> MapViewModelType? {
        return MapViewModel(profile: profiles[indexPath.row])
    }
}
