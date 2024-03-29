//
//  WriteDiaryViewController.swift
//  Diary
//
//  Created by 김현서 on 2022/10/14.
//

import UIKit

enum DiaryEditorMode {
    case new
    case edit(IndexPath, Diary)
}

protocol WriteDiaryViewDlegate : AnyObject{
    func didSelectRegister(diary : Diary)
}


class WriteDiaryViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var confirmButton: UIBarButtonItem!
    @IBOutlet weak var dateTextField: UITextField!
    private let datePicker = UIDatePicker()
    private var diaryDate: Date?
    weak var delegate: WriteDiaryViewDlegate?
    var diaryEditorMode: DiaryEditorMode = .new // 다이어리 수정 모드
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureContentsTextView()
        self.configureDatePicker()
        self.configureInputField()
        self.configureEditMode()
        self.confirmButton.isEnabled = false
    }
    
    private func configureEditMode(){
        switch self.diaryEditorMode{
            case let .edit(_, diary):
            self.titleTextField.text = diary.title
            self.contentsTextView.text = diary.contents
            self.dateTextField.text = self.dateToString(date: diary.date)
            self.diaryDate = diary.date
            self.confirmButton.title = "수정"
        default:
            break
        }
   
    }
    
    // date 타입을 받았을 때 문자열로 바꿔주는 메소드
    private func dateToString(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일(EEEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: date)
    }
    
    private func configureContentsTextView(){
        let borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        self.contentsTextView.layer.borderColor = borderColor.cgColor
        self.contentsTextView.layer.borderWidth = 0.5
        self.contentsTextView.layer.cornerRadius = 5.0
        
    }
    
    private func configureDatePicker(){
        self.datePicker.datePickerMode = .date
        self.datePicker.preferredDatePickerStyle = .wheels
        self.datePicker.addTarget(self, action: #selector(datePickerValueDidChange(_:)), for: .valueChanged) // 값이 바뀔때마다 datePickerValueDid change 호출
        self.dateTextField.inputView = self.datePicker
        
    }
    
    private func configureInputField(){
        self.contentsTextView.delegate = self
        self.titleTextField.addTarget(self, action: #selector(titleTextFieldDidChange(_:)), for: .editingChanged)
        self.dateTextField.addTarget(self, action: #selector(dateTextFieldDidChange(_:)), for: .editingChanged)
        
    }
    
    
    @IBAction func tapConfirmButton(_ sender: UIBarButtonItem) {
        guard let title = self.titleTextField.text else { return }
        guard let contents = self.contentsTextView.text else  { return }
        guard let date = self.diaryDate else { return }
        let diary = Diary(title: title, contents: contents, date: date, isStar: false)
        
        switch self.diaryEditorMode{
        case .new:
            self.delegate?.didSelectRegister(diary: diary)
            
        case let .edit(indexPath,_):
            NotificationCenter.default.post(
                name: NSNotification.Name("editDiary"),
                object: diary,
                userInfo: [
                    "indexPath.row" : indexPath.row
                ]
            )
        }
        
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    @objc private func datePickerValueDidChange(_ datePicker: UIDatePicker){
        let formmater = DateFormatter()
        formmater.dateFormat = "yyyy 년 MM 월 dd 일 (EEEEE)"
        formmater.locale = Locale(identifier: "ko_KR")
        self.diaryDate = datePicker.date
        self.dateTextField.text = formmater.string(from: datePicker.date)
        self.dateTextField.sendActions(for: .editingChanged)
    }
    
    @objc private func titleTextFieldDidChange(_ textField: UITextField){
        self.validateInputField()
    }
    
    @objc private func dateTextFieldDidChange(_ textField: UITextField){
        self.validateInputField()
    }
    
    
    //유저가 빈 화면 터치할 때 editing 종료
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func validateInputField() {
        self.confirmButton.isEnabled = !(self.titleTextField.text?.isEmpty ?? true) && !(self.dateTextField.text?.isEmpty ?? true) && !self.contentsTextView.text.isEmpty
    }
    
}


extension WriteDiaryViewController: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView){
        self.validateInputField()
    }
}
