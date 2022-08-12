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
        setPopupButton()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setPopupButton() {
        let optionClosure = { (action: UIAction) in
            if let card = self.cardButton.currentTitle {
                self.resultLabel.text = self.cardInfo[card]
            }
    
        }
        
        func createAction() -> [UIAction] {
            var children = [UIAction]()
            for card in cardInfo.keys{
                children.append(UIAction(title: card, /*image: ,*/ state: .off, handler: optionClosure))
            }
            return children
        }
        
        self.cardButton.menu = UIMenu(title: "Card List", children: createAction())
//        self.cardButton.showsMenuAsPrimaryAction = true
        self.cardButton.changesSelectionAsPrimaryAction = true
    }
    
}
