//
//  ViewController.swift
//  Test01
//
//  Created by Max Pavlov on 8.01.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet var viewModel: ViewModel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
        tableView.dataSource = self
        tableView.delegate = self
        setupData()
    }
    
    func setupData() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        viewModel.fetchProfile { [weak self] in
            self?.activityIndicator.isHidden = true
            self?.activityIndicator.stopAnimating()
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            setupData()
            viewModel.isFiltered = 0
        } else if sender.selectedSegmentIndex == 1 {
            viewModel.filteredData = viewModel.profiles.sorted(by: { $0.age > $1.age })
            viewModel.isFiltered = 1
            tableView.reloadData()
        } else if sender.selectedSegmentIndex == 2 {
            viewModel.filteredData = viewModel.profiles.sorted(by: { $0.age < $1.age })
            viewModel.isFiltered = 2
            tableView.reloadData()
        } else if sender.selectedSegmentIndex == 3 {
            viewModel.filteredData = viewModel.profiles.filter { $0.gender == "male" }
            viewModel.isFiltered = 3
            tableView.reloadData()
        } else {
            viewModel.filteredData = viewModel.profiles.filter { $0.gender == "female" }
            viewModel.isFiltered = 4
            tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController else { return }
        if viewModel.isFiltered == 0 {
            vc.viewModel = viewModel.viewModelForSelectedRow(for: indexPath)
        } else {
            vc.viewModel = viewModel.viewModelFiltredlForSelectedRow(for: indexPath)
        }
        vc.viewModelMap = viewModel.viewModelMap(for: indexPath)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.isFiltered == 0 {
            return viewModel.numberOfRows()
        } else  {
            return viewModel.filteredData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let personCell = cell as? TableViewCell else { return cell }
        let cellViewModel = viewModel.cellViewModel(for: indexPath)
        
        if viewModel.isFiltered == 0 {
            personCell.viewModel = cellViewModel
        } else {
            personCell.viewModel = viewModel.cellFiltredViewModel(for: indexPath)
        }
        
        return personCell
    }  
}

