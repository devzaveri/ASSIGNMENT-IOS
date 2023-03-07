//
//  ViewControllerforData.swift
//  API Assignment
//
//  Created by promact on 06/03/23.
//

import UIKit
struct jsonStructs:Decodable {
    let fact:String?
    let length:Int?
}


class ViewControllerforData: UIViewController {

    var datas = [NameOfApi]()
    var arrData:jsonStructs?
    
    @IBOutlet weak var tableViewForData: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fetchData()
    }
    
    func fetchData() {
        let url = URL(string: "https://api.publicapis.org/entries")
        let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: {
            (data , response , error) in

            guard let data = data , error == nil else
            {
                print("error")
                return
            }

            var apiData:arr?
            do {
                apiData = try JSONDecoder().decode(arr.self, from: data)
            }
            catch {
                print("error \(error)")
            }

            self.datas = apiData!.entries
            print(self.datas)
            DispatchQueue.main.async {
                self.tableViewForData.reloadData()
            }

        })
        dataTask.resume()
    }
    
    func getData(){
        let url = URL(string: "https://api.publicapis.org/entries")
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data , response , error) in
            
            do{
                if error == nil {
                    self.arrData = try JSONDecoder().decode(jsonStructs.self, from: data!)
                    print(self.arrData!)
                }
            }catch{
                print("error")
            }
            
            
            
            
        }
        ).resume()
    }

}






extension ViewControllerforData: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewForData.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! addDataTableViewCell
        
        if datas[indexPath.row].Description != nil {
            cell.lbl2.text = datas[indexPath.row].Description!
        } else {
            cell.lbl2.text = "empty"
        }
        
        cell.lbl1.text = datas[indexPath.row].API
        
        return cell
    }
 
}
