//
//  ViewController.swift
//  PryanikTest
//
//  Created by Emil Shpeklord on 30.05.2022.
//

import UIKit

final class DataViewController: UIViewController {

    private var viewModel: DataViewModel
    
    init(vm: DataViewModel) {
        self.viewModel = vm
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        viewModel.getData {
            print(self.viewModel.data)
        }
    }


}

