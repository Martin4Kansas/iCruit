import UIKit

class MainMenuSubmission : UITableViewCell {
  @IBOutlet weak var submissionLabel: UILabel!
  
  
  func configureForMainMenuSubmission(_ mainMenuOption: MainMenuOption) {
    submissionLabel.text = mainMenuOption.title
    submissionLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
    submissionLabel.numberOfLines = 0
  }
}
