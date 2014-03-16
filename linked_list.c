#include <stdio.h>

typedef struct node{
    struct node * next;
    int value;
} Node;

void print_node(Node node){
    printf("#<Node: value=%d, next=%p >\n", node.value, node.next);
}


typedef struct linked_list{
    Node root;
    int size;
} LinkedList;

int main(){
    Node new_node = {.value = 12};
    print_node(new_node);

    LinkedList new_list;
    // printf("%d\n", new_list.root);
    printf("%d\n", new_list.size);

    return 0;
}
