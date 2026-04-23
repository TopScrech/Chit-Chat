import Foundation

public struct ChatMessage: Identifiable {
    public let id = UUID()
    public let role: ChatMessageRole
    public var text: String
    
    public init(role: ChatMessageRole, text: String) {
        self.role = role
        self.text = text
    }
    
    public var renderedText: AttributedString {
        do {
            return try AttributedString(
                markdown: text,
                options: AttributedString.MarkdownParsingOptions(
                    interpretedSyntax: .inlineOnlyPreservingWhitespace,
                    failurePolicy: .returnPartiallyParsedIfPossible
                )
            )
        } catch {
            return AttributedString(text)
        }
    }
}
