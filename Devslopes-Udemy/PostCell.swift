//
//  PostCell.swift
//  Devslopes-Udemy
//
//  Created by Emmanuel Darmon on 25/03/2016.
//  Copyright © 2016 Emmanuel Darmon. All rights reserved.
//

import UIKit
import Alamofire

class PostCell: UITableViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var showcaseImg: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var likesLbl: UILabel!
    
    var post: Post!
    var request: Request?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func drawRect(rect: CGRect) {
        profileImg.layer.cornerRadius = profileImg.frame.size.width / 2
        profileImg.clipsToBounds = true
        
        showcaseImg.clipsToBounds = true
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(post: Post, img: UIImage?) {
        self.post = post
        
        self.descriptionText.text = post.postDescription
        self.likesLbl.text = "\(post.likes)"
        
        if post.imageURL != nil {
            
            if img != nil {
                self.showcaseImg.image = img
                
        } else {
                
            request = Alamofire.request(.GET, post.imageURL!).validate(contentType: ["image/*"]).response(completionHandler: { request, response, data, err in
                
                if err == nil {
                    let img = UIImage(data: data!)!
                    self.showcaseImg.image = img
                    FeedVC.imageCash.setObject(img, forKey: self.post.imageURL!)
                }
                
            })
        }
        
        } else {
            self.showcaseImg.hidden = true
        }
        
    }

}
