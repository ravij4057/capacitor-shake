import Foundation
import Capacitor

// Exact Cap-go logic: Extend UIWindow to catch motionEnded
extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: .deviceDidShake, object: nil)
        }
    }
}

extension Notification.Name {
    static let deviceDidShake = Notification.Name("deviceDidShake")
}

@objc(MyShakePlugin)
public class MyShakePlugin: CAPPlugin {
    
    override public func load() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.onShakeDetected), name: .deviceDidShake, object: nil)
    }

    @objc private func onShakeDetected() {
        // Notification aate hi JS ko notify karo
        self.notifyListeners("shake", data: [:])
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}