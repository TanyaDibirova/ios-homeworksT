
import Foundation

class FeedModel {
    var secretWord = "secret"
    
    func chek(word: String) -> Bool {
        if word == secretWord {
            return true
        }else {
            return false
        }
    }
}
