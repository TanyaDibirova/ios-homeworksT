

import UIKit

final class CustomButton: UIButton {
    typealias Action = () -> Void

    var buttonAction: Action

    init(title: String, titleColor: UIColor = .white, bgColor: UIColor = .black, action: @escaping Action) {
        buttonAction = action
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = ._4855
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
                layer.cornerRadius = 15.0
                layer.shadowOpacity = 0.2
                layer.shadowRadius = 2.0

    // setup appearance
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("lol")
    }

    @objc private func buttonTapped() {
        buttonAction()
    }
}
