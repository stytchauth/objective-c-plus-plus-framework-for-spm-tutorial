import UIKit
import StytchFoo

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let stytchFoo = StytchFoo()
        print(stytchFoo.getString())
        print(stytchFoo.processString("Swift String!"))
    }
}

