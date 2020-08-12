//
//  MovieTableViewCell.swift
//  Movies
//
//  Created by Vinitha Vijayan on 5/26/19.
//  Copyright © 2019 Vinitha Vijayan. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var posterImageView: CustomImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: Movie? {
        didSet {
            movieTitleLabel.text = movie?.title
            overviewLabel.text = movie?.overview
            setupPosterImage()
        }
    }
    
    func setupPosterImage() {
        if let url = movie?.poster_path {
            posterImageView.loadImageViewWithUrl(urlString: url)
        } else {
            posterImageView.image = UIImage(named: "defaultImage")
        }
    }
}
