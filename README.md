# swift-retreat

Use this package when you move a fixed-width integer position backward by a count (an index stepped back, an offset retreated) and must decide what happens when the move leaves the type's range: wrap and report it, fail, or clamp. Start from `Retreat`. To move forward instead, use the sibling swift-advancement; to step back by exactly one, use swift-predecessor; when the operands are a symmetric minuend and subtrahend rather than a position and a count, use `Subtraction` from swift-subtraction, which this package re-exports.

## Laws

- Each `Retreat` operation is the `Subtraction` operation of the same name applied to the position and the count, so retreating is subtraction and follows its laws: `Retreat.reporting` returns the two's-complement wrapped result and flags overflow exactly when the true result is outside `Value`'s range, and `Retreat.exact` throws exactly when that flag is set.
- Moving below the bottom of the range is reported as subtraction overflow; there is no separate underflow condition.
- `Retreat.saturating` returns the true result when it fits. Otherwise it clamps to `.min`, which is zero for an unsigned `Value`, or to `.max` when `Value` is signed and the count is negative.
