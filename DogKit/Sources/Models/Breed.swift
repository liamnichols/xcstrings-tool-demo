import Foundation

public struct Breed {
    public let name: String

    public static let goldenRetriever = Breed(
        name: String(localized: "Golden Retriever")
    )

    public static let germanShepherd = Breed(
        name: String(localized: "German Shepherd")
    )

    public static let poodle = Breed(
        name: String(localized: "Poodle")
    )

    public static let dachshund = Breed(
        name: String(localized: "Dachshund")
    )

    public static let shihTzu = Breed(
        name: String(localized: "Shih Tzu")
    )

    public static let pomeranian = Breed(
        name: String(localized: "Pomeranian")
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
