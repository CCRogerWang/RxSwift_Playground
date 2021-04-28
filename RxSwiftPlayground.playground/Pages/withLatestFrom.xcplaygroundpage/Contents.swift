import RxSwift


let disposeBag = DisposeBag()
let firstSubject = PublishSubject<String>()
let secondSubject = PublishSubject<String>()

firstSubject
     .withLatestFrom(secondSubject)
     .subscribe(onNext: { print($0) })
     .disposed(by: disposeBag)

firstSubject.onNext("🅰️")
firstSubject.onNext("🅱️")
secondSubject.onNext("1")
secondSubject.onNext("2")
firstSubject.onNext("🆎")
secondSubject.onNext("3")
firstSubject.onNext("tap button")
firstSubject.onNext("tap button")
firstSubject.onNext("tap button")
