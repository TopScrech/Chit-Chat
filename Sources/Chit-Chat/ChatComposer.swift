import ScrechKit

@available(iOS 26, macOS 26, *)
public struct ChatComposer: View {
    @Binding private var prompt: String
    @Binding private var isResponding: Bool
    private let sendPrompt: () -> ()
    private let stopAction: (() -> ())?
    
    public init(
        prompt: Binding<String>,
        isResponding: Binding<Bool>,
        sendPrompt: @escaping () -> (),
        stopAction: (() -> ())? = nil
    ) {
        _prompt = prompt
        _isResponding = isResponding
        self.sendPrompt = sendPrompt
        self.stopAction = stopAction
    }
    
    @FocusState private var isFocused
    
    public var body: some View {
        HStack {
            if let stopAction {
                Button("Stop", systemImage: "stop.fill", role: .destructive, action: stopAction)
                    .frame(35)
#if !os(visionOS)
                    .glassEffect()
#endif
                    .tint(.red)
                    .labelStyle(.iconOnly)
            }
            
            TextField("Type here...", text: $prompt)
                .onSubmit(sendPrompt)
                .frame(height: 35)
                .padding(.horizontal, 10)
#if !os(visionOS)
                .glassEffect()
#endif
                .focused($isFocused)
                .submitLabel(.send)
                .disabled(isResponding)
            
            Button("Send", systemImage: "paperplane", action: sendPrompt)
                .frame(35)
                .labelStyle(.iconOnly)
                .foregroundStyle(.foreground)
#if !os(visionOS)
                .glassEffect()
#endif
                .fontSize(16)
                .disabled(isResponding || prompt.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        }
        .padding()
        .task {
            isFocused = true
        }
    }
}
