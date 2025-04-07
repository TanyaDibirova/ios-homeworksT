

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    fileprivate let menu = Menu.make()
    
    private lazy var tableView: UITableView = {
        let table = UITableView.init(
            frame: .zero,
            style: .grouped
        )
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    private enum CellReuseID: String {
        case base = "PostTableViewCell_ReuseID"
        case custom = "CustomTableViewCell_ReuseID"
    }
    
    
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        if section == 0 {
            return ProfileHeaderView()
        } else {
            return nil
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        menu.count
    }
    
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        guard let cellImages = tableView.dequeueReusableCell(withIdentifier: CellReuseID.custom.rawValue, for: indexPath) as? PhotosTableViewCell else {
            print("could not dequeueReusableCell - cellImages")
            return UITableViewCell()
        }
        guard let cellPost = tableView.dequeueReusableCell(withIdentifier: CellReuseID.base.rawValue, for: indexPath
        ) as? PostTableViewCell else {
            fatalError("could not dequeueReusableCell")
        }
        if indexPath.row == 0 {
            cellImages.configure(photos: Fhotos.make())
            return cellImages
        } else {
            cellPost.update(menu[indexPath.row])
            return cellPost
        }
        
        /*
         guard let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseID.base.rawValue, for: indexPath
         ) as? PostTableViewCell else {
         fatalError("could not dequeueReusableCell")
         }
         cell.update(menu[indexPath.row])
         //   cell.configure(post: menu[indexPath.row])
         return cell
         */
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        setupView()
        addSubviews()
        
        setupConstraints()
        tuneTableView()
        
    }
    
    private func setupView() {
        view.backgroundColor = .black
        navigationItem.title = "Нетология"
        navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            
        ])
    }
    
    private func tuneTableView() {
        tableView.estimatedRowHeight = 44.0
        
        //   let headerView = ProfileHeaderView()
        //   tableView.setAndLayout(headerView: headerView)
        //   tableView.tableFooterView = UIView()
        
        
        tableView.register(
            PostTableViewCell.self,
            forCellReuseIdentifier: CellReuseID.base.rawValue
        )
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: CellReuseID.custom.rawValue)
        
        
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            navigationController?.pushViewController(PhotosViewController(), animated: true)
        }}
    
    
    
    /*
     
     private lazy var profileHeaderView: ProfileHeaderView = {
     let view = ProfileHeaderView()
     view.translatesAutoresizingMaskIntoConstraints = false
     //  view.backgroundColor = .systemBlue
     
     return view
     
     }()
     
     override func viewDidLoad() {
     super.viewDidLoad()
     
     view.backgroundColor = .lightGray
     title = "Профиль"
     view.addSubview(profileHeaderView)
     
     setupContraints()
     
     //     profileHeaderView.frame = view.frame
     
     }
     
     private func setupContraints() {
     let safeAreaGuide = view.safeAreaLayoutGuide
     
     NSLayoutConstraint.activate([
     profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
     profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
     profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
     profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
     
     ])
     }
     
     */
}
