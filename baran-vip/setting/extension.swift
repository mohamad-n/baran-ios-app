//
//  extension.swift
//  baran-vip
//
//  Created by alfy on 3/28/19.
//  Copyright © 2019 isibland. All rights reserved.
//


import Foundation
import UIKit



extension UIView {
    func setGradientBackground(ColorOne:UIColor, Colortwo:UIColor, Colorthree:UIColor){
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [ColorOne.cgColor, Colortwo.cgColor, Colorthree.cgColor]
        gradientLayer.locations = [0.0, 0.5 ,1.0]
        gradientLayer.startPoint = CGPoint(x:1.0, y:1.0)
        gradientLayer.endPoint = CGPoint(x:0.0 ,y:0.0)
        
        layer.insertSublayer(gradientLayer, at: 0 )
    }
    
}

extension UIView {
    func setGradientBackgroundcornerRadius(ColorOne:UIColor, Colortwo:UIColor, Colorthree:UIColor,CornerRadius:CGFloat){
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [ColorOne.cgColor, Colortwo.cgColor, Colorthree.cgColor]
        gradientLayer.locations = [0.0, 0.5 ,1.0]
        gradientLayer.startPoint = CGPoint(x:1.0, y:1.0)
        gradientLayer.endPoint = CGPoint(x:0.0 ,y:0.0)
        gradientLayer.cornerRadius = CornerRadius
        layer.insertSublayer(gradientLayer, at: 0 )
    }
    
}

extension UIView {
    func setGradientBackgroundcornerRadiusnews(ColorOne:UIColor, Colortwo:UIColor, Colorthree:UIColor){
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [ColorOne.cgColor, Colortwo.cgColor, Colorthree.cgColor]
        gradientLayer.locations = [0.0, 0.5 ,1.0]
        gradientLayer.startPoint = CGPoint(x:1.0, y:1.0)
        gradientLayer.endPoint = CGPoint(x:0.0 ,y:0.0)
        gradientLayer.cornerRadius = 20
        layer.insertSublayer(gradientLayer, at: 0 )
    }
    
}

extension UIView {
    func setGradientBackgroundcornerRadiusOrder(ColorOne:UIColor, Colortwo:UIColor, Colorthree:UIColor){
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [ColorOne.cgColor, Colortwo.cgColor, Colorthree.cgColor]
        gradientLayer.locations = [0.0, 0.5 ,1.0]
        gradientLayer.startPoint = CGPoint(x:1.0, y:1.0)
        gradientLayer.endPoint = CGPoint(x:0.0 ,y:0.0)
        gradientLayer.cornerRadius = 15;        layer.insertSublayer(gradientLayer, at: 0 )
    }
    
}



struct Colors {
    static var Aquamarine: UIColor  { return UIColor(hex: 0x00DAC8) }
    static var Bluish: UIColor  { return UIColor(hex: 0x0982C2) }
    static var Fadedblue: UIColor  { return UIColor(hex: 0x8074BA) }
    
}



extension UIImage {
    
    func mask(with color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        defer { UIGraphicsEndImageContext() }
        
        guard let context = UIGraphicsGetCurrentContext() else { return self }
        context.translateBy(x: 0, y: self.size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.setBlendMode(.normal)
        
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        guard let mask = self.cgImage else { return self }
        context.clip(to: rect, mask: mask)
        
        color.setFill()
        context.fill(rect)
        
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else { return self }
        return newImage
    }
}


class insetTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10);
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}


class UnderLineTextField : UITextField {
    
    var padding = UIEdgeInsets(top: 0, left: 5, bottom: 10, right: 5);
    
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
        //UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    
    override var tintColor: UIColor! {
        
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        let startingPoint   = CGPoint(x: rect.minX, y: rect.maxY)
        let endingPoint     = CGPoint(x: rect.maxX, y: rect.maxY)
        
        let path = UIBezierPath()
        
        path.move(to: startingPoint)
        path.addLine(to: endingPoint)
        path.lineWidth = 1.0
        
        tintColor.setStroke()
        
        path.stroke()
    }
}

extension UIButton {
    func centerTextAndImage(spacing: CGFloat) {
        let insetAmount = spacing / 2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: insetAmount)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: -insetAmount)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
    }
}


class ClosureSleeve {
    let closure: () -> ()
    
    init(attachTo: AnyObject, closure: @escaping () -> ()) {
        self.closure = closure
        objc_setAssociatedObject(attachTo, "[\(arc4random())]", self, .OBJC_ASSOCIATION_RETAIN)
    }
    
    @objc func invoke() {
        closure()
    }
}

extension UIControl {
    func addAction(for controlEvents: UIControl.Event, action: @escaping () -> ()) {
        let sleeve = ClosureSleeve(attachTo: self, closure: action)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
    }
}


extension UIView {
    func dropCostumShadow(scale: Bool = true,width:CGFloat,height:CGFloat,opacity:Float,radius:CGFloat) {
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = CGSize(width: width, height: height)
        layer.shadowRadius = radius
        
    }
    
    
    func dropShadow(){
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 2
        
    }
    
    func lightDropShadow(){
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.5
        //        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        
        self.layer.shadowRadius = 2
        
    }
    
    func deleteShadow(){
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 0
    }
    
}



extension UIView {
    
    func setBorder(backgroundColor:UIColor? = .white,corner:CGFloat?=0,borderWidth:CGFloat?=0,borderColor:UIColor? = .gray){
        self.layer.backgroundColor = backgroundColor!.cgColor
        self.layer.cornerRadius = corner!
        self.layer.borderWidth = borderWidth!
        self.layer.borderColor = borderColor!.cgColor
        //        self.clipsToBounds = true
    }
    
    
}





extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}

extension UITableViewCell {
    
    var viewControllerForTableView : UIViewController?{
        return ((self.superview as? UITableView)?.delegate as? UIViewController)
    }
    
}

extension UITextView {
    
    func scrollToBotom() {
        let range = NSMakeRange(text.characters.count - 1, 1);
        scrollRangeToVisible(range);
    }
    
}


//

extension UIApplication {
    class func getTopMostViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return getTopMostViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return getTopMostViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return getTopMostViewController(base: presented)
        }
        return base
    }
}

extension UILabel {
    func makeAttribute(fontSize:CGFloat,text:String){
        let font = UIFont.systemFont(ofSize: fontSize)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byWordWrapping
        paragraphStyle.baseWritingDirection = .rightToLeft
        paragraphStyle.alignment = .justified
        paragraphStyle.lineSpacing = 10
        paragraphStyle.firstLineHeadIndent = 0.01
        let myMutableString = NSMutableAttributedString(
            string: text,
            attributes: [
                NSAttributedStringKey.font: font,
                NSAttributedStringKey.paragraphStyle: paragraphStyle
            ]
        )
        self.attributedText = myMutableString
        
    }
    
    func makeAttributeWithAlignment(fontSize:CGFloat,text:String,alignment:NSTextAlignment){
        let font = UIFont.systemFont(ofSize: fontSize)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byWordWrapping
        paragraphStyle.baseWritingDirection = .rightToLeft
        paragraphStyle.alignment = alignment
        paragraphStyle.lineSpacing = 10
        paragraphStyle.firstLineHeadIndent = 0.01
        let myMutableString = NSMutableAttributedString(
            string: text,
            attributes: [
                NSAttributedStringKey.font: font,
                NSAttributedStringKey.paragraphStyle: paragraphStyle
            ]
        )
        self.attributedText = myMutableString
        
    }
}


extension String {
    func chopPrefix(_ count: Int = 1) -> String {
        return substring(from: index(startIndex, offsetBy: count))
    }
    
    func chopSuffix(_ count: Int = 1) -> String {
        return substring(to: index(endIndex, offsetBy: -count))
    }
}


extension UITextView {
    func makeAttribute(fontSize:CGFloat,text:String){
        let font = UIFont.systemFont(ofSize: fontSize)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byWordWrapping
        paragraphStyle.baseWritingDirection = .rightToLeft
        paragraphStyle.alignment = .justified
        paragraphStyle.firstLineHeadIndent = 0.01
        let myMutableString = NSMutableAttributedString(
            string: text,
            attributes: [
                NSAttributedStringKey.font: font,
                NSAttributedStringKey.paragraphStyle: paragraphStyle
            ]
        )
        self.attributedText = myMutableString
        
    }
    
    func makeAttributeWithLineHeight(fontSize:CGFloat,text:String,line_height:CGFloat){
        let font = UIFont.systemFont(ofSize: fontSize)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byWordWrapping
        paragraphStyle.baseWritingDirection = .rightToLeft
        paragraphStyle.alignment = .justified
        paragraphStyle.lineSpacing = line_height
        
        paragraphStyle.firstLineHeadIndent = 0.01
        let myMutableString = NSMutableAttributedString(
            string: text,
            attributes: [
                NSAttributedStringKey.font: font,
                NSAttributedStringKey.paragraphStyle: paragraphStyle
            ]
        )
        self.attributedText = myMutableString
        
    }
}



extension String {
    func getDateAndTimeInPersian() -> String {
        let date_from_server = DateFormatter()
        date_from_server.dateFormat =  "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        date_from_server.calendar = Calendar(identifier: .gregorian)
        let timeZone = TimeZone(identifier: "Asia/Tehran")
        
        let persianFormatter = DateFormatter()
        persianFormatter.calendar = Calendar(identifier: .persian)
        persianFormatter.dateStyle = .short
        persianFormatter.timeStyle = .short
        persianFormatter.timeZone = timeZone
        persianFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        if let date = date_from_server.date(from: self) {
            let persianString = persianFormatter.string(from: date)
            return persianString.convertToPersian()
        } else {
            return "نامشخص"
        }
    }
    
    
    func getDateInPersian() -> String {
        let date_from_server = DateFormatter()
        date_from_server.dateFormat =  "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        date_from_server.calendar = Calendar(identifier: .gregorian)
        
        let persianFormatter = DateFormatter()
        persianFormatter.calendar = Calendar(identifier: .persian)
        persianFormatter.dateStyle = .short
        persianFormatter.timeStyle = .short
        persianFormatter.dateFormat = "yyyy/MM/dd"
        
        if let date = date_from_server.date(from: self) {
            let persianString = persianFormatter.string(from: date)
            return persianString.convertToPersian()
        } else {
            return "نامشخص"
        }
    }
    
    func setDateFromPersian() -> String {
        let date_from_client = DateFormatter()
        date_from_client.dateFormat = "yyyy/MM/dd"//  "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        date_from_client.calendar = Calendar(identifier: .persian)
        
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        if let date = date_from_client.date(from: self) {
            let persianString = dateFormatter.string(from: date)
            return persianString//.convertToPersian()
        } else {
            return "نامشخص"
        }
    }
}



extension String {
    func convertEngNumToPersianNum()->String{
        //let number = NSNumber(value: Int(num)!)
        let format = NumberFormatter()
        format.locale = Locale(identifier: "fa_IR")
        let number =   format.number(from: self)
        let faNumber = format.string(from: number!)
        return faNumber!
        
    }
}

extension String {
    func convertToPersian()-> String {
        let numbersDictionary : Dictionary = ["0" : "۰","1" : "۱", "2" : "۲", "3" : "۳", "4" : "۴", "5" : "۵", "6" : "۶", "7" : "۷", "8" : "۸", "9" : "۹"]
        var str : String = self
        
        for (key,value) in numbersDictionary {
            str =  str.replacingOccurrences(of: key, with: value)
        }
        
        return str
    }
    
    
    func convertToEnglish()-> String {
        let numbersDictionary : Dictionary = [ "۰":"0" , "۱":"1" ,  "۲":"2" ,  "۳":"3" , "۴":"4",  "۵":"5" , "۶": "6",  "۷":"7",  "۸":"8" , "۹":"9"]
        var str : String = self
        
        for (key,value) in numbersDictionary {
            str =  str.replacingOccurrences(of: key, with: value)
        }
        
        return str
    }
    
    func convertArabicToPersian()-> String {
        let numbersDictionary : Dictionary = [ "ئ":"ی",
                                               "ي":"ی",
                                               "ك":"ک",
                                               "ى":"ی",
                                               "ة":"ه",
                                               //                                               "":"",
        ]
        var str : String = self
        
        for (key,value) in numbersDictionary {
            str =  str.replacingOccurrences(of: key, with: value)
        }
        
        return str
    }
}

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "fa_IR")
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }()
}
extension BinaryInteger {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}




public protocol Fadeable {
    var alpha: CGFloat {get set}
    
    mutating func fadeInView(duration: TimeInterval , delay: TimeInterval)
    mutating func fadeOutView(duration: TimeInterval, delay: TimeInterval)
}

extension UIViewController {
    
    
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


extension UIView {
    
    // In order to create computed properties for extensions, we need a key to
    // store and access the stored property
    fileprivate struct AssociatedObjectKeys {
        static var tapGestureRecognizer = "MediaViewerAssociatedObjectKey_mediaViewer"
    }
    
    fileprivate typealias Action = (() -> Void)?
    
    // Set our computed property type to a closure
    fileprivate var tapGestureRecognizerAction: Action? {
        set {
            if let newValue = newValue {
                // Computed properties get stored as associated objects
                objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        }
        get {
            let tapGestureRecognizerActionInstance = objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer) as? Action
            return tapGestureRecognizerActionInstance
        }
    }
    
    // This is the meat of the sauce, here we create the tap gesture recognizer and
    // store the closure the user passed to us in the associated object we declared above
    public func addTapGestureRecognizer(action: (() -> Void)?) {
        self.isUserInteractionEnabled = true
        self.tapGestureRecognizerAction = action
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    public func addPanGestureRecognizer(action: (() -> Void)?) {
        self.isUserInteractionEnabled = true
        self.tapGestureRecognizerAction = action
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.addGestureRecognizer(panGestureRecognizer)
    }
    
    // Every time the user taps on the UIImageView, this function gets called,
    // which triggers the closure we stored
    @objc fileprivate func handleTapGesture(sender: UITapGestureRecognizer) {
        if let action = self.tapGestureRecognizerAction {
            action?()
        } else {
            print("no action")
        }
    }
    
}



extension UIView: Fadeable {
    
    
    public func fadeInView(duration: TimeInterval = 0.3 , delay: TimeInterval = 0) {
        
        
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.alpha = 1.0
        })
        
        
    }
    
    public func fadeOutView(duration: TimeInterval = 0.3, delay: TimeInterval = 0) {
        
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.alpha = 0.0
        })
        
    }
    
    
}


class CustomButton: UIButton {
    
    var myValue: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 20
        clipsToBounds = true
        backgroundColor = .white
        layer.borderWidth = 0.5
        //        layer.borderColor = UIColor.flatGray.cgColor
        let likeimage = #imageLiteral(resourceName: "like_button_image")
        let likedimage = #imageLiteral(resourceName: "liked_button_image")
        
        
        setImage(likeimage, for: .normal)
        setImage(likedimage, for: .selected)
        
        
        
        imageEdgeInsets = UIEdgeInsetsMake(45, 45, 45, 45)
        //   titleLabel?.font = UIFont(name: "IRANSansMobileFaNum-Medium", size: 12)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // set other operations after super.init if required
        
        
        
    }
    
}


extension UIImage {
    func rotate(radians: Float) -> UIImage? {
        var newSize = CGRect(origin: CGPoint.zero, size: self.size).applying(CGAffineTransform(rotationAngle: CGFloat(radians))).size
        // Trim off the extremely small float value to prevent core graphics from rounding it up
        newSize.width = floor(newSize.width)
        newSize.height = floor(newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, true, self.scale)
        let context = UIGraphicsGetCurrentContext()!
        
        // Move origin to middle
        context.translateBy(x: newSize.width/2, y: newSize.height/2)
        // Rotate around middle
        context.rotate(by: CGFloat(radians))
        // Draw the image at its center
        self.draw(in: CGRect(x: -self.size.width/2, y: -self.size.height/2, width: self.size.width, height: self.size.height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}



extension UITableView {
    
    func scrollToBottom(){
        
        DispatchQueue.main.async {
            let indexPath = IndexPath(
                row: self.numberOfRows(inSection:  self.numberOfSections-1) - 1,
                section: self.numberOfSections - 1)
            self.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    
    func scrollToTop() {
        
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: 0, section: 0)
            self.scrollToRow(at: indexPath, at: .top, animated: false)
        }
    }
}
