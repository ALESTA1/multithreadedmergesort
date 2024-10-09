# Multithreaded sort

`Multithreaded sort` is a cpp program to efficiently sort large arrays with the use of concurrency , used threadpool to not overload the system and properly synchronized the threads. Have naively sorted the array upto a predetermined block size , and beyond that have used a bottom up merge sort approach to merge the sorted blocks for max efficiency.


## Following are test results against a naive single threaded merge sort

![image](https://github.com/user-attachments/assets/94494c35-5b46-4c0f-9fcd-e476356443f6)


