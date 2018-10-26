import UIKit

class CenterViewController: UIViewController {
  
  @IBOutlet weak fileprivate var titleLabel: UILabel!
  @IBOutlet weak var editButton: UIBarButtonItem!
  @IBOutlet weak var adminButton: UIBarButtonItem!
  @IBOutlet weak var topBar: UINavigationItem!
  var delegate: CenterViewControllerDelegate?
    
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
      titleLabel.text = "iCruit"
      titleLabel.textColor = .black
      titleLabel.font = UIFont(name: "Helvetica-Bold", size: 30.0)
      topBar.titleView = titleLabel
  }
  
  // MARK: Button actions
  @IBAction func editTapped(_ sender: Any) {
    delegate?.toggleLeftPanel?()
  }
  @IBAction func adminTapped(_ sender: Any) {
    delegate?.toggleRightPanel?()
  }
    
}

extension CenterViewController: SidePanelViewControllerDelegate {
  
  func didSelectMenuOption(_ menuOption: MenuOption) {
    titleLabel.text = menuOption.title
    
    delegate?.collapseSidePanels?()
  }
}

