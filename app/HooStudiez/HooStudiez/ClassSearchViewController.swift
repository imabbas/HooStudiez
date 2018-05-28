//
//  ClassSearchViewController.swift
//  HooStudiez
//
//  Created by Dhillon, Karanvir (Karan) (ksd9tr) on 4/16/18.
//  Copyright © 2018 Abbas, Aadil (aa4zw). All rights reserved.
//

import UIKit

class ClassSearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableVIew: UITableView!
    
    var dataList = [ClassItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVIew.delegate = self
        tableVIew.dataSource = self
        searchBar.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let searchText = searchBar.text as! String
        var classes = [ClassItem]()
        
        if (searchText != "") {
            self.dataList.removeAll()
            var searchArr = searchText.split(separator: " ")
            if (searchArr.count == 2) {
                let url = URL(string: "http://54.146.186.158:8000/api/class/\(searchArr[0])/\(searchArr[1])/")
                URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
                    guard let data = data, error == nil else { return }
                    
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
                        let success = json["success"] as! Bool
                        if (success) {
                            var courses = json["payload"] as? NSArray
                            for course in courses! {
                                var c = course as! [String:Any]
                                var name = c["name"] as! String
                                var dpt = c["dpt"] as! String
                                var num = c["num"] as! String
                                var professor = c["professor"] as! String
                                var dptNum = dpt + " " + num
                                var parsedClass = ClassItem(name: name, professor: professor, dptNumber: dptNum)
                                print(name, dpt, num, professor)
                                self.dataList.append(parsedClass)
                            }
                        }
                    } catch let error as NSError {
                        print(error)
                    }
                }).resume()
            }
        }
        print(self.dataList)
        
        self.tableVIew.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ClassItemTableCell", for : indexPath) as? ClassTableViewCell else {
            fatalError("The dequeued cell is not an instance of ClassItemTableCell")
        }
        
        let classItem = self.dataList[indexPath.row]
        
        cell.className?.text = classItem.name
        cell.dptNumber?.text = classItem.dptNumber
        cell.professor?.text = classItem.professor
        
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
