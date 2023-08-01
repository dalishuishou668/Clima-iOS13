

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    
    var weatherManager = WeatherManager()
    
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
        // textfield trigger these methods, any txtfd can trigger below action if not specified
        if textField.text != ""{
            return true
        }else{
            textField.placeholder = "Type somthing"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text{
            weatherManager.fetchWeather(cityName: city)
        }
        
        searchTextField.text = ""
        
    }


}

