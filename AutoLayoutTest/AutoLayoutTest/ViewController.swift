import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let labelOne = UILabel()
        labelOne.translatesAutoresizingMaskIntoConstraints = false
        labelOne.backgroundColor = UIColor.yellow
        labelOne.text = "WHICH"
        labelOne.font = UIFont.boldSystemFont(ofSize: 20)
        labelOne.textAlignment = NSTextAlignment.center
        labelOne.sizeToFit()
        
        let labelTwo = UILabel()
        labelTwo.translatesAutoresizingMaskIntoConstraints = false
        labelTwo.backgroundColor = UIColor.orange
        labelTwo.text = "ONE"
        labelTwo.font = UIFont.boldSystemFont(ofSize: 20)
        labelTwo.textAlignment = NSTextAlignment.center
        labelTwo.sizeToFit()
        
        let labelThree = UILabel()
        labelThree.translatesAutoresizingMaskIntoConstraints = false
        labelThree.backgroundColor = UIColor.magenta
        labelThree.text = "DO"
        labelThree.font = UIFont.boldSystemFont(ofSize: 20)
        labelThree.textAlignment = NSTextAlignment.center
        labelThree.sizeToFit()
        
        let labelFour = UILabel()
        labelFour.translatesAutoresizingMaskIntoConstraints = false
        labelFour.backgroundColor = UIColor.cyan
        labelFour.text = "YOU"
        labelFour.font = UIFont.boldSystemFont(ofSize: 20)
        labelFour.textAlignment = NSTextAlignment.center
        labelFour.sizeToFit()
        
        let labelFive = UILabel()
        labelFive.translatesAutoresizingMaskIntoConstraints = false
        labelFive.backgroundColor = UIColor.systemMint
        labelFive.text = "LIKE?"
        labelFive.font = UIFont.boldSystemFont(ofSize: 20)
        labelFive.textAlignment = NSTextAlignment.center
        labelFive.sizeToFit()
        
        view.addSubview(labelOne)
        view.addSubview(labelTwo)
        view.addSubview(labelThree)
        view.addSubview(labelFour)
        view.addSubview(labelFive)
        
        /*
        //Auto Layout VFL code
         
        let viewsDictionary = ["labelOne":labelOne, "labelTwo":labelTwo, "labelThree":labelThree, "labelFour":labelFour, "labelFive":labelFive]
        
        for label in viewsDictionary.keys {
            view.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|", options: [], metrics: nil, views: viewsDictionary))
        }
        
        let metrics = ["labelHeight": 80]
        view.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: "V:|[labelOne(labelHeight@999)]-[labelTwo(labelOne)]-[labelThree(labelOne)]-[labelFour(labelOne)]-[labelFive(labelOne)]->=10-|", options: [], metrics: metrics, views: viewsDictionary))
        // @999 assigns priority to a given constraint, using (labelOne) makes other labels the same height.
        */
        
        //Auto Layout anchors
        
        var previous: UILabel?
        
        for label in [labelOne, labelTwo, labelThree, labelFour, labelFive] {
            //label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true //same width as our main view
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            
            label.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2, constant: -10).isActive = true
            
            if let previous = previous {
                   // previous label – create a height constraint
                   label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
               } else {
                   // push the first label away from the top of the safe area
                   label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
               }

               // set the previous label to be the current one, for the next loop iteration
               previous = label
        }
        
    }


}

