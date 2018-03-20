//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import UIFramework

class MyViewController : UIViewController {
    override func loadView() {
        let screen = BeerCatalogScreen(delegate: self)
        self.view = screen.view
    }
}

extension MyViewController: BeerCatalogScreenDelegate {
    func didClickMe() {}
    func didSelectItem(at index: Int) {}
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
