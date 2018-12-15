import UIKit

class MainMenuTextbox: UITableViewCell {
  
  @IBOutlet weak var mainTextbox: UITextField?
  
  var questionNumber : Int = 0
  
  @IBAction func didChangeCompanyName(_ sender: Any) {
    if (questionNumber == -1) {
      let defaults = UserDefaults.standard
      defaults.set(mainTextbox?.text, forKey: "SelectedName")
    }
    else {
      let defaults = UserDefaults.standard
      var questionArray = defaults.array(forKey: "SelectedQuestions")
      questionArray![questionNumber - 1] = mainTextbox?.text
      defaults.set(questionArray, forKey: "SelectedQuestions")
    }
  }
  
  
  func configureForMainMenuTextbox(_ mainMenuOption: MainMenuOption) {
    mainTextbox?.layer.borderWidth = 4.0
    mainTextbox?.text = mainMenuOption.title
    mainTextbox?.font = UIFont(name: "Helvetica-Bold", size: 26.0)
    questionNumber = mainMenuOption.getQuestionNumber()
    if (mainMenuOption.type == "CompanyTextbox") {
      questionNumber = -1
    }
    let colorString = UserDefaults.standard.string(forKey: "Color")
    switch colorString {
    case "Black":
      self.backgroundColor = UIColor.white
    case "Blue":
      self.backgroundColor = UIColor.white
    case "Brown":
      self.backgroundColor = UIColor.white
    case "Cyan":
      self.backgroundColor = UIColor.black
    case "Dark Gray":
      self.backgroundColor = UIColor.white
    case "Gray":
      self.backgroundColor = UIColor.white
    case "Green":
      self.backgroundColor = UIColor.black
    case "Light Gray":
      self.backgroundColor = UIColor.black
    case "Magenta":
      self.backgroundColor = UIColor.black
    case "Orange":
      self.backgroundColor = UIColor.black
    case "Purple":
      self.backgroundColor = UIColor.white
    case "Red":
      self.backgroundColor = UIColor.black
    case "Yellow":
      self.backgroundColor = UIColor.black
    default:
      self.backgroundColor = UIColor.white
    }
  }
}
