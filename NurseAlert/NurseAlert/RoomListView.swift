//
//  RoomListView.swift
//  NurseAlert
//
//  Created by Monty Truitt on 9/9/23.
//

import SwiftUI

struct RoomListView: View {
    var hospital_id: Int
    
    var body: some View {
        NavigationLink(destination: ChatView(hospital_id: hospital_id, room_id: 2)){
            List(getRoomsInHospital(hospital_id: 5), id: \.self) { room in
                NavigationLink {
                    // TODO: send to LLM chat
                } label: {
                    RoomRow(room: room)
                }
            }
            .navigationTitle("Select Room")
            .fontDesign(.rounded)
        }
    }
}

struct RoomRow: View {
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

struct RoomListView_Previews: PreviewProvider {
    static var previews: some View {
        RoomListView(hospital_id: 1)
    }
}
