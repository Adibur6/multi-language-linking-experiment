package main

import "C"

//export count_fib_pairs
func count_fib_pairs(n C.longlong) C.longlong {
    var fibs []int64 = []int64{1, 2}
    for {
        next := fibs[len(fibs)-1] + fibs[len(fibs)-2]
        if next > int64(n) {
            break
        }
        fibs = append(fibs, next)
    }
    count := int64(0)
    for i := 0; i < len(fibs); i++ {
        for j := i; j < len(fibs); j++ {
            if fibs[i]+fibs[j] == int64(n) {
                count++
            }
        }
    }
    return C.longlong(count)
}

func main() {}
