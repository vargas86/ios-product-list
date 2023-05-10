//
//  ProductoCell.swift
//  app-list-products
//
//  Created by Ivonne on 09/05/23.
//

import UIKit

class ProductoCell: UITableViewCell {
    
    
    @IBOutlet weak var imagenProducto: UIImageView!
    @IBOutlet weak var nombreProducto: UILabel!
    @IBOutlet weak var stockProducto: UILabel!
    @IBOutlet weak var precioProducto: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configurarCelda(producto: Product){
        nombreProducto.text = producto.title
        stockProducto.text = "\(producto.stock) disponibles"
        precioProducto.text = "$\(producto.price)"
        
        //Extraer la url y buscar en interner para crear una imagen con la data resultado
        
        guard let url = URL(string: producto.thumbnail) else {return}
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let dataImagen = data else {return}
            
            //Crear una imagen con la data resultante
            let imagen = UIImage(data: dataImagen)
            //Asignar la imagen
            DispatchQueue.main.async {
                self.imagenProducto.image = imagen //Main Threath
            }
            
        }.resume()
    }
    
}
