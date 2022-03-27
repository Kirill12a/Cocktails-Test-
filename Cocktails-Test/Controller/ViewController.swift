//
//  ViewController.swift
//  Cocktails-Test
//
//  Created by Kirill Drozdov on 26.03.2022.
//

import UIKit

class ViewController: UIViewController {

  // --------------------------------------
  private var data: [Drink] = []
  private var cvView = CollectionViewSettings()
  // --------------------------------------

  override func loadView() {
    super.loadView()
    self.view = cvView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    configureViews()
    //    setupCocktailCollectionView()
    // -------------------------
    DispatchQueue.main.async {
      NetworkRequestManager.shared?.request(comletion: { [self] coctail in
        data = coctail.drinks
        cvView.tagCollectionView.reloadData()
      })
    }
    //----

  }
}


// !!!: UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return data.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CocktailCell", for: indexPath) as? CocktailCell else {fatalError("error")}
    cell.nameCocktail.text = data[indexPath.row].strDrink
    cell.backgroundColor = .systemGray
    cell.layer.cornerRadius = 10
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
    let cell = collectionView.cellForItem(at: indexPath)
    let gradient = Gradient.grENT!.getGradientLayer(bounds: cell!.bounds)
    cell?.backgroundColor = Gradient.grENT!.gradientColor(bounds: cell!.bounds, gradientLayer: gradient)
  }
}


// !!!: UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource{

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: 30)
  }
}


// !!!: UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 8
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 8
  }
}

// !!!: Delegate
extension ViewController {

  private func configureViews() {
    cvView.tagCollectionView.delegate = self
    cvView.tagCollectionView.dataSource = self
    cvView.tagCollectionView.register(CocktailCell.self, forCellWithReuseIdentifier: CocktailCell._IDENTIFIER)
  }
}
