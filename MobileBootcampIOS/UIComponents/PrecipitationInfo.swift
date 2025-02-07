import SwiftUI

struct PrecipitationInfo: View {
    let weather: WeatherEntity

    var body: some View {
        VStack {
            ListItem(
                icon: "cloud.rain.fill",
                text: "HavingRain",
                value: weather.current.precipitationInfo.isRaining
            )

            ListItem(
                icon: "cloud.rain.fill",
                text: "ChanceRain",
                value: weather.current.precipitationInfo.chanceOfRain
            )

            ListItem(
                icon: "snow",
                text: "Having Snow",
                value: weather.current.precipitationInfo.isSnowing
            )
        }
        .padding(.vertical, Guides.stdPadding)
        .padding(.horizontal, Guides.bigPadding)
        .background(Colors.lightBlue)
        .cornerRadius(Guides.cornerRadius)
        .padding(.bottom, Guides.smallPadding)
    }
}

extension PrecipitationInfo {
    private enum Guides {
        static var smallPadding: CGFloat { 8 }
        static var stdPadding: CGFloat { 16 }
        static var bigPadding: CGFloat { 24 }
        static var cornerRadius: CGFloat { 24 }
    }
}
