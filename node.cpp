#include <string>
#include "node.h"

using namespace std;

number_node::number_node(int num) {
  number = num;
}

var_node::var_node(string var_) {
  var = var_;
}
