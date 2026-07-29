import canonicalLaneMathlib.AdmissibleClass
import CompilersCodeGenerationCanonicalLaneLean.CompilerAbstractSyntax

namespace HautevilleHouse
namespace CompilersCodeGenerationCanonicalLaneLean

structure OptimizationPackage (G : SyntaxFoundationPackage) where
  passSequence : List (CodeGenerationStep)
  invariantPreservation : ∀ (s : AdmissibleSyntaxTree),
    AdmissibleSyntaxTree.invariant s →
    (∀ step ∈ passSequence, AdmissibleSyntaxTree.invariant step.outputIR)
  profitMonotonicity : Prop
  terminationGuarantee : Prop

structure OptimizationEvidence {G : SyntaxFoundationPackage} (O : OptimizationPackage G) where
  invariantPreservationClosed : O.invariantPreservation
  profitMonotonicityClosed : O.profitMonotonicity
  terminationGuaranteeClosed : O.terminationGuarantee

def OptimizationClosed {G : SyntaxFoundationPackage} (O : OptimizationPackage G) : Prop :=
  O.invariantPreservation ∧ O.profitMonotonicity ∧ O.terminationGuarantee

theorem optimization_closed_from_evidence
    {G : SyntaxFoundationPackage} (O : OptimizationPackage G)
    (E : OptimizationEvidence O) : OptimizationClosed O := by
  exact And.intro E.invariantPreservationClosed
    (And.intro E.profitMonotonicityClosed E.terminationGuaranteeClosed)

end CompilersCodeGenerationCanonicalLaneLean
end HautevilleHouse