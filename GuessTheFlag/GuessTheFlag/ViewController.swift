import UIKit

class ViewController: UIViewController {
      
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var questionsAsked = 0
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        settingUIView()
        askQuestion()
        
    }
    
    func settingUIView(){
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.darkGray.cgColor
        
        button2.layer.borderWidth = 1
        button2.layer.borderColor = UIColor.darkGray.cgColor
        
        button3.layer.borderWidth = 1
        button3.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    func askQuestion(action: UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Score \(score)".uppercased())
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        
        questionsAsked += 1
    }
    
  
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String

        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            checkQuestion(title: title)
        } else {
            title = "Wrong, that's the flag of \(countries[sender.tag].uppercased())"
            score -= 1
            checkQuestion(title: title)
        }
        
        
    }
    
    func checkQuestion(title: String) {
        if questionsAsked == 10 {
                    let ac = UIAlertController(title: title, message: "You have answered 10 questions. \nYour final score is: \(score)", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "Start Over", style: .default, handler: askQuestion))
                    present(ac, animated: true)
                    score = 0
                    questionsAsked = 0
                } else {
                    let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
                    present(ac, animated: true)
                }
    }
      
}

