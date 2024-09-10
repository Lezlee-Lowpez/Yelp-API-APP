//
//  ListView.swift
//  CitySights App
//
//  Created by Lesley Lopez on 8/21/24.
//

import SwiftUI

struct ListView: View {
    
    @Environment(BusinessModel.self) var model
    
    var body: some View {
        
        List {
            ForEach(model.businesses){b in
                
                
                
                
                VStack(spacing:20) {
                    HStack(spacing:0) {
                        
                        if let imageURL = b.imageUrl{
                            AsyncImage(url:URL(string: imageURL)!) { image in
                                image
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(RoundedRectangle(cornerRadius: 6))
                                    .padding(.trailing, 16)
                            } placeholder: {
                                ProgressView()
                                    .frame(width:50, height: 50)
                            }
                            
                        } else {
                            Image("list-placeholder-image")
                                .padding(.trailing, 16)
                        }
                        
                       
                        VStack(alignment: .leading) {
                            Text(b.name ?? "restaurant")
                                .font(Font.system(size: 15))
                                .bold()
                            Text(TextHelper.distanceAwayText(meters: b.distance ?? 0))
                                .font(Font.system(size: 16))
                                .foregroundStyle(Color(red: 67/255, green: 71/255, blue: 76/255))
                        }
                        Spacer()
                        Image("regular_\(TextHelper.roundTheRating(value: b.rating ?? 0))")
                    }
                    
                    Divider()
                }
                .onTapGesture {
                    model.selectedBusiness = b
                }
                
                
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
    }


#Preview {
    ListView()
        .environment(BusinessModel())
}
