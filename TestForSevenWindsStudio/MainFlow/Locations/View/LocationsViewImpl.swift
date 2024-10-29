import SnapKit

final class LocationsViewImpl: UIView {
    
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
private extension LocationsViewImpl {
    func setupUI() {
        backgroundColor = .gray
    }
}
