//
//  ViewController.swift
//  Cafeterias
//
//  Created by kushal on 21/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView!
    
    let reuseIdentifier = "cafeteriaCellReuse"
    let cellHeight: CGFloat = 50
    
    let appel = Cafeteria(name: "Appel", isFavorite: false, rating: .moderate)
    let rpcc = Cafeteria(name: "RPCC", isFavorite: false, rating: .moderate)
    let risley = Cafeteria(name: "Risley", isFavorite: false, rating: .bad)
    let becker = Cafeteria(name: "Becker", isFavorite: false, rating: .good)
    let cook = Cafeteria(name: "Cook", isFavorite: false, rating: .great)
    
    var cafeterias: [Cafeteria]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cafeterias = [appel, rpcc, risley, becker, cook]
        
        title = "Cafeterias"
        view.backgroundColor = .white
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CafeteriaTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        //        Setup the constraints for our views
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cafeterias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CafeteriaTableViewCell
        let cafeteria = cafeterias[indexPath.row]
        cell.configure(for: cafeteria)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cafeteria = cafeterias[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath) as! CafeteriaTableViewCell
        cafeteria.isFavorite.toggle()
        cell.toggleHeart(for: cafeteria.isFavorite)
    }
}
