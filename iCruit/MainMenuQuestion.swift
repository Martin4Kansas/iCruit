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
    questionNumber = mainMenuOption.getQuestionNumber()
    questionLabel?.text = mainMenuOption.title
    questionTextbox?.text = ""
    questionLabel?.font = UIFont(name: "Helvetica-Bold", size: 26.0)
    questionTextbox?.font = UIFont(name: "Helvetica-Bold", size: 24.0)
    let colorString = UserDefaults.standard.string(forKey: "Color")
    switch colorString {
    case "Black":
      questionLabel.textColor = UIColor.black
    case "Blue":
      questionLabel.textColor = UIColor.blue
    case "Brown":
      questionLabel.textColor = UIColor.brown
    case "Cyan":
      questionLabel.textColor = UIColor.cyan
    case "Dark Gray":
      questionLabel.textColor = UIColor.darkGray
    case "Gray":
      questionLabel.textColor = UIColor.gray
    case "Green":
      questionLabel.textColor = UIColor.green
    case "Light Grey":
      questionLabel.textColor = UIColor.lightGray
    case "Magenta":
      questionLabel.textColor = UIColor.magenta
    case "Orange":
      questionLabel.textColor = UIColor.orange
    case "Purple":
      questionLabel.textColor = UIColor.purple
    case "Red":
      questionLabel.textColor = UIColor.red
    case "Yellow":
      questionLabel.textColor = UIColor.yellow
    default:
      questionLabel.textColor = UIColor.black
    }
  }
  
}
