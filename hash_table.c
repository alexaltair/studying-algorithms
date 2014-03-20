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
        Entry * collision_entry = malloc(sizeof(Entry));
        entry->collision = collision_entry;

        collision_entry->key = key;
        collision_entry->value = value;
    }
}

void delete(Table * table, int key){
    insert(table, key, 0);
}

int search(Table * table, int key){
    int hash_key = hash_function(table->size, key);
    Entry * entry = &table->array[hash_key];
    if (entry->key == 0){
        return entry->value;
    } else if (entry->key == key){
        printf("found key: %d\n", entry->key);
        return entry->value;
    } else {
        printf("found colliding key: %d\n", entry->key);
        if (entry->collision != NULL){
            return entry->collision->value;
        } else {
            return 0;
        }
    }
}


#include <time.h>
int main(){
    srand(time(NULL));

    Table table;
    init_hash_table(&table, 20000000);
    printf("Hash table initialized.\n");

    for (int i = 0; i < 20000000; ++i){
        insert(&table, rand()/10, rand());
    }
    printf("Values inserted.\n\n");

    int rand_key = rand()/10;
    for (int i = 0; i < 15; ++i){
        int key = rand_key + i;
        printf("key: %d, hash: %d, value: %d\n\n", key, hash_function(table.size, key), search(&table, key));
    }

    return 0;
}
