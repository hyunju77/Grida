//
//  ViewController.swift
//  Grida
//
//  Created by swa on 2021/06/02.
//

import UIKit

class ImageAnimationViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fclass101.net%2Fproducts%2Fz1g4Oml6tr0o7OaCL7iy&psig=AOvVaw2l63Pkk0ZTK2Y-j8FzvFi1&ust=1624067809750000&source=images&cd=vfe&ved=0CAcQjRxqFwoTCOjnmqGKoPECFQAAAAAdAAAAABAK")
        do {
            let data = try Data(contentsOf: url!)
            imageView.image = UIImage(data: data)
            
        } catch {
            
        }
    }
}

