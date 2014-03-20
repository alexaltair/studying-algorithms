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
    if (entry->key == 0){
        entry->key = key;
        entry->value = value;
    } else {
        Entry * prev_entry;
        while (entry != NULL && entry->key != key){
            prev_entry = entry;
            entry = entry->collision;
        }
        if (entry == NULL){
            entry = malloc(sizeof(Entry));
            prev_entry->collision = entry;
            entry->key = key;
            entry->value = value;
        } else {
            entry->value = value;
        }
    }
}

// In the event of deleting an Entry in the collision chain, this will really just set the value to 0 and leave the Entry in the chain.
void delete(Table * table, int key){
    insert(table, key, 0);
}

int search(Table * table, int key){
    int hash_key = hash_function(table->size, key);
    Entry * entry = &table->array[hash_key];
    if (entry->key == 0){
        return 0;
    } else if (entry->key == key){
        // printf("found key: %d\n", entry->key);
        return entry->value;
    } else {
        // printf("found colliding key: %d\n", entry->key);
        while (entry != NULL && entry->key != key){
            entry = entry->collision;
        }

        if (entry == NULL){
            return 0;
        } else {
            return entry->value;
        }
    }
}


int main(){
    size_t size = 20000000;
    Table table;
    init_hash_table(&table, 20000000);
    printf("Hash table initialized.\n");

    int key1 = 13, key2 = size + 13;
    printf("key: %d, hash: %d, value: %d\n", key1, hash_function(table.size, key1), search(&table, key1));
    printf("key: %d, hash: %d, value: %d\n", key2, hash_function(table.size, key2), search(&table, key2));

    int value1 = 1300;
    insert(&table, key1, value1);
    printf("Insert %d at %d.\n", value1, key1);
    printf("key: %d, hash: %d, value: %d\n", key1, hash_function(table.size, key1), search(&table, key1));
    printf("key: %d, hash: %d, value: %d\n", key2, hash_function(table.size, key2), search(&table, key2));

    int value2 = 213;
    insert(&table, key2, value2);
    printf("Insert %d at %d.\n", value2, key2);
    printf("key: %d, hash: %d, value: %d\n", key1, hash_function(table.size, key1), search(&table, key1));
    printf("key: %d, hash: %d, value: %d\n", key2, hash_function(table.size, key2), search(&table, key2));

    int value3 = 45;
    insert(&table, key1, value3);
    printf("Insert %d at %d.\n", value3, key1);
    printf("key: %d, hash: %d, value: %d\n", key1, hash_function(table.size, key1), search(&table, key1));
    printf("key: %d, hash: %d, value: %d\n", key2, hash_function(table.size, key2), search(&table, key2));

    delete(&table, key1);
    printf("Delete at %d.\n", key1);
    printf("key: %d, hash: %d, value: %d\n", key1, hash_function(table.size, key1), search(&table, key1));
    printf("key: %d, hash: %d, value: %d\n", key2, hash_function(table.size, key2), search(&table, key2));

    int key = 42;
    for (int i = 0; i < 10; ++i){
        for (int j = 0; j <= i; ++j){
            printf("key: %zu, hash: %d, value: %d\n", key + j*size, hash_function(table.size, key + j*size), search(&table, key + j*size));
        }
        insert(&table, key + i*size, (i + 1)*(i + 1));
        printf("Insert %d at %zu.\n", (i + 1)*(i + 1), key + i*size);
    }

    return 0;
}
