import SnapKit

enum TextFieldType {
    case login
    case password
}

final class MainTextField: UITextField {
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    private(set) var textFieldType: TextFieldType = .login
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.textRect(forBounds: bounds)
        rect.origin.x += 19
        rect.size.width -= (19*3)
        return rect
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
}

// MARK: - Public Methods -
extension MainTextField {
    func configure(with placeholder: String, type: TextFieldType) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [
                .foregroundColor: Constants.placeholderTextColor
            ]
        )
        
        switch type {
        case .login:
            leftView = .none
        case .password:
            isSecureTextEntry = true
        }
        
        textFieldType = type
    }
}

// MARK: - Private extension -
private extension MainTextField {
    func setupUI() {
        autocorrectionType = .no
        
        layer.borderColor = Constants.mainColor.cgColor
        layer.borderWidth = 2
        layer.cornerRadius = 24.5
        
        snp.makeConstraints {
            $0.height.equalTo(47)
        }
        
        
    }
}
