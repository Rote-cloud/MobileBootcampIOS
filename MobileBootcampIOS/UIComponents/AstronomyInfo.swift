import SwiftUI

struct AstronomyInfo: View {
    let weather: WeatherEntity

    var body: some View {
        VStack {
            ListItem(
                icon: "sunrise.fill",
                text: "Sunrise",
                value: weather.current.astronomyInfo.sunrise
            )

            ListItem(
                icon: "sunset.fill",
                text: "Sunset",
                value: weather.current.astronomyInfo.sunset
            )

            ListItem(
                icon: "moon.fill",
                text: "Moonrise",
                value: weather.current.astronomyInfo.moonrise
            )

            ListItem(
                icon: "moon.stars.fill",
                text: "Moonset",
                value: weather.current.astronomyInfo.moonset
            )
        }
        .padding(.vertical, Guides.stdPadding)
        .padding(.horizontal, Guides.bigPadding)
        .background(Colors.lightBlue)
        .cornerRadius(Guides.cornerRadius)
        .padding(.bottom, Guides.smallPadding)
    }
}

extension AstronomyInfo {
    private enum Guides {
        static var smallPadding: CGFloat { 8 }
        static var stdPadding: CGFloat { 16 }
        static var bigPadding: CGFloat { 24 }
        static var cornerRadius: CGFloat { 24 }
    }
}
