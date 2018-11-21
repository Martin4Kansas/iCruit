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
    let defaultColor = ["Color" : "Black"]
    let defaultSelectedColor = ["SelectedColor" : "Black"]
    defaults.register(defaults: defaultCompanyName)
    defaults.register(defaults: defaultColor)
    defaults.register(defaults: defaultSelectedColor)
    
    
    
    return true
  }
}
