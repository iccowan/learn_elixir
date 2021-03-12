for i <- 1..100, j <- (i+1)..100, k <- (j+1)..100, (i+j) > k, i*i + j*j == k*k, do: IO.inspect {i, j, k}
