//
//  DetachmentTypeViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammerShared

final class DetachmentTypeViewController: DetachmentTypeBaseViewController {
    let roaster: RoasterResponse
    var interactor: DetachmentTypeViewOutput!
    var detachmentTypes: [DetachmentShortResponse] = []

    init(roaster: RoasterResponse) {
        self.roaster = roaster
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        interactor.getDetachmentTypes()
    }
}

extension DetachmentTypeViewController: DetachmentTypeView {
    func displayDetachmentTypes(detachmentTypes: [DetachmentShortResponse]) {
        self.detachmentTypes = detachmentTypes
        tableView.reloadData()
    }

    func didReceiveError(error: Error) {
        let alert = Alerter().informationalAlert(title: "Error", message: error.localizedDescription)
        present(alert, animated: true, completion: nil)
    }
}

extension DetachmentTypeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detachmentTypes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SingleLabelTableViewCell = tableView.dequeueIdentifiableCell(for: indexPath)
        let detachmentType = detachmentTypes[indexPath.row]

        cell.setupWithText("\(detachmentType.name) - \(detachmentType.commandPoints) CP")

        return cell
    }
}

extension DetachmentTypeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}