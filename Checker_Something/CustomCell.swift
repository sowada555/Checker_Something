

import UIKit

class CustomCell: UITableViewCell {

    // "済"表示
    @IBOutlet weak var DoneLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    // OKボタンの処理
    @IBAction func OKButton(_ sender: Any) {
       
        // DoneLabelに色をつける
        DoneLabel.textColor = UIColor.green
        // 配列AddDataのタプルのcheckを1(Yes)にする
        AddData[self.tag].check = 1
        //タプル型配列であるAddDataを辞書型配列に変換する
        let DicData:[[String:Any]] = AddData.map{["name":$0.name,"check":$0.check]}
        // UserDefaultsに保存する
        UserDefaults.standard.set(DicData, forKey: "AddList")
        
    }
    
}
