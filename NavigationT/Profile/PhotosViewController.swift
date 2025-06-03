

import UIKit


class PhotosViewController: UIViewController, UICollectionViewDelegate {
    
    fileprivate lazy var photo: [Fhotos] = Fhotos.make()
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: viewLayout
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)

        return collectionView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupSubviews()
        setupLayouts()

    }
    
    private func setupView() {
        view.backgroundColor = .systemGray
        title = "Photo Gallery"
    }
    
    private func setupSubviews() {
            setupCollectionView()
        }
        
        private func setupCollectionView() {
            view.addSubview(collectionView)
            
            collectionView.dataSource = self
            collectionView.delegate = self

        }

        private func setupLayouts() {
            let safeAreaGuide = view.safeAreaLayoutGuide
            
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
                collectionView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
                collectionView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor)
            ])
        }
        
     private  enum LayoutConstant {
            static let spacing: CGFloat = 8.0
            static let itemHeight: CGFloat = 200.0
        }
    }

extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int
    ) -> Int {
        photo.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        
        
        let fhoto = photo[indexPath.row]
        cell.setup(with:fhoto)
        return cell
    }
}
    extension PhotosViewController: UICollectionViewDelegateFlowLayout {
        
      private func itemWidth(
            for width: CGFloat,
            spacing: CGFloat
        ) -> CGFloat {
            let itemsInRow: CGFloat = 3
            
            let totalSpacing: CGFloat = 3 * spacing + (itemsInRow - 1) * spacing
            let finalWidth = (width - totalSpacing) / itemsInRow
            
            return floor(finalWidth)
        }
        
        func collectionView(
            _ collectionView: UICollectionView,
            layout collectionViewLayout: UICollectionViewLayout,
            sizeForItemAt indexPath: IndexPath
        ) -> CGSize {
            let width = itemWidth(
                for: view.frame.width,
                spacing: LayoutConstant.spacing
                )
            
            return CGSize(width: width, height: LayoutConstant.itemHeight)
        }

        
        func collectionView(
            _ collectionView: UICollectionView,
            layout collectionViewLayout: UICollectionViewLayout,
            insetForSectionAt section: Int
        ) -> UIEdgeInsets {
            UIEdgeInsets(
                top: LayoutConstant.spacing,
                left: LayoutConstant.spacing,
                bottom: LayoutConstant.spacing,
                right: LayoutConstant.spacing
            )
        }

        func collectionView(
            _ collectionView: UICollectionView,
            layout collectionViewLayout: UICollectionViewLayout,
            minimumLineSpacingForSectionAt section: Int
        ) -> CGFloat {
            LayoutConstant.spacing
        }

        func collectionView(
            _ collectionView: UICollectionView,
            layout collectionViewLayout: UICollectionViewLayout,
            minimumInteritemSpacingForSectionAt section: Int
        ) -> CGFloat {
            LayoutConstant.spacing
        }
        
        func collectionView(
            _ collectionView: UICollectionView,
            willDisplay cell: UICollectionViewCell,
            forItemAt indexPath: IndexPath
        ) {
            cell.contentView.backgroundColor = .yellow
        }
        
        func collectionView(
            _ collectionView: UICollectionView,
            didSelectItemAt indexPath: IndexPath
        ) {
            print("Did select cell at \(indexPath.row)")
            
            let fhoto = photo[indexPath.row]
            
            let viewController = UIViewController()
            viewController.title = fhoto.imageName
            viewController.view.backgroundColor = .blue
            
            navigationController?.pushViewController(viewController, animated: true)
        }
}
 
