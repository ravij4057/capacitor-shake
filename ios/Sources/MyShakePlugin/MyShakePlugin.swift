import Foundation
import Capacitor

// 1. Native UIWindow extension (Native Shake detection)
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

// 2. Plugin Bridge Class
@objc(MyShakePlugin)
public class MyShakePlugin: CAPPlugin {
    
    override public func load() {
        // Listen for native notification
        NotificationCenter.default.addObserver(self, selector: #selector(self.onShakeDetected), name: .deviceDidShake, object: nil)
    }

    @objc private func onShakeDetected() {
        // Yeh line Xcode terminal mein dikhegi
        print("DEBUG: Native Shake Captured - Sending to JS")
        
        // JS ko notify hamesha MAIN THREAD se karein
        DispatchQueue.main.async {
            self.notifyListeners("shake", data: [:])
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}