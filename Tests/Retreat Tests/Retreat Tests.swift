import Subtraction
import Retreat
import Testing

@Suite
struct `Retreat checks and saturates backward movement by a count` {

    @Test
    func `Retreat reports and throws underflow as subtraction overflow`() {
        let report = Retreat.reporting(UInt(2), by: 3)
        #expect(report.value == UInt.max)
        #expect(report.overflow)
        #expect(throws: Subtraction.Error.overflow) {
            try Retreat.exact(UInt(2), by: 3)
        }
    }

    @Test
    func `Exact and saturating retreat operations move backward by a count`() throws {
        #expect(try Retreat.exact(UInt(7), by: 3) == 4)
        #expect(Retreat.saturating(UInt(2), by: 3) == .zero)
    }
}
