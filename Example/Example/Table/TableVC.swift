import UIKit
import RKTableAdapter

class TableVC: UIViewController {
    // MARK: - Variables
    lazy var tableAdapter = TableViewAdapter(tableView: self.tableView)

    // MARK: - UI
    let tableView: UITableView = UITableView(frame: .zero, style: .grouped)

    // MARK: - Init / Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        setupTableAdapter()
        configureTableAdapterContent()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    // MARK: - Configure
    private func configure() {
        configureNavigationBar()
        view.backgroundColor = .white

        tableView.frame = view.bounds
        view.addSubview(tableView)
    }

    private func configureNavigationBar() {
        title = "Main"

        let btn1 = UIBarButtonItem(title: "1", style: .plain, target: self, action: #selector(action1))
        let btn2 = UIBarButtonItem(title: "2", style: .plain, target: self, action: #selector(action2))
        navigationItem.setRightBarButtonItems([btn1, btn2], animated: true)
    }

    // MARK: - Actions
    @objc
    func action1() {
        let tableList = DataGenerator.generateViewModels1()

        tableAdapter.reload(with: tableList)
    }

    @objc
    func action2() {
        let tableList = DataGenerator.generateViewModels2()

        tableAdapter.reload(with: tableList)
    }

    // MARK: - TableAdapter
    private func setupTableAdapter() {

    }

    private func configureTableAdapterContent() {
        let tableList = DataGenerator.generateViewModels1()

        tableAdapter.reload(with: tableList)
    }


    // MARK: TableAdapter Make sections

    // MARK: TableAdapter Actions

    // MARK: - Private
}

