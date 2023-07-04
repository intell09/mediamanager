//
//  MediaItemDetailViewController.swift
//  MediaManager
//
//  Created by russell gadsden on 3/23/23.
//

import UIKit

class MediaItemDetailViewController: UIViewController {
    
    // Mark _ Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var markAsWatchedButton: UIButton!
    @IBOutlet weak var deleteMediaItemButton: UIButton!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var addWatchReminderButton: UIButton!
    @IBOutlet weak var addToFavoritesButton: UIButton!
    
    // MARK: Properties
    var mediaItem: MediaItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
    }
    
    func setupViews() {
        guard let mediaItem = mediaItem else {
            return
        }
        
        self.titleLabel.text = mediaItem.title
        self.ratingLabel.text = String(mediaItem.rating)
        self.releaseYearLabel.text = "Released in \(mediaItem.year)"
        self.descriptionTextView.text = mediaItem.itemDescription
        descriptionTextView.isEditable = false
        
        if mediaItem.mediaType == "Movie" {
            self.deleteMediaItemButton.setTitle("Delete Movie", for: .normal)
        } else {
            self.deleteMediaItemButton.setTitle("Delete TV Show", for: .normal)
        }
        
        if mediaItem.isFavorite {
            self.addToFavoritesButton.setTitle("Remove From Favorites", for: .normal)
        } else {
            self.addToFavoritesButton.setTitle("Add To Favorites", for: .normal)
        }
        
        if mediaItem.wasWatched {
            self.markAsWatchedButton.setTitle("Mark As Unwatched", for: .normal)
        } else {
            self.markAsWatchedButton.setTitle("Mark As Watched", for: .normal)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMediaItemDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let destination = segue.destination as! MediaItemDetailViewController
            destination.mediaItem = items[indexPath.row]
        }
    }
    
}
