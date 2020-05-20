//
//  ContentView.swift
//  ListAndNavigation
//
//  Created by Pradeep on 20/05/20.
//  Copyright © 2020 Pradeep. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    let cities = BundleDecoder.decodeLandmarkBundleJson()
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach(cities, id: \.cityId){ city in
                    
                    Section(header: Text(city.name)) {
                        
                        ForEach(city.landmarks,id: \.landmarkId){
                            landmark in
                            
                            NavigationLink(destination: LandMarkDetailView(landMark: landmark)) {
                                 LandMarkRow(landMark: landmark)
                            }
                        }
                    }
                }
                .navigationBarTitle("LandMark")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
