import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompilersCodeGenerationCanonicalLaneLean

structure AdmissibleClass where
  object : CompilerAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CompilerWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CompilersCodeGenerationCanonicalLaneLean
end HautevilleHouse