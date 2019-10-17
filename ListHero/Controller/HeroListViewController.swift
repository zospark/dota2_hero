//
//  HeroListViewController.swift
//  ListHero
//
//  Created by developer team on 17/10/2562 BE.
//  Copyright © 2562 developer team. All rights reserved.
//

import UIKit

class HeroListViewController: UIViewController {
    
    var tableView = UITableView()
    let heroCellId = "heroCell"
    
    var heros = [HeroViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchHero()
    }
    
    fileprivate func fetchHero() {
        let sv = HeroService()
        sv.getAll { (heros, error) in
            self.heros = heros?.map({ HeroViewModel(hero: $0) }) ?? []
            print("success : ",self.heros.count)
            self.tableView.reloadData()
        }
    }
    
    fileprivate func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(HeroCell.self, forCellReuseIdentifier: heroCellId)
    }
    
    fileprivate func setupNavBar() {
        navigationItem.title = "Heros"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .yellow
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(red: 12, green: 47, blue: 57, alpha: 1)
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
}

extension HeroListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: heroCellId, for: indexPath) as! HeroCell
        cell.heroViewModel = heros[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
}
