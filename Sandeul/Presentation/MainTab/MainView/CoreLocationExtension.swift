//
//  CoreLocationExtension.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/07.
//

import UIKit
import CoreLocation

extension MainViewController : CLLocationManagerDelegate {
    
    //called when location is updated
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.last?.coordinate {
            currentLatitude = coordinate.latitude
            currentLongtitude = coordinate.longitude
        }
        
        let findLocation: CLLocation = CLLocation(latitude: currentLatitude!, longitude: currentLongtitude!)
        let geoCoder: CLGeocoder = CLGeocoder()
        let local: Locale = Locale(identifier: "Ko-kr") // Korea
        geoCoder.reverseGeocodeLocation(findLocation, preferredLocale: local) { [self]  (place, error) in
            if let address: [CLPlacemark] = place {
               
            }
            
           if place?.last?.administrativeArea == nil {
               currentLocation = "경기도"
               
               self.mainView.makeToast("'같은 지역에 있는 산'은 \n '경기도' 기준으로 보여집니다", duration: 2,
                                       point: CGPoint(x: self.mainView.center.x, y: 250),
                                      title: "위치를 찾을 수 없음",
                                      image: nil,
                                       style: self.toastStyle(),
                                      completion: nil)
           } else {
               currentLocation = (place?.last?.administrativeArea)!
               print("currentLocation : \(currentLocation)")
           }
        }
        
    }
    
    
    
    
    
}
