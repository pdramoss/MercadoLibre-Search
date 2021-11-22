//
//  HomeTableViewCell.swift
//  SearchItems
//
//  Created by Pedro Ramos on 20/11/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var imageItemView: UIImageView!
    @IBOutlet private weak var titleItemLabel: UILabel!
    @IBOutlet private weak var priceItemLable: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(_ item: HomeViewModel.Item) {
        titleItemLabel.text = item.title
        priceItemLable.text = item.priceCurrencyText
        setupImage(item.imageURL)
    }
    
    private func setupImage(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let imageData: Data = try Data(contentsOf: url)
                DispatchQueue.main.async {
                    self.imageItemView.image = UIImage(data: imageData)
                    self.imageItemView.contentMode = .scaleAspectFit
                }
            } catch {
                Logger.error("ERROR LOAD IMAGE: \(error)")
            }
        }
    }
}
