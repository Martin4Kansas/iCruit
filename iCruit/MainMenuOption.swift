import UIKit

struct MainMenuOption {
  let title: String
  let type: String
  var questionNumber: Int?
  
  init(title: String, type: String) {
    self.title = title
    self.type = type
  }
  init(title: String, type: String, questionNumber: Int) {
    self.title = title
    self.type = type
    self.questionNumber = questionNumber
  }
  
  func getQuestionNumber() -> Int {
    if (questionNumber != nil) {
      return questionNumber!
    }
    else {
      return 0
    }
  }
  
  static func editColorOptions() -> [MainMenuOption] {
    return [
      MainMenuOption(title: "Black", type: "ColorSelection"),
      MainMenuOption(title: "Blue", type: "ColorSelection"),
      MainMenuOption(title: "Brown", type: "ColorSelection"),
      MainMenuOption(title: "Cyan", type: "ColorSelection"),
      MainMenuOption(title: "Dark Gray", type: "ColorSelection"),
      MainMenuOption(title: "Gray", type: "ColorSelection"),
      MainMenuOption(title: "Green", type: "ColorSelection"),
      MainMenuOption(title: "Light Gray", type: "ColorSelection"),
      MainMenuOption(title: "Magenta", type: "ColorSelection"),
      MainMenuOption(title: "Orange", type: "ColorSelection"),
      MainMenuOption(title: "Purple", type: "ColorSelection"),
      MainMenuOption(title: "Red", type: "ColorSelection"),
      MainMenuOption(title: "Yellow", type: "ColorSelection"),
      MainMenuOption(title: "Submit", type: "ColorSubmission")
    ]
  }
  static func editCompanyOptions() -> [MainMenuOption] {
    return [
      MainMenuOption(title: "Company Name:", type: "Label"),
      MainMenuOption(title: "", type: "CompanyTextbox"),
      MainMenuOption(title: "Submit", type: "CompanySubmission")
    ]
  }
  static func presentQuestionOptions() -> [MainMenuOption] {
    var MainMenuQuestions = [MainMenuOption]()
    let questions = UserDefaults.standard.array(forKey: "Questions")
    var i = 0
    for question in questions! {
      i = i + 1
      if ((question as! String) != "") {
        MainMenuQuestions.append(MainMenuOption(title: question as! String, type: "Question", questionNumber: i))
      }
    }
    MainMenuQuestions.append(MainMenuOption(title: "  Submit", type: "QuestionSubmission"))
    return MainMenuQuestions
  }
  static func editQuestionOptions() -> [MainMenuOption] {
    var MainMenuQuestions = [MainMenuOption]()
    let questions = UserDefaults.standard.array(forKey: "Questions")
    var i = 0
    for question in questions! {
      i = i + 1
      if ((question as! String) != "") {
        MainMenuQuestions.append(MainMenuOption(title: question as! String, type: "EditQuestion", questionNumber: i))
      }
    }
    MainMenuQuestions.append(MainMenuOption(title: "  Add", type: "AddQuestion"))
    MainMenuQuestions.append(MainMenuOption(title: "  Remove", type: "RemoveQuestion"))
    MainMenuQuestions.append(MainMenuOption(title: "  Submit", type: "EditQuestionSubmission"))
    return MainMenuQuestions
  }
}
