//
//  ArticleCell.swift
//  MarbleTest
//
//  Created by ShuichiNagao on 6/28/16.
//  Copyright © 2016 ShuichiNagao. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var user: UILabel!
    @IBOutlet weak var dexcription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(article: Article){
        self.title.text = article.title
        self.date.text = String(article.modified)
        self.user.text = article.userData.userName
        self.dexcription.text = article.body
        if let thumbnailUrl: String = article.thumb {
            if let data = NSData(contentsOfURL: NSURL(string: thumbnailUrl)!) {
                self.thumbnail.image = UIImage(data: data)
            }
        }
    }

}
