import UIKit

struct MenuOption {
  
  static var leftBuffer = "  ";
  static var rightBuffer = "                   ";
  
  let title: String
  
  init(title: String) {
    self.title = title
  }
  
  static func leftMenuOptions() -> [MenuOption] {
    return [
      MenuOption(title: leftBuffer + "Present"),
      MenuOption(title: leftBuffer + "Edit Questions"),
      MenuOption(title: leftBuffer + "Edit Color"),
      MenuOption(title: leftBuffer + "View Responses"),
      MenuOption(title: leftBuffer + "Export Data")
    ]
  }
  
  static func rightMenuOptions() -> [MenuOption] {
    return [
      MenuOption(title: rightBuffer + "Lock/Unlock"),
      MenuOption(title: rightBuffer + "Reset App")
    ]
  }
}
