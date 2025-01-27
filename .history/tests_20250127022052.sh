#!/bin/bash

echo "Running Test 1"
actual_output=$(echo -e "1, 1\n2, 5\n3,8" | ./rod_cutting 45)

expected_output="15 @ 8 = 120\nRemainder: 0\nValue: 120\n"

if [ "$actual_output" == "$expected_output" ]; then
    echo "Test passed"
else
    echo "Test failed"
fi 
