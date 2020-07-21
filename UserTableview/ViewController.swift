//
//  ViewController.swift
//  UserTableview
//
//  
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    var arrayDefault = [UserDetails]()
    var arrayFavourite = [UserDetails]()
    var sec: [Int:[UserDetails]] = [:]
    var Default = UserDefaults.standard

    
    @IBOutlet weak var myTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTableview.dataSource = self
        self.myTableview.delegate = self
        
        DownloadJSON()
        
    }
    override func viewWillAppear(_ animated: Bool) {
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sec = [0 : arrayFavourite, 1 : arrayDefault]
        return (sec[section]?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataRef = arrayDefault[indexPath.row]
        let cel: MyCell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
        cel.NameLabel.text = dataRef.name
        cel.AgeLabel.text = dataRef.age
        
        let imgFav = UIImage(systemName: "star")
        let b = imgFav?.withRenderingMode(.alwaysOriginal)
        cel.FavButton.setImage(b, for: .normal)
        
        return cel
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func DownloadJSON() {
            let urlll = URL(string: "https://pastebin.com/raw/Wufivqmq")
            guard let downloadURL = urlll else { return }
            URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
                guard let data = data, error == nil, urlResponse != nil else {
                    print("something is wrong")
                    return
                }
                print("downloaded")
                do
                {
                    let decoder = JSONDecoder()
                    let downloadeduser = try decoder.decode(User.self, from: data)
                    self.arrayDefault.removeAll()
                    self.arrayDefault.append(contentsOf: downloadeduser.user)
                    DispatchQueue.main.async {
                        print("data saved")
                        self.myTableview.reloadData()
                    }
                } catch {
                    print(error)
                }
            }.resume()
    }
    
    @IBAction func RefreshButton(_ sender: Any) {
        // Here i wish to refresh the table view (so the current saved array) with the updated JSON
        // For example if i update the "Age" in the original JSON
        // But i don't want to lose the user preference for the "Favourite"
    }
    
    
}

