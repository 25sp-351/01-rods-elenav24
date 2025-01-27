#!/bin/bash

echo "Running Test 1"
actual_output=$(echo -e "1, 1\n2, 5\n3,8" | ./rod_cutting 45)

expected_output=$(cat <<EOF
Enter piece prices in the format <length>, <value> (press Ctrl+Z to end input):
15 @ 8 = 120
Remainder: 0
Value: 120
EOF
)

if [ "$actual_output" == "$expected_output" ]; then
    echo "Test 1 passed"
else
    echo "Test 1 failed"
    echo "$actual_output"
    echo "$expected_output"
fi 

echo "Running Test 2"
actual_output=$(echo -e "200, 1\n" | ./rod_cutting 100)

expected_output="Enter piece prices in the format <length>, <value> (press Ctrl+Z to end input):\nRemainder: 100\nValue: 0\n"


# if [ "
# " == "\n" ]; then
#     echo "t"
# else
#     echo "ttt"
# fi

if [ "$actual_output" == "$expected_output" ]; then
    echo "Test 2 passed"
else
    echo "Test 2 failed"
fi 

echo "Running Test 3"
actual_output=$(echo -e "1, 5\n7, 8\n9, 4\n17, 13\n24, 24" | ./rod_cutting 1000)

expected_output="Enter piece prices in the format <length>, <value> (press Ctrl+Z to end input):\n41 @ 24 = 984\n2 @ 8 = 16\n2 @ 5 = 10\nRemainder: 0\nValue: 1010\n"

if [ "$actual_output" == "$expected_output" ]; then
    echo "Test 3 passed"
else
    echo "Test 3 failed"
fi 