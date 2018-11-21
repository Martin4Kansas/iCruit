import UIKit

class MainMenuTextbox: UITableViewCell {
  
  @IBOutlet weak var mainTextbox: UITextField?
  
  func configureForMainMenuTextbox(_ mainMenuOption: MainMenuOption) {
    mainTextbox?.text = mainMenuOption.title
    mainTextbox?.font = UIFont(name: "Helvetica-Bold", size: 26.0)
  }
}
