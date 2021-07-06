//
//  HomeTVC.swift
//  MVVMDemo
//
//  Created by Sunish Ram on 23/05/21.
//

import UIKit

class HomeTVC: UITableViewCell {

   // var arrData = [JsonModel]()
    
    
   // var arrData = [ServiceData]()
    
    @IBOutlet weak var lblName: UILabel!
    
//    var modelUser: HomeServiceModel?{
//        didSet{
//            userConfiguration()
//        }
//    }
    
    
    var modelUser: HomeServiceModel?{
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
    
    func configureCell(withDictData dictData: [HomeServiceModel] , forIndxPath indxPath : IndexPath)
    {
        //print("dictDatasunish:\(arrData)")
    }
    
    func userConfiguration(){
        self.lblName.text = modelUser?.service_name
    }

}
