#include <stdio.h>

typedef struct node{
    struct node * next;
    int value;
} Node;

void print_node(Node * node){
    printf("#<Node: value=%d, next=%p >\n", node->value, node->next);
}

Node new_node(){
    Node node;
    node.value = 0;
    return node;
}



typedef struct linked_list{
    Node * root;
    int size;
} LinkedList;

LinkedList new_linked_list(){
    LinkedList list;
    list.root = NULL;
    list.size = 0;
    return list;
}

void print_linked_list(LinkedList * linked_list){
    printf("[\n");
    if (linked_list->root != NULL){
        print_node(linked_list->root);
    }
    printf("]\n");
}


int main(){
    Node my_node = new_node();
    my_node.value = 12;
    print_node(&my_node);

    LinkedList my_linked_list = new_linked_list();
    my_linked_list.root = &my_node;
    print_linked_list(&my_linked_list);

    return 0;
}
