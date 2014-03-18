#include <stdio.h>

typedef struct node{
    struct node * next;
    int value;
} Node;

void init_node(Node * node){
    node->next = NULL;
    node->value = 0;
}
void print_node(Node * node){
    printf("#<Node: value=%d, next=%p >\n", node->value, node->next);
}


typedef struct linked_list{
    Node * root;
    int size;
} LinkedList;

void init_linked_list(LinkedList * list){
    list->root = NULL;
    list->size = 0;
}

void print_linked_list(LinkedList * list){
    printf("[\n");
    if (list->root != NULL){
        printf("  root: ");
        print_node(list->root);
    }
    printf("]\n");
}



int main(){
    Node my_node;
    print_node(&my_node);
    init_node(&my_node);
    my_node.value = 12;
    print_node(&my_node);

    LinkedList my_linked_list;
    init_linked_list(&my_linked_list);
    print_linked_list(&my_linked_list);
    my_linked_list.root = &my_node;
    print_linked_list(&my_linked_list);

    return 0;
}
