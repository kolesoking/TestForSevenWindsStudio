import SnapKit

final class TextFieldWithTitle: UIView {
    
    private let titleLabel = UILabel()
    private let textField = MainTextField()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }
    
    func configure(
        title: String,
        placeholder: String,
        type: TextFieldType
    ) {
        setTextForTitle(with: title)
        textField.configure(with: placeholder, type: type)
    }
}

// MARK: - Private extension -
private extension TextFieldWithTitle {
    func setupUI() {
        setupTitle()
        setupTextField()
    }
    
    func setupTitle() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.left.equalToSuperview()
            $0.height.equalTo(18)
        }
    }
    
    func setupTextField() {
        addSubview(textField)
        textField.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
    }
    
    func setTextForTitle(with text: String) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineHeightMultiple = 0.79
        paragraphStyle.minimumLineHeight = 18
        paragraphStyle.maximumLineHeight = 18
        
        let attributes = NSAttributedString(
            string: text,
            attributes: [
                .font: UIFont.systemFont(ofSize: 15, weight: .regular),
                .paragraphStyle: paragraphStyle,
                .foregroundColor: Constants.mainColor.cgColor
            ]
        )
        
        titleLabel.attributedText = attributes
    }
}
