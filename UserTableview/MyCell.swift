//
//  MyCell.swift
//  UserTableview
//
//
//

import Foundation
import UIKit
import AVFoundation


class MyCell: UITableViewCell {
    
    @IBOutlet weak var AgeLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var ViewCella: UIView!
    @IBOutlet weak var FavButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ViewCella.layer.cornerRadius = 20
        FavButton.imageView?.contentMode = .scaleAspectFit
    }
    
    @IBAction func FavouriteButt(_ sender: UIButton) {
        if FavButton.currentImage == UIImage(systemName: "star")?.withRenderingMode(.alwaysOriginal) {
        let imgFav = UIImage(systemName: "star.fill")
        let b = imgFav?.withRenderingMode(.alwaysOriginal)
        FavButton.setImage(b, for: .normal)
        } else {
            let imgFav = UIImage(systemName: "star")
            let b = imgFav?.withRenderingMode(.alwaysOriginal)
            FavButton.setImage(b, for: .normal)
        }
    }
    
    
}
