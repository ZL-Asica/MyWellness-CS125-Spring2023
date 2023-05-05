//
//  HomeView.swift
//  MyWellness
//
//  Created by ZL Asica on 5/4/23.
//

import SwiftUI

struct HomeView: View {
    @State private var userName = "ZL Asica"
    @State private var userBMI = 22.5
    @State private var greeting = ""
    
    private func updateGreeting() {
        let hour = Calendar.current.component(.hour, from: Date())
        if hour >= 5 && hour < 12 {
            greeting = "Good Morning"
        } else if hour >= 12 && hour < 17 {
            greeting = "Good Afternoon"
        } else if hour >= 17 && hour < 23{
            greeting = "Good Evening"
        } else {
            greeting = "Sweet dreams"
        }
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                // Give user a greeting based on the time of the day
                Text("\(greeting),\n \(userName)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                // Show user's BMI and the corresponding health status
                Text("BMI: \(userBMI, specifier: "%.1f") (\(userBMI < 18.5 ? "Underweight" : userBMI < 25 ? "Normal" : userBMI < 30 ? "Overweight" : "Obese"))")
                    .font(.title2)
                    .padding(.bottom)
                
                // TODO: implement the recommendations by machine learning
                VStack(alignment: .leading, spacing: 10) {
                    Text("Recommendations for you:")
                        .font(.headline)

                    // TODO: Based on the user's BMI, also the user's diet history, recommend the user a diet plan.
                    Text("Diet: Eat more fruits and vegetables")
                    // TODO: Based on the user's BMI, also the user's exercise history, recommend the user an exercise plan.
                    Text("Exercise: Try 30 minutes of cardio every day")
                    // TODO: Based on the user's BMI, also the user's sleep history, recommend the user a sleep plan.
                    Text("Sleep: Go to bed before 11 PM")
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding()
            
            VStack {
                DietCardView()
                ExerciseCardView()
                SleepCardView()
            }
            .padding(.bottom)
            .onAppear {
                updateGreeting()
            }
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
