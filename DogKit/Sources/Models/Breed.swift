import Foundation

public struct Breed {
    public let name: String

    public static let goldenRetriever = Breed(
        name: String(localized: .localizable.goldenRetriever)
    )

    public static let germanShepherd = Breed(
        name: String(localized: .localizable.germanShepherd)
    )

    public static let poodle = Breed(
        name: String(localized: .localizable.poodle)
    )

    public static let dachshund = Breed(
        name: String(localized: .localizable.dachshund)
    )

    public static let shihTzu = Breed(
        name: String(localized: .localizable.shihTzu)
    )

    public static let pomeranian = Breed(
        name: String(localized: .localizable.pomeranian)
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
