//
//  OnboardingCollectionViewCell.swift
//  MEO1
//
//  Created by Thành Mai on 12/06/2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionReusableView {
    @IBOutlet weak var DecsLabel: UILabel!
    @IBOutlet weak var TitleLable: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(data: OnboardingModel) {
        DecsLabel.text = data.description
        TitleLable.text = data.title
        avatarImageView.image = UIImage(named: data.logo)
    }
    
}
