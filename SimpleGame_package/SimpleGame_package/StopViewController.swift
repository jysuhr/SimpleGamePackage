//
//  StopViewController.swift
//  SimpleGame_package
//
//  Created by 서준영 on 12/26/24.
//

import UIKit
import SnapKit

class StopViewController: UIViewController {
    
    let circlePanel = UIView()
    let gameNumLabel = UILabel()
    let infoPanel = UIView()
    let infoLabel = UILabel()
    
    var gameNumber: CGFloat = 0.01
    var randomNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bgColor
        circlePanelSetup()
        gameNumLabelSetup()
        infoSetup()
    }
    
    func circlePanelSetup() {
        circlePanel.backgroundColor = .white
        circlePanel.layer.cornerRadius = 250 / 2
        circlePanel.clipsToBounds = true
        self.view.addSubview(circlePanel)
        
        circlePanel.snp.makeConstraints {
            $0.width.height.equalTo(250)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.snp.top).offset(90)
        }
    }
    
    func gameNumLabelSetup() {
        gameNumLabel.text = "\(gameNumber)"
        gameNumLabel.textColor = textColor
        gameNumLabel.font = UIFont.systemFont(ofSize: 65)
        gameNumLabel.textAlignment = .center
        self.view.addSubview(gameNumLabel)
        
        gameNumLabel.snp.makeConstraints {
            $0.height.equalTo(130)
            $0.width.equalTo(260)
            $0.center.equalTo(circlePanel)
        }
    }
    
    func infoSetup() {
        infoPanel.backgroundColor = laColor
        infoPanel.layer.cornerRadius = 27
        infoPanel.clipsToBounds = true
        
        numSet()
        
        infoLabel.text = "정확히 \(randomNum)초에 멈추세요"
        infoLabel.font = UIFont.systemFont(ofSize: 24)
        infoLabel.textColor = .black
        infoLabel.textAlignment = .center
        
        self.view.addSubview(infoPanel)
        self.view.addSubview(infoLabel)
        
        infoPanel.snp.makeConstraints {
            $0.width.equalTo(305)
            $0.height.equalTo(66)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.circlePanel.snp.bottom).offset(35)
        }
        
        infoLabel.snp.makeConstraints {
            $0.center.equalTo(self.infoPanel.snp.center)
        }
    }
    
    func numSet() {
        randomNum = Int.random(in: 3...12)
    }
}
