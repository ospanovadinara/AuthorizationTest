//
//  MainViewController.swift
//  AuthorizationTest
//
//  Created by Dinara on 12.06.2024.
//

import UIKit
import SnapKit

// MARK: - Class MainViewController
final class MainViewController: UIViewController {
    // MARK: - UI
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.icon.uiImage
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.text = "SIS"
        label.textColor = Colors.white.uiColor
        label.font = Fonts.bold.s34()
        label.textAlignment = .center
        return label
    }()

    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "Выбери свою безопасность"
        label.textColor = Colors.white.uiColor
        label.font = Fonts.regular.s17()
        label.textAlignment = .center
        return label
    }()

    private lazy var firstStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 17
        return stackView
    }()

    private lazy var enterButton: GradientButton = {
        let button = GradientButton(colors: [Colors.purple01.cgColor,
                                             Colors.purple02.cgColor,
                                             Colors.blue01.cgColor,
                                             Colors.blue02.cgColor,
                                             Colors.cyan.cgColor])
        button.setTitle("Войти по коду приложения", for: .normal)
        button.setTitleColor(Colors.white.uiColor, for: .normal)
        button.titleLabel?.font = Fonts.regular.s16()
        button.layer.cornerRadius = 30
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var noAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "У вас нет аккаунта?"
        label.textColor = Colors.white.uiColor
        label.font = Fonts.regular.s14()
        label.textAlignment = .center
        return label
    }()

    private lazy var registerNowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Зарегистрируйтесь сейчас", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(registerNowButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var secondStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        return stackView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
}

// MARK: - Private Extension MainViewController
private extension MainViewController {
    // MARK: - Setup Views
    func setupViews() {
        view.backgroundColor = Colors.black.uiColor

        [firstLabel,
         secondLabel
        ].forEach {
            firstStackView.addArrangedSubview($0)
        }

        [noAccountLabel,
         registerNowButton
        ].forEach {
            secondStackView.addArrangedSubview($0)
        }

        [iconImageView,
         firstStackView,
         enterButton,
         secondStackView
        ].forEach {
            view.addSubview($0)
        }
    }

    // MARK: - Setup Constraints
    func setupConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(265)
            make.leading.equalToSuperview().offset(155)
            make.size.equalTo(79)
        }

        firstStackView.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(88)
            make.trailing.equalToSuperview().offset(-92)
        }

        enterButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(35)
            make.trailing.equalToSuperview().offset(-35)
            make.bottom.equalTo(secondStackView.snp.top).offset(-100)
            make.height.equalTo(56)
        }

        secondStackView.snp.makeConstraints { make in
            make.top.equalTo(enterButton.snp.bottom).offset(100)
            make.bottom.equalToSuperview().offset(-89)
            make.centerX.equalTo(enterButton.snp.centerX)
        }
    }

    // MARK: - Actions
    @objc func enterButtonTapped() {

    }

    @objc func registerNowButtonTapped() {
        let controller = RegistrationViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

