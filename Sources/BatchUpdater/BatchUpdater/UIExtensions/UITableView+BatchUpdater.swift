//
//  UITableView.swift
//  TestBatchUpdate
//
//  Created by Roman Kotov on 14/07/2018.
//  Copyright © 2018 Roman Kotov. All rights reserved.
//

import UIKit

extension UITableView {
    func performBatchUpdates(sectionsChanges: SectionsChanges, sectionChanges: SectionChanges, completion: ((Bool) -> Void)?) {
        if #available(iOS 11.0, *) {
            performBatchUpdates({
                updateActions(sectionsChanges: sectionsChanges, sectionChanges: sectionChanges)
            }, completion: completion)
            reloadRows(at: sectionChanges.updates, with: .fade)
        } else {
            beginUpdates()
            updateActions(sectionsChanges: sectionsChanges, sectionChanges: sectionChanges)
            reloadRows(at: sectionChanges.updates, with: .fade)
            endUpdates()

            if let completion = completion {
                completion(true)
            }
        }
    }

    // MARK: - Private
    private func updateActions(sectionsChanges: SectionsChanges, sectionChanges: SectionChanges) {
        // sections
        deleteSections(sectionsChanges.deletes, with: .fade)
        insertSections(sectionsChanges.inserts, with: .fade)
        for move in sectionsChanges.moves {
            moveSection(move.from, toSection: move.to)
        }
        reloadSections(sectionsChanges.updates, with: .fade)

        // rows
        deleteRows(at: sectionChanges.deletes, with: .fade)
        insertRows(at: sectionChanges.inserts, with: .fade)
        for move in sectionChanges.moves {
            guard !sectionsChanges.deletes.contains(move.from.row) && !sectionsChanges.inserts.contains(move.to.row) else {
                continue
            }
            moveRow(at: move.from, to: move.to)
        }
    }
}