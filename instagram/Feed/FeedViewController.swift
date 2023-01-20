//
//  FeedViewController.swift
//  instagram
//
//  Created by Данил on 18.01.2023.
//
import SnapKit
import UIKit

class FeedViewController: UIViewController {
    //MARK: - view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private let tableview = UITableView()
    private var items: [FeedItemType] = [
        .stories([
            FeedStoriesItemCellInfo(image: UIImage(named: "avatar")!, userName: "userName", isAddButtonVisible: true, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "avatar")!, userName: "userName", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "avatar")!, userName: "userName", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "avatar")!, userName: "userName", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "avatar")!, userName: "userName", isAddButtonVisible: false, isNewStory: false)
        ])
    ]
}

//MARK: - private extension
extension FeedViewController {
    private func configure() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = makeLeftBarButtonItem()
        navigationItem.rightBarButtonItems = makeRightButtonItem()
        view.addSubview(tableview)
        tableview.dataSource = self
        tableview.separatorColor = .clear
        tableview.register(FeedStoriesSetCell.self, forCellReuseIdentifier: String(describing: FeedStoriesSetCell.self))
        tableview.register(FeedPostCell.self, forCellReuseIdentifier: String(describing: FeedPostCell.self))
        tableview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func makeLeftBarButtonItem() -> [UIBarButtonItem] {
        let logoBarButtonItem = UIBarButtonItem(customView: LogoView())
        let dropDownMenuItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "chevron.down"), target: self, action: nil, menu: makeDropDownMenu())
        return [logoBarButtonItem, dropDownMenuItem]
    }
    
    func makeRightButtonItem() -> [UIBarButtonItem] {
        let addBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "plus.app"), target: self, action: #selector(funcAdd))
        let directBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "paperplane"), target: self, action: #selector(direct))
        return [directBarButtonItem, addBarButtonItem]
    }
    
    @objc private func funcAdd(){
        print("added")
    }
    
    @objc private func direct(){
        print("send message")
    }
    
    func makeDropDownMenu() -> UIMenu {
        let subsItem = UIAction(title: "Подписки", image: UIImage(systemName: "person.2")) { _ in
            print("Subs")
        }
        let favsItem = UIAction(title: "Изюранное", image: UIImage(systemName: "star")) { _ in
            print("Favorit")
        }
        return UIMenu(title: "", children: [subsItem, favsItem])
    }
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item {
        case .stories(let info):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedStoriesSetCell.self), for: indexPath) as! FeedStoriesSetCell
            cell.configure(with: info)
            return cell
            
        case .post(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedPostCell.self), for: indexPath) as! FeedPostCell
            cell.configure(with: post)
            return cell
        }
    }
}
