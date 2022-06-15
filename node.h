#ifndef NODE_H_
#define NODE_H_

#include <string>

using namespace std;

class node {};

class number_node : public node {
    public:
        int number;
        number_node(int num);
};

class var_node : public node {
    public:
        string var;
        var_node(string temp_var);
};

#endif // NODE_H_
