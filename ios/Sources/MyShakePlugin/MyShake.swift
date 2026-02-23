import Foundation

@objc public class MyShake: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
