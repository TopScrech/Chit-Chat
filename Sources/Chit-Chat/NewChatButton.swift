import SwiftUI

public struct NewChatButton: View {
    private let disabled: Bool
    private let action: () -> ()
    
    public init(disabled: Bool, action: @escaping () -> Void) {
        self.disabled = disabled
        self.action = action
    }
    
    public var body: some View {
        Button("New Chat", systemImage: "square.and.pencil", action: action)
            .disabled(disabled)
            .keyboardShortcut("n")
    }
}
