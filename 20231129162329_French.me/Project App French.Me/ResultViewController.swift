//
//  ResultViewController.swift
//  Project App French.me
//
//  Created by english on 2023-11-27.
//

import UIKit

// To implement the tableView you need to invoke protocols :
// UITableViewDelegate, UITableViewDataSource


class ResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    
    @IBOutlet weak var tableViewShowResult: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // connecting the ResultViewController class to use the TableView protocols
        //tableViewShowResult.dataSource = self
        //tableViewShowResult.delegate = self
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableViewShowResult.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        // to get the row number, you can access indexPath.row
        
        var cellContent = cell.defaultContentConfiguration()
        cellContent.text = VerbProvider.conjugation[indexPath.row]
        cell.contentConfiguration = cellContent
        
        return cell
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
