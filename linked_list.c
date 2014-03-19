#include <stdlib.h>
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
    printf("#<Node: address=%p, value=%d, next=%p>\n", node, node->value, node->next);
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
        Node * node = (list->root)->next;
        while(node != NULL){
            printf("  next: ");
            print_node(node);
            node = node->next;
        }
    }
    printf("]\n");
}

void shift(LinkedList * list){
    Node * root = list->root;
    if (root != NULL){
        list->root = root->next;
        list->size--;
        free(root);
    }
}

void unshift(LinkedList * list, int value){
    Node * node = malloc(sizeof(Node));
    node->value = value;
    Node * temp = list->root;
    node->next = temp;
    list->root = node;
    list->size++;
}

Node * nth_node(LinkedList * list, int index){
    if (index < 0 || list->size <= index){
        return NULL;
    }
    Node * node = list->root;
    for (int i = 0; i < index; ++i){
        node = node->next;
    }
    return node;
}

int nth(LinkedList * list, int index){
    Node * node = nth_node(list, index);
    if (node == NULL){
        return 0;
    }
    return node->value;
}



int main(){
    LinkedList my_linked_list;
    init_linked_list(&my_linked_list);

    unshift(&my_linked_list, 12);
    unshift(&my_linked_list, 3);
    unshift(&my_linked_list, 15);

    print_linked_list(&my_linked_list);
    printf("size: %d\n", my_linked_list.size);

    shift(&my_linked_list);
    print_linked_list(&my_linked_list);
    printf("size: %d\n", my_linked_list.size);

    unshift(&my_linked_list, 53);
    print_linked_list(&my_linked_list);
    printf("size: %d\n", my_linked_list.size);

    int value = 2;
    printf("\n%p\n", nth_node(&my_linked_list, value));
    printf("value: %d\n", nth(&my_linked_list, value));

    return 0;
}
