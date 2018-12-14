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
    mainTextbox?.text = mainMenuOption.title
    mainTextbox?.font = UIFont(name: "Helvetica-Bold", size: 26.0)
    questionNumber = mainMenuOption.getQuestionNumber()
    if (mainMenuOption.type == "CompanyTextbox") {
      questionNumber = -1
    }
  }
}
