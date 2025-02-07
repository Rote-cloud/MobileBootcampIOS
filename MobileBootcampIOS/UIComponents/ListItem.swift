import SwiftUI

struct ListItem: View {
    let icon: String
    let text: LocalizedStringKey
    let value: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size: 30))
                .foregroundColor(Colors.white)
                .padding(.bottom, Guides.smallPadding)

            Text(text, tableName: "Weather")
                .foregroundColor(Colors.white)
                .padding(.bottom, Guides.smallPadding)

            Spacer()

            Text(value)
                .foregroundColor(Colors.white)
        }
    }
}

extension ListItem {
    private enum Guides {
        static var smallPadding: CGFloat { 4 }
    }
}
