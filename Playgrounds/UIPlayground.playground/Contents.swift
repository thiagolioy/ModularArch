//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import UIFramework

class MyViewController : UIViewController {
    override func loadView() {
        let screen = BeerCatalogScreen()
        self.view = screen.view
    }
}



// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
