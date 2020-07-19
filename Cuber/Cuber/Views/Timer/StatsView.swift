//
//  StatsView.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/10/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI
import Firebase

struct StatsView: View {
    
    @State var cubeTimes = [CubeTime]()
    @State var bestTime = CubeTime(time: "", date: "", algorithms: "", seconds: 59, minutes: 100)
    @State var averageOfLast5 = CubeTime(time: "", date: "", algorithms: "", seconds: 0, minutes: 0)
    
    var body: some View {
        
        ZStack {
            Color(red: 242 / 255, green: 242 / 255, blue: 247 / 255)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                
                HStack(spacing: 40) {
                    BestStats(text: "أسرع حل", time: self.$bestTime.time)
                    BestStats(text: "متوسط آخر 5 حلول", time: self.$averageOfLast5.time)
                }
                
                List {
                    ForEach(cubeTimes, id: \.id) { cubeTime in
                        VStack{
                            Spacer()
                            HStack {
                                
                                Text(cubeTime.time)
                                    .font(.system(size: 25, weight: .heavy, design: .default))
                                Text(cubeTime.algorithms)
                                    .font(.custom("Tajawal", size: 22))
                            }
                            HStack {
                                Text(cubeTime.date)
                                    .font(.system(size: 20, weight: .thin, design: .rounded))
                                Spacer()
                            }
                            Spacer()
                        }
                    }.onDelete(perform: removeRows)
                }
                    .listStyle(GroupedListStyle())
                    .padding([.bottom], 80)
                    .frame(height: 650)
            }
        }
    .onAppear(perform: getCubeTimes)
    }
    
    func removeRows(at offsets: IndexSet) {
        let index = Int(offsets.first!)
        let deletedTime = cubeTimes[index]
        let db = Firestore.firestore()
        let uid = Auth.auth().currentUser?.uid
        db.collection("users").document("\(uid!)").collection("Cube").document("\(deletedTime.id!)").delete() { (error) in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            self.cubeTimes.remove(atOffsets: offsets)
            print("")
            print(deletedTime.id)
            print("")
        }
    }
    
    func getCubeTimes() {
        guard let id = Auth.auth().currentUser?.uid else{
            fatalError()
        }
        Networking.getListOf(COLLECTION_NAME: "users/\(id)/Cube/", success: { (times: [CubeTime]) in
            self.cubeTimes = times
            self.getBestSolve()
            if self.cubeTimes.count >= 5 {
                self.getAverageOfLast5()
            }
            print(times)
        }) { (error) in
            print(error)
        }
    }
    
    func getBestSolve() {
        for time in self.cubeTimes {
            if time.minutes <= self.bestTime.minutes && time.seconds < self.bestTime.seconds {
                self.bestTime = time
            }
        }
    }
    
    func getAverageOfLast5() {
        var sum = 0.0
        var averageMinutes = 0
        var averageSeconds = 0.0
        for i in (self.cubeTimes.count - 5) ..< self.cubeTimes.count {
            sum += Double(self.cubeTimes[(self.cubeTimes.count - 1) - i].minutes)
        }
        sum = sum * 60
        for i in (self.cubeTimes.count - 5) ..< self.cubeTimes.count {
            sum += self.cubeTimes[(self.cubeTimes.count - 1) - i].seconds
        }
        sum = sum / 5
        averageMinutes = Int(sum / 60)
        averageSeconds = sum.truncatingRemainder(dividingBy: 60)
        
        if averageMinutes == 0 {
            self.averageOfLast5.time = String(format: "%0.2f", averageSeconds)
        }else {
            self.averageOfLast5.time = "\(averageMinutes): \(averageSeconds)"
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
