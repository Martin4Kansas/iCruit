import UIKit

class MainMenuOptionCell: UITableViewCell {
  
  @IBOutlet weak var mainMenuOptionLabel: UILabel!
  
  func configureForMainMenuOption(_ mainMenuOption: MainMenuOption) {
    mainMenuOptionLabel.text = mainMenuOption.title
    mainMenuOptionLabel.font = UIFont(name: "Helvetica-Bold", size: 26.0)
    mainMenuOptionLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
    mainMenuOptionLabel.numberOfLines = 0
    if (mainMenuOption.type == "ColorSelection") {
      switch mainMenuOption.title {
      case "Black":
        mainMenuOptionLabel.textColor = UIColor.black
        self.backgroundColor = UIColor.white
      case "Blue":
        mainMenuOptionLabel.textColor = UIColor.blue
        self.backgroundColor = UIColor.white
      case "Brown":
        mainMenuOptionLabel.textColor = UIColor.brown
        self.backgroundColor = UIColor.white
      case "Cyan":
        mainMenuOptionLabel.textColor = UIColor.cyan
        self.backgroundColor = UIColor.black
      case "Dark Gray":
        mainMenuOptionLabel.textColor = UIColor.darkGray
        self.backgroundColor = UIColor.white
      case "Gray":
        mainMenuOptionLabel.textColor = UIColor.gray
        self.backgroundColor = UIColor.white
      case "Green":
        mainMenuOptionLabel.textColor = UIColor.green
        self.backgroundColor = UIColor.black
      case "Light Gray":
        mainMenuOptionLabel.textColor = UIColor.lightGray
        self.backgroundColor = UIColor.black
      case "Magenta":
        mainMenuOptionLabel.textColor = UIColor.magenta
        self.backgroundColor = UIColor.black
      case "Orange":
        mainMenuOptionLabel.textColor = UIColor.orange
        self.backgroundColor = UIColor.black
      case "Purple":
        mainMenuOptionLabel.textColor = UIColor.purple
        self.backgroundColor = UIColor.white
      case "Red":
        mainMenuOptionLabel.textColor = UIColor.red
        self.backgroundColor = UIColor.black
      case "Yellow":
        mainMenuOptionLabel.textColor = UIColor.yellow
        self.backgroundColor = UIColor.black
      default:
        mainMenuOptionLabel.textColor = UIColor.black
        self.backgroundColor = UIColor.white
      }
    }
    else if (mainMenuOption.type == "ColorSubmission") {
      let colorString = UserDefaults.standard.string(forKey: "Color")
      switch colorString {
      case "Black":
        mainMenuOptionLabel.textColor = UIColor.black
        self.backgroundColor = UIColor.white
      case "Blue":
        mainMenuOptionLabel.textColor = UIColor.black
        self.backgroundColor = UIColor.white
      case "Brown":
        mainMenuOptionLabel.textColor = UIColor.black
        self.backgroundColor = UIColor.white
      case "Cyan":
        mainMenuOptionLabel.textColor = UIColor.white
        self.backgroundColor = UIColor.black
      case "Dark Gray":
        mainMenuOptionLabel.textColor = UIColor.black
        self.backgroundColor = UIColor.white
      case "Gray":
        mainMenuOptionLabel.textColor = UIColor.black
        self.backgroundColor = UIColor.white
      case "Green":
        mainMenuOptionLabel.textColor = UIColor.white
        self.backgroundColor = UIColor.black
      case "Light Gray":
        mainMenuOptionLabel.textColor = UIColor.white
        self.backgroundColor = UIColor.black
      case "Magenta":
        mainMenuOptionLabel.textColor = UIColor.white
        self.backgroundColor = UIColor.black
      case "Orange":
        mainMenuOptionLabel.textColor = UIColor.white
        self.backgroundColor = UIColor.black
      case "Purple":
        mainMenuOptionLabel.textColor = UIColor.black
        self.backgroundColor = UIColor.white
      case "Red":
        mainMenuOptionLabel.textColor = UIColor.white
        self.backgroundColor = UIColor.black
      case "Yellow":
        mainMenuOptionLabel.textColor = UIColor.white
        self.backgroundColor = UIColor.black
      default:
        mainMenuOptionLabel.textColor = UIColor.black
        self.backgroundColor = UIColor.white
      }
      mainMenuOptionLabel.font = UIFont(name: "Helvetica-Bold", size: 30.0)
    }
    else {
      let colorString = UserDefaults.standard.string(forKey: "Color")
      switch colorString {
      case "Black":
        mainMenuOptionLabel.textColor = UIColor.black
        self.backgroundColor = UIColor.white
      case "Blue":
        mainMenuOptionLabel.textColor = UIColor.blue
        self.backgroundColor = UIColor.white
      case "Brown":
        mainMenuOptionLabel.textColor = UIColor.brown
        self.backgroundColor = UIColor.white
      case "Cyan":
        mainMenuOptionLabel.textColor = UIColor.cyan
        self.backgroundColor = UIColor.black
      case "Dark Gray":
        mainMenuOptionLabel.textColor = UIColor.darkGray
        self.backgroundColor = UIColor.white
      case "Gray":
        mainMenuOptionLabel.textColor = UIColor.gray
        self.backgroundColor = UIColor.white
      case "Green":
        mainMenuOptionLabel.textColor = UIColor.green
        self.backgroundColor = UIColor.black
      case "Light Gray":
        mainMenuOptionLabel.textColor = UIColor.lightGray
        self.backgroundColor = UIColor.black
      case "Magenta":
        mainMenuOptionLabel.textColor = UIColor.magenta
        self.backgroundColor = UIColor.black
      case "Orange":
        mainMenuOptionLabel.textColor = UIColor.orange
        self.backgroundColor = UIColor.black
      case "Purple":
        mainMenuOptionLabel.textColor = UIColor.purple
        self.backgroundColor = UIColor.white
      case "Red":
        mainMenuOptionLabel.textColor = UIColor.red
        self.backgroundColor = UIColor.black
      case "Yellow":
        mainMenuOptionLabel.textColor = UIColor.yellow
        self.backgroundColor = UIColor.black
      default:
        mainMenuOptionLabel.textColor = UIColor.black
        self.backgroundColor = UIColor.white
      }
    }
  }
  
}
