

import UIKit

class TextInputVC: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    var output: TextInputViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let text = output?.initialText {
            textView.text = text
        } else {
            textView.text = output?.placeholder
            textView.textColor = UIColor.lightGray
            doneBtn.isEnabled = false
        }
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        let info: NSDictionary = notification.userInfo! as NSDictionary
        let value: NSValue = info.value(forKey: UIKeyboardFrameBeginUserInfoKey) as! NSValue
        let keyboardSize: CGSize = value.cgRectValue.size
        bottomConstraint.constant += keyboardSize.height
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let info: NSDictionary = notification.userInfo! as NSDictionary
        let value: NSValue = info.value(forKey: UIKeyboardFrameBeginUserInfoKey) as! NSValue
        let keyboardSize: CGSize = value.cgRectValue.size
        bottomConstraint.constant -= keyboardSize.height
    }

    @IBAction func cancelButtonTapped(_ sender: Any) {
        output?.cancelAction()
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        output?.setText(textView.text)
    }
    
}

extension TextInputVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = output?.placeholder
            textView.textColor = UIColor.lightGray
            doneBtn.isEnabled = false
        } else {
            doneBtn.isEnabled = true
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty {
            doneBtn.isEnabled = false
        } else {
            doneBtn.isEnabled = true
        }
    }
}
