//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import BeerCatalog

let navigation = UINavigationController()
navigation.navigationBar.prefersLargeTitles = true
let coordinator = BeerCatalogCoordinator(presenter: navigation)

coordinator.start()

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = navigation
