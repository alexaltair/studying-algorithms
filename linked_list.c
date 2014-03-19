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

Node * last_node(LinkedList * list){
    return nth_node(list, list->size - 1);
}

int last(LinkedList * list){
    return nth(list, list->size - 1);
}

Node * first_node(LinkedList * list){
    return nth_node(list, 0);
}

int first(LinkedList * list){
    return nth(list, 0);
}


void pop(LinkedList * list){
    Node * new_tail = nth_node(list, list->size - 2);
    if (new_tail == NULL){
        free(list->root);
        list->root = NULL;
        list->size = 0;
    } else {
        Node * old_tail = new_tail->next;
        free(old_tail);
        new_tail->next = NULL;
        list->size --;
    }
}

void push(LinkedList * list, int value){
    Node * old_tail = last_node(list);
    Node * new_tail = malloc(sizeof(Node));
    new_tail->value = value;
    new_tail->next = NULL;
    if (old_tail == NULL){
        list->root = new_tail;
    } else {
        old_tail->next = new_tail;
    }
    list->size++;
}




int main(){
    LinkedList my_linked_list;
    init_linked_list(&my_linked_list);

    unshift(&my_linked_list, 12);

    print_linked_list(&my_linked_list);
    printf("size: %d\n", my_linked_list.size);

    unshift(&my_linked_list, 1);

    print_linked_list(&my_linked_list);
    printf("size: %d\n", my_linked_list.size);

    push(&my_linked_list, 3);

    print_linked_list(&my_linked_list);
    printf("size: %d\n", my_linked_list.size);

    push(&my_linked_list, 4);

    print_linked_list(&my_linked_list);
    printf("size: %d\n", my_linked_list.size);

    shift(&my_linked_list);

    print_linked_list(&my_linked_list);
    printf("size: %d\n", my_linked_list.size);

    return 0;
}
