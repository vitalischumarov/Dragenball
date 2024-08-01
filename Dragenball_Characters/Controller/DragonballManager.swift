import Foundation

class DragonballManager {
    var url: String = "https://dragonball-api.com/api/characters/"
    
    var mydelegateDragonball: DragonballDelegate?
    
    func fetchURL(name: String) {
        let urlString = "\(url)\(name)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("an error ist occured:")
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let readyData = self.parseJSON(information: safeData) {
                        self.mydelegateDragonball?.delegateFunction(dragonballData: readyData)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(information: Data) -> CharacterModel? {
        let codable = JSONDecoder()
        do {
            let decodedData = try codable.decode(CharacterModel.self, from: information)
            return decodedData
        } catch {
            print("Fehler aufgetreten im try / catch block")
            print(error)
            return nil
        }
    }
    
}
