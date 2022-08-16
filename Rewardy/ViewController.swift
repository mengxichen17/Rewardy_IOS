//
//  ViewController.swift
//  Rewardy
//
//  Created by Mengxi Chen on 8/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cardTableView: UITableView!
    
    var row = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cardTableView.delegate = self
        cardTableView.dataSource = self
    }

    @IBAction func addCardPressed(_ sender: UIBarButtonItem) {
        row += 1
        cardTableView.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return row
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! CustomCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete && indexPath.row < row) {
//            row -= 1
//            tableView.reloadData()
            tableView.beginUpdates()
            row -= 1
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
        
    }
    

}
