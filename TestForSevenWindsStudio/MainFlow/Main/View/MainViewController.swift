import UIKit

class MainViewController: UIViewController {
    
    private let mainView = MainViewImpl()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO
    }


}

