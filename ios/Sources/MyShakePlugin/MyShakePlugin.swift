import Foundation
import Capacitor
import CoreMotion

@objc(MyShakePlugin)
public class MyShakePlugin: CAPPlugin {
    private let motionManager = CMMotionManager()
    private let queue = OperationQueue()
    private let shakeThreshold = 2.5
    
    // Timer add kiya taaki baar-baar trigger na ho
    private var lastShakeTime: TimeInterval = 0
    private let cooldownLimit: TimeInterval = 2.0 // 2 seconds cooldown

    override public func load() {
        startMonitoring()
    }

    private func startMonitoring() {
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.1
            motionManager.startAccelerometerUpdates(to: queue) { [weak self] (data, error) in
                guard let acceleration = data?.acceleration else { return }
                let totalAcceleration = sqrt(pow(acceleration.x, 2) + pow(acceleration.y, 2) + pow(acceleration.z, 2))

                if totalAcceleration > self?.shakeThreshold ?? 2.5 {
                    let now = Date().timeIntervalSince1970
                    
                    // Check karein ki pichla shake 2 second pehle hua tha ya nahi
                    if now - (self?.lastShakeTime ?? 0) > (self?.cooldownLimit ?? 2.0) {
                        self?.lastShakeTime = now
                        print("DEBUG: Shake Captured (Throttled)")
                        self?.notifyJS()
                    }
                }
            }
        }
    }

    private func notifyJS() {
        DispatchQueue.main.async {
            self.notifyListeners("shake", data: [:])
        }
    }
}