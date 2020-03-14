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
            .fadeOut(duration:0.4),
            .fadeIn(),
            .move(to: CGPoint(x:100, y:100)),
            .move(to: animatedView.frame.origin, duration:2),
            .rotate(by: 180),
            .move(by: CGPoint(x:200, y:200)),
            .move(by: CGPoint(x:-200, y:-200))
        ])
    }
    
}

