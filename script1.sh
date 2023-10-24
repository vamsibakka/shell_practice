#!/bin/bash
# the below if condition is to retain the i value for the next iterations,the "i" value is stored in the increment.txt file and increments in the iterations.
if [ -e "increment.txt" ]; then
  i=$(<increment.txt)
else
  i=0 
fi 
t=$(date "+%Y-%m-%d %I-%M-%S") # the date and time is displayed in 12 hour formate %I is used to give the hours in 12 hr formate.
value=$(cat ./test/test.csv) # the cat command will get the value present in the file test.csv and we assigned it to variable "value"
if [ "$value" = "True" ]  # if condition is used to check the value and do the following operations. 
then 
  i=$((i+1)) # i value is incremented by 1 value for each iteration.
  echo "$t ,test${i} " >> result.txt  # Passing the date and file name of the tar file to a txt document for reference.
  tar -czvf "test${i}.tar.gz"  ./test/test.csv  # creating a tar file for each iteration with the iteration number in the tar file name.
else 
  echo "the file containes false value " # if the test.csv contains value other than TRUE then this condition is execuited.
fi 
echo "$i" > increment.txt # the present i value in the loop is rewritten in the increment.txt file.which is used in the next increment.


: '
  To run the following program we required following setup in an test sample.
  1.create a files increment.txt and result.txt and test.csv and pass the value True in the test.csv file only. 
  2.The test.csv file is created in a test folder.
  3. The problem.sh shell file is created outside the test folder.
  4. The result.txt will be updated with the new values of date and tar file name foreach iterations.
  5. Initailly the increment.txt file will be empty file after the execution of the problem.sh for the 1st iteration the i value is created and the updated value is updated to the increment.txt file.
'
