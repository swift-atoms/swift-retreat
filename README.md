# Retreat

`Retreat` identifies and implements backward movement by a fixed-width integer
count. Its `reporting`, `exact`, and `saturating` policies delegate to
Subtraction. Exact failure is `Subtraction.Error.overflow`.
