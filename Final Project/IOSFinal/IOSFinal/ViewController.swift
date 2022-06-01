//
//  ViewController.swift
//  IOSFinal
//
//  Created by Yeldos on 25.05.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var result: Result?
    
    public let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJson()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        // print(result?.data.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let text = result?.data[indexPath.section].name
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController{
            vc.namerr = result?.data[indexPath.section].name ?? "error"
            vc.agerr = result?.data[indexPath.section].age ?? 18
            vc.heightrr = result?.data[indexPath.section].height ?? 180
            vc.profrr = result?.data[indexPath.section].proffession ?? "18"
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print(result?.data.count)
        return result?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let result = result {
            return 1
        }
        return 0
    }
    
    public func parseJson(){
        guard let path = Bundle.main.path(forResource: "inform", ofType: "json") else{
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do{
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Result.self, from: jsonData)
            return
        }
        catch{
            print("Error \(error)")
        }
    }
}

