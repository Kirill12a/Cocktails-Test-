//
//  Gradient.swift
//  Cocktails-Test
//
//  Created by Kirill Drozdov on 27.03.2022.
//

import UIKit

class Gradient {

  static var grENT = Gradient()
  private init?(){}

  func getGradientLayer(bounds : CGRect) -> CAGradientLayer{
    let gradient = CAGradientLayer()
    gradient.frame = bounds
    gradient.colors = [UIColor.red.cgColor,UIColor.purple.cgColor]
    gradient.startPoint = CGPoint(x: 0.7, y: 1.3)
    gradient.endPoint = CGPoint(x: 1.2, y: 1.0)
    return gradient
  }
  func gradientColor(bounds: CGRect, gradientLayer :CAGradientLayer) -> UIColor? {
    UIGraphicsBeginImageContext(gradientLayer.bounds.size)
    gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return UIColor(patternImage: image!)
  }

}
