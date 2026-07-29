import canonicalLaneMathlib.AdmissibleClass
import CompilersCodeGenerationCanonicalLaneLean.CompilerAbstractSyntax

namespace HautevilleHouse
namespace CompilersCodeGenerationCanonicalLaneLean

structure RegisterAllocationPackage {G : SyntaxFoundationPackage} (O : OptimizationPackage G) where
  interferenceGraph : AdmissibleSyntaxTree → Type
  coloring : ∀ (s : AdmissibleSyntaxTree), interferenceGraph s → List Nat
  spillCodeGenerated : Prop
  allocationCorrectness : Prop

structure RegisterAllocationEvidence {G : SyntaxFoundationPackage}
    {O : OptimizationPackage G} (R : RegisterAllocationPackage O) where
  coloringClosed : ∀ s g, R.coloring s g ≠ []
  spillCodeGeneratedClosed : R.spillCodeGenerated
  allocationCorrectnessClosed : R.allocationCorrectness

def RegisterAllocationClosed {G : SyntaxFoundationPackage}
    {O : OptimizationPackage G} (R : RegisterAllocationPackage O) : Prop :=
  R.spillCodeGenerated ∧ R.allocationCorrectness

theorem register_allocation_closed_from_evidence
    {G : SyntaxFoundationPackage} {O : OptimizationPackage G}
    (R : RegisterAllocationPackage O) (E : RegisterAllocationEvidence R) :
    RegisterAllocationClosed R := by
  exact And.intro E.spillCodeGeneratedClosed E.allocationCorrectnessClosed

end CompilersCodeGenerationCanonicalLaneLean
end HautevilleHouse