//
//  ViewController.swift
//  Examen iOS
//
//  Created by Tardes on 27/01/2025.
//

import UIKit

class MainVC: UIViewController, UITableViewDataSource,UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    var list: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
        findMovieBy(name: "marvel")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieVCell
        let movie = list[indexPath.row]
        cell.render(movie: movie)
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let query = searchBar.text { // If there is text in the search bar...
            // Call the function to find superheroes by the entered name.
            findMovieBy(name: query)
        } else {
            findMovieBy(name: "a")
        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        list = []
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if (segue.identifier == "navigateToDetail") {
           let detailViewController = segue.destination as! DetailVC
           let indexPath = tableView.indexPathForSelectedRow!
           let movie = list[indexPath.row]
           detailViewController.movie = movie
           tableView.deselectRow(at: indexPath, animated: true)
           }
       }

    func findMovieBy(name: String) {
        Task {
            do {
                list = try await MovieProvider.findMovieBy(name: name)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error)
            }
        }
    }
}

