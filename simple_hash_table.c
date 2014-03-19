#include <stdlib.h>
#include <stdio.h>

typedef struct hash_table {
    int * array;
    size_t size;
} Table;

void init_hash_table(Table * table, size_t size){
    table->size = size;
    table->array = malloc(size);
}

int hash_function(size_t table_size, int key){
    return key % table_size;
}

void insert(Table * table, int key, int value){
    table->array[hash_function(table->size, key)] = value;
}

void delete(Table * table, int key){
    insert(table, key, 0);
}

int search(Table * table, int key){
    return table->array[hash_function(table->size, key)];
}


int main(){
    Table table;
    init_hash_table(&table, 2048);

    printf("%d\n", search(&table, 15));
    insert(&table, 15, 1500);
    printf("%d\n", search(&table, 15));
    delete(&table, 15);
    printf("%d\n", search(&table, 15));

    insert(&table, 2048+15, 28);
    printf("%d\n", search(&table, 15));

    return 0;
}
