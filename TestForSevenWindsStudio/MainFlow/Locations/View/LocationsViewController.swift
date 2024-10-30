import UIKit

final class LocationsViewController: UIViewController {
    
    private let locationsView = LocationsViewImpl()
    
    let model: LocationsWithSectionModel = LocationsWithSectionModel(
        section: .mane,
        locations: [
            LocationCellModel(title: "123"),
            LocationCellModel(title: "1234"),
            LocationCellModel(title: "12345"),
            LocationCellModel(title: "1231234"),
            LocationCellModel(title: "12341234"),
            LocationCellModel(title: "123451234"),
            LocationCellModel(title: "1231231234"),
            LocationCellModel(title: "12341231234"),
            LocationCellModel(title: "123451231234"),
            LocationCellModel(title: "1231231234123451231234"),
            LocationCellModel(title: "1234123451231234"),
            LocationCellModel(title: "12345123451231234")
        ]
    )
    
    override func loadView() {
        super.loadView()
        view = locationsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationsView.updateUI(model)
    }
}
