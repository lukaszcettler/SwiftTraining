import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let labelOne = UILabel()
        labelOne.translatesAutoresizingMaskIntoConstraints = false
        labelOne.backgroundColor = UIColor.yellow
        labelOne.text = "WHICH"
        labelOne.sizeToFit()
        
        let labelTwo = UILabel()
        labelTwo.translatesAutoresizingMaskIntoConstraints = false
        labelTwo.backgroundColor = UIColor.orange
        labelTwo.text = "ONE"
        labelTwo.sizeToFit()
        
        let labelThree = UILabel()
        labelThree.translatesAutoresizingMaskIntoConstraints = false
        labelThree.backgroundColor = UIColor.magenta
        labelThree.text = "DO"
        labelThree.sizeToFit()
        
        let labelFour = UILabel()
        labelFour.translatesAutoresizingMaskIntoConstraints = false
        labelFour.backgroundColor = UIColor.cyan
        labelFour.text = "YOU"
        labelFour.sizeToFit()
        
        let labelFive = UILabel()
        labelFive.translatesAutoresizingMaskIntoConstraints = false
        labelFive.backgroundColor = UIColor.systemMint
        labelFive.text = "LIKE?"
        labelFive.sizeToFit()
        
        view.addSubview(labelOne)
        view.addSubview(labelTwo)
        view.addSubview(labelThree)
        view.addSubview(labelFour)
        view.addSubview(labelFive)
        
        let viewsDictionary = ["labelOne":labelOne, "labelTwo":labelTwo, "labelThree":labelThree, "labelFour":labelFour, "labelFive":labelFive]
        
        for label in viewsDictionary.keys {
            view.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|", options: [], metrics: nil, views: viewsDictionary))
        }
        
        let metrics = ["labelHeight": 80]
        view.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: "V:|[labelOne(labelHeight@999)]-[labelTwo(labelOne)]-[labelThree(labelOne)]-[labelFour(labelOne)]-[labelFive(labelOne)]->=10-|", options: [], metrics: metrics, views: viewsDictionary))
        // @999 assigns priority to a given constraint, using (labelOne) makes other labels the same height.
        
    }


}

