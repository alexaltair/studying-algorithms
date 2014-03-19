#include <stdlib.h>
#include <stdio.h>

typedef struct node{
    struct node * next;
    int value;
} Node;

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
        while (node != NULL){
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

Node * last_node(LinkedList * list){
    return nth_node(list, list->size - 1);
}

Node * first_node(LinkedList * list){
    return nth_node(list, 0);
}

int nth(LinkedList * list, int index){
    Node * node = nth_node(list, index);
    if (node == NULL){
        return 0;
    }
    return node->value;
}

int last(LinkedList * list){
    return nth(list, list->size - 1);
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


void remove_at(LinkedList * list, int index){
    if (index < 0 || list->size <= index){
        return;
    } else if (index == 0){
        shift(list);
    } else if (index == list->size){
        pop(list);
    } else {
        Node * before = nth_node(list, index-1);
        Node * at_index = nth_node(list, index);
        before->next = at_index->next;
        free(at_index);
        list->size --;
    }
}

void clear(LinkedList * list){
    while (list->root != NULL){
        shift(list);
    }
}



int main(){
    LinkedList list;
    init_linked_list(&list);

    push(&list, 0);
    push(&list, 1);
    push(&list, 2);
    push(&list, 3);
    push(&list, 4);
    push(&list, 5);
    push(&list, 6);

    print_linked_list(&list);
    printf("size: %d\n", list.size);

    clear(&list);

    print_linked_list(&list);
    printf("size: %d\n", list.size);

    return 0;
}
