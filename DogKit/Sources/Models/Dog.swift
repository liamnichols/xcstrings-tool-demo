import SwiftData

@available(iOS 17, *)
@Model
public final class Dog {
    public var name: String
    public var breed: String
    public var rating: Int

    public init(name: String, breed: String, rating: Int) {
        self.name = name
        self.breed = breed
        self.rating = rating
    }
}
