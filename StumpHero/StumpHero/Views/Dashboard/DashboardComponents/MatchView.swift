//
//  MatchView.swift
//  StumpHero
//
//  Created by Milind Trivedi on 09/03/23.
//

import SwiftUI

struct MatchView: View {
    
    var vm : DashboardViewModel
    var rows : MatchDatum
    @State private var isAnimating: Bool = false
    @State private var ShowPlayerScreen = false
    @AppStorage("Filterselection") var Filterselection = 0
    
    var body: some View {
        ZStack {
            VStack(alignment: .center){
                
                if rows.matchdetail.match.livecoverage.localizedCaseInsensitiveContains("yes") {
                    Group {
                        HStack {
                            
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                HStack(spacing: 4.0){
                                    Rectangle()
                                        .frame(width: 20.0,height: 20.0)
                                        .foregroundColor(.red)
                                        .cornerRadius(10.0)
                                        .padding(.trailing, 10)
                                    
                                    Text(AppStrings.DashboardLivetxt)
                                        .foregroundColor(Color(hex: AppConstants.TextlightGrayClr))
                                        .padding(.trailing, 10)
                                        .font(.callout)
                                }.padding(8)
                                    .background(
                                        Color(hex: AppConstants.CapsuleBackGroundClr)
                                    )
                                    .clipShape(Capsule())
                                    .opacity(isAnimating ? 1.0 : 0.1)
                            }
                            
                        }.padding()
                    }
                } else {
                    /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                }
                
                HStack {
                    Button {
                        Filterselection = 1
                        ShowPlayerScreen = true
                    } label: {
                        VStack(alignment: .center) {
                            Text(vm.getTeamName(data: self.rows, id: rows.matchdetail.teamHome)?.nameShort ?? "err")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .bold()
                            
                            Text(vm.getTeamName(data: self.rows,id: rows.matchdetail.teamHome)?.nameFull ?? "err")
                                .foregroundColor(.white)
                                .font(.callout)
                                .bold()
                        }
                    }.frame(width: UIScreen.screenWidth / 3)
                        .padding()
                    
                    Text("V/S")
                        .foregroundColor(.white)
                    
                    
                    Button {
                        Filterselection = 2
                        ShowPlayerScreen = true
                    } label: {
                        
                        VStack(alignment: .center){
                            Text(vm.getTeamName(data: self.rows,id: rows.matchdetail.teamAway)?.nameShort ?? "err")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .bold()
                            
                            Text(vm.getTeamName(data: self.rows,id: rows.matchdetail.teamAway)?.nameFull ?? "err")
                                .foregroundColor(.white)
                                .font(.callout)
                                .bold()
                            
                        }
                    }.frame(width: UIScreen.screenWidth / 3)
                        .padding()
                    
                }
                
                VStack {
                    
                    Text((vm.getDayOfWeek(rows.matchdetail.match.date) ?? "") + ", " + rows.matchdetail.match.date)
                    HStack {
                        Text(vm.convertToAMPM(rows.matchdetail.match.time) ?? "err")
                        Text(rows.matchdetail.match.offset)
                    }
                    
                    HStack(alignment: .center){
                        Text("Venue: " + rows.matchdetail.venue.name)
                        vm.getSystemImage(for: rows.matchdetail.weather)
                            .foregroundColor(.white)
                    }
                }
                .foregroundColor(Color(hex:AppConstants.TextYellowClr))
                .padding()
            }
        }
        .frame(width: UIScreen.screenWidth - 20)
        .background(
            Color(hex: "2E3944")
        )
        .cornerRadius(12.0)
        .onAppear{
            withAnimation(Animation.easeInOut(duration: 0.99).repeatForever()) {
                isAnimating = true
            }
        }
        
        .navigationDestination(isPresented: $ShowPlayerScreen) {
            PlayerView(vm: vm, rows: rows)
                .navigationBarBackButtonHidden()
                .navigationBarHidden(true)
        }
    }
}

struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        
        let json : [MatchDatum] = [load("60.json")]
        
        MatchView(vm: DashboardViewModel(getMatchCase: getMatchCaseImpl()), rows: json.first!)
    }
}
