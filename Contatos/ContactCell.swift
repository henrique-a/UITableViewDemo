//
//  ContactCell.swift
//  Contatos
//
//  Created by Ada 2018 on 26/04/18.
//  Copyright © 2018 Academy. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.photo.layer.masksToBounds = false
        self.photo.layer.cornerRadius = self.photo.frame.size.width/2
        self.photo.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
