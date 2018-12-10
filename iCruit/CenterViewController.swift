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
    static let MainMenuTextboxCell = "MainMenuTextboxCell"
    static let MainMenuQuestionCell = "MainMenuQuestionCell"
  }
  override func viewDidLoad() {
      super.viewDidLoad()
      mainViewVariables.color = UIColor.black
      let colorString = UserDefaults.standard.string(forKey: "Color")
      switch colorString {
        case "Black":
          mainViewVariables.color = UIColor.black
        case "Blue":
          mainViewVariables.color = UIColor.blue
        case "Brown":
          mainViewVariables.color = UIColor.brown
        case "Cyan":
          mainViewVariables.color = UIColor.cyan
        case "Dark Gray":
          mainViewVariables.color = UIColor.darkGray
        case "Gray":
          mainViewVariables.color = UIColor.gray
        case "Green":
          mainViewVariables.color = UIColor.green
        case "Light Grey":
          mainViewVariables.color = UIColor.lightGray
        case "Magenta":
          mainViewVariables.color = UIColor.magenta
        case "Orange":
          mainViewVariables.color = UIColor.orange
        case "Purple":
          mainViewVariables.color = UIColor.purple
        case "Red":
          mainViewVariables.color = UIColor.red
        case "Yellow":
          mainViewVariables.color = UIColor.yellow
        default:
          mainViewVariables.color = UIColor.black
      }
      editButton.setTitleTextAttributes([
      NSAttributedStringKey.font: UIFont(name: "Helvetica-Bold", size: 26.0)!,
      NSAttributedStringKey.foregroundColor: UIColor.darkGray],
                                      for: .normal)
      adminButton.setTitleTextAttributes([
      NSAttributedStringKey.font: UIFont(name: "Helvetica-Bold", size: 26.0)!,
      NSAttributedStringKey.foregroundColor: UIColor.darkGray],
                                      for: .normal)
      let titleLabel = UILabel(frame: CGRect(x: 10, y: 50, width: 230, height: 21))
      titleLabel.textAlignment = .center //For center alignment
      titleLabel.text = mainViewVariables.title
      titleLabel.textColor = mainViewVariables.color
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
    tableView.rowHeight = 63
    tableView.estimatedRowHeight = 63
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
    else if (mainViewVariables.mainMenuOptions[indexPath.row].type == "CompanySubmission") {
      let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainMenuOptionCell, for: indexPath) as! MainMenuOptionCell
      cell.configureForMainMenuOption(mainViewVariables.mainMenuOptions[indexPath.row])
      return cell
    }
    else if (mainViewVariables.mainMenuOptions[indexPath.row].type == "CompanyTextbox") {
      let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainMenuTextboxCell, for: indexPath) as! MainMenuTextbox
      cell.configureForMainMenuTextbox(mainViewVariables.mainMenuOptions[indexPath.row])
      return cell
    }
    else if (mainViewVariables.mainMenuOptions[indexPath.row].type == "Question") {
      let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainMenuQuestionCell, for: indexPath) as! MainMenuQuestion
      cell.configureForMainMenuQuestion(mainViewVariables.mainMenuOptions[indexPath.row])
      tableView.rowHeight = 99
      tableView.estimatedRowHeight = 99
      return cell
    }
    else if (mainViewVariables.mainMenuOptions[indexPath.row].type == "QuestionSubmission") {
      let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainMenuOptionCell, for: indexPath) as! MainMenuOptionCell
      cell.configureForMainMenuOption(mainViewVariables.mainMenuOptions[indexPath.row])
      return cell
    }
    else {
      let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainMenuOptionCell, for: indexPath) as! MainMenuOptionCell
      cell.configureForMainMenuOption(mainViewVariables.mainMenuOptions[indexPath.row])
      return cell
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let mainMenuOption = mainViewVariables.mainMenuOptions[indexPath.row]
    if (mainMenuOption.type == "ColorSelection") {
      let title = mainMenuOption.title
      let defaults = UserDefaults.standard
      defaults.set(title, forKey:"SelectedColor")
    }
    else if (mainMenuOption.type == "ColorSubmission") {
      let defaults = UserDefaults.standard
      let selected = defaults.string(forKey: "SelectedColor")
      defaults.set(selected, forKey: "Color")
      self.mainMenu.reloadData()
      viewDidLoad()
    }
    else if (mainMenuOption.type == "CompanySubmission") {
      let defaults = UserDefaults.standard
      let selected = defaults.string(forKey: "SelectedName")
      defaults.set(selected, forKey: "CompanyName")
      self.mainMenu.reloadData()
      viewDidLoad()
    }
  }
  
}

struct mainViewVariables{
    static var title = "iCruit"
    static var mainMenuOptions = [MainMenuOption(title:"Welcome to iCruit", type:"WelcomeMessage")]
    static var color = UIColor.black
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
    else if (menuOption.titleString == "Company") {
      mainViewVariables.mainMenuOptions = MainMenuOption.editCompanyOptions()
    }
    else if (menuOption.titleString == "Present") {
      mainViewVariables.mainMenuOptions = MainMenuOption.presentQuestionOptions()
    }
    else {
        mainViewVariables.mainMenuOptions = [MainMenuOption(title:"Welcome to iCruit", type:"WelcomeMessage")]
    }
    delegate?.collapseSidePanels?()
    self.mainMenu.reloadData()
    viewDidLoad()
  }
}

