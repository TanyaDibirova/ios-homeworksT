//
//  PostTableViewCell.swift
//  NavigationT
//
//  Created by MacBook on 02.04.2025.
//

import UIKit
import StorageService

class PostTableViewCell: UITableViewCell {
    
    private let image: UIImageView = {
           let image = UIImageView()
           image.translatesAutoresizingMaskIntoConstraints = false
           image.contentMode = .scaleAspectFit
           image.backgroundColor = .black
           return image
       }()
       
       private let authorLabel: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.numberOfLines = 2
           label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
           label.textColor = .black
           return label
       }()
       
       private let descriptionLabel: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.numberOfLines = 0
           label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
           label.textColor = .systemGray
           return label
       }()
       
       private let likesLabel: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.numberOfLines = 1
           label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
           label.textColor = .black
           return label
       }()
       
       private let viewsLabel: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.numberOfLines = 1
           label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
           label.textColor = .black
           label.textAlignment = .right
           return label
       }()
       override init(
           style: UITableViewCell.CellStyle,
           reuseIdentifier: String?
       ) {
           super.init(
               style: .subtitle,
               reuseIdentifier: reuseIdentifier
           )

           tuneView()
           layout()
           
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       override func prepareForReuse() {
           super.prepareForReuse()
           
           isHidden = false
           isSelected = false
           isHighlighted = false
       }
       
       override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)
           
           guard let view = selectedBackgroundView else {
               return
           }
           
           contentView.insertSubview(view, at: 0)
           selectedBackgroundView?.isHidden = !selected
       }
       
       private func tuneView() {
           backgroundColor = .tertiarySystemBackground
           contentView.backgroundColor = .tertiarySystemBackground
           textLabel?.backgroundColor = .clear
           detailTextLabel?.backgroundColor = .clear
           imageView?.backgroundColor = .clear
           
           

     //      accessoryView = nil
     //      accessoryType = .disclosureIndicator
           
           selectionStyle = .gray
           let selectedView = UIView()
           selectedView.backgroundColor = .systemYellow
           selectedBackgroundView = selectedView
       }
       
       private func layout() {
           [image, likesLabel, descriptionLabel, authorLabel, viewsLabel].forEach {contentView.addSubview($0)
           }
           let standartConstraint: CGFloat = 16
           
           NSLayoutConstraint.activate([
               authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: standartConstraint),
               authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: standartConstraint),
               authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -standartConstraint),
               
               image.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
               image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
               image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
               image.widthAnchor.constraint(equalTo: contentView.widthAnchor),
               image.heightAnchor.constraint(equalTo: image.widthAnchor),
               
               descriptionLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: standartConstraint),
               descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: standartConstraint),
               descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -standartConstraint),
               
               likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: standartConstraint),
               likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: standartConstraint),
               likesLabel.trailingAnchor.constraint(equalTo: viewsLabel.leadingAnchor),
               
               viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: standartConstraint),
               viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -standartConstraint),
               viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -standartConstraint),
               viewsLabel.widthAnchor.constraint(equalTo: likesLabel.widthAnchor)
           ])
       }
       
       func update(_ model: Menu) {
        authorLabel.text = model.author
           descriptionLabel.text = model.description
           image.image = UIImage(named: model.image)
           likesLabel.text = "Likes: \(String(describing: model.likes))"
           viewsLabel.text = "Views: \(String(describing: model.views))"
           
       }
   }
