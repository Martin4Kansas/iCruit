import UIKit

struct MainMenuOption {
  let title: String
  let type: String
  init(title: String, type: String) {
    self.title = title
    self.type = type
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
      MainMenuOption(title: "", type: "Textbox"),
      MainMenuOption(title: "Submit", type: "TextboxSubmission")
    ]
  }
}
