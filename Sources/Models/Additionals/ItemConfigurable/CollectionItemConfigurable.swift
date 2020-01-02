import UIKit

open class CollectionItemConfigurable: ItemConfigurable {

    /// Модель данных ячейки
    open var cellVM: CollectionCellVM {
        preconditionFailure("This method must be overridden")
    }
}
