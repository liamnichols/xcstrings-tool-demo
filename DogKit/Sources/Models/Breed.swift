import Foundation

@available(iOS 16, *)
@available(watchOS 9, *)
public struct Breed {
    public let name: String

    public static let goldenRetriever = Breed(
        name: String(localized: .breeds.goldenRetriever)
    )

    public static let germanShepherd = Breed(
        name: String(localized: .breeds.germanShepherd)
    )

    public static let poodle = Breed(
        name: String(localized: .breeds.poodle)
    )

    public static let dachshund = Breed(
        name: String(localized: .breeds.dachshund)
    )

    public static let shihTzu = Breed(
        name: String(localized: .breeds.shihTzu)
    )

    public static let pomeranian = Breed(
        name: String(localized: .breeds.pomeranian)
    )

    public static let all: [Breed] = [
        .goldenRetriever,
        .germanShepherd,
        .poodle,
        .dachshund,
        .shihTzu,
        .pomeranian
    ]
}
