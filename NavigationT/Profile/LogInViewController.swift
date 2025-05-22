
import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    private lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    
    private lazy var textField: UITextField = { [unowned self] in
        let textField = UITextField()
        textField.placeholder = " Email or phone"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        textField.delegate = self
        return textField
        
    }()
    
    private lazy var passField: UITextField = { [unowned self] in
        let passF = UITextField()
        passF.placeholder = " Password"
        passF.font = UIFont.systemFont(ofSize: 16)
        passF.autocapitalizationType = UITextAutocapitalizationType.none
        passF.keyboardType = UIKeyboardType.default
        passF.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        passF.returnKeyType = UIReturnKeyType.done
        passF.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
        passF.clearButtonMode = UITextField.ViewMode.whileEditing
        passF.delegate = self
        return passF
        
    }()
    
    private lazy var separatorView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .lightGray
        return v
    }()
    
    
    private lazy var stackView: UIStackView =  { [unowned self] in
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.layer.cornerRadius = 10
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.spacing = 0
        stackView.addArrangedSubview(self.textField)
        stackView.addArrangedSubview(separatorView)
        stackView.addArrangedSubview(self.passField)
        
        return stackView
        
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = ._4855
        button.layer.cornerRadius = 10.0
        button.addTarget (self, action: #selector(pressed), for: .touchUpInside)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4.0
        return button
    }()
    
    let logo = UIImage(named: "logo")
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        removeKeyboardObservers()
    }
    
    @objc func willShowKeyboard(_ notification: NSNotification) {
        if scrollView.contentInset.bottom == 0.0 {
            let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
            scrollView.contentInset.bottom += (keyboardHeight ?? 0.0) + 20
        }
    }
    
    @objc func willHideKeyboard(_ notification: NSNotification) {
        scrollView.contentInset.bottom = 0.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        logoImage.image = logo
        addSubviews()
        setupContraints()
   //    setupKeyboardObservers()
        
    }
    
    private func addSubviews() {
        view.addSubview(logoImage)
        view.addSubview(scrollView)
        view.addSubview(editButton)
        scrollView.addSubview(stackView)
    }
    
    private func setupContraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            logoImage.heightAnchor.constraint(equalToConstant: 100.0),
            logoImage.widthAnchor.constraint(equalToConstant: 100.0),
            logoImage.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 120),
            
            scrollView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor,constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor,constant: -16),
            scrollView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            
            textField.heightAnchor.constraint(equalToConstant: 49),
            passField.heightAnchor.constraint(equalToConstant: 50),
            separatorView.heightAnchor.constraint(equalToConstant: 0.2),
            
            editButton.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            editButton.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16),
            editButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            editButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    private func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willShowKeyboard(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willHideKeyboard(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc func pressed() {
        let profileView = ProfileViewController()
        
        self.navigationController?.pushViewController(profileView, animated: true)
        
    }
    
    private func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    func textFieldShouldReturn(
        _ textField: UITextField
    ) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}


