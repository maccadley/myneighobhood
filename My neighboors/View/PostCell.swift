//
//  PostCell.swift
//  My neighboors
//
//  Created by Admin on 18.07.2018.
//  Copyright © 2018 MaximMasov. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    //Outlets
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        postImg.layer.cornerRadius = 15
    }
    
    func configureCell(_ post:Post){
        titleLbl.text = post.title
        descLbl.text = post.postDesc
        postImg.image = DataService.instance.imageForPath(post.imagePath)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
