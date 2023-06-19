//
//  ExtendingPageControl.swift
//  MEO1
//
//  Created by Thành Mai on 12/06/2023.
//

import UIKit

class ExtendingPageControl: UIView {
    var numberOfPage: Int
    var currentpage : Int                  = 0 {
        didSet {
            reloadView()
            didSetPage?(currentpage)
        }
    }
    var currentIndicatorColor: UIColor     = UIColor.blue
    var indicatorColor: UIColor            = UIColor(white: 0.9, alpha: 1)
    var circleIndicator: Bool              = false
    private var dotView                    = [UIView]()
    private let spacing: CGFloat           = 8
    private lazy var  extraWidth: CGFloat  = circleIndicator ? 6 : 0
    var didSetPage: ((_ page: Int) -> Void)?

 init(numberOfPages: Int,currentPage: Int,isCircular: Bool){
    self.numberOfPage    = numberOfPages
    self.currentpage     = currentPage
    self.circleIndicator = isCircular
    super.init(frame: .zero)
    configView()
}
 required init?(coder: NSCoder) {fatalError("not implemented")}

 private func configView(){
    backgroundColor = .clear
    (0..<numberOfPage).forEach { _ in
        let view = UIView()
        addSubview(view)
        dotView.append(view)
    }
 }

 private func reloadView(){
     print("reloadView")
    dotView.forEach{$0.backgroundColor = indicatorColor}
    dotView[currentpage].backgroundColor = currentIndicatorColor
    UIView.animate(withDuration: 0.2) {
        self.dotView[self.currentpage].frame.origin.x   = self.dotView[self.currentpage].frame.origin.x - self.extraWidth
        self.dotView[self.currentpage].frame.size.width = self.dotView[self.currentpage].frame.size.width + (self.extraWidth * 2)
    }
}

 override func layoutSubviews() {
     print("layoutSubviews")
    super.layoutSubviews()
    for (i,view) in dotView.enumerated(){
        view.clipsToBounds      = true
        view.layer.cornerRadius = bounds.height / 2
        let width: CGFloat      = circleIndicator ? self.bounds.height : CGFloat(self.bounds.width / CGFloat(self.numberOfPage) - self.spacing) - self.extraWidth
        UIView.animate(withDuration: 0.2) {
          view.frame = CGRect(x: ((self.bounds.width / CGFloat(self.numberOfPage)) * CGFloat(i)) + self.spacing, y: 0, width: width , height: self.bounds.height)
        }
    }
    reloadView()
 }


    
    
    
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
