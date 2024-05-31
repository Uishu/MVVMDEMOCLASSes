//
//  ViewController.swift
//  DemoMVVM
//
//  Created by Disha on 31/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mvvmTableView: UITableView!

    var viewModel = GuitarCoursesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchGuitarCourses { [weak self] success in
            if success {
                self?.mvvmTableView.reloadData()
            } else {
                // Handle error
            }
        }
        // Do any additional setup after loading the view.
    }


}

