//
//  AddressDetailTableViewCell.swift
//  SearchItems
//
//  Created by Pedro Ramos on 21/11/21.
//

import UIKit

class AddressDetailTableViewCell: UITableViewCell {

    @IBOutlet private weak var stateDetailLabel: UILabel!
    @IBOutlet private weak var cityDetailLabel: UILabel!
    @IBOutlet private weak var availableQuantityLabel: UILabel!
    @IBOutlet private weak var soldQuantityLabel: UILabel!
    @IBOutlet private weak var acceptsMercadopagoLabel: UILabel!
    @IBOutlet private weak var shadowView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setup(_ viewModel: DetailViewModel) {
        stateDetailLabel.text = Language.DetailScreen.stateAddressDetail.localizableKey + viewModel.address.stateName
        cityDetailLabel.text = Language.DetailScreen.cityAddressDetail.localizableKey + viewModel.address.cityName
        availableQuantityLabel.text = Language.DetailScreen.availableQuantity.localizableKey + "\(viewModel.availableQuantity)"
        soldQuantityLabel.text = Language.DetailScreen.soldQuantity.localizableKey + "\(viewModel.soldQuantity)"
        acceptsMercadopagoLabel.text = (viewModel.acceptsMercadopago ? Language.DetailScreen.acceptsMercadopago : Language.DetailScreen.notAcceptsMercadopago).localizableKey
        shadowView.layer.cornerRadius = 15
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 1
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = 5
    }
}
