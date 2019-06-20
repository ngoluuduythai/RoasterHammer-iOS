//
//  EditUnitView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/19/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct EditUnitView : View {
    @ObjectBinding var rosterData: RoasterInteractor
    var selectedUnit: SelectedUnitResponse
    let detachment: DetachmentResponse

    private var uniqueModels: [SelectedModelResponse] {
        return rosterData.selectedUnit?.models.unique { $0.model.name } ?? []
    }

    var body: some View {
        List {
            ForEach(uniqueModels) { uniqueSelectedModel in
                Section(header: self.makeHeader(uniqueSelectedModel: uniqueSelectedModel)) {
                    ForEach(self.modelsByName(uniqueSelectedModel.model.name)) { selectedModel in
                        NavigationButton(destination: Text("Edit Model \(selectedModel.model.name)")) {
                            EditUnitRow(selectedModel: selectedModel)
                        }
                    }
                }
            }
        }
    }

    private func modelsByName(_ name: String) -> [SelectedModelResponse] {
        return rosterData.selectedUnit?.models.filter { $0.model.name == name } ?? []
    }

    private func makeHeader(uniqueSelectedModel: SelectedModelResponse) -> some View {
        return HeaderAndActionButtonHeader(text: uniqueSelectedModel.model.name,
                                           buttonTitle: "Add",
                                           action: {
                                            self.rosterData.addModel(uniqueSelectedModel.model.id,
                                                                     toUnit: self.selectedUnit.id,
                                                                     inDetachment: self.detachment.id)
        })
    }
}

struct EditUnitHeader: View {
    let selectedModel: SelectedModelResponse

    var body: some View {
        HStack {
            Text(selectedModel.model.name)
            Spacer()
            Button(action: {
                // TODO
            }) {
                Text("Edit")
            }
        }
    }
}

struct EditUnitRow: View {
    let selectedModel: SelectedModelResponse

    var body: some View {
        HStack {
            Text(selectedModel.model.name)
            Spacer()
            Text("\(selectedModel.cost) points")
        }
    }
}

//#if DEBUG
//struct EditUnitUI_Previews : PreviewProvider {
//    static var previews: some View {
//        EditUnitUI()
//    }
//}
//#endif
