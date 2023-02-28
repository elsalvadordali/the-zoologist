//
//  ZooTable.swift
//  The Zoologist
//
//  Created by Tijana Jung on 2/22/23.
//
    
import UIKit

class ZooTableVC: UIViewController {
    
    var tableView = UITableView()
    var animals: [Animal] = []
    
    struct Cells {
        static let animalCell = "AnimalCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "The Zoo"
        animals = fetchData()
        setTableDelegates()
        configueTableView()
    }
    
    func configueTableView() {
        view.addSubview(tableView)
        // Four things:
        
        // set delegates
        setTableDelegates()
        
        //set row height
        tableView.rowHeight = 240

        //register cells
        tableView.register(AnimalCell.self, forCellReuseIdentifier: Cells.animalCell)

        //set constraints
        tableView.pin(to: view)
    }
    
    func setTableDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ZooTableVC: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.animalCell) as! AnimalCell
        let animal = animals[indexPath.row]
        cell.set(animal: animal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let currentAnimal = animals[indexPath.row]
        
        let infoScreen = Info(animal: currentAnimal)
        infoScreen.title = currentAnimal.name
        
        navigationController?.pushViewController(infoScreen, animated: true)
        
        // HOW TO NAVIGATE!!
        //let rootVC = SecondScreen()
        //let navVC = UINavigationController(rootViewController: rootVC)  (works well, but maybe not ideal??)
        //let navVC = UINavigationController(rootViewController: rootVC)
        
        //present(navVC, animated: true)
        
    }
}


extension ZooTableVC {
    func fetchData() -> [Animal] {
       return  [Animal(
            name: "California sea lion",
            latinName: "Zalophus californianus",
            image: UIImage(named: "California-Sea-Lion")!,
            funFacts: [
                "There are six species of sea lion",
                "They are intelligent enough to be trained",
                "They have blue-green color vision",/*
                "California sea lions communicate via various methods of vocalization",
                "Sea Lions have ears flaps, seals don't",
                "They can go without touching land for up to two weeks at a time"*/
            ],
            sizeRange: [2.1, 2.7],
            sizeUnit: "meters",
            weightRange: [],
            endangeredStatus: "least concern",
            diet: "carnivore"
            
        ),/*
        Animal(
            name: "Stingray",
            image: UIImage(named: "Aardvark")!,
            funFacts: [
                "Stingrays are related to sharks",
                "There are eight families of stingrays",
                "Stingrays are edible",
                "Usually they are very docile, and curious, though bigger ones can be aggressive"
            ],
            sizeRange: [2.1, 2.7],
            sizeUnit: "meters",
            weightRange: [],
            endangeredStatus: "least concern",
            diet: "carnivores"
        ), */
        Animal(
            name: "Tupaia",
            latinName: "Tupaia (varies)",
            image: UIImage(named: "Dwarf-Tupaia")!,
            funFacts: [
                "Tupaias are a native from northeastern India to south east Asia",
                "They are able to hear ultrasonic sounds",
                "All Tupaias are treeshrews, but not all treeshrews are Tupaia",/*
                "They use their super sense of smell to find food amongst leaf litter on the forest floor",
                "Humans don't eat them because they taste bad",*/
                ""
            ],
            sizeRange: [],
            sizeUnit: "",
            weightUnit: "",
            endangeredStatus: "Least Concern",
            diet: "Herbivore"
        ), Animal(
            name: "Boa Constrictor",
            latinName: "Boa Constrictor",
            image: UIImage(named: "Boa-Constrictor")!,
            funFacts: [
                "Boa Constrictors are not venomous",
                "One of the only animals to have the same English and Latin (scientific) name",
                "They are native to South America"/*,
                "They squeeze their prey until the prey's bones are crushed and the blood flow is cut off to the prey's heart",
                "The females are usually larger than the males",
                "They usually eat medium-sized pray, such as rodents, larger lizards, monkeys and wild pigs, and even sometimes birds",
                "They are nocturnal"*/
            ],
            sizeRange: [1.8, 3],
            sizeUnit: "meters",
            weightRange: [10, 45],
            weightUnit: "kg",
            endangeredStatus: "Least Concern",
            diet: "Carnivore"
        ),
            Animal(
                    name: "Saki",
                    latinName: "Pithecia (genus)",
                    image: UIImage(named: "Bald-Headed-Saki")!,
                    funFacts: [
                        "Sakis are diurnal, meaning they are active during the day",
                        "They eat mostly fruit, making the frugivores",
                        "They are \"New World Moneys\", meaning they are native to South America"/*,
                        "They live in small groups of two to four, but can sometimes come together into larger groups",
                        "They usually eat medium-sized pray, such as rodents, larger lizards, monkeys and wild pigs, and even sometimes birds",
                        "They are nocturnal"*/
                    ],
                    sizeRange: [30, 50],
                    sizeUnit: "centimeters",
                    weightRange: [2],
                    weightUnit: "kg",
                    endangeredStatus: "Least Concern",
                    diet: "Herbivore"
                ),
                Animal(
                    name: "Aye-Aye",
                    latinName: "Daubentonia madagascariensis",
                    image: UIImage(named: "Aye-Aye")!,
                    funFacts: [
                        "An Aye-Aye is a species of lemur",
                        "Lemurs are native to madegascar",
                        "They are the world's largest nocturnal primate, meaning they like moneyking around at night",/*
                        "Their tails are longer than their bodies",
                        "They have really long and thin fingers, the third finger being the thinnest, which is commonly used to fish insects out of trees",
                        "They have evolved a sixth finger, which is sort of like a thumb"*/
                    ],
                    sizeRange: [60],
                    sizeUnit: "centimeters",
                    weightRange: [2],
                    weightUnit: "kg",
                    endangeredStatus: "Least Concern",
                    diet: "Omnivore"
                )
       ]
    }
}
    

