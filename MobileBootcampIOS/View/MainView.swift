import SwiftUI

struct MainView: View {

    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        VStack {
            switch (viewModel.state) {
            case .loaded:
                navBar

                ScrollView {
                    LazyVStack {
                        head

                        additionalInfo
                        astronomyInfo
                        precipitationInfo
                    }
                }
            case .loading:
                LoaderView()
            case .error:
                ErrorView {
                    viewModel.updateLocation()
                }
            }
        }
        .background(Colors.blue)
        .onAppear {
            viewModel.updateLocation()
        }
    }

    private var navBar: some View {
        NavBar(
            left: {
            }, center: {
            },
            right: {
                Button {
                    viewModel.navigateToAddSityPage()
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(Colors.white)
                }
            }
        )
    }

    private var head: some View {
        VStack {
            Text(viewModel.weather.location.name)
                .bold()
                .foregroundColor(Colors.white)
                .padding(.bottom, Guides.smallPadding)

            Text(viewModel.weather.location.date)
                .foregroundColor(Colors.grey)
                .padding(.bottom, Guides.sdtPadding)

            HStack {
                AsyncImage(url: viewModel.weather.current.condition.iconUrl) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Image(systemName: "sun.max")
                }
                .foregroundColor(Colors.white)
                .frame(width: Guides.imageSize.width, height: Guides.imageSize.height)

                Text(viewModel.weather.current.temperature)
                    .foregroundColor(Colors.white)
                    .font(.system(size: 60))
            }
            .padding(.bottom, Guides.sdtPadding)

            Text("\(viewModel.weather.current.minMaxTemp) \(viewModel.weather.current.feelsLike)")
                .foregroundColor(Colors.grey)
                .padding(.bottom, Guides.smallPadding)
            Text(viewModel.weather.current.condition.text)
                .foregroundColor(Colors.grey)
        }
        .padding(.bottom, Guides.bigPadding)
    }

    private var additionalInfo: some View {
        AdditionalInfo(weather: viewModel.weather)
    }

    private var astronomyInfo: some View {
        AstronomyInfo(weather: viewModel.weather)
    }

    private var precipitationInfo: some View {
        PrecipitationInfo(weather: viewModel.weather)
    }
}

extension MainView {
    private enum Guides {
        static var smallPadding: CGFloat { 4 }
        static var sdtPadding: CGFloat { 12 }
        static var bigPadding: CGFloat { 48 }
        static var imageSize: CGSize { CGSize(width: 80, height: 80) }
    }
}

// MARK: - Preview

#Preview("MainPageView") {
    MainView(viewModel: .mock)
}
