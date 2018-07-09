//
//  LaundryIconsListViewController.swift
//  Keep_And_Wash
//
//  Created by Alexandr Ovchinnikov on 06/07/2018.
//

import DTModelStorage
import DTTableViewManager

final class LaundryIconsListViewController: UIViewController, LaundryIconsListViewInput, DTTableViewManageable {

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View out

    var output: LaundryIconsListModuleInput?
    var viewIsReady: (() -> Void)?
    var dataSourceIsReady: ((_ dataSource: MemoryStorage) -> Void)?

    // MARK: - View in

    func setupInitialState() {
        manager.startManaging(withDelegate: self)
        manager.configureEvents(for: LaundryIconCell.self) { cellType, modelType in
            manager.register(cellType)
            manager.heightForCell(withItem: modelType) { _, _ in return UITableViewAutomaticDimension }
        }
        if let dataSource = manager.storage as? MemoryStorage {
            dataSourceIsReady?(dataSource)
        }
    }

	// MARK: - Life cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		viewIsReady?()
	}
}
