import canonicalLaneMathlib.AdmissibleClass

/-!
# Compiler Optimization Phase Package
-/

namespace HautevilleHouse
namespace CompilersCodeGenerationCanonicalLaneLean

structure OptimizationPackage (I : IRPackage) where
  deadCodeElimination : Prop
  constantFolding : Prop
  loopInvariantHoisting : Prop
  inliningHeuristic : Prop
  optimizationCorrect : Prop

structure OptimizationEvidence {I : IRPackage} (O : OptimizationPackage I) where
  deadCodeEliminationClosed : O.deadCodeElimination
  constantFoldingClosed : O.constantFolding
  loopInvariantHoistingClosed : O.loopInvariantHoisting
  inliningHeuristicClosed : O.inliningHeuristic
  optimizationCorrectClosed : O.optimizationCorrect

def OptimizationClosed {I : IRPackage} (O : OptimizationPackage I) : Prop :=
  O.deadCodeElimination ∧ O.constantFolding ∧ O.loopInvariantHoisting ∧ O.inliningHeuristic ∧ O.optimizationCorrect

theorem optimization_closed_from_evidence
    {I : IRPackage} (O : OptimizationPackage I) (E : OptimizationEvidence O) :
    OptimizationClosed O := by
  exact And.intro E.deadCodeEliminationClosed
    (And.intro E.constantFoldingClosed
      (And.intro E.loopInvariantHoistingClosed
        (And.intro E.inliningHeuristicClosed E.optimizationCorrectClosed)))

end CompilersCodeGenerationCanonicalLaneLean
end HautevilleHouse
