//
//  LoginView.swift
//  Bopito
//
//  Created by Hans Heidmann on 2/11/24.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var authManager: AuthManager
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage: String?
    
    var body: some View {
        ZStack {
            Color.white
            VStack(spacing: 20) {
                
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.black)
                        .frame(width: 100, height: 100)
                    Text("B")
                        .foregroundColor(Color.white)
                        .font(.system(size: 60, weight: .bold, design: .rounded))
                        .fontWeight(.bold)
                        .fontWeight(.bold)
                }
                
                Text("Welcome Back!")
                    .foregroundColor(.black)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .padding(.bottom)
                
               
                
                TextField("Email", text: $email)
                    .foregroundColor(.black)
                    .padding(10)
                    .background(Color.white)
                    .textFieldStyle(.plain)
                    .cornerRadius(20)
                    .colorScheme(.light)
                    .frame(width: UIScreen.main.bounds.width * 0.6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2)
                    )
                
                SecureField("Password", text: $password)
                    .foregroundColor(.black)
                    .padding(10)
                    .background(Color.white)
                    .textFieldStyle(.plain)
                    .cornerRadius(20)
                    .colorScheme(.light)
                    .frame(width: UIScreen.main.bounds.width * 0.6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2)
                    )
                
                Button {
                    Task {
                        do {
                            try await authManager.signIn(email: email, password: password)
                            // Handle successful registration
                        } catch {
                            errorMessage = error.localizedDescription
                        }
                        
                    }
                    
                } label: {
                    Text("Log In")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.black)
                        )
                        .foregroundColor(.white)
                }
                .padding(.top)
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Dismiss the current view
                }) {
                    Text("Don't have an account?")
                        .bold()
                        .foregroundColor(.blue)
                }
                .padding(.top)
                
                
               
                
                
                Button(action: {
                    print("Sign In with Google tapped")
                }) {
                    HStack {
                        Image(systemName: "person.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(.trailing, 8)
                        
                        Text("Sign in with Google")
                            .bold()
                            .foregroundColor(.black)
                    }
                    .padding(15)
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    )
                }
                
                Button(action: {
                    print("Sign In with Google tapped")
                }) {
                    HStack {
                        Image(systemName: "person.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(.trailing, 8)
                        
                        Text("Sign in with Apple")
                            .bold()
                            .foregroundColor(.black)
                    }
                    .padding(15)
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    )
                }
                
                
         
                
                
            }
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthManager())
}
