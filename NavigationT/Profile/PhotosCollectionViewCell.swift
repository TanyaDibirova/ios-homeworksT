

import UIKit


final class PhotosCollectionViewCell: UICollectionViewCell {
    
    private enum Constants {
        
        static let verticalSpacing: CGFloat = 8.0
        static let horizontalPadding: CGFloat = 8.0
        static let profileDescriptionVerticalPadding: CGFloat = 8.0
        static let imageHeight: CGFloat =  160.0
    }
    
    private lazy var phtosImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
        setupSubviews()
        setupLayouts()
      
    }
    private func setupView() {
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
    }
    
    private func setupSubviews() {
        contentView.addSubview(phtosImageView)
    }
    
    private func setupLayouts() {
        NSLayoutConstraint.activate([
            phtosImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            phtosImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            phtosImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            phtosImageView.heightAnchor.constraint(equalToConstant: Constants.imageHeight),
            phtosImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

    
        ])
    
    }
    
    func setup(
        with fhotos: UIImage){
            phtosImageView.image = fhotos
    }
    
    }
