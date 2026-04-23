import SwiftUI

/// Provide a value between 0.0 & 1.0
@available(macOS 13, iOS 16, watchOS 7, *)
public struct TokenUsageGauge: View {
    private let value: Double
    private let action: () -> ()
    
    public init(value: Double, action: @escaping () -> Void) {
        self.value = value
        self.action = action
    }
    
    public var body: some View {
        Gauge(value: value) {}
            .gaugeStyle(.accessoryCircularCapacity)
            .scaleEffect(0.5)
            .frame(width: 30, height: 30)
            .tint(.green)
            .animation(.default, value: value)
            .onTapGesture(perform: action)
    }
}
