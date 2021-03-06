
/**
 *  The available types in Thrift are:
 *
 *  bool        Boolean, one byte
 *  i8 (byte)   Signed 8-bit integer
 *  i16         Signed 16-bit integer
 *  i32         Signed 32-bit integer
 *  i64         Signed 64-bit integer
 *  double      64-bit floating point value
 *  string      String
 *  binary      Blob (byte array)
 *  map<t1,t2>  Map from one type to another
 *  list<t1>    Ordered list of one type
 *  set<t1>     Set of unique elements of one type
 *
 */

namespace java seakers.client
namespace py thriftinterface

typedef i32 int

 /**
  * Structs are the basic complex data structures. They are comprised of fields
  * which each have an integer identifier, a type, a symbolic name, and an
  * optional default value.
  *
  * Fields can be declared "optional", which ensures they will not be included
  * in the serialized output if they aren't set.  Note that this requires some
  * manual management in some languages.
  */

#struct BinaryInputArchitecture {
    #1: int id,
    #2: list<bool> inputs,
    #3: list<double> outputs
#}

#struct DiscreteInputArchitecture {
    #1: int id,
    #2: list<int> inputs,
    #3: list<double> outputs
#}

struct NeuralNetScores {
    1: list<int> arch,
    2: double science,
    3: double cost
}

service PythonNeuralNetInterface {

     /**
     * A method definition looks like C code. It has a return type, arguments,
     * and optionally a list of exceptions that it may throw. Note that argument
     * lists and exception lists are specified using the exact same syntax as
     * field lists in struct or exception definitions.
     */

     void ping(),

     #BinaryInputArchitecture evalBinaryInputArch(1:string problem, 2:list<bool> inputs),

     #DiscreteInputArchitecture evalDiscreteInputArch(1:string problem, 2:list<int> inputs),

     NeuralNetScores neuralNetArchitectureEval (1:list<int> arch),

     #list<NeuralNetScores> ScienceAndCostDiscreteInput (1:DiscreteInputArchitecture arch)

}
