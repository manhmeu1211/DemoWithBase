//
//  NewsVC.swift
//  BaseAFAPI
//
//  Created by ManhLD on 11/12/20.
//

import UIKit
import RealmSwift

class NewsVC: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model : [NewsModel] = []
    var pageIndex = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getNews()
    }
    
    private func setupTableView() {
        tableView.register(NewsCell.nib, forCellReuseIdentifier: NewsCell.interfaceId)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func getNews() {
        NewsAPI(paramss: ["pageIndex": "\(pageIndex)", "pageSize": "20"]).execute { [weak self] (response) in
            switch response {
            case .success(let news):
                self?.model = news.response?.news ?? []
                self?.tableView.reloadData()
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
}

extension NewsVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.interfaceId, for: indexPath) as? NewsCell else {
            return UITableViewCell()
        }
        cell.setupCell(model: model[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    
}
