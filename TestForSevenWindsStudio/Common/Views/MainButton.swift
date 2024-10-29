import SnapKit

final class MainButton: UIView {
    
    private let mainButton = UIButton()
    
    private var actionButton: (() -> Void)?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }
    
    func configure(with text: String) {
        setButtonTitle(with: text)
    }
}

// MARK: - Actions -
extension MainButton {
    func setAction(_ action: @escaping (() -> Void)) {
        self.actionButton = action
    }
}

// MARK: - Private extension -
private extension MainButton {
    func setupUI() {
        setupButton()
    }
    
    func setupButton() {
        mainButton.layer.cornerRadius = 24
        mainButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
        mainButton.backgroundColor = Constants.buttonColor
        
        addSubview(mainButton)
        mainButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(48)
        }
    }
    
    @objc func tap() {
        actionButton?()
        print("Hello")
    }
    
    func setButtonTitle(with text: String) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineHeightMultiple = 0.79
        paragraphStyle.minimumLineHeight = 21
        paragraphStyle.maximumLineHeight = 21
        
        let attributes = NSAttributedString(
            string: text,
            attributes: [
                .font: UIFont.systemFont(ofSize: 18, weight: .bold),
                .paragraphStyle: paragraphStyle,
                .foregroundColor: Constants.buttonTextColor
            ]
        )

        mainButton.setAttributedTitle(attributes, for: .normal)
    }
}
