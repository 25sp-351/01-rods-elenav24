#!/bin/bash

echo "Running Test 1"
actual_output=$(echo -e "1, 1\n2, 5\n3,8" | ./rod_cutting 45)

expected_output="15 @ 8 = 120\nRemainder: 0\nValue: 120\n"

if [ "$actual_output" == "$expected_output" ]; then
    echo "Test 1 passed"
else
    echo "Test 1 failed"
fi 

echo "Running Test 2"
actual_output=$(echo -e "200, 1\n" | ./rod_cutting 100)

expected_output="Remainder: 100\nValue: 0\n"

if [ "$actual_output" == "$expected_output" ]; then
    echo "Test 2 passed"
else
    echo "Test 2 failed"
fi 

echo "Running Test 1"
actual_output=$(echo -e "1, 5\n7, 8\n9, 4\n17, 13\n24, 24" | ./rod_cutting 45)

expected_output="15 @ 8 = 120\nRemainder: 0\nValue: 120\n"

if [ "$actual_output" == "$expected_output" ]; then
    echo "Test passed"
else
    echo "Test failed"
fi 