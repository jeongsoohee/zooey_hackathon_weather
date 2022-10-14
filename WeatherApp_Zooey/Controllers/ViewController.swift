//
//  ViewController.swift
//  WeatherApp_Zooey
//
//  Created by zooey on 2022/10/08.
//

import UIKit
import Lottie

// 애니메이션 효과(로티 구현)
class ViewController: UIViewController {
    // splash animation
    private let animationView: AnimationView = {
        let animView = AnimationView(name:"10686-the-moon")
        animView.frame = CGRect(x:0, y:0, width: 400, height: 400)
        animView.contentMode = .scaleToFill
        return animView
    }()
    
    // 애니메이션 후 보여줄 화면
    private let popView: UILabel = {
        let label = UILabel()
        label.text = "웨더 앱 이용을 위해 접근 권한 허용이 필요합니다."
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.textColor = .black
        return label
    }()
    
    private let popView2: UILabel = {
        let label = UILabel()
        label.text = """
                        위치사용(선택)
                        현재 위치를 중심으로 날씨 정보 이용
                        ※ 동의하지 않아도 앱 이용은 가능합니다.
                    """
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    // 버튼
    private let pressedButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 5
        btn.clipsToBounds = true
        btn.layer.borderWidth = 1
        btn.setTitle("확 인", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.titleLabel?.textColor = .white
        btn.addTarget(self, action: #selector(pressedBtnTapped), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 애니메이션 보여주기 후 삭제 -> 다음 화면 나오기
        view.addSubview(animationView)
        animationView.center = view.center
        animationView.play{ (finish) in
            print("Animation finished!")
            self.animationView.removeFromSuperview()
            self.makeUI()
        }
    }
    
    // 레이블 + 버튼 UI
    func makeUI() {
        view.addSubview(popView)
        popView.translatesAutoresizingMaskIntoConstraints = false
        popView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        popView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        popView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        view.addSubview(popView2)
        popView2.translatesAutoresizingMaskIntoConstraints = false
        popView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        popView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        popView2.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        
        view.addSubview(pressedButton)
        pressedButton.translatesAutoresizingMaskIntoConstraints = false
        pressedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        pressedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        pressedButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        pressedButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    // 버튼 누르면 다음 화면으로 이동
    @objc func pressedBtnTapped() {
        
        //let vc = UINavigationController(rootViewController: WeatherViewController())
        
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "WeatherViewController")
        //UINavigationController(rootViewController: WeatherViewController())
        vcName?.modalPresentationStyle = .fullScreen
        vcName?.modalTransitionStyle = .crossDissolve
        //self.navigationController?.pushViewController(vcName, animated: true)
        self.present(vcName!, animated: true, completion: nil)
    }
}
