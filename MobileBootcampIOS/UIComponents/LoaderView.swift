import SwiftUI

struct LoaderView: View {
    var body: some View {
        ZStack {
            Colors.blue
                .ignoresSafeArea()

            VStack(spacing: 20) {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Colors.white))
                    .scaleEffect(2)

                Text("LoadingData", tableName: "Weather")
                    .font(.title2)
                    .foregroundColor(Colors.white)
            }
        }
    }
}
