//
//  NetworkRequestManager.swift
//  Cocktails-Test
//
//  Created by Kirill Drozdov on 26.03.2022.
//

import Alamofire

class NetworkRequestManager{

  let cocktailURL = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic"

  static let shared = NetworkRequestManager()
  private init?(){}

  func request(comletion: @escaping(Cocktail)->Void){
    guard let url = URL(string: cocktailURL) else {return}

    AF.request(url).validate().responseDecodable(of: Cocktail.self) { response in
      switch response.result{
      case .success(let value):
        comletion(value)
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
}
