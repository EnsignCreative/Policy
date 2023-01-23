//
//  ImageHelpers.swift
//  Policy
//
//  Created by Bradley Ensign on 5/27/22.
//

import UIKit

extension UIImage {
    func scaleImage(for target: CGSize) -> UIImage? {
        let widthRatio  = target.width  / size.width
        let heightRatio = target.height / size.height
        
        let ratio = widthRatio > heightRatio ? heightRatio : widthRatio
        let size = CGSize(width: size.width * ratio, height: size.height * ratio)
        
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { (context) in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
    
    func jpg(from size: CGSize, withQuality quality: CGFloat) -> Data? {
        let resizedImage = self.scaleImage(for: size)
        return resizedImage?.jpegData(compressionQuality: quality)
    }
}




extension UIImageView {
    func downloaded(from url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }

            DispatchQueue.main.async() { [weak self] in
                self?.image = image
                self?.layoutIfNeeded()
            }
        }.resume()
    }
    
    
    func downloaded(from link: String) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url)
    }
}
  
