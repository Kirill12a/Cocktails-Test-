//
//  ViewController.swift
//  Cocktails-Test
//
//  Created by Kirill Drozdov on 26.03.2022.
//

import UIKit

class ViewController: UIViewController {


    let tagCollectionView: UICollectionView = {
        let layout = UICollectionViewCenterLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()

    var data: [Drink] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureViews()
        setupViews()

      DispatchQueue.main.async {
        NetworkRequestManager.shared?.request(comletion: { [self] coctail in
          self.data = coctail.drinks
          tagCollectionView.reloadData()
        })
      }
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return data.count
    }



    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 60)
    }



    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CocktailCell", for: indexPath) as? CocktailCell else {
            fatalError("Can't dequeue reusable cell")
        }
      cell.nameCocktail.text = data[indexPath.row].strDrink
        cell.backgroundColor = .lightGray
        cell.layer.cornerRadius = 6
        return cell
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

private extension ViewController {



    func configureViews() {
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
        tagCollectionView.register(CocktailCell.self, forCellWithReuseIdentifier: CocktailCell._IDENTIFIER)
    }



    func setupViews() {
        setupTagCollectionView()
    }

    func setupTagCollectionView() {
        view.addSubview(tagCollectionView)
        tagCollectionView.contentInset = .init(top: 8, left: 8, bottom: 8, right: 8)
      tagCollectionView.snp.makeConstraints { make in
        make.top.equalTo(view.snp_topMargin)
        make.leading.equalTo(view.snp_leadingMargin)
        make.trailing.equalTo(view.snp_trailingMargin)
        make.bottom.equalTo(view.snp_bottomMargin)


      }
    }
}
