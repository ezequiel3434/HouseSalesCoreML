//
//  ViewController.swift
//  HouseSalesCoreML
//
//  Created by Ezequiel Parada Beltran on 11/07/2020.
//  Copyright © 2020 Ezequiel Parada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        predecirPrecioDeCasa(banios: 2, cuartos: 4, piesCuadrados: 1200)
    }
    
    func predecirPrecioDeCasa(banios: Double, cuartos: Double, piesCuadrados: Double) -> Double{
        
        
        let houseSales = HouseSalesInCA()
        
        guard let precio = try? houseSales.prediction(Bedrooms: cuartos, Bathrooms: banios, Size: piesCuadrados) else {
            print("ha ocurrido un error")
            
            return 0.0
        }
        
        print(precio.Price)
        
        return precio.Price
    }


}

