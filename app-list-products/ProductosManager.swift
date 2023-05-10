//
//  ProductosManager.swift
//  app-list-products
//
//  Created by Ivonne on 08/05/23.
//

import Foundation

struct ProductosManager {
    
    func obetenerProductos(completion: @escaping ([Product]) -> Void ) {
        guard let url = URL(string: "https://dummyjson.com/products") else { return }
            
        let tarea = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                //completion([])
                print("Error al obteenr productos")
                return
            }
            
            //Decodificar la data y devlverla al view controller
            do {
                let listaProductos = try JSONDecoder().decode(ProductoResponse.self, from: data)
                completion(listaProductos.products)
            } catch  {
                print("Debug: error \(error.localizedDescription)")
            }
        }
        tarea.resume()
        
        
    }
    
    
}
