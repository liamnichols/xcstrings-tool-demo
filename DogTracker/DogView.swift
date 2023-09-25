import DogKit
import SwiftData
import SwiftUI

struct DogView: View {
    let dog: Dog

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(dog.name)
                Text(dog.breed)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Text(.localizable.ratingOutOf10(dog.rating))
        }
        .foregroundStyle(.primary)
    }
}
