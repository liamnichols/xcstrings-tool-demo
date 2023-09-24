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
                TextField("Name", text: $name)
                    .focused($focusedField, equals: .name)

                TextField("Breed", text: $breed)
                    .focused($focusedField, equals: .breed)

                Stepper(value: $rating, in: 1...100, step: 1) {
                    HStack {
                        Text("Rating")
                        Spacer()
                        Text("\(rating)/10")
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Add Dog")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Close", action: close)
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", action: addDog)
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
