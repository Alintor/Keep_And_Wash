

protocol TextInputViewOutput {
    var placeholder:String { get }
    var initialText:String? { get }
    func setText(_ text:String)
    func cancelAction()
}

class TextInputPresenter: TextInputViewOutput {
    var placeholder:String
    var initialText:String?
    var callback: (_ text:String)->()
    var router:TextInputRouter?
    
    init(placeholder:String, initialText:String?, callback:@escaping (String)->()) {
        self.placeholder = placeholder
        self.initialText = initialText
        self.callback = callback
    }
    
    func setText(_ text: String) {
        callback(text)
        router?.closeModule()
    }
    
    func cancelAction() {
        router?.closeModule()
    }
}
