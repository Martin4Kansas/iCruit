import UIKit

class MainMenuButton: UITableViewCell {
  
  @IBOutlet weak var mainButton: UIButton!
  
  func configureForMainMenuButton(_ mainMenuOption: MainMenuOption) {
    mainButton.setTitle(mainMenuOption.title, for: .normal)
  }
}
