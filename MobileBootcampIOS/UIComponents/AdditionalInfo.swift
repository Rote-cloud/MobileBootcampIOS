import SwiftUI

struct AdditionalInfo: View {
    let weather: WeatherEntity

    var body: some View {
        VStack {
            ListItem(
                icon: "drop.fill",
                text: "Humidity",
                value: weather.current.additionalInfo.humidity
            )

            ListItem(
                icon: "gauge",
                text: "Pressure",
                value: weather.current.additionalInfo.pressure
            )

            ListItem(
                icon: "wind",
                text: "WindSpeed",
                value: weather.current.additionalInfo.windSpeed
            )

            ListItem(
                icon: "arrow.up.left.circle",
                text: "Wind Direction",
                value: weather.current.additionalInfo.windDirection
            )

            ListItem(
                icon: "eye.fill",
                text: "Visibility",
                value: weather.current.additionalInfo.visibility
            )

            ListItem(
                icon: "sun.max.fill",
                text: "UV",
                value: weather.current.additionalInfo.uvIndex
            )
        }
        .padding(.vertical, Guides.stdPadding)
        .padding(.horizontal, Guides.bigPadding)
        .background(Colors.lightBlue)
        .cornerRadius(Guides.cornerRadius)
        .padding(.bottom, Guides.smallPadding)
    }
}

extension AdditionalInfo {
    private enum Guides {
        static var smallPadding: CGFloat { 8 }
        static var stdPadding: CGFloat { 16 }
        static var bigPadding: CGFloat { 24 }
        static var cornerRadius: CGFloat { 24 }
    }
}
