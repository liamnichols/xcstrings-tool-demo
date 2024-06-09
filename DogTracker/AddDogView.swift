import DogKit
import SwiftData
import SwiftUI

struct AddDogView: View {
    enum Field: Hashable {
        case name, breed
    }

    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    @State private var name: String = ""
    @State private var breed: String = Breed.all.randomElement()!.name
    @State private var rating: Int = Int.random(in: 9...14)

    @FocusState private var focusedField: Field?

    var body: some View {
        NavigationStack {
            Form {
                TextField(.localizable(.addFieldName), text: $name)
                    .focused($focusedField, equals: .name)

                TextField(.localizable(.addFieldBreed(String(breeds: .germanShepherd))), text: $breed)
                    .focused($focusedField, equals: .breed)

                Stepper(value: $rating, in: 1...100, step: 1) {
                    HStack {
                        Text(.localizable(.addFieldRating))
                        Spacer()
                        Text(.localizable(.ratingOutOf10(rating)))
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle(.localizable(.addTitle))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(.localizable(.buttonLabelClose), action: close)

                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button(.localizable(.buttonLabelAddDog), systemImage: "plus", action: addDog)
                        .disabled(!isValid)
                }
            }
            .onAppear {
                focusedField = .name
            }
        }
    }

    var isValid: Bool {
        !name.isEmpty && !breed.isEmpty && rating >= 10
    }

    func close() {
        dismiss()
    }

    func addDog() {
        modelContext.insert(
            Dog(name: name, breed: breed, rating: rating)
        )

        close()
    }
}

#Preview {
    AddDogView()
        .modelContainer(for: Dog.self, inMemory: true)
}
