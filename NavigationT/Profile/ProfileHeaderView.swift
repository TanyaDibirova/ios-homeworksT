

import UIKit

class ProfileHeaderView: UIView {
    
    private lazy var imageCat: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 55
        image.clipsToBounds = true
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        return image
    }()
    let catImage = UIImage(named: "cat")
    
    private lazy var labelCat: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hipster Cat"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var labelSecond: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Waiting for something"
        label.textColor = UIColor.gray
        label.font = UIFont(name: "Regular", size: 14)
        return label
    }()
    
    private lazy var muButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
       button.layer.cornerRadius = 20
        button.backgroundColor = .systemBlue
        button.setTitle("Sho status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageCat.image =  catImage
        addSubview(imageCat)
        addSubview(labelCat)
        addSubview(labelSecond)
        addSubview(muButton)
        setupContraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContraints() {
   //     let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            imageCat.heightAnchor.constraint(equalToConstant: 110.0),
            imageCat.widthAnchor.constraint(equalToConstant: 110.0),
            imageCat.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageCat.topAnchor.constraint(equalTo: topAnchor, constant: 110),
            
            labelCat.topAnchor.constraint(equalTo: topAnchor, constant: 121),
            labelCat.leadingAnchor.constraint(equalTo: imageCat.trailingAnchor, constant: 16),
            
            muButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            muButton.topAnchor.constraint(equalTo: imageCat.bottomAnchor, constant: 16),
            muButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            muButton.heightAnchor.constraint(equalToConstant: 50),
            
            labelSecond.leadingAnchor.constraint(equalTo: imageCat.trailingAnchor, constant: 16),
            labelSecond.bottomAnchor.constraint(equalTo: muButton.topAnchor, constant: -34)
            
        
            
            
            
        ])
    }
    
    @objc func buttonPressed() {
        print("Waiting for something...")
    }
}

