//
//  ViewController.swift
//  Cocktails-Test
//
//  Created by Kirill Drozdov on 26.03.2022.
//

import UIKit

class ViewController: UIViewController {
  var arra: [Drink] = []

  private lazy var recipeView = CocktailsTest()

  override func loadView() {
    self.view = recipeView
  }


  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .red
    DispatchQueue.main.async {
      NetworkRequestManager.shared?.request(comletion: { [self]  name in
        self.arra = name.drinks
        print(self.arra[0].strDrink)
        recipeView.recipeNameLabel.text = arra[0].strDrink
      })

    }





  }
}

