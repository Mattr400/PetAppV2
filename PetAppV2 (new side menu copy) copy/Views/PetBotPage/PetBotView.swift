//
//  PetBotPage.swift
//  PetAppV2
//
//  Created by Matthew Regalado on 3/27/23.
//

import SwiftUI
import Combine

struct PetBotView: View{
    @State var chatMessages: [ChatMessage] = []
    @State var messageText: String = ""
    let openAIService = ChatGPTAPI()
    
    @State var cancellables = Set<AnyCancellable>()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(chatMessages, id: \.id) { message in
                        messageView(message: message)
                    }
                }
            }
            HStack {
                TextField("Enter a message", text: $messageText)
                    .padding()
                    .background(.gray.opacity(0.2))
                    .cornerRadius(12)
                Button {
                    sendMessage()
                } label: {
                    Text("Send")
                        .foregroundColor(.white)
                        .padding()
                        .background(.red)
                        .cornerRadius(12)
                }
            }
          
            .padding()
        }
        
    }
    func messageView(message: ChatMessage) -> some View {
        HStack{
            if message.sender == .me { Spacer() }
            Text(message.content)
                .foregroundColor(message.sender == .me ? .white : .black)
                .padding()
                .background(message.sender == .me ? .blue : .gray.opacity(0.3))
                .cornerRadius(16)
            if message.sender == .gpt { Spacer() }
        }
    }
    
    func sendMessage() {
        let myMessage = ChatMessage(id: UUID().uuidString, content: messageText, dateCreated: Date(), sender: .me)
        chatMessages.append(myMessage)
        openAIService.sendMessage(message: messageText).sink{ completion in
            // Handle error
        } receiveValue: { response in
            guard let textResponse = response.choices.first?.text else { return }
            let gptMessage = ChatMessage(id: response.id, content: textResponse, dateCreated: Date(), sender: .gpt)
            chatMessages.append(gptMessage)
        }
        .store(in: &cancellables)
        messageText = ""
    }
}
        

struct PetBotPage_Previews: PreviewProvider {
    static var previews: some View {
        PetBotView()
    }
}

struct ChatMessage {
    let id: String
    let content: String
    let dateCreated: Date
    let sender: MessageSender
}

enum MessageSender {
    case me
    case gpt
}
extension ChatMessage {
    static let sampleMessages = [
        ChatMessage(id: UUID().uuidString, content: "Sample Message From me", dateCreated: Date(), sender: .me),
        ChatMessage(id: UUID().uuidString, content: "Sample Message From gpt", dateCreated: Date(), sender: .gpt),
        ChatMessage(id: UUID().uuidString, content: "Sample Message From me", dateCreated: Date(), sender: .me),
        ChatMessage(id: UUID().uuidString, content: "Sample Message From gpt", dateCreated: Date(), sender: .gpt)
    
    ]
}



