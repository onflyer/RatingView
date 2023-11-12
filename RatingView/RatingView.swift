//
//  RatingView.swift
//  RatingView
//
//  Created by Aleksandar Milidrag on 11/12/23.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Double?
    let imageSize: Double = 40
    
    private func handleTap(at index: Double, location: CGPoint) {
        let isTappedOnLeftSide = location.x < imageSize/2
        rating = isTappedOnLeftSide ? index - 0.5: index
    }
    
    private func starType(_ index: Int) -> String {
        
        guard let rating = rating else { return "star" }
        
        let roundedRating = Int(ceil(rating))
        
        if index <= roundedRating {
            if index <= Int(rating) {
                return "star.fill"
            } else {
                return "star.leadinghalf.fill"
            }
        }
        
        return "star"
        
    }
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { index in
                
                let doubleIndex = Double(index)
                
                Image(systemName: starType(index))
                    .foregroundStyle(.yellow)
                    .font(.largeTitle)
                    .onTapGesture(coordinateSpace: .local) {
                        handleTap(at: doubleIndex, location: $0)
                    }
            }
        }
    }
    
}

//#Preview {
//    RatingView(rating: $20)
//}
