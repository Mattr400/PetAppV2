//
//  ChatGPTAPI.swift
//  PetAppV2
//
//  Created by Matthew Regalado on 3/27/23.
//

import Foundation
import Alamofire
import Combine

class ChatGPTAPI {
    let baseURL = "https://api.openai.com/v1/completions"
    
    func sendMessage(message: String) -> AnyPublisher<OpenAICompletionsResponse, Error> {
        let body = OpenAICompletionsBody(model: "text-davinci-003", prompt: message, temperature: 0.7, max_tokens: 256)
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(Constants.apiKey)"
        ]
        return Future { [weak self] promise in
            guard let self = self else { return }
            AF.request(self.baseURL, method: .post, parameters: body, encoder: .json, headers: headers).responseDecodable(of: OpenAICompletionsResponse.self) {response in
                switch response.result {
                case .success(let result):
                    promise(.success(result))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}

struct OpenAICompletionsBody: Encodable {
    let model: String
    let prompt: String
    let temperature: Float?
    let max_tokens: Int
}

struct OpenAICompletionsResponse: Decodable {
    let id: String
    let choices: [OpenAICompletionsChoice]
}

struct OpenAICompletionsChoice: Decodable {
    let text: String
}
