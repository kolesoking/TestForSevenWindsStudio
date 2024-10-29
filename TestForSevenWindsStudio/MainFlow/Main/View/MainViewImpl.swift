import SnapKit

enum StateView {
    case registration
    case login
}

final class MainViewImpl: UIView {
    
    private let stackView = UIStackView()
    
    private let containerView = UIView()
    private let emailTextField = TextFieldWithTitle()
    private let passwordTextField = TextFieldWithTitle()
    private let repeatPasswordTextField = TextFieldWithTitle()
    private let mainButton = MainButton()
    private let questionLabel = UILabel()
    
    private var stateView: StateView = .login
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setTitleForQuestionLabel()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }
    
    func show() {
        changeStateWithAnimation()
    }
}

// MARK: - Actions -
extension MainViewImpl {
    func setButtonAction(_ action: @escaping (() -> Void)) {
        mainButton.setAction(action)
    }
}

// MARK: - Private extension -
private extension MainViewImpl {
    func setupUI() {
        setupContainerView()
        setupStackView()
        
        setupTextField()
        setupPasswordTextField()
        setupMainButton()
        setupQuestionLabel()
    }
    
    func setupContainerView() {
        containerView.backgroundColor = .white
        
        addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 24
        
        containerView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide).offset(190)
            $0.left.right.equalToSuperview().inset(20)
        }
    }
    
    func setupTextField() {
        emailTextField.configure(title: "email", placeholder: "example@example.com", type: .login)

        stackView.addArrangedSubview(emailTextField)
        emailTextField.snp.makeConstraints {
            $0.left.right.equalToSuperview()
        }
    }
    
    func setupPasswordTextField() {
        passwordTextField.configure(title: "Пароль", placeholder: "******", type: .password)
        
        stackView.addArrangedSubview(passwordTextField)
        passwordTextField.snp.makeConstraints {
            $0.left.right.equalToSuperview()
        }
    }
    
    func setupRepeatPasswordTextField() {
        repeatPasswordTextField.configure(title: "Повторите пароль", placeholder: "******", type: .password)
        
        stackView.addArrangedSubview(repeatPasswordTextField)
        repeatPasswordTextField.snp.makeConstraints {
            $0.left.right.equalToSuperview()
        }
    }
    
    func setupMainButton() {
        mainButton.configure(with: "HELLO NAHUY", type: .registration)
        
        containerView.addSubview(mainButton)
        mainButton.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(30)
            $0.left.right.equalToSuperview().inset(20)
        }
    }
    
    func setupQuestionLabel() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapQuestionLabel))
        questionLabel.addGestureRecognizer(tap)
        questionLabel.isUserInteractionEnabled = true
        
        containerView.addSubview(questionLabel)
        questionLabel.snp.makeConstraints {
            $0.centerX.equalTo(mainButton)
            $0.top.equalTo(mainButton.snp.bottom).offset(24)
        }
    }
    
    func setTitleForQuestionLabel() {
        
        var text = "asdasdasdasd"
        
        switch stateView {
        case .registration:
            text = "Уже есть аккаунт"
        case .login:
            text = "Заригистрироваться?"
        }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineHeightMultiple = 0.79
        paragraphStyle.minimumLineHeight = 20
        paragraphStyle.maximumLineHeight = 20
        
        let attributes = NSAttributedString(
            string: text,
            attributes: [
                .font: UIFont.systemFont(ofSize: 17, weight: .regular),
                .paragraphStyle: paragraphStyle,
                .foregroundColor: Constants.mainColor.cgColor
            ]
        )
        
        questionLabel.attributedText = attributes
    }
    
    func changeStateWithAnimation() {
        
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self else { return }
            switch self.stateView {
            case .login:
                self.setupRepeatPasswordTextField()
                self.stateView = .registration
            case .registration:
                self.repeatPasswordTextField.removeFromSuperview()
                self.stateView = .login
            }
            self.setTitleForQuestionLabel()
            self.layoutIfNeeded()
        }
    }
    
    @objc func tapQuestionLabel() {
        changeStateWithAnimation()
    }
}
