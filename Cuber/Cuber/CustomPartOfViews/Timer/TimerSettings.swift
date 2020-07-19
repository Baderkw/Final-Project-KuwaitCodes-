//
//  TimerSettings.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/9/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI
import CoreData

struct TimerSettings: View {
    
    @Binding var inspection: Int
    @Binding var isShown: Bool
    @Binding var timerBackColor: UIColor
    
    var body: some View {
        
        ZStack {
            
            Button(action: {
                
                withAnimation {
                    self.isShown = false
                }
                self.saveSettings()
                
            }, label: {
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .background(Color.black)
                    .opacity(0.4)
                
            })
            

            VStack {
                HStack {
                    VStack(spacing: 50) {
                            VStack {
                                SettingLabel(text: "وقت الفحص : ")
                                Stepper(value: self.$inspection, in: 0 ... 60) {
                                    Text("\(self.inspection)")
                                }.padding([.horizontal], 50)
                                .font(.system(size: 23))
                                
                                
                            }
                            
                            VStack{
                                SettingLabel(text: "لون الخلفية : ")
                                TimerSettingsColorPicker(selectedColor: self.$timerBackColor)
                            }
                        }
                        .frame(width: 320, height: 350)
                        .background(Color.white)
                        .cornerRadius(20)
                        .padding([.top], 170)
                        .padding([.leading], 30)
                    Spacer()
                }
                
                Spacer()
            }
            
        }.edgesIgnoringSafeArea(.all)
    }
    
    func saveSettings() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        if let managedObjectContext = appDelegate?.persistentContainer.viewContext {
            let setting = NSEntityDescription.insertNewObject(forEntityName: "TimerSettingsCD", into: managedObjectContext) as? TimerSettingsCD
            setting?.inspection = Double(self.inspection)
            setting?.backgroundColor = self.timerBackColor
            appDelegate?.saveContext()
        }
    }
    
}

struct SettingLabel : View{
    var text: String
    
    var body: some View {
        
        HStack {
            Spacer()
            Text(text)
                .foregroundColor(.black)
                .font(.custom("Tajawal", size: 23))
                .padding([.horizontal], 20)
        }
    }
}


struct TimerSettings_Previews: PreviewProvider {
    static var previews: some View {
        TimerSettings(inspection: .constant(15), isShown: .constant(true), timerBackColor: .constant(UIColor.black))
    }
}
