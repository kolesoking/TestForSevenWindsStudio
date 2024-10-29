import UIKit

class MainViewController: UIViewController {
    
    private let mainView = MainViewImpl()
    
    private var stateView: StateView = .login
    
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
        mainView.setLoginTextFieldsAction { [weak self] email, password in
            print(email, password)
        }
        
        mainView.setRegistrationTextFieldsAction { [weak self] email, password, repeatPassword in
            print(email, password, repeatPassword)
        }
    }
}

