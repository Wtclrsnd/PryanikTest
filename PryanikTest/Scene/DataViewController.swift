//
//  ViewController.swift
//  PryanikTest
//
//  Created by Emil Shpeklord on 30.05.2022.
//

import UIKit
import SnapKit

final class DataViewController: UIViewController {

    private var viewModel: DataViewModel
    
    init(vm: DataViewModel) {
        self.viewModel = vm
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 1000
        return tableView
    }()

    private var refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.getData {
            self.tableView.reloadData()
        }

        setUpUI()
        self.tableView.refreshControl?.endRefreshing()
    }

    private func setUpUI() {
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: "img")
        tableView.register(TextTableViewCell.self, forCellReuseIdentifier: "text")
        tableView.register(SelectorTableViewCell.self, forCellReuseIdentifier: "selector")

        tableView.delegate = self
        tableView.dataSource = self

        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.backgroundColor = .systemBackground
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }

    @objc private func refreshData() {
        viewModel.getData {
            URLCache.shared.removeAllCachedResponses()
            self.tableView.reloadData()
        }
        self.tableView.refreshControl?.endRefreshing()
    }

}

extension DataViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.data?.view?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentModuleKey = viewModel.data?.view?[indexPath.row]
        let data = viewModel.modules?[currentModuleKey ?? ""]
        switch currentModuleKey {
        case "hz":
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "text",
                for: indexPath
            ) as? TextTableViewCell else { return UITableViewCell() }
            cell.setUpText(text: data?.text ?? "")
            cell.selectionStyle = .none
            return cell
        case "selector":
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "selector",
                for: indexPath
            ) as? SelectorTableViewCell else { return UITableViewCell() }
            cell.setUp(data: data)
            cell.selectionStyle = .none
            return cell
        case "picture":
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "img",
                for: indexPath
            ) as? ImageTableViewCell else { return UITableViewCell() }
            cell.setUpImage(imageUrl: data?.url ?? "")
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: viewModel.data?.view?[indexPath.row] , message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            print("User click Approve button")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

