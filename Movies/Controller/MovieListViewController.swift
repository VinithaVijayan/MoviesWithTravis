//
//  MovieListViewController.swift
//  Movies
//
//  Created by Vinitha Vijayan on 5/26/19.
//  Copyright © 2019 Vinitha Vijayan. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    @IBOutlet weak var searchContainerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorLabel: UILabel!
    
    var searchController: UISearchController!
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = kAppTitle
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.backgroundColor = .clear
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search here..."
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        searchController.searchBar.returnKeyType = .done
        searchContainerView.addSubview(searchController.searchBar)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCellID")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchContainerView.frame.origin.x = 0
        searchContainerView.frame.size.width = view.frame.size.width
        searchController.searchBar.frame.size.width = searchContainerView.frame.size.width
    }
    
    // MARK: - Internal Methods
    
    func searchMovieWith(text: String) {
        self.errorLabel.isHidden = true
        
        if text.count > 0 {
            ApiService.sharedInstance.fetchMoviesWith(text: text) { (movies, error) in
                if let _ = error {
                    self.clearData()
                    self.errorLabel.text = "Some error occured, please try again"
                    self.errorLabel.isHidden = false
                } else if let moviesList = movies {
                    if moviesList.count > 0 {
                        self.updateData(movies: moviesList)
                        
                    } else {
                        self.clearData()
                        self.errorLabel.isHidden = false
                        self.errorLabel.text = "No movie found"
                    }
                }
            }
        }
    }
    
    func updateData(movies: [Movie]) {
        self.movies = movies
        self.tableView.reloadData()
    }
    
    func clearData() {
        if movies.count > 0 {
            movies.removeAll()
            tableView.reloadData()
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        view.setNeedsLayout()
        view.setNeedsUpdateConstraints()
    }
}

extension MovieListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            searchMovieWith(text: searchText)
        } else {
            self.errorLabel.isHidden = true
            clearData()
        }
    }
}

extension MovieListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.errorLabel.isHidden = true
        
        if let searchText = searchBar.text, !searchText.isEmpty {
            clearData()
        }
    }
}

extension MovieListViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: - TableViewDataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCellID", for: indexPath) as! MovieTableViewCell
        cell.movie = movies[indexPath.row]
        return cell
    }
    
    // MARK: - TableViewDelegate Methods
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
