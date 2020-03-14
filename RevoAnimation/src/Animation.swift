import UIKit

struct Animation {
    let duration: TimeInterval
    let delay: TimeInterval
    let clousure: (UIView)->Void
    
    static func fadeIn(duration:TimeInterval = 0.2, delay:TimeInterval = 0) -> Animation {
        Animation(duration:duration, delay:delay){ $0.alpha = 1 }
    }
    
    static func fadeOut(duration:TimeInterval = 0.2, delay:TimeInterval = 0) -> Animation {
        Animation(duration:duration, delay:delay){ $0.alpha = 0 }
    }
    
    static func scale(to newScale:CGRect, duration:TimeInterval = 0.2, delay:TimeInterval = 0) -> Animation {
        Animation(duration:duration, delay:delay){ $0.frame = newScale }
    }
    
    static func move(to point:CGPoint, duration:TimeInterval = 0.2, delay:TimeInterval = 0) -> Animation {
        Animation(duration:duration, delay:delay){ $0.frame.origin = point }
    }
    
    static func move(by point:CGPoint, duration:TimeInterval = 0.2, delay:TimeInterval = 0) -> Animation {
        Animation(duration:duration, delay:delay){
            $0.frame.origin = CGPoint(x:$0.frame.origin.x + point.x, y:$0.frame.origin.y + point.y)
        }
    }
    
    static func scale(by scale:CGFloat, duration:TimeInterval = 0.2, delay:TimeInterval = 0) -> Animation {
        Animation(duration:duration, delay:delay){
            let scaled = $0.transform.scaledBy(x: scale, y: scale)
            $0.transform = scaled
        }
    }
    
    static func rotate(by degrees:CGFloat, duration:TimeInterval = 0.2, delay:TimeInterval = 0) -> Animation {
        Animation(duration:duration, delay:delay){
            let angleInRadians = degrees / 180.0 * CGFloat.pi
            let rotation = $0.transform.rotated(by: angleInRadians)
            $0.transform = rotation
        }
    }
}

extension UIView {
    func animate(_ animations:[Animation], then:(()->Void)? = nil) {
        guard !animations.isEmpty else { return }
        
        var animations = animations
        let animation  = animations.removeFirst()
        
        UIView.animate(withDuration: animation.duration, delay: animation.delay, animations: { [weak self] in
            guard let self = self else { return }
            animation.clousure(self)
        }, completion: { [weak self] _ in
            if animations.count == 0 { then?() }
            self?.animate(animations, then:then)
        })
    }
    
    func animate(forever animations:[Animation]){
        animate(animations) { [weak self] in
            self?.animate(forever: animations)
        }
    }
    
    func animate(parallel animations:[Animation]) {
        animations.forEach { [weak self] animation in
            UIView.animate(withDuration: animation.duration) {
                guard let self = self else { return }
                animation.clousure(self)
            }
        }
    }
}

