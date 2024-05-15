//
//  ContentView.swift
//  PI-gui
//
//  Created by Nabil Birgle on 19/04/2024.
//

import SwiftUI

struct ContentView: View {
//    var body: some View {
//        VStack {
//            Text("π !!")
//			Image(systemName: "globe")
//	   .imageScale(.large)
//	   .foregroundStyle(.tint)
//        }
//        .padding()
//    }

	@State private var n: String = ""
	@State private var pi: String = ""

	var body: some View {
		VStack(alignment: .leading) {
			Text("π !!")
				.font(.largeTitle)
			HStack {
				TextField(
					"Enter a number",
					text: $n
				)
				.onSubmit {
					run()
				}
				Button(action: run) {
					Label("Run", systemImage: "rectangle.portrait.and.arrow.forward")
				}
			}
			Spacer()
			HStack {
				VStack (alignment: .leading) {
					Spacer()
					Text("π:")
					Text("\t" + pi)
				}
				Spacer()
				VStack {
					Spacer()
					Button(action: clear) {
						Label("Clear", systemImage: "arrow.clockwise")
					}
				}
			}
		}.padding()
	}

	func run(){
		let N: Int? = Int(n, radix: 10)
		if N == nil {
			return
		}
		let PI: MyFloat = PI().cut(n: N!)
		pi = print(PI)
		let three = pi.firstIndex(of: "3") ?? pi.startIndex
		pi = String(pi[three...])
	}
	func clear(){
		n = ""
		pi = ""
	}
}

#Preview {
    ContentView()
}
