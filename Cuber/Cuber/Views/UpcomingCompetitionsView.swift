//
//  UpcomingCompetitionsView.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/11/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI

struct UpcomingCompetitionsView: View {
    
    @Binding var competitions: [Competition]
    @State var isOffline = false
    
    var body: some View {
        
        ZStack {
            
            VStack{
                HStack {
                    Text("المسابقات")
                        .font(.custom("Tajawal", size: 40))
                    Spacer()
                }
                Spacer()
            }.padding([.top, .leading], 30)
            
            if self.isOffline {
                Text("من فضلك تأكد من اتصالك بالإنترنت.")
            }
            
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ForEach(self.competitions, id: \.id) { competition in
                            CompetitionCard(competition: competition)
                                .padding()
                        }
                    }
                }.padding([.vertical], 100)
                
            }
        }
        .onAppear {
            if self.competitions.isEmpty {
                self.isOffline = true
            }
        }
    }
    
}

struct UpcomingCompetitionsView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingCompetitionsView(competitions: .constant([]))
    }
}
