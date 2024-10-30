import SnapKit

final class LocationsViewImpl: UIView {
    
    private let collectionViewFlowLayout = UICollectionViewFlowLayout()
    private let dataSource: LocationsListAdapter
    private let collectionView: UICollectionView
    
    override public init(frame: CGRect) {
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        self.dataSource = LocationsListAdapter(collectionView: collectionView)
        
        super.init(frame: frame)
        setupUI()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }

    func updateUI(_ model: LocationsWithSectionModel) {
        dataSource.updateUI(model)
    }
}

// MARK: - Private extension -
private extension LocationsViewImpl {
    func setupUI() {
        backgroundColor = .gray
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(LocationCell.self, forCellWithReuseIdentifier: "\(LocationCell.self)")
        collectionViewFlowLayout.minimumLineSpacing = 4
        collectionViewFlowLayout.scrollDirection = .vertical
        
        let screenWidth = UIScreen.main.bounds.width
        collectionViewFlowLayout.itemSize = CGSize(width: screenWidth - 40, height: 96)
        
        addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension LocationsViewImpl: UICollectionViewDelegate {
    
}
