import SnapKit

final class LocationCell: UICollectionViewCell {
    
    private let containerView = UIView()
    private let title = UILabel()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }
    
    func updateUI(_ model: LocationCellModel) {
        title.text = model.title
    }
}

// MARK: - Private extension -
private extension LocationCell {
    func setupUI() {
        setupContainerView()
    }
    
    func setupContainerView() {
        containerView.backgroundColor = .systemPink
        
        addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(96)
        }
    }
    
    func setupTitle() {
        containerView.addSubview(title)
        title.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
