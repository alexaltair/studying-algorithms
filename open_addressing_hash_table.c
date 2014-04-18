#include <stdlib.h>
#include <stdio.h>

typedef struct entry{
    int key;
    int value;
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
    int stored_key = entry->key;
    // This loop won't terminate if the table is full.
    while (stored_key != key && stored_key != 0){
        hash_key = (hash_key + 1) % table->size;
        entry = &table->array[hash_key];
        stored_key = entry->key;
    }
    entry->key = key;
    entry->value = value;
}

void delete(Table * table, int key){
    insert(table, key, 0);
}

int search(Table * table, int key){
    int hash_key = hash_function(table->size, key);
    Entry * entry = &table->array[hash_key];
    int stored_key = entry->key;
    // This loop won't terminate if the table is full.
    while (stored_key != key && stored_key != 0){
        hash_key = (hash_key + 1) % table->size;
        entry = &table->array[hash_key];
        stored_key = entry->key;
    }
    if (stored_key == 0){
        return 0;
    } else {
        return entry->value;
    }
}


#include <time.h>
int main(){
    srand(time(NULL));

    Table table;
    init_hash_table(&table, 200000000);
    printf("Hash table initialized.\n");

    for (int i = 0; i < 100000000; ++i){
        insert(&table, rand()/10, rand());
    }
    printf("Values inserted.\n\n");

    int rand_key = rand()/10;
    for (int i = 0; i < 55; ++i){
        int key = rand_key + i;
        printf("key: %d, hash: %d, value: %d\n", key, hash_function(table.size, key), search(&table, key));
    }

    return 0;
}
