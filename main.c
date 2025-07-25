#include <stdio.h>
#include <stdint.h>

// Declaration of the assembly function
extern int64_t count_primes(int64_t n);
// Declaration of the Rust function
extern int64_t count_prime_pairs(int64_t n);
// Declaration of the Go function
extern int64_t count_fib_pairs(int64_t n);

int main() {
    int64_t n;
    int choice;
    printf("Select option:\n");
    printf("1. Count primes up to n\n");
    printf("2. Count pairs of primes that sum to n\n");
    printf("3. Count pairs of Fibonacci numbers that sum to n\n");
    printf("Enter choice: ");
    scanf("%d", &choice);
    printf("Enter n: ");
    scanf("%ld", &n);
    if (choice == 1) {
        int64_t result = count_primes(n);
        printf("Number of primes from 1 to %ld: %ld\n", n, result);
    } else if (choice == 2) {
        int64_t result = count_prime_pairs(n);
        printf("Number of prime pairs that sum to %ld: %ld\n", n, result);
    } else if (choice == 3) {
        int64_t result = count_fib_pairs(n);
        printf("Number of Fibonacci pairs that sum to %ld: %ld\n", n, result);
    } else {
        printf("Invalid choice.\n");
    }
    return 0;
}
