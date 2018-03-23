//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import BeerCatalog


class Mock: BeerCatalogCoordinatorDelegate {
    func proceedToNext() {}
}

let navigation = UINavigationController()
navigation.navigationBar.prefersLargeTitles = true
let coordinator = BeerCatalogCoordinator(presenter: navigation, delegate:Mock())

coordinator.start()

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = navigation
