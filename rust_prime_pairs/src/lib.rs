// src/lib.rs
#[no_mangle]
pub extern "C" fn count_prime_pairs(n: i64) -> i64 {
    fn is_prime(x: i64) -> bool {
        if x < 2 { return false; }
        for i in 2..=((x as f64).sqrt() as i64) {
            if x % i == 0 { return false; }
        }
        true
    }
    let mut count = 0;
    for a in 2..=n/2 {
        let b = n - a;
        if is_prime(a) && is_prime(b) {
            count += 1;
        }
    }
    count
}
