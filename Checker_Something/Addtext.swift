

import UIKit

// セル全体の配列
// nameはセルのラベルであり、checkは"済"かどうかの判定(1=Yes,0=No)
var AddData = [(name:String,check:Int)]()

class Addtext: UIViewController {
    
    @IBOutlet weak var textfield: UITextField!
    // Addボタンが押されたときの処理
    @IBAction func AddButton(_ sender: Any) {
        // 追加するタプルを定数に入れる
        let tmp = (name:textfield.text!,check:0)
        // 配列にtextfieldの値を入れる
        AddData.append(tmp)
        // textfieldの値を初期化
        textfield.text = ""
        
        //タプル型配列であるAddDataを辞書型配列に変換する
        let DicData:[[String:Any]] = AddData.map{["name":$0.name,"check":$0.check]}
        // 配列をUserDefaultsに保存
        UserDefaults.standard.set(DicData,forKey: "AddList")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // メモリの解放
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
