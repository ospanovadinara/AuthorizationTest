//
//  RegistrationViewController.swift
//  AuthorizationTest
//
//  Created by Dinara on 13.06.2024.
//

import UIKit
import SnapKit

// MARK: - Class RegistrationViewController
final class RegistrationViewController: UIViewController {
    // MARK: - UI
    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Номер телефона"
        label.textColor = Colors.white.uiColor
        label.font = Fonts.bold.s13()
        return label
    }()

    private lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = Colors.black.uiColor
        textField.placeholder = "(000) - 000 - 0000"
        textField.font = Fonts.regular.s19()
        textField.layer.cornerRadius = 10
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 34, height: 0))
        textField.leftViewMode = .always
        return textField
    }()

    private lazy var firstNumberTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = Colors.black.uiColor
        textField.placeholder = "+ 7"
        textField.font = Fonts.regular.s19()
        textField.layer.cornerRadius = 10
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 13, height: 0))
        textField.leftViewMode = .always
        textField.rightView = rightView
        textField.rightViewMode = .always
        textField.layer.cornerRadius = 10
        return textField
    }()

    private lazy var rightView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 13, height: 12))
        return view
    }()

    private lazy var subtractButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 6, height: 12))
        button.setImage(Images.arrowDown.uiImage, for: .normal)
        return button
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 18
        return stackView
    }()

    private lazy var codeWillSentLabel: UILabel = {
        let label = UILabel()
        label.text = "Код придет на ваш номер телефона"
        label.textColor = Colors.white.uiColor
        label.font = Fonts.regular.s14()
        label.textAlignment = .center
        return label
    }()

    private lazy var getCodeButton: GradientButton = {
        let button = GradientButton(colors: [Colors.purple01.cgColor,
                                             Colors.purple02.cgColor,
                                             Colors.blue01.cgColor,
                                             Colors.blue02.cgColor,
                                             Colors.cyan.cgColor])
        button.setTitle("Получить код", for: .normal)
        button.setTitleColor(Colors.white.uiColor, for: .normal)
        button.titleLabel?.font = Fonts.regular.s16()
        button.layer.cornerRadius = 30
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(getCodeButtonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupViews()
        setupConstraints()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        firstNumberTextField.addGradientBorder(colors: [Colors.purple01.uiColor,
                                               Colors.purple02.uiColor,
                                               Colors.blue01.uiColor,
                                               Colors.blue02.uiColor,
                                               Colors.cyan.uiColor],
                                      width: 1)

        phoneTextField.addGradientBorder(colors: [Colors.purple01.uiColor,
                                                  Colors.purple02.uiColor,
                                                  Colors.blue01.uiColor,
                                                  Colors.blue02.uiColor,
                                                  Colors.cyan.uiColor],
                                         width: 1)
    }
}

private extension RegistrationViewController {
    // MARK: - Setup Navigation Controller
    func setupNavigationController() {
        self.navigationItem.title = "Зарегистрироваться"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: Colors.white.uiColor]
        let leftBarButtonItem = UIBarButtonItem(
            image: Images.arrowLeft.uiImage,
            style: .plain,
            target: self,
            action: #selector(arrowLeftButtonTapped)
        )
        leftBarButtonItem.tintColor = Colors.white.uiColor
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }

    func setupViews() {
        view.backgroundColor = Colors.black.uiColor

        rightView.addSubview(subtractButton)

        [firstNumberTextField,
         phoneTextField
        ].forEach {
            stackView.addArrangedSubview($0)
        }

        [phoneLabel,
         stackView,
         codeWillSentLabel,
         getCodeButton
        ].forEach {
            view.addSubview($0)
        }
    }

    func setupConstraints() {
        phoneLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.leading.equalToSuperview().offset(34)
        }

        firstNumberTextField.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.height.equalTo(50)
        }

        phoneTextField.snp.makeConstraints { make in
            make.width.equalTo(231)
            make.height.equalTo(50)
        }

        stackView.snp.makeConstraints { make in
            make.top.equalTo(phoneLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(34)
        }

        codeWillSentLabel.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(22)
            make.centerX.equalTo(getCodeButton.snp.centerX)
        }

        getCodeButton.snp.makeConstraints { make in
            make.top.equalTo(codeWillSentLabel.snp.bottom).offset(53)
            make.leading.equalToSuperview().offset(35)
            make.trailing.equalToSuperview().offset(-35)
            make.height.equalTo(56)
        }
    }

    // MARK: - Actions
    @objc func arrowLeftButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc func getCodeButtonTapped() {

    }
}
