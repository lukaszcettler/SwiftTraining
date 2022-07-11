import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var flagView: UIImageView!
    
    var selectedCountry: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageToLoad = selectedCountry {
            flagView.image = UIImage(named: imageToLoad)
        }
        
        setUI()
        title = selectedCountry?.uppercased()
        
    }
    
    func setUI(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share))
        navigationItem.largeTitleDisplayMode = .never
        flagView.layer.borderWidth = 1
        flagView.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    @objc func share(){
        
        let imageName = selectedCountry!.uppercased()
        
        guard let image = flagView.image?.jpegData(compressionQuality: 0.8) else {
            print("Image not found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image, imageName], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }


}
