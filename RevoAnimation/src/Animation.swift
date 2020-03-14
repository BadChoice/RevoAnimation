import UIKit

struct Animation {
    let duration: TimeInterval
    let clousure: (UIView)->Void
    
    static func fadeIn(duration:TimeInterval = 0.2) -> Animation {
        Animation(duration:duration){ $0.alpha = 1 }
    }
    
    static func fadeOut(duration:TimeInterval = 0.2) -> Animation {
        Animation(duration:duration){ $0.alpha = 0 }
    }
    
    static func scale(to newScale:CGRect, duration:TimeInterval = 0.2) -> Animation {
        Animation(duration:duration){ $0.frame = newScale }
    }
    
    static func move(to point:CGPoint, duration:TimeInterval = 0.2) -> Animation {
        Animation(duration:duration){ $0.frame.origin = point }
    }
    
    static func move(by point:CGPoint, duration:TimeInterval = 0.2) -> Animation {
        Animation(duration:duration){
            $0.frame.origin = CGPoint(x:$0.frame.origin.x + point.x, y:$0.frame.origin.y + point.y)
        }
    }
    
    static func rotate(by degrees:CGFloat, duration:TimeInterval = 0.2) -> Animation {
        Animation(duration:duration){
            let angleInRadians = degrees / 180.0 * CGFloat.pi
            let rotation = $0.transform.rotated(by: angleInRadians)
            $0.transform = rotation
        }
    }
}

extension UIView {
    func animate(_ animations:[Animation]) {
        guard !animations.isEmpty else { return }
        
        var animations = animations
        let animation  = animations.removeFirst()
        
        UIView.animate(withDuration: animation.duration, animations: {
            animation.clousure(self)
        }, completion: { _ in
            self.animate(animations)
        })
    }
    
    func animate(parallel animations:[Animation]) {
        animations.forEach { animation in
            UIView.animate(withDuration: animation.duration) {
                animation.clousure(self)
            }
        }
    }
}

