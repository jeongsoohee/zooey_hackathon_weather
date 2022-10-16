//
//  FirstViewController.swift
//  WeatherApp_Zooey
//
//  Created by zooey on 2022/10/15.
//

import UIKit

final class FirstViewController: UIViewController {
    
    var weatherListManager = WeatherDataManager()
    
    // MARK: - 컬렉션뷰
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        setupNaviBar()
        collectionUI()
        setupCollectionView()
        setupWeatherData()
    }
    
    // MARK: - UI셋팅
    func makeUI() {
        // 배경 및 보여질 화면 설정
        let vc = ViewController()
        view.backgroundColor = #colorLiteral(red: 0.7882352941, green: 0.8524353391, blue: 1, alpha: 1)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
    }
    
    // MARK: - Data 불러오기
    func setupWeatherData() {
        weatherListManager.makeWeatherDatas()
    }
    
    // MARK: - 컬렉션뷰 셋팅
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(WeatherCell.self, forCellWithReuseIdentifier: "WeatherCell")
    }
    
    
    // MARK: - 네비게이션바 설정
    func setupNaviBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        appearance.shadowColor = .clear
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        // 백버튼 커스텀
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
            self.navigationItem.backBarButtonItem = backBarButtonItem
        
        // 버튼
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWeatherTapped))
                
        let line = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style:.plain, target: self, action: #selector(lineWeatherTapped))
        
        // 버튼 한줄로 묶어줌
        navigationItem.rightBarButtonItems = [line, add]
    }
    
    // MARK: - 컬렉션뷰 레이아웃
    func collectionUI() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - 네비게이션바 버튼 설정
    @objc func addWeatherTapped() {
            print("addWeatherTapped")
        // 화면 전환
        let vc = SelectWeatherViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        //전화면으로 돌아가는 버튼
        //self.navigationController?.popViewController(animated: true)
    }
    @objc func lineWeatherTapped() {
            print("lineWeatherTapped")
        let vc = SettingPersonalViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        //self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - 컬렉션뷰 확장
// 셀 사이즈
extension FirstViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}
extension FirstViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
}

extension FirstViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        cell.weather = weatherListManager[indexPath.row]
//        cell.locationName.text = weatherListManager[indexPath.row].locationName
//        cell.weatherText.text = weatherListManager[indexPath.row].weatherTxt
//        cell.weahterIcon.image = weatherListManager[indexPath.row].weatherIcon
//        cell.temIcon.image = weatherListManager[indexPath.row].temIcon
//        cell.temText.text = weatherListManager[indexPath.row].temperature
//        cell.humidyIcon.image = weatherListManager[indexPath.row].humidityIcon
//        cell.humidyText.text = weatherListManager[indexPath.row].humidity
//        cell.highIcon.image = weatherListManager[indexPath.row].highIcon
//        cell.highTemText.text = weatherListManager[indexPath.row].highTem
//        cell.lowIcon.image = weatherListManager[indexPath.row].lowIcon
//        cell.lowTemText.text = weatherListManager[indexPath.row].lowTem
//        cell.weatherDetail.text = weatherListManager[indexPath.row].detail
       
        return cell
    }
}
