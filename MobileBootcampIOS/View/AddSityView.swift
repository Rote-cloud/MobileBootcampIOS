import SwiftUI

struct AddSityView: View {

    @StateObject var viewModel: AddSityViewModel

    var body: some View {
        VStack {
            navBar

            ScrollView {
                LazyVStack(spacing: 16) {
                    yourLocation

                    SityItem()
                    SityItem()
                    SityItem()
                }
            }
            .padding(.all)
        }
        .background(Colors.blue)
        .navigationBarBackButtonHidden()
    }

    private var navBar: some View {
        NavBar(
            left: {
                Button {
                    viewModel.navigateToMainPage()
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(Colors.white)
                }
            }, center: {
                Text("Locations", tableName: "Weather")
                    .foregroundColor(Colors.white)
                    .bold()
            },
            right: {
                Button {

                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(Colors.white)
                }
            }
        )
    }

    private var yourLocation: some View {
        Button {
        } label: {
            HStack {
                Image(systemName: "target")
                    .foregroundColor(Colors.white)
                    .font(.system(size: 25))

                Text("CurrentLocation", tableName: "Weather")
                    .foregroundColor(Colors.white)

                Spacer()
            }
        }
    }
}

private struct SityItem: View {
    var body: some View {
        HStack(alignment: .center) {
            Button {

            } label: {
                Image(systemName: "text.justify")
                    .foregroundColor(Colors.white)
                    .font(.system(size: 25))

                Text("New York, New York")
                    .foregroundColor(Colors.white)

                Spacer()
            }

            Button {

            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Colors.white)
            }
        }
    }
}

#Preview {
    AddSityView(viewModel: .mock)
}
