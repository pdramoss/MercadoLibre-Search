//
//  HeaderDetailTableViewCell.swift
//  SearchItems
//
//  Created by Pedro Ramos on 21/11/21.
//

import UIKit

class HeaderDetailTableViewCell: UITableViewCell {

    @IBOutlet private weak var imageDetailView: UIImageView!
    @IBOutlet private weak var titleDetailLabel: UILabel!
    @IBOutlet private weak var priceDetailLabel: UILabel!
    @IBOutlet private weak var stackView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(_ viewModel: DetailViewModel) {
        titleDetailLabel.text = viewModel.title
        priceDetailLabel.text = viewModel.priceCurrencyText
        setupImage(viewModel.imageURL)
        stackView.layer.cornerRadius = 15
        stackView.layer.shadowColor = UIColor.black.cgColor
        stackView.layer.shadowOpacity = 1
        stackView.layer.shadowOffset = .zero
        stackView.layer.shadowRadius = 5
    }
    
    private func setupImage(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let imageData: Data = try Data(contentsOf: url)
                DispatchQueue.main.async {
                    self.imageDetailView.image = UIImage(data: imageData)
                    self.imageDetailView.contentMode = .scaleAspectFit
                }
            } catch {
                Logger.error("ERROR LOAD IMAGE: \(error)")
            }
        }
    }
    
}
