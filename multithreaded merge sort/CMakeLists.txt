cmake_minimum_required(VERSION 3.22)
project(multithreaded_merge_sort)

set(CMAKE_CXX_STANDARD 14)

add_executable(multithreaded_merge_sort
        multithreadedMergesort.cpp)
