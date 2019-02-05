//
//  OnboardingCollectionViewCell.swift
//  Challenge
//
//  Created by Rafael Lucena on 1/23/19.
//  Copyright © 2019 Rafael. All rights reserved.
//

import UIKit

struct OnboardingCollectionViewCellModel {
    var title: String?
    var description: String?
    var imageName: String?
    var button: Bool?
    
    init(title: String, description: String, imageName: String,button: Bool?) {
        self.title = title
        self.description = description
        self.imageName = imageName
        self.button = button
    }
}

class OnboardingCollectionViewCell: UICollectionViewCell {
    // MARK: IBOutlets Variables
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var button: UIButton!
    // MARK: Model Variables
    var model: OnboardingCollectionViewCellModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func populate(model: OnboardingCollectionViewCellModel) {
        self.model = model
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        button.isHidden = model.button!
        
        if let imageName = model.imageName {
            backgroundImage.image = UIImage(named: imageName)
        }
    }
}
