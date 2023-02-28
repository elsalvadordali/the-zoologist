//
//  Info.swift
//  The Zoologist
//
//  Created by Tijana Jung on 2/27/23.
//

import UIKit

class Info: UIViewController, UIScrollViewDelegate {
    
    let animal: Animal
    
    struct Cells {
        static let factCells = "FactCells"
    }

    init(animal: Animal) {
        self.animal = animal
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = animal.name
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        latinName.text = animal.latinName
        animalImage.image = animal.image

        setTableDelegates()
        tableView.register(FactCell.self, forCellReuseIdentifier: Cells.factCells)
        content.addSubview(tableView)

        setConstraints()
        scrollView.isScrollEnabled = true
    }
    
    override func viewDidLayoutSubviews() {
        scrollView.contentSize = CGSizeMake(view.frame.width, 1000)
    }

    // create scroll view
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = true
        view.isDirectionalLockEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //create content view
    let con: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //create UI
    let content: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let latinName: UILabel = {
        let name = UILabel()
        name.sizeToFit()
        name.lineBreakMode = .byWordWrapping
        name.translatesAutoresizingMaskIntoConstraints = false
        //name.text = animal.name
        return name
    }()
    
    let animalImage = UIImageView()

    
    let tableView:  UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 48
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    func setTableDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //add constraints
    
    func setConstraints() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        scrollView.addSubview(content)
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 6),
            content.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            content.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            content.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -6),
            content.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        
        content.addSubview(latinName)
        NSLayoutConstraint.activate([
            latinName.topAnchor.constraint(equalTo: content.topAnchor, constant: 24),
            latinName.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 24),
            latinName.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -34),
            latinName.bottomAnchor.constraint(equalTo: content.bottomAnchor, constant: -24)
        ])
        
        content.addSubview(animalImage)
        animalImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animalImage.topAnchor.constraint(equalTo: latinName.bottomAnchor),
            animalImage.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 24),
            animalImage.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -24),
            animalImage.heightAnchor.constraint(equalTo: animalImage.widthAnchor)
        ])
         
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: animalImage.bottomAnchor, constant: 24),
            tableView.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 24),
            tableView.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -24),
            tableView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
    }
    
}


extension Info: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animal.funFacts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.factCells) as! FactCell
        let fact = animal.funFacts[indexPath.row]
        cell.set(fact: fact)
        return cell
    }
}
