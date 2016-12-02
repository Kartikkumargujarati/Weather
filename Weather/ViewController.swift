//
//  ViewController.swift
//  Weather
//
//  Created by Kartik on 11/26/16.
//  Copyright © 2016 Kartik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var maxMinTemp: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var weatherResult: UILabel!
    @IBAction func weatherButton(_ sender: AnyObject) {
        if(cityText.text == ""){
            weatherResult.text = "Please enter a city name..!!"
            cityName.text = ""
            maxMinTemp.text = ""
        }else{
        cityName.text = cityText.text
        let cityname = cityText.text?.replacingOccurrences(of: " ", with: "-")
        let weatherurl = "http://www.weather-forecast.com/locations/"+cityname!+"/forecasts/latest"
        guard let myurl = URL(string: weatherurl)else{
            cityName.text = ""
            maxMinTemp.text = ""
            weatherResult.text = "Enter a valid city..!!"
            return
        }
        do{
            let htmlString = try String(contentsOf: myurl)
            let webDataArray = htmlString.components(separatedBy: "Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
            if((webDataArray.count) > 0){
                let weatherDataArray = webDataArray[1].components(separatedBy: "</span>")
                let weatherSummary = weatherDataArray[0].replacingOccurrences(of: "&deg;", with: "")
                weatherResult.text = "Summary: "+weatherSummary
                let maxArray = weatherSummary.components(separatedBy: "(max ")
                let maxtemp = maxArray[1].components(separatedBy: "C")
                let minArray = weatherSummary.components(separatedBy: " min ")
                let mintemp = minArray[1].components(separatedBy: "C")
                let mTemp = "\(maxtemp[0]) C / "
                let mMTemp = "\(mintemp[0]) C"
                maxMinTemp.text = mTemp+mMTemp
            }
            
        }catch _{
            cityName.text = ""
            maxMinTemp.text = ""
            weatherResult.text = "Enter a valid city..!!"        }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        let weatherurl = "http://www.weather-forecast.com/locations/Greensboro/forecasts/latest"
        guard let myurl = URL(string: weatherurl)else{
            cityName.text = ""
            maxMinTemp.text = ""
            weatherResult.text = "Error..!!"
            return
        }
        do{
            let htmlString = try String(contentsOf: myurl)
            let webDataArray = htmlString.components(separatedBy: "Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
            if((webDataArray.count) > 0){
                let weatherDataArray = webDataArray[1].components(separatedBy: "</span>")
                let weatherSummary = weatherDataArray[0].replacingOccurrences(of: "&deg;", with: "")
                weatherResult.text = "Summary: "+weatherSummary
                let maxArray = weatherSummary.components(separatedBy: "(max ")
                let maxtemp = maxArray[1].components(separatedBy: "C")
                let minArray = weatherSummary.components(separatedBy: " min ")
                let mintemp = minArray[1].components(separatedBy: "C")
                let mTemp = "\(maxtemp[0]) C / "
                let mMTemp = "\(mintemp[0]) C"
                maxMinTemp.text = mTemp+mMTemp

            }
            
        }catch _{
            cityName.text = ""
            maxMinTemp.text = ""
            weatherResult.text = "Error..!!"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

