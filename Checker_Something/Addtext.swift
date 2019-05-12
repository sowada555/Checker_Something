

import UIKit

// セル全体の配列
var AddData = [String]()

class Addtext: UIViewController {
    
    @IBOutlet weak var textfield: UITextField!
    // Addボタンが押されたときの処理
    @IBAction func AddButton(_ sender: Any) {
        // 配列にtextfieldの値を入れる
        AddData.append(textfield.text!)
        // textfieldの値を初期化
        textfield.text = ""
        // 配列をUserDefaultsに保存
        UserDefaults.standard.set(AddData,forKey: "AddList")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // メモリの解放
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
