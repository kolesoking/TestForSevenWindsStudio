import SnapKit

final class MainViewImpl: UIView {
    
    private let containerView = UIView()
    private let textField = TextFieldWithTitle()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }
}

// MARK: - Private extension -
private extension MainViewImpl {
    func setupUI() {
        setupContainerView()
        setupTextField()
    }
    
    func setupContainerView() {
        containerView.backgroundColor = .white
        
        addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setupTextField() {
        textField.configure(title: "HELLLOOOO EBAT`", placeholder: "Nu I SHO", type: .login)
        
        containerView.addSubview(textField)
        textField.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.left.right.equalToSuperview().inset(20)
        }
    }
}
