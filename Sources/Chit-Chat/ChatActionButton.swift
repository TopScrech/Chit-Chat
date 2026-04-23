import SwiftUI

public struct ChatActionButton: View {
    private let title: String
    private let systemImage: String
    private let action: () -> Void
    
    public init(_ title: String, systemImage: String, action: @escaping () -> ()) {
        self.title = title
        self.systemImage = systemImage
        self.action = action
    }
    
    public var body: some View {
        Button(title, systemImage: systemImage, action: action)
#if !os(visionOS)
            .buttonStyle(.glassProminent)
#endif
            .transition(
                .offset(x: -12, y: -12)
                .combined(with: .scale(scale: 0.50, anchor: .topLeading))
                .combined(with: .opacity)
            )
    }
}
