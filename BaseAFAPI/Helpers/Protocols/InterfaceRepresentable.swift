

import UIKit

protocol InterfaceRepresentable {
    static var interfaceId: String { get }
    static var nib: UINib { get }
    var interfaceId: String { get }
}

extension InterfaceRepresentable {
    static var interfaceId: String { return String(describing: self) }
    
    static var nib: UINib {
        return UINib(nibName: interfaceId, bundle: nil)
    }
    
    var interfaceId: String {
        return String(describing: type(of: self))
    }
}

extension UIView: InterfaceRepresentable { }
