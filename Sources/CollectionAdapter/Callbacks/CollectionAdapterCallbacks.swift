import UIKit

open class CollectionAdapterCallbacks {
    // MARK: - Types
    public typealias CollectionData = (section: CollectionSection, row: CollectionItemConfigurable)

    // MARK: - Props

//    // MARK: - Edit
//    #if swift(>=4.2)
//    public typealias TableViewCellEditingStyle = UITableViewCell.EditingStyle
//    #else
//    public typealias TableViewCellEditingStyle = UITableViewCellEditingStyle
//    #endif

//    public typealias CanEditRow = (UITableView, IndexPath, CollectionData) -> Bool
//    public typealias EditingStyleRow = (UITableView, IndexPath, CollectionData) -> TableViewCellEditingStyle
//    public typealias CommitEditRow = (UITableView, IndexPath, TableViewCellEditingStyle, CollectionData) -> Void
//
//    public var canEditRow: CanEditRow?
//    public var editingStyleRow: EditingStyleRow?
//    public var commitEditRow: CommitEditRow?
    
    public typealias WillDisplayCell = (UICollectionView, UICollectionViewCell, CollectionData) -> Void
    public var willDisplayCell: WillDisplayCell?

//     MARK: - Header / Footer
    public typealias WillDisplayCollectionReusableView = (UICollectionView, UICollectionReusableView, Int) -> Void
    public typealias DidEndDisplayCollectionReusableView = WillDisplayCollectionReusableView

    public var willDisplayCollectionReusableView: WillDisplayCollectionReusableView?
    public var didEndDisplayCollectionReusableView: DidEndDisplayCollectionReusableView?
}
