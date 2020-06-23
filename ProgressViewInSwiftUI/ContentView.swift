//
//  ContentView.swift
//  ProgressViewInSwiftUI
//
//  Created by Ramill Ibragimov on 23.06.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var downloaded: CGFloat = 0
    
    var body: some View {
        VStack {
            VStack {
                ProgressView("Loading", value: self.downloaded, total: 100)
                
                Button("Download") {
                    self.startDownload()
                }
            }.padding(.all, 10)
        }
    }
    
    private func startDownload() {
        let timer = Timer(timeInterval: 0.1, repeats: true) { (timer) in
            if self.downloaded < 100 {
                self.downloaded += 1
            } else {
                timer.invalidate()
            }
        }
        RunLoop.main.add(timer, forMode: .common)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
