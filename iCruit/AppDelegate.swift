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
    let questionArray = ["What is your name?", "What school do you attend?", "What is your expected graduation date?", "What is your GPA?","What is your email?", "How did you hear about us?", "Have you applied online?","","","","","","","","","","","","","",""]
    let answerArray = ["","","","","","","","","","","","","","","","","","","",""]
    let defaultQuestions = ["Questions" : questionArray]
    let defaultAnswers = ["Answers" : answerArray]
    let defaultNumberOfAnswers = ["NumberOfAnswers" : 0]
    let defaultNumberOfQuestions = ["NumberOfQuestions" : 7]
    let defaultSubmissionsArray = [[String]]()
    let defaultSubmissions = ["Submissions" : defaultSubmissionsArray]
    let defaultLockStatus = ["IsLocked" : false]
    let defaultPassword = ["Password" : ""]
    let defaultWrongPasswords = ["WrongPasswords" : 0]
    let defaultSelectedQuestionsArray = ["What is your name?", "What school do you attend?", "What is your expected graduation date?", "What is your GPA?","What is your email?", "How did you hear about us?", "Have you applied online?","","","","","","","","","","","","","",""]
    let defaultSelectedQuestions = ["SelectedQuestions" : defaultSelectedQuestionsArray]
    defaults.register(defaults: defaultCompanyName)
    defaults.register(defaults: defaultSelectedName)
    defaults.register(defaults: defaultColor)
    defaults.register(defaults: defaultSelectedColor)
    defaults.register(defaults: defaultQuestions)
    defaults.register(defaults: defaultAnswers)
    defaults.register(defaults: defaultNumberOfAnswers)
    defaults.register(defaults: defaultSubmissions)
    defaults.register(defaults: defaultNumberOfQuestions)
    defaults.register(defaults: defaultLockStatus)
    defaults.register(defaults: defaultPassword)
    defaults.register(defaults: defaultWrongPasswords)
    defaults.register(defaults: defaultSelectedQuestions)
    return true
  }
}
