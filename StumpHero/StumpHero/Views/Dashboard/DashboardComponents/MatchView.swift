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
    
    var body: some View {
        ZStack {
            VStack(alignment: .center){
                
                if rows.matchdetail.match.livecoverage.localizedCaseInsensitiveContains("yes") {
                    Group {
                        HStack {
                            
                            Spacer()
                            
                            Button {
                                print("clicked")
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
                        
                    } label: {
                        VStack(alignment: .center) {
                            Text(vm.getTeamName(id: rows.matchdetail.teamHome)?.nameShort ?? "err")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .bold()
                            
                            Text(vm.getTeamName(id: rows.matchdetail.teamHome)?.nameFull ?? "err")
                                .foregroundColor(.white)
                                .font(.callout)
                                .bold()
                        }
                    }.frame(width: UIScreen.screenWidth / 3)
                        .padding()
                    
                    Text("V/S")
                        .foregroundColor(.white)
                    
                    
                    Button {
                        
                    } label: {
                        
                        VStack(alignment: .center){
                            Text(vm.getTeamName(id: rows.matchdetail.teamAway)?.nameShort ?? "err")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .bold()
                            
                            Text(vm.getTeamName(id: rows.matchdetail.teamAway)?.nameFull ?? "err")
                                .foregroundColor(.white)
                                .font(.callout)
                                .bold()
                            
                        }
                    }.frame(width: UIScreen.screenWidth / 3)
                        .padding()
                    
                }
                
                VStack {
                    
                    Text((vm.getDayOfWeek(rows.matchdetail.match.date) ?? "") + ", " + rows.matchdetail.match.date)
                    Text(vm.convertToAMPM(rows.matchdetail.match.time) ?? "")
                    Text("Venue: " + rows.matchdetail.venue.name)
                    
                }
                .padding()
            }
        }
        .frame(width: UIScreen.screenWidth)
        .background(
            Color(hex: AppConstants.TextlightGrayClr)
        )
        .onAppear{
            withAnimation(Animation.easeInOut(duration: 0.99).repeatForever()) {
                isAnimating = true
            }
        }
    }
}

struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        
        let json : [MatchDatum] = [load("60.json")]
        
        MatchView(vm: DashboardViewModel(getMatchCase: getMatchCaseImpl()), rows: json.first!)
    }
}
