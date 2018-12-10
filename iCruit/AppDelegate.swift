import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    
    let containerViewController = ContainerViewController()
    
    window!.rootViewController = containerViewController
    window!.makeKeyAndVisible()
    
    let defaults = UserDefaults.standard
    let defaultCompanyName = ["CompanyName" : "iCruit"]
    let defaultSelectedName = ["SelectedName" : "iCruit"]
    let defaultColor = ["Color" : "Black"]
    let defaultSelectedColor = ["SelectedColor" : "Black"]
    let questionArray = ["What school do you attend?", "What is your expected graduation date?", "What is your GPA?", "How did you hear about us?", "Have you applied online?","","","","","","","","","","","","","","",""]
    let answerArray = ["","","","","","","","","","","","","","","","","","","",""]
    let defaultQuestions = ["Questions" : questionArray]
    let defaultAnswers = ["Answers" : answerArray]
    defaults.register(defaults: defaultCompanyName)
    defaults.register(defaults: defaultSelectedName)
    defaults.register(defaults: defaultColor)
    defaults.register(defaults: defaultSelectedColor)
    defaults.register(defaults: defaultQuestions)
    defaults.register(defaults: defaultAnswers)
    return true
  }
}
