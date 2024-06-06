//
//  AudioPokemon.swift
//  iOS201pokee22
//
//  Created by cmStudent on 2024/04/27.
//

import Foundation
import AVFoundation
import OggDecoder // Library convert file ogg to wav

class AudioPokemonManager {
    static let instance = AudioPokemonManager()
    private init() { }
    var audioPlayer: AVAudioPlayer?
    let decoder = OGGDecoder()
    func playSound(url: String) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, _ in
            guard let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300,
                  let data = data
            else { return }
            
            do {
                let temporaryURL = FileManager.default.temporaryDirectory.appendingPathComponent("pokemon_audio.ogg")
                
                // Ghi dữ liệu vào file
                try data.write(to: temporaryURL)
                
                // Tại đây bạn có thể sử dụng URL của file đã lưu
               // print("File saved to: \(temporaryURL)")
                
                
                let path = self.decoder.decode(temporaryURL) // path file wav
                do {
                    if let path = path {
                        self.audioPlayer = try AVAudioPlayer(contentsOf: path)
                        self.audioPlayer?.prepareToPlay()
                        self.audioPlayer?.play()
                    }
                } catch {
                    print("Error to play file")
                }
                
            } catch {
                // Xử lý lỗi ghi file tại đây
                print("Error saving file: (error.localizedDescription)")
            }
        }
        .resume()
    }
    
//    func checkFileExisted(path: String) -> Bool {
//        
//    }
}
