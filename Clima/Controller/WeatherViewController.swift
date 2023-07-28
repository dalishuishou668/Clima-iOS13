

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    
    @IBOutlet weak var searchTextField: UITextField!
    
    
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true) // dismiss keyboard
        print(searchTextField.text!)
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // text field should report back to view controller, self refers the current view controller
        searchTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        // when return button pressed on the keyboard
        print(searchTextField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }else{
            textField.placeholder = "Type somthing"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchTextField.text = ""
    }


}

