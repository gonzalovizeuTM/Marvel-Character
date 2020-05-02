//
//  CharacterTVC.swift
//  Marvel Character
//
//  Created by Gonzalo Vizeu on 22/04/2020.
//  Copyright © 2020 Gonzalo Vizeu. All rights reserved.
//

import UIKit

protocol CharacterTVCDelegate: class {
    func didSelectCell(with id: Int)
}

class CharacterTVC: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageCharacter: UIImageView!
    
    weak var delegate: CharacterTVCDelegate?
    var model: CharactersList.DataRawValue?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func configureCell(model: CharactersList.DataRawValue){
        self.nameLabel.text = model.name
        let image = model.thumbnail
        self.imageCharacter.getImage(from: image?.path ?? "", fileExtension: image?.thumbnailExtension ?? "", rounded: imageCharacter.frame.height/2)
        
        self.model = model
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if self.isSelected {
            guard let id = model?.id else { return }
            self.delegate?.didSelectCell(with: id)
        }
        
       
    }
    

}
