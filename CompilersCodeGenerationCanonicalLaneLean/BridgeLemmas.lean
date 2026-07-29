import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompilersCodeGenerationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CompilerWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CompilersCodeGenerationCanonicalLaneLean
end HautevilleHouse