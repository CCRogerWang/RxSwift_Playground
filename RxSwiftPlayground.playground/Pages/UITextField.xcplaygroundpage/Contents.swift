import UIKit
import PlaygroundSupport
import RxSwift
import RxCocoa


class ViewController : UIViewController {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        //创建文本输入框
        let inputField = UITextField(frame: CGRect(x:10, y:80, width:200, height:30))
        inputField.borderStyle = UITextField.BorderStyle.roundedRect
        self.view.addSubview(inputField)
        
        //创建文本输出框
        let outputField = UITextField(frame: CGRect(x:10, y:150, width:200, height:30))
        outputField.borderStyle = UITextField.BorderStyle.roundedRect
        self.view.addSubview(outputField)
        
        //创建文本标签
        let label = UILabel(frame:CGRect(x:20, y:190, width:300, height:30))
        self.view.addSubview(label)
        
        //创建按钮
        let button:UIButton = UIButton(type:.system)
        button.frame = CGRect(x:20, y:230, width:40, height:30)
        button.setTitle("提交", for:.normal)
        self.view.addSubview(button)
        let inputStream = inputField.rx.controlEvent(.editingChanged)
            .map { inputField.text ?? ""}
        
            
//        let inputStream = inputField.rx.text.orEmpty.skip(1)
        inputStream.subscribe(onNext: {
            print("目前的字：\($0)")
        })
        let inputDriver = inputStream.asDriver(onErrorJustReturn: "")
        
        inputDriver.drive(outputField.rx.text)
            .disposed(by: disposeBag)
        
        inputDriver.map {
            let text = "字數：\($0)"
            print(text)
            return text
        }
            .drive(label.rx.text)
            .disposed(by: disposeBag)
        
        inputDriver.map { $0.count > 5}
            .drive(button.rx.isEnabled)
            .disposed(by: disposeBag)
        
//        inputField.text = "tt"
    }
}

let viewController = ViewController()
viewController.view.frame = CGRect(x: 0, y: 0, width: 300, height: 600)
PlaygroundPage.current.liveView = viewController
PlaygroundPage.current.needsIndefiniteExecution = true
