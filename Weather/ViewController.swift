//
//  ViewController.swift
//  Weather
//
//  Created by Kartik on 11/26/16.
//  Copyright © 2016 Kartik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var weatherResult: UILabel!
    @IBAction func weatherButton(_ sender: AnyObject) {
        if(cityText.text == ""){
            weatherResult.text = "Please enter a city name..!!"
        }else{
        cityName.text = cityText.text
        let cityname = cityText.text?.replacingOccurrences(of: " ", with: "-")
        let weatherurl = "http://www.weather-forecast.com/locations/"+cityname!+"/forecasts/latest"
        guard let myurl = URL(string: weatherurl)else{
            weatherResult.text = "Enter a valid city..!!"
            return
        }
        do{
            let htmlString = try String(contentsOf: myurl)
            //print(htmlString)
            let webDataArray = htmlString.components(separatedBy: "Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
            if((webDataArray.count) > 0){
                let weatherDataArray = webDataArray[1].components(separatedBy: "</span>")
                let weatherSummary = weatherDataArray[0].replacingOccurrences(of: "&deg;", with: "")
                weatherResult.text = weatherSummary
                //print(weatherSummary)
            }
            
        }catch _{
            weatherResult.text = "Enter a valid city..!!"        }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        let weatherurl = "http://www.weather-forecast.com/locations/Greensboro/forecasts/latest"
        guard let myurl = URL(string: weatherurl)else{
            weatherResult.text = "Error..!!"
            //print("error")
            return
        }
        do{
            let htmlString = try String(contentsOf: myurl)
            //print(htmlString)
            let webDataArray = htmlString.components(separatedBy: "Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
            if((webDataArray.count) > 0){
                let weatherDataArray = webDataArray[1].components(separatedBy: "</span>")
                let weatherSummary = weatherDataArray[0].replacingOccurrences(of: "&deg;", with: "")
                weatherResult.text = weatherSummary
               
            }
            
        }catch _{
            weatherResult.text = "Error..!!"
            //print(error)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

