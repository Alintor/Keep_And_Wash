//
//  ClothesListViewController.swift
//  Keep_And_Wash
//
//  Created by Alexandr Ovchinnikov on 06/07/2018.
//

import DTModelStorage
import DTTableViewManager

final class ClothesListViewController: UIViewController, ClothesListViewInput, DTTableViewManageable {

    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - View out

    var output: ClothesListModuleInput?
    var viewIsReady: (() -> Void)?
    var viewDidAppear: (() -> Void)?
    var dataSourceIsReady: ((_ dataSource: MemoryStorage) -> Void)?
    var itemSelected: ((_ item: ClothesListViewModel) -> Void)?
    var showLaundryIcons: (() -> Void)?

    // MARK: - View in

    func setupInitialState() {
        manager.startManaging(withDelegate: self)
        manager.configureEvents(for: ClothesSwipeableCell.self) { cellType, _ in
            manager.register(cellType)
            manager.didSelect(cellType) { [weak self] _, model, _ in
                self?.itemSelected?(model)
            }
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewDidAppear?()
    }
    
    // MARK: Actions
    
    @IBAction func laundryIconsTapped() {
        showLaundryIcons?()
    }
}
