//
//  ViewController.swift
//  NfilterCustomView
//
//  Created by Eunchan Kim on 2023/07/07.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    @IBOutlet weak var keyPad: UIView!
    var isShowStackView:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
       showCustomView()
    }

    func showCustomView(){
        //customView 만들기
        let maxCustomViewHeight: CGFloat = 200
        let customView = UIView()
        customView.backgroundColor = .black
        customView.layer.cornerRadius = 24
        customView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        customView.clipsToBounds = true
        
        let closeButton = UIButton(type: .custom)
        closeButton.setTitle("닫기", for: .normal)
        closeButton.titleLabel?.textAlignment = .left
        closeButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        closeButton.tintColor = .white
        customView.addSubview(closeButton)
        closeButton.snp.makeConstraints{ make in
            make.trailing.equalTo(customView.snp.trailing).offset(-24)
            make.top.equalTo(customView.snp.top).offset(24)
        }

        let label = UILabel()
        label.text = "간편비밀번호 입력"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        customView.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.equalTo(customView.snp.centerX)
            make.top.equalTo(customView.snp.top).offset(77)
        }
        // 수평 스택뷰
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .center
        customView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.centerX.equalTo(customView.snp.centerX)
            make.top.equalTo(label.snp.bottom).offset(20)
        }
        
        // 이미지 뷰 추가
        for _ in 1...6 {
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "circle")
            imageView.tintColor = .white
            imageView.snp.makeConstraints { make in
                make.width.height.equalTo(18)
            }
            stackView.addArrangedSubview(imageView)
        }
        
        // 이미지, 라벨, 버튼 추가
        let lockImg = UIImageView()
        lockImg.image = UIImage(named: "lock")
        customView.addSubview(lockImg)
        lockImg.snp.makeConstraints { make in
            make.bottom.equalTo(customView.snp.bottom).offset(-20)
            make.leading.equalTo(customView.snp.leading).offset(24)
        }
       
        let lockLabel = UILabel()
        lockLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        lockLabel.textColor = .white
        lockLabel.text = "보안키보드 작동 중"
        customView.addSubview(lockLabel)
        lockLabel.snp.makeConstraints{ make in
            make.leading.equalTo(lockImg.snp.trailing).offset(8)
            make.bottom.equalTo(customView.snp.bottom).offset(-20)
        }
        keyPad.addSubview(customView)
        
        customView.snp.makeConstraints { make in
            make.top.equalTo(keyPad.snp.top).offset(-maxCustomViewHeight)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(keyPad.snp.top)
            make.height.lessThanOrEqualTo(maxCustomViewHeight)
        }
    }
    
}

