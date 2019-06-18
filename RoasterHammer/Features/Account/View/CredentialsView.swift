//
//  CredentialsView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/17/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI

struct CredentialsView : View {
    @State var email: String = ""
    @State var password: String = ""

    @ObjectBinding var accountInteractor: AccountInteractor

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("RoasterHammer")
                    .font(.title)
                    .bold()

                TextField($email, placeholder: Text("Email"))
                    .textContentType(.emailAddress)
                TextField($password, placeholder: Text("Password"))
                    .textContentType(.password)

                HStack {
                    Button(action: {
                        self.accountInteractor.login(email: self.email, password: self.password)
                    }) {
                        Text("Login")
                    }

                    Text("or")

                    Button(action: {
                        self.accountInteractor.createAccount(email: self.email, password: self.password)
                    }) {
                        Text("Create Account")
                    }
                }

                Spacer()
                }
                .padding()
        }
    }
}

#if DEBUG
struct CredentialsView_Previews : PreviewProvider {
    static var previews: some View {
        CredentialsView(accountInteractor: RoasterHammerDependencyManager.shared.accountBuilder().buildDataStore())
    }
}
#endif