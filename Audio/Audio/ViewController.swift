//
//  ViewController.swift
//  Audio
//
//  Created by 이규빈 on 2022/01/18.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {

    var audioPlayer : AVAudioPlayer! //AVAudio 인스턴스 변수
    var audioFile : URL! //재생할 오디오의 파일명 변수
    let MAX_VOLUME : Float = 10.0 // 최대볼륨, 실수형 상수
    var progressTimer : Timer! //타이머를 위한 변수
    
    let timePlayerSelector:Selector = #selector(ViewController.updatePlayTime)
    let timeRecordSelector:Selector = #selector(ViewController.updateRecordTime)
    
    @IBOutlet var pvProgressPlay: UIProgressView!
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblEndTime: UILabel!
    
    @IBOutlet var btnPlay: UIButton!
    @IBOutlet var btnPause: UIButton!
    @IBOutlet var btnStop: UIButton!
    
    
    @IBOutlet var slVolume: UISlider!
    
    @IBOutlet var btnRecord: UIButton!
    @IBOutlet var lblRecordTime: UILabel!
    
    var audioRecorder : AVAudioRecorder!
    var isRecordMode = false //녹음 모드
    
    @IBOutlet var imgStateImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        selectAudioFile()
        if !isRecordMode{ //재생모드일때
            initPlay()
            btnRecord.isEnabled = false
            lblRecordTime.isEnabled = false
        } else { //녹음모드일때
            initRecord()
        }
        
    }
    
    //재생 모드와 녹음 모드에 따라 다른 파일을 선택함
    func selectAudioFile() {
        if !isRecordMode{
            audioFile = Bundle.main.url(forResource: "audio_Sample", withExtension: "mp3")
        } else {
            let documentDirectory = FileManager.default.urls(for: (.documentDirectory), in: .userDomainMask) [0]
            audioFile = documentDirectory.appendingPathComponent("recordFile.m4a")
        }
    }
    
    //녹음 모드의 초기화
    func initRecord() {
        //재생 중이던 오디오 멈추고 녹음 시작
        let recordSettings = [
            AVFormatIDKey : NSNumber(value: kAudioFormatAppleLossless as UInt32),
            AVEncoderAudioQualityKey : AVAudioQuality.max.rawValue,
            AVEncoderBitRateKey : 320000,
            AVNumberOfChannelsKey : 2,
            AVSampleRateKey : 44100.0] as [String : Any]
        do {
            audioRecorder = try AVAudioRecorder(url: audioFile, settings: recordSettings)
        } catch let error as NSError {
             print("Error-initRecod : \(error)")
        }
        
        audioRecorder.delegate = self
        
        slVolume.value = 1.0 //슬라이더의 볼륨 초기화
        audioPlayer.volume = slVolume.value //audioPlayer 볼륨 slVolume 볼륨값으로 초기화 (1.0)
        pvProgressPlay.progress = 0 //프로그레스 바 진행율 초기화
            
        lblEndTime.text = convertNSTimeInterval2String(0)
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        
        setPlayButtons(false, pause: false, stop: false)
        
        //
        let session = AVAudioSession.sharedInstance()
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch let error as NSError {
            print(" Error-setCategory : \(error)")
        }
        do {
            try session.setActive(true)
        } catch let error as NSError {
            print("Error-setActive : \(error)")
        }
    }

    //재생 모드의 초기화
    func initPlay() {
        //오디오 재생을 초기화 하는 함수
        //오디오 파일이 없을 떄에 대비하여 do-try-catch문 사용
        do {
            //try 오류 발생 코드
            //오류가 발생하지 않으면 실행할 코드
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        } catch let error as NSError {//오류 패턴 1
            //처리 구문
            print("Error-initPlay : \(error)")
        }
        slVolume.maximumValue = MAX_VOLUME //최대 볼륨 값 초기화
        slVolume.value = 1.0 //슬라이더의 볼륨 초기화
        pvProgressPlay.progress = 0 //프로그레스 바 진행율 초기화
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.volume = slVolume.value //audioPlayer 볼륨 slVolume 볼륨값으로 초기화 (1.0)
        
        lblEndTime.text = convertNSTimeInterval2String(audioPlayer.duration)
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        
        setPlayButtons(true, pause: false, stop: false)
    }
    
    //재생, 일시정지, 정지 버튼을 활성화 또는 비활성화하는 함수
    func setPlayButtons(_ play:Bool, pause:Bool, stop:Bool) {
        btnPlay.isEnabled = play
        btnPause.isEnabled = pause
        btnStop.isEnabled = stop
    }
    
    //TimeInterval값을 받아서 00:00 형태로(String) 돌려보내는 함수
    func convertNSTimeInterval2String(_ time:TimeInterval) -> String {
        let min = Int(time/60) //time을 60으로 나눈 몫을 min에 할당
        let sec = Int(time.truncatingRemainder(dividingBy: 60)) //time을 60으로 나눈 나머지를 sec에 할당
        let strTime = String(format: "%02d:%02d", min, sec)
        return strTime
    }

    //재생 버튼을 클릭
    @IBAction func btnPlayAudio(_ sender: UIButton) {
        audioPlayer.play() //오디오 재생
        setPlayButtons(false, pause: true, stop: true) //play 버튼 비활성화, 나머지 버튼 활성화
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
        imgStateImage.image = UIImage(named: "play.png")
    }
    
    //재생시간을 레이블과 프로그레스바에 표시(0.1초 마다 호출)
    @objc func updatePlayTime() {
        lblCurrentTime.text = convertNSTimeInterval2String(audioPlayer.currentTime)
        pvProgressPlay.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
    }
    
    //일시정지 버튼을 클릭
    @IBAction func btnPauseAudio(_ sender: UIButton) {
        audioPlayer.pause()
        setPlayButtons(true, pause: false, stop: true)
        imgStateImage.image = UIImage(named: "pause.png")
    }
    
    //정지 버튼을 클릭
    @IBAction func btnStopAudio(_ sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        setPlayButtons(true, pause: false, stop: false)
        progressTimer.invalidate() //타이머 무효화
        imgStateImage.image = UIImage(named: "stop.png")
    }
    
    //볼륨 슬라이더 값을 audioPlayer.volume에 대입
    @IBAction func slChangeVolume(_ sender: UISlider) {
        audioPlayer.volume = slVolume.value
    }
    
    //재생이 종료되었을 때 호출
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        progressTimer.invalidate()
        setPlayButtons(true, pause: false, stop: false)
    }
    
    //스위치 On/Off로 녹음 모드인지 재생 모드인지 결정
    @IBAction func swRecordMode(_ sender: UISwitch) {
        if sender.isOn {
            //스위치가 on이 되었을 때는 녹음모드이므로 오디오 재생을 중지
            //현재 재생 시간을 00:00으로 만들고 isRecordMode 값을 true로 설정
            //녹음 관련 버튼과 레이블값 활성화
            audioPlayer.stop()
            audioPlayer.currentTime = 0
            lblRecordTime!.text = convertNSTimeInterval2String(0)
            isRecordMode = true
            btnRecord.isEnabled = true
            lblRecordTime.isEnabled = true
        } else {
            //스위치가 off일 때 즉, 재생모드일때
            //isRecordMode값을 false로 설정
            //녹음 관련 버튼과 레이블값을 비활성화하고 녹음 시간은 0으로 초기화
            isRecordMode = false
            btnRecord.isEnabled = false
            lblRecordTime.isEnabled = false
            lblRecordTime.text = convertNSTimeInterval2String(0)
        }
        selectAudioFile() //모드에 따라 오디오 파일 선택
        //모드에 따라 재생 초기화 또는 녹음 초기화를 수행
        if !isRecordMode { //녹음 모드가 아닐때(재생모드일때)
            initPlay()
        } else { //녹음 모드일 떄
            initRecord()
        }
    }
    
    @IBAction func btnRecord(_ sender: UIButton) {
        //만약 버튼 이름이 record이면 녹음을 하고 버튼 이름을 Stop으로 변경
        if (sender as AnyObject).titleLabel?.text == "Record" {
            audioRecorder.record()
            (sender as AnyObject).setTitle("Stop", for: UIControl.State())
            progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timeRecordSelector, userInfo: nil, repeats: true)
            imgStateImage.image = UIImage(named: "voice.png")
        } else {
            //그렇지 않으면 현재 녹음 중이므로 녹음을 중단하고 버튼이름을 Stop으로 변경
            //Play버튼을 활성화하고 방금 녹음한 파일로 재생을 초기화
            audioRecorder.stop()
            (sender as AnyObject).setTitle("Record", for: UIControl.State())
            btnPlay.isEnabled = true
            initPlay()
            imgStateImage.image = UIImage(named: "")
        }
    }
    
    //0.1초마다 호출되며 녹음 시간을 표시
    @objc func updateRecordTime() {
        lblRecordTime.text = convertNSTimeInterval2String(audioRecorder.currentTime)
    }
}

