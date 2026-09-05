import Retreat
import Testing

@Suite
struct `Retreat Tests` {

    @Test
    func `reports and throws underflow as subtraction overflow`() {
        let report = Retreat.reporting(UInt(2), by: 3)
        #expect(report.value == UInt.max)
        #expect(report.overflow)
        #expect(throws: Subtraction.Error.overflow) {
            try Retreat.exact(UInt(2), by: 3)
        }
    }

    @Test
    func `exact and saturating retreat by a count`() throws {
        #expect(try Retreat.exact(UInt(7), by: 3) == 4)
        #expect(Retreat.saturating(UInt(2), by: 3) == .zero)
    }
}
