import UIKit
import PlaygroundSupport

class ViewController : UIViewController {
    override func viewDidLoad() {
        
    }
}

let viewController = ViewController()
viewController.view.frame = CGRect(x: 0, y: 0, width: 300, height: 600)
PlaygroundPage.current.liveView = viewController
PlaygroundPage.current.needsIndefiniteExecution = true
