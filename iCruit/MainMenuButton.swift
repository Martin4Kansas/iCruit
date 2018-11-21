import UIKit

class MainMenuButton: UITableViewCell {
  
  @IBOutlet weak var mainButton: UIButton!
  @IBAction func mainButtonPressed(_ sender: Any) {
    UserDefaults.standard.set(UserDefaults.standard.string(forKey: "SelectedColor"), forKey: "Color")
    self.tableView?.reloadData()
    self.tableView?.superview?.reloadInputViews()
  }
  
  func configureForMainMenuButton(_ mainMenuOption: MainMenuOption) {
    mainButton.setTitle(mainMenuOption.title, for: .normal)
  }
}

extension UITableViewCell {
  var tableView: UITableView? {
    var view = self.superview
    while (view != nil && view!.isKind(of: UITableView.self) == false) {
      view = view!.superview
    }
    return view as? UITableView
  }
}
