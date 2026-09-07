public import Subtraction


public enum Retreat {}

extension Retreat {

    @inlinable
    public static func reporting<Value: FixedWidthInteger>(
        _ value: Value,
        by count: Value
    ) -> (value: Value, overflow: Bool) {
        Subtraction.reporting(value, count)
    }

    @inlinable
    public static func exact<Value: FixedWidthInteger>(
        _ value: Value,
        by count: Value
    ) throws(Subtraction.Error) -> Value {
        try Subtraction.exact(value, count)
    }

    @inlinable
    public static func saturating<Value: FixedWidthInteger>(
        _ value: Value,
        by count: Value
    ) -> Value {
        Subtraction.saturating(value, count)
    }
}
