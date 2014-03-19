#include <stdlib.h>
#include <stdio.h>

typedef struct entry{
    int key;
    int value;
    struct entry * collision;
} Entry;

typedef struct hash_table {
    Entry * array;
    size_t size;
} Table;

void init_hash_table(Table * table, size_t size){
    table->size = size;
    table->array = malloc(size * sizeof(Entry));
}

int hash_function(size_t table_size, int key){
    return key % table_size;
}

void insert(Table * table, int key, int value){
    int hash_key = hash_function(table->size, key);
    Entry * entry = &table->array[hash_key];
    entry->value = value;
}

void delete(Table * table, int key){
    insert(table, key, 0);
}

int search(Table * table, int key){
    int hash_key = hash_function(table->size, key);
    return table->array[hash_key].value;
}


#include <time.h>
int main(){
    srand(time(NULL));

    Table table;
    init_hash_table(&table, 10000000);

    for (int i = 0; i < 2000000; ++i){
        insert(&table, rand(), rand());
    }

    int rand_key = rand();
    for (int i = 0; i < 15; ++i){
        printf("key: %d value: %d\n", rand_key+i, search(&table, rand_key+i));
    }

    return 0;
}
