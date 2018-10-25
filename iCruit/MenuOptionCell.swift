import UIKit

class MenuOptionCell: UITableViewCell {
  
  @IBOutlet weak var menuOptionLabel: UILabel!
  
  func configureForMenuOption(_ menuOption: MenuOption) {
    menuOptionLabel.text = menuOption.title
  }
}
