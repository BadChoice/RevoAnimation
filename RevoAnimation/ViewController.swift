import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animatedView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func animate(_ sender: Any) {
        animatedView.animate([
        //animatedView.animate(parallel: [
            .fadeOut(),
            .fadeIn(),
            .move(to: CGPoint(x:100, y:100)),
            .move(to: animatedView.frame.origin),
            .rotate(by: 180),
            .move(by: CGPoint(x:200, y:200)),
            .move(by: CGPoint(x:-200, y:-200))
        ])
    }
    
}

