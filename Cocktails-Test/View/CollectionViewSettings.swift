//
//  Test.swift
//  Cocktails-Test
//
//  Created by Kirill Drozdov on 27.03.2022.
//

import UIKit

class CollectionViewSettings: UIView {

  lazy var tagCollectionView: UICollectionView = {
    let layout = UICollectionViewCenterLayout()
    layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 8
    layout.minimumInteritemSpacing = 8
    // ---------------------------- //
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.backgroundColor = .white
    cv.showsVerticalScrollIndicator = false
    return cv
  }()

  private func setupCocktailCollectionView() {
    addSubview(tagCollectionView)
    tagCollectionView.contentInset = .init(top: 8, left: 8, bottom: 8, right: 8)
    tagCollectionView.snp.makeConstraints { make in
      make.top.equalTo(self.snp_topMargin)
      make.leading.equalTo(self.snp_leadingMargin)
      make.trailing.equalTo(self.snp_trailingMargin)
      make.bottom.equalTo(self.snp_bottomMargin)
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupCocktailCollectionView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
