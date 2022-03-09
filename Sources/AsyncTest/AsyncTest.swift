@main
struct Main {
  static func main() async throws {
    print("started")
    try await Task.sleep(nanoseconds: 1_000_000_000)
    print("ended")
  }
}
