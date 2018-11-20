import UIKit

class MainMenuOptionCell: UITableViewCell {
  
  @IBOutlet weak var mainMenuOptionLabel: UILabel!
  
  func configureForMainMenuOption(_ mainMenuOption: MainMenuOption) {
    mainMenuOptionLabel.text = mainMenuOption.title
    mainMenuOptionLabel.font = UIFont(name: "Helvetica-Bold", size: 26.0)
    if (mainMenuOption.type == "ColorSelection") {
      switch mainMenuOption.title {
      case "Black":
        mainMenuOptionLabel.textColor = UIColor.black
      case "Blue":
        mainMenuOptionLabel.textColor = UIColor.blue
      case "Brown":
        mainMenuOptionLabel.textColor = UIColor.brown
      case "Cyan":
        mainMenuOptionLabel.textColor = UIColor.cyan
      case "Dark Gray":
        mainMenuOptionLabel.textColor = UIColor.darkGray
      case "Gray":
        mainMenuOptionLabel.textColor = UIColor.gray
      case "Green":
        mainMenuOptionLabel.textColor = UIColor.green
      case "Light Grey":
        mainMenuOptionLabel.textColor = UIColor.lightGray
      case "Magenta":
        mainMenuOptionLabel.textColor = UIColor.magenta
      case "Orange":
        mainMenuOptionLabel.textColor = UIColor.orange
      case "Purple":
        mainMenuOptionLabel.textColor = UIColor.purple
      case "Red":
        mainMenuOptionLabel.textColor = UIColor.red
      case "Yellow":
        mainMenuOptionLabel.textColor = UIColor.yellow
      default:
        mainMenuOptionLabel.textColor = UIColor.black
      }
    }
  }
}
