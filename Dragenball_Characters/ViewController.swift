import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, DragonballDelegate {

    @IBOutlet weak var charactersPickerView: UIPickerView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var kiLabel: UILabel!
    @IBOutlet weak var raceLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    let character: Character_Names = Character_Names()
    let dragonballManager = DragonballManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charactersPickerView.delegate = self
        charactersPickerView.dataSource = self
        dragonballManager.mydelegateDragonball = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return character.characters.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return character.characters[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let characterID = matchName(name: character.characters[row])
        dragonballManager.fetchURL(name: characterID)
    }
    
    func delegateFunction(dragonballData: CharacterModel) {
        DispatchQueue.main.async {
            self.nameLabel.text = dragonballData.name
            self.kiLabel.text = dragonballData.ki
            self.raceLabel.text = dragonballData.race
            print(dragonballData.image)

        }
    }
    
    func matchName(name: String) -> String {
        switch name {
        case "Goku": return "1"
        case "Vegeta": return "2"
        case "Piccolo": return "3"
        case "Bulma": return "4"
        case "Freezer": return "5"
        case "Gohan": return "10"
        case "Krilin": return "11"
        case "Tenshinhan": return "12"
        case "Yamcha": return "13"
        case "Chi-Chi": return "14"
        case "Gotenks": return "15"
        case "Trunks": return "16"
        case "Master Rosh": return "17"
        default: return "1"
        }
        
    }
}

