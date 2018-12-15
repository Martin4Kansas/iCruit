import UIKit

class MainMenuQuestion: UITableViewCell {
  var questionNumber = 1
  @IBOutlet weak var questionLabel : UILabel!
  @IBOutlet weak var questionTextbox : UITextField!
  @IBAction func didChangeAnswer(_ sender: Any) {
    let defaults = UserDefaults.standard
    var answers = defaults.array(forKey: "Answers")
    answers![questionNumber - 1] = questionTextbox.text!
    defaults.set(answers, forKey:"Answers")
  }
  func configureForMainMenuQuestion(_ mainMenuOption: MainMenuOption) {
    questionTextbox?.layer.borderWidth = 4.0
    questionNumber = mainMenuOption.getQuestionNumber()
    questionLabel?.text = mainMenuOption.title
    questionTextbox?.text = ""
    questionLabel?.font = UIFont(name: "Helvetica-Bold", size: 26.0)
    questionTextbox?.font = UIFont(name: "Helvetica-Bold", size: 24.0)
    let colorString = UserDefaults.standard.string(forKey: "Color")
    switch colorString {
    case "Black":
      questionLabel?.textColor = UIColor.black
      self.backgroundColor = UIColor.white
    case "Blue":
      questionLabel?.textColor = UIColor.blue
      self.backgroundColor = UIColor.white
    case "Brown":
      questionLabel?.textColor = UIColor.brown
      self.backgroundColor = UIColor.white
    case "Cyan":
      questionLabel?.textColor = UIColor.cyan
      self.backgroundColor = UIColor.black
    case "Dark Gray":
      questionLabel?.textColor = UIColor.darkGray
      self.backgroundColor = UIColor.white
    case "Gray":
      questionLabel?.textColor = UIColor.gray
      self.backgroundColor = UIColor.white
    case "Green":
      questionLabel?.textColor = UIColor.green
      self.backgroundColor = UIColor.black
    case "Light Gray":
      questionLabel?.textColor = UIColor.lightGray
      self.backgroundColor = UIColor.black
    case "Magenta":
      questionLabel?.textColor = UIColor.magenta
      self.backgroundColor = UIColor.black
    case "Orange":
      questionLabel?.textColor = UIColor.orange
      self.backgroundColor = UIColor.black
    case "Purple":
      questionLabel?.textColor = UIColor.purple
      self.backgroundColor = UIColor.white
    case "Red":
      questionLabel?.textColor = UIColor.red
      self.backgroundColor = UIColor.black
    case "Yellow":
      questionLabel?.textColor = UIColor.yellow
      self.backgroundColor = UIColor.black
    default:
      questionLabel?.textColor = UIColor.black
      self.backgroundColor = UIColor.white
    }
  }
  
}
