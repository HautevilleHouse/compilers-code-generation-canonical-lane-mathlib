import canonicalLaneMathlib.AdmissibleClass
import CompilersCodeGenerationCanonicalLaneLean.RegisterAllocation

namespace HautevilleHouse
namespace CompilersCodeGenerationCanonicalLaneLean

structure InstructionSelectionPackage {G : SyntaxFoundationPackage}
    {O : OptimizationPackage G} {Reg : RegisterAllocationPackage O} where
  patternMatchingRules : List (AdmissibleSyntaxTree → Bool)
  targetInstructionSet : Type
  selectedInstructions : ∀ (s : AdmissibleSyntaxTree), targetInstructionSet
  semanticEquivalence : ∀ (s : AdmissibleSyntaxTree),
    semantics s = semantics (selectedInstructions s)
  coverageComplete : Prop

structure InstructionSelectionEvidence {G : SyntaxFoundationPackage}
    {O : OptimizationPackage G} {Reg : RegisterAllocationPackage O}
    (I : InstructionSelectionPackage Reg) where
  semanticEquivalenceClosed : I.semanticEquivalence
  coverageCompleteClosed : I.coverageComplete

def InstructionSelectionClosed {G : SyntaxFoundationPackage}
    {O : OptimizationPackage G} {Reg : RegisterAllocationPackage O}
    (I : InstructionSelectionPackage Reg) : Prop :=
  I.semanticEquivalence ∧ I.coverageComplete

theorem instruction_selection_closed_from_evidence
    {G : SyntaxFoundationPackage} {O : OptimizationPackage G}
    {Reg : RegisterAllocationPackage O} (I : InstructionSelectionPackage Reg)
    (E : InstructionSelectionEvidence I) : InstructionSelectionClosed I := by
  exact And.intro E.semanticEquivalenceClosed E.coverageCompleteClosed

end CompilersCodeGenerationCanonicalLaneLean
end HautevilleHouse