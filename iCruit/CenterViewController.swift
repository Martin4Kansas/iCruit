import UIKit

class CenterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  @IBOutlet weak var editButton: UIBarButtonItem!
  @IBOutlet weak var adminButton: UIBarButtonItem!
  @IBOutlet weak var topBar: UINavigationItem!
  @IBOutlet weak var mainMenu: UITableView!
  var delegate: CenterViewControllerDelegate?
  enum CellIdentifiers {
    static let MainMenuOptionCell = "MainMenuOptionCell"
    static let MainMenuButtonCell = "MainMenuButtonCell"
  }
  override func viewDidLoad() {
      super.viewDidLoad()
      editButton.setTitleTextAttributes([
      NSAttributedStringKey.font: UIFont(name: "Helvetica-Bold", size: 26.0)!,
      NSAttributedStringKey.foregroundColor: UIColor.black],
                                      for: .normal)
      adminButton.setTitleTextAttributes([
      NSAttributedStringKey.font: UIFont(name: "Helvetica-Bold", size: 26.0)!,
      NSAttributedStringKey.foregroundColor: UIColor.black],
                                      for: .normal)
      let titleLabel = UILabel(frame: CGRect(x: 10, y: 50, width: 230, height: 21))
      titleLabel.textAlignment = .center //For center alignment
      titleLabel.text = mainViewVariables.title
      titleLabel.textColor = .black
      titleLabel.font = UIFont(name: "Helvetica-Bold", size: 30.0)
      topBar.titleView = titleLabel
      mainMenu.dataSource = self
      mainMenu.delegate = self
      self.view.addSubview(mainMenu)
  }
  
  // MARK: Button actions
  @IBAction func editTapped(_ sender: Any) {
    delegate?.toggleLeftPanel?()
  }
  @IBAction func adminTapped(_ sender: Any) {
    delegate?.toggleRightPanel?()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return mainViewVariables.mainMenuOptions.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if (mainViewVariables.mainMenuOptions[indexPath.row].type == "WelcomeMessage") {
      let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainMenuOptionCell, for: indexPath) as! MainMenuOptionCell
      cell.configureForMainMenuOption(mainViewVariables.mainMenuOptions[indexPath.row])
      return cell
    }
    else if (mainViewVariables.mainMenuOptions[indexPath.row].type == "ColorSelection") {
      let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainMenuOptionCell, for: indexPath) as! MainMenuOptionCell
      cell.configureForMainMenuOption(mainViewVariables.mainMenuOptions[indexPath.row])
      return cell
    }
    else if (mainViewVariables.mainMenuOptions[indexPath.row].type == "Submission") {
      let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainMenuButtonCell, for: indexPath) as! MainMenuButton
      cell.configureForMainMenuButton(mainViewVariables.mainMenuOptions[indexPath.row])
      return cell
    }
    let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainMenuOptionCell, for: indexPath) as! MainMenuOptionCell
    cell.configureForMainMenuOption(mainViewVariables.mainMenuOptions[indexPath.row])
    return cell
  }
  
}

struct mainViewVariables{
    static var title = "iCruit"
    static var mainMenuOptions = [MainMenuOption(title:"Welcome to iCruit", type:"WelcomeMessage")]
}

extension CenterViewController: SidePanelViewControllerDelegate {
  func didSelectMenuOption(_ menuOption: MenuOption) {
    if (menuOption.titleString != "Present") {
        mainViewVariables.title = menuOption.title
    }
    else {
        let defaults = UserDefaults.standard
        let token = defaults.string(forKey: "CompanyName")
        mainViewVariables.title = String(token!)
    }
    if (menuOption.titleString == "Color") {
        mainViewVariables.mainMenuOptions = MainMenuOption.editColorOptions()
    }
    else {
        mainViewVariables.mainMenuOptions = [MainMenuOption(title:"Welcome to iCruit", type:"WelcomeMessage")]
    }
    delegate?.collapseSidePanels?()
    self.mainMenu.reloadData()
    viewDidLoad()
  }
}

/*extension CenterViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return mainMenuOptions.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainMenuOptionCell, for: indexPath) as! MainMenuOptionCell
    cell.configureForMainMenuOption(mainMenuOptions[indexPath.row])
    return cell
  }
}
 */

