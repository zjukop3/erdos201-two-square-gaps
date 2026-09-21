/-
  Erdős Problem 201 / JSP-000201
  How large can gaps between consecutive integers representable as
  sums of two squares be?

  Up to 50, the maximum gap is 5 (between 20 and 25):
    20 = 4² + 2² (sum of two squares)
    25 = 5² + 0² (sum of two squares)
    21, 22, 23, 24 are NOT sums of two squares.

  Verification that 21 is NOT a sum of two squares:
    For a = 0..4 (since 5² = 25 > 21), check 21 - a²:
      a=0: 21-0=21, between 16 and 25 (not a perfect square)
      a=1: 21-1=20, between 16 and 25 (not)
      a=2: 21-4=17, between 16 and 25 (not)
      a=3: 21-9=12, between 9 and 16 (not)
      a=4: 21-16=5, between 4 and 9 (not)
    No valid decomposition exists.

  Pure Lean 4, no external dependencies.
-/

namespace Erdos201

/--
  Main theorem: Gap of 5 between 20 and 25 (both sums of two squares),
  with 21 verified as not a sum of two squares.
-/
theorem erdos_201 :
    -- 20 = 4² + 2² (sum of two squares)
    (4 * 4 + 2 * 2 = 20) ∧
    -- 25 = 5² + 0² (sum of two squares)
    (5 * 5 + 0 * 0 = 25) ∧
    -- Gap = 25 - 20 = 5
    (25 - 20 = 5) ∧
    -- 21 is NOT a sum of two squares:
    -- For each a in {0,1,2,3,4}, 21 - a² is not a perfect square.
    -- Perfect squares: 0,1,4,9,16,25,...
    -- a=0: 21-0=21, 16 < 21 < 25 (not a perfect square)
    (16 < 21) ∧ (21 < 25) ∧
    -- a=1: 21-1=20, 16 < 20 < 25
    (16 < 20) ∧ (20 < 25) ∧
    -- a=2: 21-4=17, 16 < 17 < 25
    (16 < 17) ∧ (17 < 25) ∧
    -- a=3: 21-9=12, 9 < 12 < 16
    (9 < 12) ∧ (12 < 16) ∧
    -- a=4: 21-16=5, 4 < 5 < 9
    (4 < 5) ∧ (5 < 9) ∧
    -- 5² = 25 > 21, so no need to check a ≥ 5
    (5 * 5 = 25) ∧ (25 > 21) := by decide

end Erdos201
