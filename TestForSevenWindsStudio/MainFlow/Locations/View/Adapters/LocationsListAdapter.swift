import UIKit

final class LocationsListAdapter {
    typealias LocationsListDataSourse = UICollectionViewDiffableDataSource<Section, LocationCellModel>
    
    private let collectionView: UICollectionView
    private var dataSourse: LocationsListDataSourse?
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.dataSourse = createDataSourse()
    }
    
    func updateUI(_ model: LocationsWithSectionModel) {
        guard var snapshot = dataSourse?.snapshot() else { return }
        snapshot.deleteAllItems()
        snapshot.appendSections([model.section])
        snapshot.appendItems(model.locations)
        dataSourse?.apply(snapshot, animatingDifferences: false)
    }
}

// MARK: - Private extension -
private extension LocationsListAdapter {
    func createDataSourse() -> LocationsListDataSourse {
        let dataSourse = LocationsListDataSourse(
            collectionView: collectionView) { collectionView, indexPath, locationCellModel in
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(LocationCell.self)", for: indexPath) as? LocationCell else {
                    print("error cell")
                    return UICollectionViewCell()
                }
                cell.updateUI(locationCellModel)
                return cell
            }
        return dataSourse
    }
}

extension LocationsListAdapter {
    enum Section: Int, Hashable {
        case mane
        
    }
}
