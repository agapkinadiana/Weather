//
//  Extensions.swift
//  Weather
//
//  Created by Diana Agapkina on 10/12/20.
//

import Foundation
import UIKit

extension UIView {
    
    public var width: CGFloat {
        return self.frame.size.width
    }
    
    public var height: CGFloat {
        return self.frame.size.height
    }
    
    public var top: CGFloat {
        return self.frame.origin.y
    }
    
    public var bottom: CGFloat {
        // origin - верхний левый угол прямоугольника
        return self.frame.size.height + self.frame.origin.y
    }
    
    public var right: CGFloat {
        return self.frame.origin.x + self.frame.size.width
    }
    
    public var left: CGFloat {
        return self.frame.origin.x
    }
}
