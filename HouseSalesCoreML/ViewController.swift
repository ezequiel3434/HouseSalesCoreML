//
//  ViewController.swift
//  HouseSalesCoreML
//
//  Created by Ezequiel Parada Beltran on 11/07/2020.
//  Copyright © 2020 Ezequiel Parada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var precioDeLaCasa: UILabel!
    @IBOutlet weak var roomsNumber: UILabel!
    @IBOutlet weak var roomsBathrooms: UILabel!
    @IBOutlet weak var piesCuadrados: UILabel!
    
    // Sliders
    @IBOutlet weak var roomsSlider: UISlider!
    @IBOutlet weak var bathroomSlider: UISlider!
    @IBOutlet weak var feetSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

    @IBAction func cambiarValores(_ sender: Any) {
      
        
        let rooms = Int(roomsSlider.value)
        let bathrooms = Int(bathroomSlider.value)
        let feets = Int(feetSlider.value)
        
        roomsNumber.text = "\(rooms) Dormitorios"
        roomsBathrooms.text = "\(bathrooms) Baños"
        piesCuadrados.text = "\(feets) pies cuadrados"
        
        let housePrice = predecirPrecioDeCasa(banios: Double(bathrooms), cuartos: Double(rooms), piesCuadrados: Double(feets))
        precioDeLaCasa.text = "Costo de la propiedad: $\(Int(housePrice))"
        

        
    }
    
}

