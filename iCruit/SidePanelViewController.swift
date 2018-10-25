import UIKit

class SidePanelViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var delegate: SidePanelViewControllerDelegate?
  
  var menuOptions: Array<MenuOption>!
  
  enum CellIdentifiers {
    static let MenuOptionCell = "MenuOptionCell"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.reloadData()
  }
}

// MARK: Table View Data Source
extension SidePanelViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menuOptions.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MenuOptionCell, for: indexPath) as! MenuOptionCell
    cell.configureForMenuOption(menuOptions[indexPath.row])
    return cell
  }
}

// Mark: Table View Delegate

extension SidePanelViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let menuOption = menuOptions[indexPath.row]
    delegate?.didSelectMenuOption(menuOption)
  }
}
