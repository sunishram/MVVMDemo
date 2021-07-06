//
//  JSON4SfwiftyVC.swift
//  MVVMDemo
//
//  Created by Sunish Ram on 24/05/21.
//

import UIKit

class JSON4SfwiftyVC: BlissGenXBaseViewC {

    var viewModelUser = UserViewModel()
    @IBOutlet weak var tblJson: UITableView!
    private var dictParams   =  ["" : ""]
    
    let dictImg:[String : Any] = ["image" : UIImage(),
                                  "imageName" : "uploaded_file"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelUser.vc3 = self
        viewModelUser.callServicesWebService(withDictParams: dictParams, dictImg: dictImg, subView: self.view)
    }
  
}
extension JSON4SfwiftyVC : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return viewModelUser.serviceDataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblJson.dequeueReusableCell(withIdentifier: JsonSwifty4TVC.cellIdentifier(), for: indexPath) as! JsonSwifty4TVC
        cell.modelUser = viewModelUser.serviceDataArr[indexPath.row]
     
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
