//
//  MessagesViewController.swift
//  ZBMessaging
//
//  Created by Khalil Mhelheli on 9/3/2023.
//

import UIKit

class MessagesViewController: UIViewController {
    
    // outlets
    @IBOutlet var tableView: UITableView!
    @IBOutlet var editButton: UIButton!
    @IBOutlet var searchButton: UIButton!
    
    private var data: [CellConroller] = []
    
    var viewModel: MessagesViewControllerViewModel
    
    init(viewModel: MessagesViewControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "MessagesViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.excuteAction()
        data.append(GroupCellController(group: Group(name: "Sunday BBQ", body: "fdfsd")))
        data.append(GroupCellController(group: Group(name: "Sunday BBQ", body: "fdfsd")))
        data.append(GroupCellController(group: Group(name: "Sunday BBQ", body: "fdfsd")))
        data.append(GroupCellController(group: Group(name: "Sunday BBQ", body: "fdfsd")))
        data.append(MessagesCellController(model: Message(name: "Michael Davis", body: "fdfsd")))
        data.append(MessagesCellController(model: Message(name: "Michael Davis", body: "fdfsd")))
        data.append(MessagesCellController(model: Message(name: "Michael Davis", body: "fdfsd")))
        data.append(MessagesCellController(model: Message(name: "Michael Davis", body: "fdfsd")))
        data.append(MessagesCellController(model: Message(name: "Michael Davis", body: "fdfsd")))
        MessagesCellController.configure(tableView: tableView)
        GroupCellController.configure(tableView: tableView)
    }
    
}


extension MessagesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let controller = data[indexPath.row]
        return controller.tableView(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        data[indexPath.row].tableView(tableView, didSelectRowAt: indexPath)
    }
    
    
}
