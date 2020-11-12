
import UIKit

enum StoryboardType: String {
    case authentication = "Auth"
}

protocol InterfaceInitable: InterfaceRepresentable {
    static func initFromNib() -> Self
}

extension InterfaceInitable where Self: UIViewController {
    static func initFromNib() -> Self {
        return Self(nibName: interfaceId, bundle: nil)
    }
    
    static func initFromStoryboard(_ type: StoryboardType, withVCId vcId: String? = nil) -> Self {
        let storyboard = UIStoryboard.init(name: type.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: vcId ?? interfaceId) as! Self
    }
}


extension InterfaceInitable where Self: UITableViewCell {
    static func initFromNib() -> Self {
        return Bundle.main.loadNibNamed(interfaceId, owner: self, options: nil)?.first as! Self
    }
}

extension UIViewController: InterfaceInitable { }
extension UITableViewCell: InterfaceInitable { }

extension InterfaceInitable where Self: UICollectionViewCell {
    static func initFromNib() -> Self {
        return Bundle.main.loadNibNamed(interfaceId, owner: self, options: nil)?.first as! Self
    }
}

extension UICollectionViewCell: InterfaceInitable { }
