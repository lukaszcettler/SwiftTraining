import UIKit

class TableViewController: UITableViewController {
    
    var websites = ["onet.pl","apple.com","wp.pl","hackingwithswift.com"]
    var websitesNames = ["Onet", "Apple", "Wirtualna Polska", "Hacking with Swift"]
      

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id", for: indexPath)
        cell.textLabel?.text = websitesNames[indexPath.row]
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        cell.detailTextLabel?.text = websites[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "websiteViewer") as? ViewController{
            let index = indexPath.row
            vc.webIndex = index
            vc.websites = websites
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    

}
