//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import UIFramework

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let frame = CGRect(x: 50, y: 400, width: 200, height: 60)
        let button = RedButton(frame: frame)
        
        view.addSubview(button)
        self.view = view
    }
}
// Present the view controller in the Live View window

let controller = MyViewController()
PlaygroundPage.current.liveView = playgroundWrapper(child: controller)
