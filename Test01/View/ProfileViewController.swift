//
//  ProfileViewController.swift
//  Test01
//
//  Created by Max Pavlov on 9.01.22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var gendorLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    var viewModel: PersonViewModelType?
    var viewModelMap: MapViewModelType?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let viewModel = viewModel else { return }
        self.nameLable.text = viewModel.name
        self.ageLabel.text = "\(viewModel.age) years old"
        self.gendorLabel.text = "Gender: \(viewModel.gender)"
        self.infoLabel.text = viewModel.phoneAddressEmail
    }
    
    @IBAction func locationButtonAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "MapViewController") as? MapViewController else { return }
        vc.viewModel = viewModelMap
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
