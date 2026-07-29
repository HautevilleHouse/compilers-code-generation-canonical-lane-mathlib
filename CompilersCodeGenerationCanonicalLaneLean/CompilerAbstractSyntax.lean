import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompilersCodeGenerationCanonicalLaneLean

structure CompilerAdmittedObject where
  source : Type
  target : Type
  translation : source → target
  correctness : ∀ (s : source), semantics (translation s) = semantics s
  conclusion : correctness

def CompilerWitnessClosed (O : CompilerAdmittedObject) : Prop :=
  O.correctness

structure AdmissibleSyntaxTree where
  nodeType : String
  children : List AdmissibleSyntaxTree
  attributes : List (String × String)
  invariant : Prop

def syntaxTreeInvariant (t : AdmissibleSentenceTree) : Prop :=
  match t with
  | leaf v => v.isWellFormed
  | node op children =>
    (∀ child ∈ children, syntaxTreeInvariant child) ∧ op.isValid

structure CodeGenerationStep where
  inputIR : AdmissibleSyntaxTree
  outputIR : AdmissibleSyntaxTree
  transformationRule : String
  preservesSemantics : Prop
  evidence : preservesSemantics

end CompilersCodeGenerationCanonicalLaneLean
end HautevilleHouse