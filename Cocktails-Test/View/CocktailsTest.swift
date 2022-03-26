//
//  test.swift
//  Cocktails-Test
//
//  Created by Kirill Drozdov on 26.03.2022.
//

import UIKit
import SnapKit

class CocktailsTest: UIView{

  lazy var recipeNameLabel: UILabel = {
    let label = UILabel()
    label.text = "Скоро буду..."
//    label.backgroundColor = .black
    label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
    label.textAlignment = .center
    label.numberOfLines = 0
    return label
  }()


  private func settLabel(){
    self.addSubview(recipeNameLabel)

    recipeNameLabel.snp.makeConstraints { make in
      make.center.equalToSuperview()
      make.width.height.equalTo(300)
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    settLabel()
    
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


}
