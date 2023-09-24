import DogKit
import SwiftData
import SwiftUI

struct ContentView: View {
    @Query var dogs: [Dog]
    @State private var isAddingDog = false

    var totalRating: Int {
        dogs.reduce(into: 0, { $0 += $1.rating })
    }

    var body: some View {
        NavigationStack {
            List {
                if !dogs.isEmpty {
                    Section {
                        ForEach(dogs) { dog in
                            DogView(dog: dog)
                        }
                    } footer: {
                        Text(
                            "You've seen \(dogs.count) dogs with a combined rating of \(totalRating)/\(dogs.count * 10)", comment: "Summary of sightings shown at the bottom of the list"
                        )
                    }
                }
            }
            .overlay {
                if dogs.isEmpty {
                    VStack(spacing: 8) {
                        Text("No Sightings Yet", comment: "The empty state heading")
                            .font(.headline)

                        Text("Tap the ‘+‘ button to get started", comment: "The empty state subheading")
                            .font(.subheadline)
                    }
                    .foregroundStyle(.secondary)
                }
            }
            .navigationTitle(Text("Dog Tracker", comment: "Title of the application"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(
                        "\(LocalizedStringResource("Add Dog", comment: "Title of the button that presents the Add Dog view"))",
                        systemImage: "plus",
                        action: addDog
                    )
                }
            }
            .sheet(isPresented: $isAddingDog) {
                AddDogView()
            }
        }
    }

    func addDog() {
        isAddingDog = true
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Dog.self, inMemory: true)
}
