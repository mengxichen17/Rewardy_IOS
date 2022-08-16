//
//  CustomCell.swift
//  Rewardy
//
//  Created by Mengxi Chen on 8/11/22.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var cardButton: UIButton!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var cardView: UIView! //may not need
    
    let cardInfo = K.cardData
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //cardButton.setTitle("Select Card", for: .normal)
        setPopupButton()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setPopupButton() {
//        let optionClosure = { (action: UIAction) in
//            if let card = self.cardButton.currentTitle {
//                self.resultLabel.text = K.cardData.
//            }
        let optionClosure = { (action: UIAction) in
            
        }
        
        func createAction() -> [UIAction] {
            var children = [UIAction]()
            for card in K.cardData {
                children.append(UIAction(title: card.name, /*image: ,*/ state: .off, handler: {
                    (action: UIAction) in
                    self.resultLabel.text = card.reward
                    self.seasonLabel.text = card.season
                }))
            }
            return children
        }
        
        self.cardButton.menu = UIMenu(title: "Card List", options: .displayInline,  children: createAction())
        self.cardButton.showsMenuAsPrimaryAction = true
        self.cardButton.changesSelectionAsPrimaryAction = true
    }
    
}
