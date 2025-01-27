#include <stdio.h>
#include <stdlib.h>

void swap(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

void sortByValue(int *lengths, int *values, int count) {
    for (int i = 0; i < count - 1; i++) {
        for (int j = 0; j < count - i - 1; j++) {
            if (values[j] < values[j + 1]) {
                swap(&values[j], &values[j + 1]);
                swap(&lengths[j], &lengths[j + 1]);
            }
        }
    }
}

void cuts(int *lengths, int *values, int count, int rodLength, int totalValue) {
    for (int i = 0; i < count - 1; i++) {

        int cutLength = 0;
        int n = 0;
        
        while (cutLength + lengths[i] <= rodLength) {
            cutLength += lengths[i];
            n++;
        }
        if (cutLength != 0) {
            printf("%d @ %d = %d\n", n, values[i], n * values[i]);
            totalValue += n * values[i];
            rodLength -= cutLength;
        }
    }
    printf("Remainder: %d\n", rodLength);
    printf("Value: %d\n", totalValue);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Missing an integer argument\n");
        return 1;
    }

    int rodLength = atoi(argv[1]);
    int totalValue = 0;
    int *lengths = NULL;
    int *values = NULL;
    int count = 0;
    int capacity = 10;
    int length;
    int value;

    lengths = malloc(capacity * sizeof(int));
    values = malloc(capacity * sizeof(int));

    if (!lengths || !values) {
        fprintf(stderr, "Memory allocation failed.\n");
        return 1;
    }

    char buffer[50];

    printf("Enter piece prices in the format <length>, <value> (press Ctrl+Z to end input):\n");

    while (fgets(buffer, sizeof(buffer), stdin) != NULL) {
        if (count >= capacity) {
            capacity *= 2;
            lengths = realloc(lengths, capacity * sizeof(int));
            values = realloc(values, capacity * sizeof(int));

            if (!lengths || !values) {
                fprintf(stderr, "Memory allocation failed.\n");
                return 1;
            }
        }

        if (sscanf(buffer, "%d, %d", &lengths[count], &values[count]) == 2) {
            count++;
        } else {
            fprintf(stderr, "Invalid Input.\n");
        }
    }

    if (count == 0) {
        fprintf(stderr, "Must have at least one line of input formatted <length>, <value>\n");
        return 1;
    }

    sortByValue(lengths, values, count);

    cuts(lengths, values, count, rodLength, totalValue);
}