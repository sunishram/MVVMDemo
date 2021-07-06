//
//  ViewController2.swift
//  MVVMDemo
//
//  Created by Sunish Ram on 23/05/21.
//

import UIKit

class ViewController2: BlissGenXBaseViewC {

    var viewModelUser = UserViewModel()
    
    @IBOutlet weak var tblService: UITableView!
    
    private var dictParams   =  ["" : ""]
    
    let dictImg:[String : Any] = ["image" : UIImage(),
                                  "imageName" : "uploaded_file"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelUser.vc2 = self
        viewModelUser.callServicesWebService(withDictParams: dictParams, dictImg: dictImg, subView: self.view)
    }
}
extension ViewController2 : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return viewModelUser.jsonModelDataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblService.dequeueReusableCell(withIdentifier: HomeTVC2.cellIdentifier(), for: indexPath) as! HomeTVC2
        cell.modelUser = viewModelUser.jsonModelDataArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
