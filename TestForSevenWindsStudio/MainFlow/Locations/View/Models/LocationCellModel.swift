import Foundation

struct LocationsWithSectionModel {
    let section: LocationsListAdapter.Section
    let locations: [LocationCellModel]
}

struct LocationCellModel: Hashable {
    let title: String
}
