

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    // セルの数をreturn
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AddData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let addcell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        // 配列から一つの文字列を取り、セルに入れる
        addcell.textLabel!.text = AddData[indexPath.row].name
        // 配列のタプルのcheck=1のときDoneLabelの色を緑にする
        if AddData[indexPath.row].check == 1{
            addcell.DoneLabel.textColor = UIColor.green
        }
        // セルの行番号をtagに設定
        addcell.tag = indexPath.row
        // addcellをreturnする
        return addcell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // UserDefaultsに保存されているデータを取り出す
        if let TapData = UserDefaults.standard.object(forKey: "AddList") as? [[String:Any]]{
            AddData = TapData.map{(name:$0["name"] as! String,check:$0["check"] as! Int)}
        }
    }
    
    @IBOutlet weak var tableview: UITableView!
    // All Deleteボタンが押されたときの処理
    @IBAction func AllDeleteButton(_ sender: Any) {
        // 配列の全要素を削除する
        AddData.removeAll()
        // tableviewを再読み込み
        tableview.reloadData()
    }
    
    // セルの削除の処理
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // 削除処理かの確認
        if editingStyle == UITableViewCell.EditingStyle.delete{
            // 配列から削除
            AddData.remove(at: indexPath.row)
            //セルの削除
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            
            //タプル型配列であるAddDataを辞書型配列に変換する
            let DicData:[[String:Any]] = AddData.map{["name":$0.name,"check":$0.check]}
            // UserDefaultsに保存する
            UserDefaults.standard.set(DicData, forKey: "AddList")
        }
    }
    
    //メモリの解放
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

