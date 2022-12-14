//
//  Timer.swift
//  HW2
//
//  Created by Justin Boyer on 11/6/22.

import SwiftUI

struct TimerView: View {
    @Binding var savedTime: Double
    @State var isTimerRunning = false
    @State private var startTime =  Date()
    @SceneStorage("TimerView.timerString") private var timerString = "0.0"
    @State private var curTimerValue = 0.0
    @State private var prevCount = 0.0
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        let play = Image(systemName: "play.circle.fill")
            .imageScale(.large)
            .foregroundStyle(.green)
            .accessibilityLabel(Text("Start timer"))
        let stop = Image(systemName: "stop.circle.fill")
            .imageScale(.large)
            .foregroundStyle(.red)
            .accessibilityLabel(Text("Stop Timer"))
        let reset = Image(systemName: "repeat.circle.fill")
            .imageScale(.large)
            .foregroundStyle(.black)
            .accessibilityLabel(Text("Restart Timer"))
        HStack {
            HStack {
                isTimerRunning ? stop : play
                Text(self.timerString)
                    .font(Font.system(.largeTitle, design: .monospaced))
                    .onReceive(timer) { _ in
                        if self.isTimerRunning {
                            curTimerValue = Date().timeIntervalSince(self.startTime)
                            timerString = String(format: "%.1f", (curTimerValue + prevCount))
                        }
                    }
                    .onAppear() {
                        if(isTimerRunning){
                            self.startTimer()
                        }
                        else{
                            self.stopTimer()
                        }
                }

            }
            .onTapGesture {
                if isTimerRunning {
                    self.stopTimer()
                    savedTime = curTimerValue
                } else {
                    startTime = Date()
                    self.startTimer()
                }

                isTimerRunning.toggle()
            }
            .padding()
            reset
                .onTapGesture {
                    stopTimer();
                    isTimerRunning = false;
                    timerString = "0.0"
                    curTimerValue = 0.0
                    prevCount = 0.0
                    savedTime = 0.0
                }
        }
    }
    
    func stopTimer() {
        prevCount += Date().timeIntervalSince(self.startTime)
        self.timer.upstream.connect().cancel()
    }
    
    func startTimer() {
        self.timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    }
    func stateRestorationActivity(for scene: UIScene){
        
    }
    struct TimerView_Previews: PreviewProvider {
        @State static var value = 0.0
        static var previews: some View {
            TimerView(savedTime: $value)
        }
    }
}

//References for HW 3

// https://developer.apple.com/documentation/swiftui/restoring_your_app_s_state_with_swiftui
// https://www.kodeco.com/34862236-state-restoration-in-swiftui#toc-anchor-007
// https://developer.apple.com/documentation/swiftui/view/onreceive(_:perform:)
// https://developer.apple.com/documentation/swiftui/restoring_your_app_s_state_with_swiftui
// https://developer.apple.com/documentation/uikit/uiscenedelegate/restoring_your_app_s_state
// https://stackoverflow.com/questions/63548432/swiftui-how-to-make-a-start-stop-timer
// https://developer.apple.com/documentation/uikit/view_controllers/preserving_your_app_s_ui_across_launches
