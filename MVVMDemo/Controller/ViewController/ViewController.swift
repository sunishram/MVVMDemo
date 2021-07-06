//
//  ViewController.swift
//  MVVMDemo
//
//  Created by Sunish Ram on 09/05/21.
//

import UIKit

class ViewController: BlissGenXBaseViewC {

    
    var viewModelUser = UserViewModel()
    
    @IBOutlet weak var tblHome: UITableView!
    //    @IBOutlet weak var txtFPassword: UITextField!
//    @IBOutlet weak var txtFieldEmail: UITextField!
    
   
    
    private var dictParams   =  ["" : ""]
    
    let dictImg:[String : Any] = ["image" : UIImage(),
                                  "imageName" : "uploaded_file"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModelUser.simpleClosure()
        viewModelUser.vc = self
        viewModelUser.callServicesWebService(withDictParams: dictParams, dictImg: dictImg, subView: self.view)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear_sunish")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear_sunish")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear_sunish")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear_sunish")
    }
    
    @IBAction func tapToCallProtocallFunction(_ sender: UIBarButtonItem) {
    }
    
}
extension ViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModelUser.homeServiceDataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblHome.dequeueReusableCell(withIdentifier: HomeTVC.cellIdentifier(), for: indexPath) as! HomeTVC
       // cell.configureCell(withDictData: viewModelUser.dataDict[indexPath.row], forIndxPath: indexPath)
        cell.modelUser = viewModelUser.homeServiceDataArr[indexPath.row]
        
        
        
//        cell.lblName.text = viewModelUser.arrData[indexPath.row].service_name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
