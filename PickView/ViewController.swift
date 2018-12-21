//
//  ViewController.swift
//  PickView
//
//  Created by Артем on 12/21/18.
//  Copyright © 2018 Артем. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let cityArr = ["Kyiv", "Dnipro", "Lviv", "Kharkiv", "Odessa"]
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var cityPickerView: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cityPickerView.delegate = self
        //подписываем наш пикер на делегегаты (изменение данных)
        //делегейт это выполнение одного класса в другом ()
        
        self.cityPickerView.dataSource = self
        //управление данными
    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    //вынесли в расширение чтобы не был основной вью контроллер забит
    //вообще надо в отдельный класс
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1        //кол-во столбцов
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.cityArr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.cityArr[row]        //вносит название строк
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.label.text = self.cityArr[row]
    }
    
}
