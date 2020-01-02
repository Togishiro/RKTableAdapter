import UIKit

open class TableRowConfigurable: ItemConfigurable {
    /// Модель данных ячейки
    open var cellVM: TableCellVM {
        preconditionFailure("This method must be overridden")
    }
}
