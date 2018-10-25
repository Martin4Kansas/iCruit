import UIKit

class CenterViewController: UIViewController {
  
  @IBOutlet weak fileprivate var titleLabel: UILabel!
  
  var delegate: CenterViewControllerDelegate?
  
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

