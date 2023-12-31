//
//  RoomListView.swift
//  NurseAlert
//
//  Created by Monty Truitt on 9/9/23.
//

import SwiftUI

struct RoomListViewNurse: View {
    
    var body: some View {
        NavigationLink(destination: NurseView(hospital_id: 5)){
            List(getRoomsInHospital(hospital_id: 5), id: \.self) { room in
                NavigationLink {
                    // TODO: send to LLM chat
                } label: {
                    RoomRowNurse(room: room)
                }
            }
            .navigationTitle("Select Room")
            .fontDesign(.rounded)
        }
    }
}

struct RoomRowNurse: View {
    var room: Room
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(room.room_name)
                    .bold()
                    .font(.title2)
                    .hoverEffect(.lift)
                Text(room.division)
                    .font(.footnote)
            }
            Spacer()
            Image(systemName: "person.fill")
                .foregroundColor(.blue)
                .aspectRatio(contentMode: .fit)
            Text(String(room.number_employees))
                .foregroundColor(.gray)
        }
        .frame(height: 60)
    }
}

struct RoomListViewNurse_Previews: PreviewProvider {
    static var previews: some View {
        RoomListViewNurse()
    }
}
