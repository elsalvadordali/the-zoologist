//
//  SecondScreen.swift
//  The Zoologist
//
//  Created by Tijana Jung on 2/22/23.
//

import UIKit

class SecondScreen: UIViewController {
    
    //let stackView = UIStackView()
    let animal: Animal
    let image = UIImageView()
    let latinName = UILabel()
    let tableView = UITableView()
    let infoView = UIStackView()
    
    init(animal: Animal) {
        self.animal = animal
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let scrollView = UIScrollView(frame: CGRect(x: 10, y: 10, width: view.frame.size.width - 20, height: view.frame.size.height - 20))
        scrollView.backgroundColor = .systemPink
        view.addSubview(scrollView)
        
        scrollView.addSubview(image)
        scrollView.addSubview(tableView)
        
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 2000)

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureStackView() {
        //view.addSubview(scrollView)
        //scrollView.addSubview(infoView)
    }
    
    struct Cells {
        static let factCells = "FactCells"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(infoView)
        infoView.addSubview(image)
        infoView.addSubview(tableView)
        //infoView.addSubview(latinName)
        
        //scrollView.isScrollEnabled = true
        //scrollView.contentSize = CGSizeMake(1000, 1000)
        // HERE scrollView.contentSize =
        
        view.backgroundColor = .white
        title = animal.name
        navigationController?.navigationBar.prefersLargeTitles = true
        image.image = animal.image
        tableView.rowHeight = 24

        configueTableView()
        setInfoViewConstraints()
        setImageConstraints()
    }
    
    
    
    func configueTableView() {
        infoView.addSubview(tableView)
        // Four things:
        
        // set delegates
        setTableDelegates()
        tableView.register(FactCell.self, forCellReuseIdentifier: Cells.factCells)

        //set constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 32).isActive = true
        tableView.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: -20).isActive = true
    }
    func setTableDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // CONSTRAINTS
    
    private func setInfoViewConstraints() {
        infoView.translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        constraints.append(infoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(infoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(infoView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(infoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        NSLayoutConstraint.activate(constraints)
    }
    
    func setNameConstraint() {
        latinName.translatesAutoresizingMaskIntoConstraints = false
        latinName.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        latinName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setImageConstraints() {
        image.translatesAutoresizingMaskIntoConstraints                                           = false
        image.topAnchor.constraint(equalTo: infoView.topAnchor).isActive                          = true
        image.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 24).isActive    = true
        image.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -24).isActive = true
        image.heightAnchor.constraint(equalTo: image.widthAnchor).isActive                        = true
        
    }
}

extension SecondScreen: UITableViewDelegate, UITableViewDataSource {
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


