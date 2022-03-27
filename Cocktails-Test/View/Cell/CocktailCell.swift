//
//  CocktailCell.swift
//  Cocktails-Test
//
//  Created by Kirill Drozdov on 27.03.2022.
//

import SnapKit
import UIKit

class CocktailCell: UICollectionViewCell
{
  static let _IDENTIFIER = "CocktailCell"

  let nameCocktail: UILabel = {
    var name = UILabel()
    name.textColor = .white
    return name
  }()

  override init(frame: CGRect)
  {
    super.init(frame: frame)
    backgroundColor = .gray
    setupView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func prepareForReuse() {
    super.prepareForReuse()
  }

  private func setupView()
  {
    addSubview(nameCocktail)
    nameCocktail.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(6)
      make.left.equalToSuperview().inset(12)
      make.trailing.equalToSuperview().inset(12)
      make.bottom.equalToSuperview().inset(6)
    }
  }
}
