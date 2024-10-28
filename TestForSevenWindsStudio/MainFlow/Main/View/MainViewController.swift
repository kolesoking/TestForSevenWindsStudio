import UIKit

class MainViewController: UIViewController {
    
    private let mainView = MainViewImpl()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
    }
}

// MARK: - Private extension -
private extension MainViewController {
    func setupActions() {
        mainView.setButtonAction {
            print("VOT TUT ZAEBOK")
        }
    }
}

