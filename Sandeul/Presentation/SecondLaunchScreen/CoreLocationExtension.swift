//
//  CoreLocationExtension.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/07.
//

import UIKit
import CoreLocation
import CoreLocation

extension SecondLaunchViewController : CLLocationManagerDelegate {
    
    //called when location is updated - get currentLocation & currentRegion
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.last?.coordinate {
            currentLatitude = coordinate.latitude
            currentLongtitude = coordinate.longitude
        }
        
        let findLocation: CLLocation = CLLocation(latitude: currentLatitude!, longitude: currentLongtitude!)
        let geoCoder: CLGeocoder = CLGeocoder()
        let local: Locale = Locale(identifier: "Ko-kr") // Korea
        geoCoder.reverseGeocodeLocation(findLocation, preferredLocale: local) { [self]  (place, error) in
            
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
    
    //Request LocationAuthorization
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
            switch status {
            case .authorizedAlways, .authorizedWhenInUse:
                print("GPS 권한 설정됨")
              //  self.locationManager.startUpdatingLocation() // 중요!
            case .restricted, .notDetermined:
                print("GPS 권한 설정되지 않음")
                self.locationManager.requestWhenInUseAuthorization()
            case .denied:
                print("GPS 권한 요청 거부됨")
                getUserPermisson()
            default:
                print("GPS: Default")
            }
        }
    
    
    func getUserPermisson(){
        
        let requestAlert = UIAlertController(title: "위치정보 이용", message: "'근처의 산' 서비스를 이용할 수 없습니다.기기의 '설정 > 개인정보보호'에서 위치서비스를 켜주세요 ", preferredStyle: .alert)
        let goSetting = UIAlertAction(title: "설정으로 이동", style: .destructive) { _
            in
            if let appSetting = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSetting)
            }
        }
        let cancel = UIAlertAction(title: "서비스 이용 안함", style: .default) { _ in
           
            self.mainView.makeToast("'같은 지역에 있는 산'은 \n '경기도' 기준으로 보여집니다", duration: 1.5,
                                    point: CGPoint(x: self.mainView.center.x, y: 250),
                                   title: "위치서비스 거부",
                                   image: nil,
                                    style:  self.toastStyle(),
                                   completion: nil)
            
        }
        
        requestAlert.addAction(goSetting)
        requestAlert.addAction(cancel)
        
        present(requestAlert, animated: true)
        
        
    }
    
    func locationSetup() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() //권한 요청
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    
    
    
}