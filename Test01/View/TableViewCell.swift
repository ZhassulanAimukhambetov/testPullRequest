//
//  TableViewCell.swift
//  Test01
//
//  Created by Max Pavlov on 9.01.22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var gendorAgeLable: UILabel!
    
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            nameLable.text = viewModel.name
            gendorAgeLable.text = viewModel.genderAge
        }
    }
}
