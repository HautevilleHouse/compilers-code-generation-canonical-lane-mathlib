import canonicalLaneMathlib.AdmissibleClass
import CompilersCodeGenerationCanonicalLaneLean.Optimization
import CompilersCodeGenerationCanonicalLaneLean.RegisterAllocation
import CompilersCodeGenerationCanonicalLaneLean.InstructionSelection

/-!
# Final Code Generation Package
-/

namespace HautevilleHouse
namespace CompilersCodeGenerationCanonicalLaneLean

structure CodeGenerationPackage {I : IRPackage}
    {O : OptimizationPackage I} {R : RegisterAllocationPackage I} {S : InstructionSelectionPackage I} where
  targetCodeEmitted : Prop
  correctnessPreserved : Prop
  performanceWithinBound : Prop

structure CodeGenerationEvidence {I : IRPackage}
    {O : OptimizationPackage I} {R : RegisterAllocationPackage I} {S : InstructionSelectionPackage I}
    (C : CodeGenerationPackage O R S) where
  targetCodeEmittedClosed : C.targetCodeEmitted
  correctnessPreservedClosed : C.correctnessPreserved
  performanceWithinBoundClosed : C.performanceWithinBound

def CodeGenerationClosed {I : IRPackage}
    {O : OptimizationPackage I} {R : RegisterAllocationPackage I} {S : InstructionSelectionPackage I}
    (C : CodeGenerationPackage O R S) : Prop :=
  C.targetCodeEmitted ∧ C.correctnessPreserved ∧ C.performanceWithinBound

theorem code_generation_closed_from_evidence
    {I : IRPackage} {O : OptimizationPackage I} {R : RegisterAllocationPackage I} {S : InstructionSelectionPackage I}
    (C : CodeGenerationPackage O R S) (E : CodeGenerationEvidence C) : CodeGenerationClosed C := by
  exact And.intro E.targetCodeEmittedClosed
    (And.intro E.correctnessPreservedClosed E.performanceWithinBoundClosed)

end CompilersCodeGenerationCanonicalLaneLean
end HautevilleHouse
