import UIKit

struct MenuOption {
  static var leftBuffer = "  ";
  static var rightBuffer = "             ";
  let titleString: String
  let title: String
  init(title: String, titleString: String) {
    self.title = title
    self.titleString = titleString
  }
  static func leftMenuOptions() -> [MenuOption] {
    return [
      MenuOption(title: leftBuffer + "Present", titleString: "Present"),
      MenuOption(title: leftBuffer + "Edit Questions", titleString: "Questions"),
      MenuOption(title: leftBuffer + "Edit Color", titleString: "Color"),
      MenuOption(title: leftBuffer + "Edit Company Name", titleString: "Company"),
      MenuOption(title: leftBuffer + "View Responses", titleString: "Responses"),
      MenuOption(title: leftBuffer + "Export Data", titleString: "Export"),
      MenuOption(title: leftBuffer + "Tutorial", titleString: "Tutorial")
    ]
  }
  static func rightMenuOptions() -> [MenuOption] {
    return [
      MenuOption(title: rightBuffer + "Lock/Unlock", titleString: "Lock"),
      MenuOption(title: rightBuffer + "Reset App", titleString: "Reset")
    ]
  }
}
