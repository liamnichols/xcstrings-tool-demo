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
                            .localizable(.listSummary(
                                dogCount: dogs.count,
                                totalRating,
                                dogs.count * 10
                            ))
                        )
                    }
                }
            }
            .overlay {
                if dogs.isEmpty {
                    VStack(spacing: 8) {
                        Text(.localizable(.emptyStateHeading))
                            .font(.headline)

                        Text(.localizable(.emptyStateSubheading))
                            .font(.subheadline)
                    }
                    .foregroundStyle(.secondary)
                }
            }
            .navigationTitle(.localizable(.appName))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(.localizable(.buttonLabelAddDog), systemImage: "plus", action: addDog)
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
