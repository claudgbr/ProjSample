//
//  ContentView.swift
//  ProjSample
//
//  Created by Claudia Gabrielle R on 7/31/23.
//

import SwiftUI

struct ContentView: View {
    // call them
    let APCourses = [
        "AP Art History",
        "AP Biology",
        "AP Chemistry",
        "AP CS Principles",
        "AP English Lang",
        "AP Statistics",
        "AP Spanish",
        "AP World History"
    ]
    
    var body: some View {
        ZStack {
            Color(.gray)
                .ignoresSafeArea()

            VStack(alignment: .center, spacing: 20.0) {
                Text("List of AP Courses")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                // Using LazyVGrid to arrange content blocks in a grid
                LazyVGrid(columns: gridLayout, spacing: 30) {
                    ForEach(0..<APCourses.count) { index in // Use 0..<APCourses.count
                        ContentBlockView(courseTitle: APCourses[index])
                    }
                }
                .padding()
            }
        }
    }

    private var gridLayout: [GridItem] {
        let gridItem = GridItem(.flexible(), spacing: 20)
        return Array(repeating: gridItem, count: 2)
    }
}

struct ContentBlockView: View {
    let courseTitle: String

    var body: some View {
        VStack(alignment: .center, spacing: 20.0) {
            Image("Test")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(height: 100)
                .cornerRadius(20, corners: [.topLeft, .topRight])

            HStack {
                Text(courseTitle)
                    .font(.headline)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(.top, -10)
                    .padding(.bottom, 10)
            }
        }
        .background(Color.white)
        .cornerRadius(40, corners: [.bottomLeft, .bottomRight, .topLeft, .topRight])
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    let radius: CGFloat
    let corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
