import Foundation
import Capacitor
import CoreMotion

@objc(MyShakePlugin)
public class MyShakePlugin: CAPPlugin {
    private let motionManager = CMMotionManager()
    private let queue = OperationQueue()
    private let shakeThreshold = 2.5 // Sensitivity

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
                    print("DEBUG: Native Shake Detected - Notifying JS")
                    self?.notifyJS()
                }
            }
        }
    }

    private func notifyJS() {
        // Hamesha Main Thread se JS ko bhejien
        DispatchQueue.main.async {
            self.notifyListeners("shake", data: [:])
        }
    }

    deinit {
        motionManager.stopAccelerometerUpdates()
    }
}