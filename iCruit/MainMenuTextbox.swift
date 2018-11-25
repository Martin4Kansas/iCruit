import UIKit

class MainMenuTextbox: UITableViewCell {
  
  @IBOutlet weak var mainTextbox: UITextField?
  
  @IBAction func didChangeCompanyName(_ sender: Any) {
    let defaults = UserDefaults.standard
    defaults.set(mainTextbox?.text, forKey: "SelectedName")
  }
  
  
  func configureForMainMenuTextbox(_ mainMenuOption: MainMenuOption) {
    mainTextbox?.text = mainMenuOption.title
    mainTextbox?.font = UIFont(name: "Helvetica-Bold", size: 26.0)
  }
}
