//
//  JsonSwifty4TVC.swift
//  MVVMDemo
//
//  Created by Sunish Ram on 24/05/21.
//

import UIKit

class JsonSwifty4TVC: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    var modelUser: ServiceData?{
        didSet{
            userConfiguration()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func userConfiguration(){
        self.lblName.text = modelUser?.service_name
    }


}
