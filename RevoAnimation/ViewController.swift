import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animatedView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func animate(_ sender: Any) {
        //animatedView.animate([
        animatedView.animate(forever: [
        //animatedView.animate(parallel: [
            .scale(by: 4),
            .scale(by: 0.25),
            .fadeOut(duration:0.4),
            .fadeIn(duration:0.2, delay:1),
            .move(to: CGPoint(x:100, y:100)),
            .move(to: animatedView.frame.origin, duration:2),
            .rotate(by: 180),
            .move(by: CGPoint(x:200, y:200)),
            .move(by: CGPoint(x:-200, y:-200))
        ])
        
        /*animatedView.animate(parallel: [
            .scale(by: 4),
            .fadeOut()
        ])*/
    }
    
}

