import UIKit

struct AnimatedPoint{
    let start:CGFloat
    let end:CGFloat
    
    func at(_ percentage:CGFloat) -> CGFloat{
        (end - start) * percentage + start
    }
}

struct AnimatedPosition {
    let x:AnimatedPoint
    let y:AnimatedPoint
    
    func at(_ percent:CGFloat) -> CGPoint {
        CGPoint(x: x.at(percent),y: y.at(percent))
    }
}
