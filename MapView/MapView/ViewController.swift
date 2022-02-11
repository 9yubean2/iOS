//
//  ViewController.swift
//  MapView
//
//  Created by 이규빈 on 2022/01/12.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var mapView: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //정확도 최고로 설정
        locationManager.requestWhenInUseAuthorization() //위치 데이터를 추적하기 위해 사용자에게 승인을 요구
        locationManager.startUpdatingLocation() // 위치 업데이트를 시작
        mapView.showsUserLocation = true // 위치 보기
    }

    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span :Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        mapView.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span :Double, title strTitle: String, subtitle strSubtitle: String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        mapView.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first //pm에 placemarks의 첫부분만 할당
            let country = pm!.country //나라 값을 country에 대입
            var address:String = country! //address에 country상수 값 대입
            if pm!.locality != nil { //pm상수에 지역값이 존재하면 address에 추가
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil { //pm상수에 도로값이 존재하면 address에 추가
                address += " "
                address += pm!.thoroughfare!
            }
            
            //레이블에 텍스트 표시
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
            
        })
        locationManager.stopUpdatingLocation() //위치 업데이트 정지
    }
    
    @IBAction func changeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            //현재위치
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
        }
        else if sender.selectedSegmentIndex == 1 {
            //서울여대
            setAnnotation(latitudeValue: 37.628274, longitudeValue: 127.090489, delta: 0.001, title: "서울여자대학교", subtitle: "서울특별시 노원구 화랑로 621")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "서울여자대학교"
        }
        else if sender.selectedSegmentIndex == 2{
            //애플스토어
            setAnnotation(latitudeValue: 37.520818, longitudeValue: 127.022684, delta: 0.001, title: "Apple 가로수길", subtitle: "서울특별시 강남구 가로수길 43")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "Apple 가로수길"
        }
        else if sender.selectedSegmentIndex == 3{
            //애플스토어
            setAnnotation(latitudeValue: 37.549198471676604, longitudeValue: 126.83960819918221, delta: 0.001, title: "우리 집", subtitle: "서울특별시 강서구 강서로 266")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "우리 집"
        }
    }
    
    
}

