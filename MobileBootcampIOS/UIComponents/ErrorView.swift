import SwiftUI

struct ErrorView: View {
    let retryAction: () -> Void

    var body: some View {
        ZStack {
            Colors.blue
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Image(systemName: "exclamationmark.triangle")
                    .font(.system(size: 50))
                    .foregroundColor(Colors.white)

                Text("FailedData", tableName: "Weather")
                    .font(.title2)
                    .foregroundColor(Colors.white)
                    .multilineTextAlignment(.center)

                Button {
                    retryAction()
                } label: {
                    Text("TryAgain", tableName: "Weather")
                        .font(.headline)
                        .foregroundColor(Colors.blue)
                        .padding()
                        .background(Colors.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}
