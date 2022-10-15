//
//  SettingCell.swift
//  WeatherApp_Zooey
//
//  Created by zooey on 2022/10/09.
//

import UIKit

//설정 테이블 뷰
class SettingCell: UITableViewCell {

    @IBOutlet weak var settingImage: UIImageView!
    @IBOutlet weak var settingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}