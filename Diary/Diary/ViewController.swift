//
//  ViewController.swift
//  Diary
//
//  Created by 김현서 on 2022/10/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var diaryList = [Diary]() {
        // 다이어리의 변경이 될때마다 호출됨
        didSet{
            self.saveDiaryList()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCollectionView()
        self.loadDiaryList()
        // Do any additional setup after loading the view.
    }
    
    private func configureCollectionView(){
        self.collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        self.collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let wireDiaryViewController = segue.destination as? WriteDiaryViewController{
            wireDiaryViewController.delegate = self
        }
    }
    
    
    
    //UserDefault를 이용해 다이어리 데이터 저장
    private func saveDiaryList(){
        // dictionary 형태로 저장
        let date = self.diaryList.map {
            [
            "title" : $0.title,
            "contents" : $0.contents,
            "date" : $0.date,
            "isStar" : $0.isStar
            ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(date,forKey: "diaryList")
    }
    
    // 저장된 다이어리 데이터 불러오기
    private func loadDiaryList() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "diaryList") as? [[String: Any]] else{
            return
        }
        self.diaryList = data.compactMap{
            guard let title = $0["title"] as? String else {return nil}
            guard let contents = $0["contents"] as? String else { return nil}
            guard let date = $0["date"] as? Date else { return nil }
            guard let isStar = $0["isStar"] as? Bool else { return nil }
            return Diary(title: title, contents: contents, date: date, isStar: isStar)
        }
        self.diaryList = self.diaryList.sorted(by: {
            $0.date.compare($1.date) == .orderedDescending
            
        })
        
    }
    
    
    // date 타입을 받았을 때 문자열로 바꿔주는 메소드
    private func dateToString(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일(EEEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: date)
    }
    
}

// Collection View 필수 구현 메소드
extension ViewController: UICollectionViewDataSource{
    // 지정된 셀의 갯수를
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.diaryList.count
    }
    // 지정된 위치의 cell을 위치시키는 메소드
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiaryCell", for: indexPath) as? DiaryCell else {
            return UICollectionViewCell()
        }
        let diary = self.diaryList[indexPath.row]
        cell.titleLabel.text = diary.title
        cell.dateLabel.text = self.dateToString(date: diary.date)
        return cell
    }
}

extension ViewController:UICollectionViewDelegateFlowLayout{
    //cell 크기 설정
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout
                        :UICollectionViewLayout,sizeForItemAt indexPath:IndexPath) -> CGSize{
        return CGSize(width: (UIScreen.main.bounds.width/2) - 20, height: 200)
    }
}

//일기 상세 화면으로 이동
extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath){
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "DiaryDetailViewController")
                as? DiaryDetailViewController else { return }
        let diary = self.diaryList[indexPath.row]
        viewController.diary = diary
        viewController.indexPath = indexPath
        viewController.delegate = self
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}


extension ViewController: WriteDiaryViewDlegate{
    func didSelectRegister(diary: Diary) {
        self.diaryList.append(diary)
        self.diaryList = self.diaryList.sorted(by: {
            $0.date.compare($1.date) == .orderedDescending
             
        })
        self.collectionView.reloadData()
    }
}


extension ViewController: DiaryDetailViewDelegate{
    func didSelectDelete(indexPath: IndexPath) {
        self.diaryList.remove(at: indexPath.row)
        self.collectionView.deleteItems(at: [indexPath])
    }
}

