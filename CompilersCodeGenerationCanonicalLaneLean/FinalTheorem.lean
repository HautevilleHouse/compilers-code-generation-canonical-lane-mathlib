import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompilersCodeGenerationCanonicalLaneLean

def ConstrainedCodeGenerationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_code_generation_endgame (A : AdmissibleClass) :
    ConstrainedCodeGenerationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CompilersCodeGenerationCanonicalLaneLean
end HautevilleHouse