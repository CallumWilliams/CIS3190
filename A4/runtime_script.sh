start=$(date +%s.%N);
#EXECUTABLE GOES HERE
./C/sieve 100
dur=$(echo "$(date +%s.%N) - $start" | bc);
printf "Run time: %.6f seconds\n" $dur
