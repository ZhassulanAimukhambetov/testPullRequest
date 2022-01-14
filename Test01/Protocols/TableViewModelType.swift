//
//  TableViewModelType.swift
//  Test01
//
//  Created by Max Pavlov on 9.01.22.
//

import Foundation

protocol TableViewViewModelType {
    func numberOfRows() -> Int
    func cellViewModel(for indexPath: IndexPath) -> TableViewCellViewModelType?
    
    func viewModelForSelectedRow(for indexPath: IndexPath) -> PersonViewModelType?
    func viewModelFiltredlForSelectedRow(for indexPath: IndexPath) -> PersonViewModelType?
    
    func cellFiltredViewModel(for indexPath: IndexPath) -> TableViewCellViewModelType?
    func selectRow(indexPath: IndexPath)
    
    func viewModelMap(for indexPath: IndexPath) -> MapViewModelType? 

}
