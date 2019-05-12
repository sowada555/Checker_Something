

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    // セルの数をreturn
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AddData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let addcell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // 配列から一つの文字列を取り、セルに入れる
        addcell.textLabel!.text = AddData[indexPath.row]
        // addcellをreturnする
        return addcell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // UserDefaultsに保存されているデータを取り出す
        if UserDefaults.standard.object(forKey: "AddList") != nil{
            AddData = UserDefaults.standard.object(forKey: "AddList") as! [String]
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
            // UserDefaultsに保存する
            UserDefaults.standard.set(AddData, forKey: "AddList")
        }
    }
    //メモリの解放
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

