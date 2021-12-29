//
//  AddViewController.swift
//  TestApp2
//
//  Created by 이현호 on 2021/12/10.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var importancePickerView: UIPickerView!
    
    let userDefaults = UserDefaults.standard
    let pickerViewSelectList = ["낮음", "중간", "높음"]
    var selectedPicker: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        importancePickerView.delegate = self
        importancePickerView.dataSource = self
    }
    
    @IBAction func didTapXButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapSaveButton(_ sender: Any) {
        let todoItem = TodoItem(title: titleTextField.text ?? "값이 없음",
                                description: descriptionTextField.text ?? "설명 값이 없음",
                                importance: "낮음")
        todoItems.append(todoItem)
        dismiss(animated: true, completion: nil)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadTableView"), object: nil)

        do {
            let encoder = JSONEncoder()
            let encodedTodoItems = try encoder.encode(todoItems)
            userDefaults.setValue(encodedTodoItems, forKey: "todoItems")
        } catch {
            print("인코딩 에러 발상 저장 실패")
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewSelectList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPicker = pickerViewSelectList[row]
    }    
}
