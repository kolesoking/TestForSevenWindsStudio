import UIKit

final class LocationsViewController: UIViewController {
    
    private let locationsView = LocationsViewImpl()
    
    override func loadView() {
        super.loadView()
        view = locationsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
