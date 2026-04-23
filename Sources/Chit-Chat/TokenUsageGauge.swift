import ScrechKit

/// Provide a value between 0.0 & 1.0
@available(macOS 13, iOS 16, watchOS 7, *)
public struct TokenUsageGauge: View {
    private let value: Double
    private let action: () -> ()
    
    public init(value: Double, action: @escaping () -> Void) {
        self.value = value
        self.action = action
    }
    
    private var tint: Color {
        if value == 0 {
            .gray
        } else if (0...0.5).contains(value) {
            .green
        } else if (0.5...0.75).contains(value) {
            .orange
        } else {
            .red
        }
    }
    
    public var body: some View {
        Gauge(value: value) {}
            .gaugeStyle(.accessoryCircularCapacity)
            .scaleEffect(0.5)
            .frame(30)
            .tint(tint)
            .animation(.default, value: value)
            .onTapGesture(perform: action)
    }
}
