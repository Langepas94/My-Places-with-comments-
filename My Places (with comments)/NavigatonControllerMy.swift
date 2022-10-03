import UIKit

class NavigationController: UINavigationController
{
    // MARK: Navigation Controller Life Cycle

    override func viewDidLoad()
    {
       super.viewDidLoad()
        self.title = "Wowla"
        setFont()
    }

    // MARK: Methods

    func setFont()
    {
       // set font for title
       self.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Al-Jazeera-Arabic", size: 10)!]
        
    
       // set font for navigation bar buttons
       UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Al-Jazeera-Arabic", size: 15)!], for: UIControl.State.normal)
        
    }
}
