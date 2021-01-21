//
//  CafeteriaTableViewCell.swift
//  Cafeterias
//
//  Created by kushal on 21/01/21.
//

import UIKit

class CafeteriaTableViewCell: UITableViewCell {
    
    var nameLabel: UILabel!
    var ratingLabel: UILabel!
    var heartImageView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 14)
        contentView.addSubview(nameLabel)
        
        ratingLabel = UILabel()
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.font = .systemFont(ofSize: 12)
        contentView.addSubview(ratingLabel)
        
        heartImageView = UIImageView(image: UIImage(named: "heart"))
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        heartImageView.contentMode = .scaleAspectFit
        heartImageView.isHidden = true
        contentView.addSubview(heartImageView)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
        
        NSLayoutConstraint.activate([
            ratingLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 8),
            ratingLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            ratingLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
        
        NSLayoutConstraint.activate([
            heartImageView.heightAnchor.constraint(equalToConstant: 20),
            heartImageView.widthAnchor.constraint(equalToConstant: 20),
            heartImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            heartImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(for cafeteria: Cafeteria) {
        nameLabel.text = cafeteria.name
        ratingLabel.text = "Rating: \(cafeteria.getRatingString())"
    }
    
    func toggleHeart(for isFavorite: Bool) {
        heartImageView.isHidden = !isFavorite
    }
}
