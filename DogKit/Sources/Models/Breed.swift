import Foundation

@available(iOS 15, *)
public struct Breed {
    public let name: String

    public static let goldenRetriever = Breed(
        name: String(breeds: .goldenRetriever)
    )

    public static let germanShepherd = Breed(
        name: String(breeds: .germanShepherd)
    )

    public static let poodle = Breed(
        name: String(breeds: .poodle)
    )

    public static let dachshund = Breed(
        name: String(breeds: .dachshund)
    )

    public static let shihTzu = Breed(
        name: String(breeds: .shihTzu)
    )

    public static let pomeranian = Breed(
        name: String(breeds: .pomeranian)
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
