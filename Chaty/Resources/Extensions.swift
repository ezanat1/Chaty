//
//  Extensions.swift
//  Chaty
//
//  Created by Ezana Tesfaye on 2/26/21.
//

import Foundation
import UIKit


extension UIView {
    
    public var width : CGFloat {
        return self.frame.width
    }
    
    public var heigth : CGFloat {
        return self.frame.height
    }
    
    public var top : CGFloat {
        return self.frame.origin.y
    }
    
    public var bottom : CGFloat {
        return self.frame.height + self.frame.origin.y
    }
    
    public var left : CGFloat {
        return self.frame.origin.x
    }
    
    public var rigth : CGFloat {
        return self.frame.width + self.frame.origin.x
    }
}


extension Notification.Name{
    static let  didLogInNotification = Notification.Name("didLogInNotification")
}
