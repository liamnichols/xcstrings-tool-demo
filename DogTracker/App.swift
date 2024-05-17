import DogKit
import SwiftData
import SwiftUI
import Runtime

@main
struct App: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .navigationTitle(Text(localizable: .addFieldBreed("Any")))
        }
        .modelContainer(for: Dog.self)
    }
}

extension Text {
    init(localizable: String.Localizable) {
        // Relies on a private extension in the generated source
//        if #available(iOS 16.0, *) {
//            self.init(LocalizedStringResource(localizable: localizable))
//            return
//        }

        var stringInterpolation = LocalizedStringKey.StringInterpolation(
            literalCapacity: 0,
            interpolationCount: localizable.arguments.count
        )

        for argument in localizable.arguments {
            switch argument {
            case .int(let value):
                stringInterpolation.appendInterpolation(value)
            case .uint(let value):
                stringInterpolation.appendInterpolation(value)
            case .double(let value):
                stringInterpolation.appendInterpolation(value)
            case .float(let value):
                stringInterpolation.appendInterpolation(value)
            case .object(let value):
                stringInterpolation.appendInterpolation(value)
            }
        }

        var key = LocalizedStringKey(stringInterpolation: stringInterpolation)
        dump(key)

        let type = try! typeInfo(of: LocalizedStringKey.self)
        let property = try! type.property(named: "key")
        try! property.set(value: String(describing: localizable.key), on: &key)

        dump(key)
        self.init(key, tableName: localizable.table, bundle: .from(description: localizable.bundle))
    }
}
