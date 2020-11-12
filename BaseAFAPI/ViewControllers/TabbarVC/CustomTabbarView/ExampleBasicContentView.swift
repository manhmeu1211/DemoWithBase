

import UIKit
import ESTabBarController_swift

class ExampleBasicContentView: ESTabBarItemContentView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        highlightTextColor = UIColor.purple
        highlightIconColor = UIColor.purple
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
