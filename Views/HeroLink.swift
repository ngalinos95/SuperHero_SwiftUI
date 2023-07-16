//
//  HeroLink.swift
//  SuperHero(MVVM)
//
//  Created by Nikos Galinos on 18/6/23.
//

import SwiftUI

struct HeroLink: View {
    var hero : SuperHeroViewModel
    var body: some View {
        VStack{
            
            AsyncImage(url: URL(string:hero.image.url) , scale: 1.9)
                .frame(width: 250, height: 250)
                .cornerRadius(40)
            
            
            Spacer()
            
            
            Group{
                HStack{
                   
                    Text("Full Name:         ")
                        .font(.system(size: 22))
                        .bold()
                        .padding(.bottom,12)
                        .padding(.leading,30)
                        .frame(alignment : .leading)
                    Spacer()
                    
                    if(hero.biography.fullName == ""){
                        Text("-")
                            .bold()
                            .padding(.trailing,30)
                            .font(.system(size: 20))
                    }else{
                        Text(hero.biography.fullName)
                            .bold()
                            .padding(.trailing,30)
                            .font(.system(size: 20))
                        
                    }
                    Spacer()
                    
                    
                }
                HStack{
                    Text("Alter Egos:         ")
                        .font(.system(size: 22))
                        .bold()
                        .padding(.bottom,12)
                        .padding(.leading,30)
                        .frame(alignment : .leading)

                    
                    Spacer()
                    
                    Text(hero.biography.alterEgos)
                        .bold()
                        .padding(.trailing,30)
                        .font(.system(size: 20))
                    
                    Spacer()
                    
                    
                }
                HStack{
                    Text("Place of Birth:         ")
                        .font(.system(size: 22))
                        .bold()
                        .padding(.bottom,12)
                        .padding(.leading,30)
                        .frame(alignment : .leading)

                    
                    Spacer()
                    
                    Text(hero.biography.placeOfBirth)
                        .bold()
                        .padding(.trailing,30)
                        .font(.system(size: 20))
                    Spacer()
                }
                
                HStack{
                    Text("Alignment:         ")
                        .font(.system(size: 22))
                        .bold()
                        .padding(.bottom,12)
                        .padding(.leading,30)
                        .frame(alignment : .leading)

                    
                    
                    
                    Spacer()
                    
                    Text(hero.biography.alignment)
                        .bold()
                        .padding(.trailing,30)
                        .font(.system(size: 20))
                    Spacer()
                    
                    
                }
                
            }
            Spacer()
            
            HStack{
                Text("First appearance: in \(hero.biography.firstAppearance)")
                    .bold()
                    .padding(.bottom,30)
                    .font(.system(size: 14))
                
            }
            
        }.background(Color(red: 0.8, green: 0.8, blue: 0.8))
        
        
    }
    
}






