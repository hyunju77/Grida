import UIKit

class CameraFilterCell: UICollectionViewCell {
    
    @IBOutlet var lmageView: UIImageView!
    
    var image: UIImage?
    var ciFilterNames: Array<String> = [
    "CIColorCrossPolynomial", "CIColorInvert", "CIColorMonocharome","CIColorPosterize","CIFalseColor","CIMaximumComponent","CIMinimumComponent","CiPhotoEffectChrome","CiPhotoEffectFade","CiPhotoEffectInstant","CiPhotoEffectNoir","CiPhotoEffectProcess","CiPhotoEffectTonal","CiPhotoEffectTransfer","CISeptiaTone"
    ]
    
    func display(image:UIImage, filterName: String) {
        let ciContext = CIContext(options: nil)
        let coreImage = CIImage(image: image)
        if let filter = CIFilter(name: filterName){
            filter.setDefaults()
            filter.setValue(coreImage, forKey: kCIInputImageKey)
            if let filteredImageData = filter.value(forKey: kCIInputImageKey) as? CIImage,
               let filteredImageRef = ciContext.createCGImage(filteredImageData, from: filteredImageData.extent) {
                let image = UIImage(cgImage: filteredImageRef)
                lmageView.image = image
            }
        }
    }
    func collectioniew(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ciFilterNames.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cameraFilterCell", for: indexPath) as! CameraFilterCell
        if let _image = image {
            cell.display(image: _image , filterName: ciFilterNames[indexPath.row])
        }
        return cell
    }

    func collectionView (_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CameraFilterCell
        MainImageView.image = cell.imageView.image
    }
}
//ciFilterNames ? m

