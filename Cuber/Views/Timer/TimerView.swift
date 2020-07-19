//
//  TimerView.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/9/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI
import CoreData

struct TimerView: View {
    
    @State var gearIsTapped = false
    @State var scrambleText = ""
    @State var settingsIsShown = false
    @State var inspection = 15
    @State var selectedBackColor = UIColor.black
    @State var isSolving = false
    @ObservedObject var cubeTimer = CubeTimer()
    
    var body: some View {
        ZStack {
            Color(self.selectedBackColor)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                Button(action: {
                    self.cubeTimer.inspection = self.inspection
                    self.cubeTimer.startSolving()
                    if self.cubeTimer.isStarted {
                        self.cubeTimer.scramble = self.scrambleText
                        self.scramble()
                    }
                    
                }, label: {
                    Text(self.cubeTimer.time == "" ? "إبدأ" : self.cubeTimer.time)
                        .font(.custom("Tajawal", size: 50))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                })
            }
            
            VStack {
                HStack{
                    
                    Button(action: {
                        
                        withAnimation {
                            self.settingsIsShown.toggle()
                        }
                        
                    }, label: {
                        Image(systemName: "gear")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            .rotationEffect(.degrees(self.settingsIsShown ? 180 : 0))
                            .padding([.top], 50)
                            .padding([.leading], 20)
                    })
                    
                    
                    Spacer()
                }
                Text(self.scrambleText)
                    .font(.custom("Tajawal", size: 26))
                    .foregroundColor(.gray)
                    .padding([.horizontal], 40)
                    .multilineTextAlignment(.center)
                    .padding([.top], 20)
            
                Spacer()
            }
            
            if self.settingsIsShown {
                TimerSettings(inspection: self.$inspection, isShown: self.$settingsIsShown, timerBackColor: self.$selectedBackColor)
                    .transition(.asymmetric(insertion: .opacity, removal: .opacity))
            }
            
        }
        .onAppear(perform: configureView)
    }
    
    func configureView() {
        scramble()
        fetchSettings()
    }
    
    func scramble(){
        self.scrambleText = ""
        
        let cubeMoves = ["R", "R'", "L", "L'", "U", "U'", "D", "D'", "U", "U'", "F", "F'", "F2", "D2", "R2", "L2", "B2", "U2"]
        var randomSymbol = cubeMoves.randomElement()
        var previousSymbol = ""
        let randomNumber = Int.random(in: 18 ... 25)
        
        for _ in 1 ... randomNumber {
            
            while randomSymbol?.first == previousSymbol.first {
                randomSymbol = cubeMoves.randomElement()
                
            }
            
            self.scrambleText += randomSymbol! + " "
            previousSymbol = randomSymbol!
        }
    }
    
    func fetchSettings() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        if let managedObjectContext = appDelegate?.persistentContainer.viewContext {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TimerSettingsCD")
            do {
               let result =  try managedObjectContext.fetch(fetchRequest) as? [TimerSettingsCD]
                if let setting = result?.last {
                    self.inspection = Int(setting.inspection)
                    self.selectedBackColor = setting.backgroundColor ?? UIColor.black
                }
            }catch {
                fatalError()
            }
            
        }
    }
    
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
