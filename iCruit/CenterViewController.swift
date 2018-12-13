import UIKit
import MessageUI

class CenterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate {
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
    static let MainMenuSubmissionCell = "MainMenuSubmissionCell"
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
    if (mainViewVariables.mainMenuOptions[indexPath.row].type == "WelcomeMessage") {
      let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainMenuOptionCell, for: indexPath) as! MainMenuOptionCell
      cell.configureForMainMenuOption(mainViewVariables.mainMenuOptions[indexPath.row])
      tableView.rowHeight = UITableViewAutomaticDimension
      tableView.estimatedRowHeight = 63
      return cell
    }
    else if (mainViewVariables.mainMenuOptions[indexPath.row].type == "ColorSelection") {
      let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainMenuOptionCell, for: indexPath) as! MainMenuOptionCell
      cell.configureForMainMenuOption(mainViewVariables.mainMenuOptions[indexPath.row])
      tableView.rowHeight = UITableViewAutomaticDimension
      tableView.estimatedRowHeight = 63
      return cell
    }
    else if (mainViewVariables.mainMenuOptions[indexPath.row].type == "CompanySubmission") {
      let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainMenuOptionCell, for: indexPath) as! MainMenuOptionCell
      cell.configureForMainMenuOption(mainViewVariables.mainMenuOptions[indexPath.row])
      tableView.rowHeight = UITableViewAutomaticDimension
      tableView.estimatedRowHeight = 63
      return cell
    }
    else if (mainViewVariables.mainMenuOptions[indexPath.row].type == "CompanyTextbox") {
      let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainMenuTextboxCell, for: indexPath) as! MainMenuTextbox
      cell.configureForMainMenuTextbox(mainViewVariables.mainMenuOptions[indexPath.row])
      tableView.rowHeight = UITableViewAutomaticDimension
      tableView.estimatedRowHeight = 63
      return cell
    }
    else if (mainViewVariables.mainMenuOptions[indexPath.row].type == "Question") {
      let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainMenuQuestionCell, for: indexPath) as! MainMenuQuestion
      cell.configureForMainMenuQuestion(mainViewVariables.mainMenuOptions[indexPath.row])
      tableView.rowHeight = UITableViewAutomaticDimension
      tableView.estimatedRowHeight = 63
      return cell
    }
    else if (mainViewVariables.mainMenuOptions[indexPath.row].type == "EditQuestion") {
      let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainMenuTextboxCell, for: indexPath) as! MainMenuTextbox
      cell.configureForMainMenuTextbox(mainViewVariables.mainMenuOptions[indexPath.row])
      tableView.rowHeight = UITableViewAutomaticDimension
      tableView.estimatedRowHeight = 63
      return cell
    }
    else if (mainViewVariables.mainMenuOptions[indexPath.row].type == "QuestionSubmission") {
      let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainMenuOptionCell, for: indexPath) as! MainMenuOptionCell
      cell.configureForMainMenuOption(mainViewVariables.mainMenuOptions[indexPath.row])
      tableView.rowHeight = UITableViewAutomaticDimension
      tableView.estimatedRowHeight = 63
      return cell
    }
    else if (mainViewVariables.mainMenuOptions[indexPath.row].type == "EditQuestionSubmission") {
      let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainMenuOptionCell, for: indexPath) as! MainMenuOptionCell
      cell.configureForMainMenuOption(mainViewVariables.mainMenuOptions[indexPath.row])
      tableView.rowHeight = UITableViewAutomaticDimension
      tableView.estimatedRowHeight = 63
      return cell
    }
    else if (mainViewVariables.mainMenuOptions[indexPath.row].type == "AddQuestion") {
      let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainMenuOptionCell, for: indexPath) as! MainMenuOptionCell
      cell.configureForMainMenuOption(mainViewVariables.mainMenuOptions[indexPath.row])
      tableView.rowHeight = UITableViewAutomaticDimension
      tableView.estimatedRowHeight = 63
      return cell
    }
    else if (mainViewVariables.mainMenuOptions[indexPath.row].type == "Submission") {
      let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainMenuSubmissionCell, for: indexPath) as! MainMenuSubmission
      cell.configureForMainMenuSubmission(mainViewVariables.mainMenuOptions[indexPath.row])
      tableView.rowHeight = UITableViewAutomaticDimension
      tableView.estimatedRowHeight = 63
      return cell
    }
    else if (mainViewVariables.mainMenuOptions[indexPath.row].type == "PasswordTextbox") {
      let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainMenuTextboxCell, for: indexPath) as! MainMenuTextbox
      cell.configureForMainMenuTextbox(mainViewVariables.mainMenuOptions[indexPath.row])
      tableView.rowHeight = UITableViewAutomaticDimension
      tableView.estimatedRowHeight = 63
      return cell
    }
    else if (mainViewVariables.mainMenuOptions[indexPath.row].type == "PasswordSubmission") {
      let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainMenuOptionCell, for: indexPath) as! MainMenuOptionCell
      cell.configureForMainMenuOption(mainViewVariables.mainMenuOptions[indexPath.row])
      tableView.rowHeight = UITableViewAutomaticDimension
      tableView.estimatedRowHeight = 63
      return cell
    }
    else if (mainViewVariables.mainMenuOptions[indexPath.row].type == "Reset") {
      let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainMenuOptionCell, for: indexPath) as! MainMenuOptionCell
      cell.configureForMainMenuOption(mainViewVariables.mainMenuOptions[indexPath.row])
      tableView.rowHeight = UITableViewAutomaticDimension
      tableView.estimatedRowHeight = 63
      return cell
    }
    else if (mainViewVariables.mainMenuOptions[indexPath.row].type == "Export") {
      let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainMenuOptionCell, for: indexPath) as! MainMenuOptionCell
      cell.configureForMainMenuOption(mainViewVariables.mainMenuOptions[indexPath.row])
      tableView.rowHeight = UITableViewAutomaticDimension
      tableView.estimatedRowHeight = 63
      return cell
    }
    else {
      let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MainMenuOptionCell, for: indexPath) as! MainMenuOptionCell
      cell.configureForMainMenuOption(mainViewVariables.mainMenuOptions[indexPath.row])
      tableView.rowHeight = UITableViewAutomaticDimension
      tableView.estimatedRowHeight = 63
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
    else if (mainMenuOption.type == "QuestionSubmission") {
      let defaults = UserDefaults.standard
      var answers = defaults.array(forKey: "Answers")
      var submissions = defaults.array(forKey: "Submissions")
      submissions!.append(answers!)
      answers = ["","","","","","","","","","","","","","","","","","","",""]
      defaults.set(submissions, forKey: "Submissions")
      defaults.set(answers, forKey: "Answers")
      self.mainMenu.reloadData()
      viewDidLoad()
    }
    else if (mainMenuOption.type == "AddQuestion") {
      let defaults = UserDefaults.standard
      var questions = defaults.array(forKey: "Questions") as? [String]
      var number = defaults.integer(forKey: "NumberOfQuestions")
      var notFound = true
      if (number != 20) {
        for n in 0...19 {
          if (notFound && questions![n]=="") {
            questions![n] = "Question " + String(n+1)
            notFound = false
          }
        }
        number = number + 1
      }
      defaults.set(questions, forKey: "Questions")
      defaults.set(number, forKey: "NumberOfQuestions")
      mainViewVariables.mainMenuOptions = MainMenuOption.editQuestionOptions()
      self.mainMenu.reloadData()
      viewDidLoad()
    }
    else if (mainMenuOption.type == "RemoveQuestion") {
      let defaults = UserDefaults.standard
      var questions = defaults.array(forKey: "Questions") as? [String]
      var number = defaults.integer(forKey: "NumberOfQuestions")
      var notFound = true
      if (number != 1) {
        for n in 1...19 {
          if (notFound && questions![n]=="") {
            questions![n - 1] = ""
            notFound = false
          }
          else if (n==19) {
            questions![n] = ""
          }
        }
        number = number - 1
      }
      defaults.set(questions, forKey: "Questions")
      defaults.set(number, forKey: "NumberOfQuestions")
      mainViewVariables.mainMenuOptions = MainMenuOption.editQuestionOptions()
      self.mainMenu.reloadData()
      viewDidLoad()
    }
    else if (mainMenuOption.type == "EditQuestionSubmission") {
      let defaults = UserDefaults.standard
      var questions = ["","","","","","","","","","","","","","","","","","","",""]
      let number = defaults.integer(forKey: "NumberOfQuestions")
      for n in 0...(number - 1) {
        let path = IndexPath(row: n, section: 0)
        let cell = tableView.cellForRow(at: path) as! MainMenuTextbox
        questions[n] = (cell.mainTextbox?.text!)!
      }
      defaults.set(questions, forKey: "Questions")
      mainViewVariables.mainMenuOptions = MainMenuOption.editQuestionOptions()
      self.mainMenu.reloadData()
      viewDidLoad()
    }
    else if (mainMenuOption.type == "PasswordSubmission") {
      let defaults = UserDefaults.standard
      let oldPassword = defaults.string(forKey: "Password")
      let newPassword = (tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as! MainMenuTextbox).mainTextbox?.text!
      let isLocked = defaults.bool(forKey: "IsLocked")
      var numberWrong = defaults.integer(forKey: "WrongPasswords")
      if (!isLocked) {
        defaults.set(true, forKey: "IsLocked")
        defaults.set(newPassword as! String, forKey: "Password")
        (tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as! MainMenuOptionCell).mainMenuOptionLabel.text = "Unlock"
      }
      else if (oldPassword == newPassword) {
        defaults.set(false, forKey: "IsLocked")
        defaults.set("", forKey: "Password")
        numberWrong = 0
        defaults.set(numberWrong, forKey: "WrongPasswords")
        (tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as! MainMenuOptionCell).mainMenuOptionLabel.text = "Lock"
      }
      else if (numberWrong < 8) {
        numberWrong = numberWrong + 1
        (tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as! MainMenuTextbox).mainTextbox?.text! = "Wrong Password x" + String(numberWrong)
        defaults.set(numberWrong, forKey: "WrongPasswords")
      }
      else if (numberWrong < 9) {
        numberWrong = numberWrong + 1
        (tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as! MainMenuTextbox).mainTextbox?.text! = "Two more wrong passwords until reset."
        defaults.set(numberWrong, forKey: "WrongPasswords")
      }
      else if (numberWrong < 10) {
        numberWrong = numberWrong + 1
        (tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as! MainMenuTextbox).mainTextbox?.text! = "One more wrong passwords until reset."
        defaults.set(numberWrong, forKey: "WrongPasswords")
      }
      else if (numberWrong < 11) {
        numberWrong = numberWrong + 1
        (tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as! MainMenuTextbox).mainTextbox?.text! = "Too many wrong passwords, press reset to reset iCruit!"
        (tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as! MainMenuOptionCell).mainMenuOptionLabel.text = "Reset"
        defaults.set(numberWrong, forKey: "WrongPasswords")
      }
      else {
        (tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as! MainMenuTextbox).mainTextbox?.text! = "iCruit was reset!"
        (tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as! MainMenuOptionCell).mainMenuOptionLabel.text = "Lock"
        resetApp()
      }
    }
    else if (mainMenuOption.type == "Reset") {
      mainViewVariables.mainMenuOptions = MainMenuOption.areYouSureOptions()
      self.mainMenu.reloadData()
      viewDidLoad()
    }
    else if (mainMenuOption.type == "YesReset") {
      resetApp()
      mainViewVariables.mainMenuOptions = [MainMenuOption(title: "iCruit was successfully reset.", type: "Success")]
      self.mainMenu.reloadData()
      viewDidLoad()
    }
    else if (mainMenuOption.type == "NoReset") {
      mainViewVariables.mainMenuOptions = MainMenuOption.resetOptions()
      self.mainMenu.reloadData()
      viewDidLoad()
    }
    else if (mainMenuOption.type == "Export") {
      if MFMailComposeViewController.canSendMail() {
        let mailVC = configuredMailComposeViewController()
        self.present(mailVC, animated: true, completion: nil)
      }
      else {
        mainViewVariables.mainMenuOptions = [MainMenuOption(title: "Your mail client is not set up properly.  Please set up and try again later.", type: "Export")]
        self.mainMenu.reloadData()
        viewDidLoad()
      }
    }
  }
  func resetApp() {
    let defaults = UserDefaults.standard
    let questionArray = ["What is your name?", "What school do you attend?", "What is your expected graduation date?", "What is your GPA?","What is your email?", "How did you hear about us?", "Have you applied online?","","","","","","","","","","","","","",""]
    let answerArray = ["","","","","","","","","","","","","","","","","","","",""]
    let defaultSubmissionsArray = [[String]]()
    defaults.set("iCruit", forKey: "CompanyName")
    defaults.set("iCruit", forKey: "SelectedName")
    defaults.set("Black", forKey: "Color")
    defaults.set("Black", forKey: "SelectedColor")
    defaults.set(questionArray, forKey: "Questions")
    defaults.set(answerArray, forKey: "Answers")
    defaults.set(0, forKey: "NumberOfAnswers")
    defaults.set(7, forKey: "NumberOfQuestions")
    defaults.set(defaultSubmissionsArray, forKey: "Submissions")
    defaults.set(false, forKey:"IsLocked")
    defaults.set("", forKey:"Password")
    defaults.set(0, forKey:"WrongPasswords")
  }
  
  func configuredMailComposeViewController() -> MFMailComposeViewController {
    let mailComposerVC = MFMailComposeViewController()
    mailComposerVC.mailComposeDelegate = self
    mailComposerVC.setSubject("Potential Applicant Data")
    mailComposerVC.setMessageBody("Attached to this email is a CSV of potential applicant data.", isHTML: false)
    let csvStringData = generateStringForCSV()
    if let data = (csvStringData as NSString).data(using: String.Encoding.utf8.rawValue){
      //Attach File
      mailComposerVC.addAttachmentData(data, mimeType: "text/plain", fileName: "applicants.csv")
    }
    return mailComposerVC
  }
  
  func generateStringForCSV () -> NSMutableString {
    let delimiter = ","
    let stringData:NSMutableString  = NSMutableString()
    let defaults = UserDefaults.standard
    let submissions = defaults.array(forKey: "Submissions") as! [[String]]
    let questions = defaults.array(forKey: "Questions") as! [String]
    var isFirst = true
    
    for question in questions {
      if (!isFirst) {
        stringData.append(delimiter)
      }
      else {
        isFirst = false
      }
      stringData.append(question)
    }
    stringData.append("\n")
    
    for submission in submissions {
      isFirst = true
      for entry in submission {
        if (!isFirst) {
          stringData.append(delimiter)
        }
        else {
          isFirst = false
        }
        stringData.append(entry)
      }
      stringData.append("\n")
    }
    
    return stringData
  }
  
  func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
    controller.dismiss(animated: true)
  }
}

struct mainViewVariables{
    static var title = "iCruit"
    static var mainMenuOptions = [MainMenuOption(title: "Welcome to iCruit", type: "WelcomeMessage")]
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
    else if (menuOption.titleString == "Questions") {
      mainViewVariables.mainMenuOptions = MainMenuOption.editQuestionOptions()
    }
    else if (menuOption.titleString == "Responses") {
      mainViewVariables.mainMenuOptions = MainMenuOption.submissionOptions()
    }
    else if (menuOption.titleString == "Lock") {
      mainViewVariables.mainMenuOptions = MainMenuOption.lockOptions()
      mainViewVariables.title = "Lock/Unlock"
    }
    else if (menuOption.titleString == "Reset") {
      mainViewVariables.mainMenuOptions = MainMenuOption.resetOptions()
    }
    else if (menuOption.titleString == "Export") {
      mainViewVariables.mainMenuOptions = MainMenuOption.exportOptions()
    }
    else {
      mainViewVariables.mainMenuOptions = [MainMenuOption(title:"Welcome to iCruit", type:"WelcomeMessage")]
    }
    delegate?.collapseSidePanels?()
    self.mainMenu.reloadData()
    viewDidLoad()
  }
}

