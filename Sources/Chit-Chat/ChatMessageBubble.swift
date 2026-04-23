import SwiftUI

public struct ChatMessageBubble: View {
    private let message: ChatMessage
    
    public init(_ message: ChatMessage) {
        self.message = message
    }
    
    public var body: some View {
        HStack {
            if message.role == .assistant {
                Text(message.renderedText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            } else {
                Text(message.text)
                    .padding()
                    .background(.tint.opacity(0.15), in: .rect(cornerRadius: 20))
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}
