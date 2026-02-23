import Foundation
import Capacitor

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

@objc(MyShake)
public class MyShakePlugin: CAPPlugin {
    
    override public func load() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.onShakeDetected), name: .deviceDidShake, object: nil)
    }

    @objc private func onShakeDetected() {
        print("DEBUG: Native iOS Shake Captured")
        DispatchQueue.main.async {
            self.notifyListeners("shake", data: [:])
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}