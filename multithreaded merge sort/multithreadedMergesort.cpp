#include <atomic>
#include <bits/stdc++.h>
#include <chrono>
#include <condition_variable>
#include <mutex>
#include <thread>
#include <future>
#include <vector>
#include <queue>
#include <iostream>
#include <random>

using namespace std;

vector<int> temp;
class ThreadPool {
public:
    ThreadPool(int numThreads) : stop(false) {
        for (int i = 0; i < numThreads; i++) {
            threads.emplace_back([this] { executeTask(); });
        }
    }

    // Template function to accept tasks
    template <typename F>
    future<void> addTask(F&& task) {
        auto promise = make_shared<std::promise<void>>(); // Fully qualified std::promise
        auto future = promise->get_future();

        auto wrapper = [task = std::forward<F>(task), promise]() mutable {
            task();
            promise->set_value();
        };

        {
            unique_lock<mutex> lock(m);
            functionQueue.push(std::move(wrapper));
        }
        cv.notify_one();
        return future;
    }

    ~ThreadPool() {
        {
            unique_lock<mutex> lock(m);
            stop = true;
        }
        cv.notify_all();
        for (auto& thread : threads) {
            if (thread.joinable()) {
                thread.join();
            }
        }
    }

private:
    void executeTask() {
        while (true) {
            function<void()> task;
            {
                unique_lock<mutex> lock(m);
                cv.wait(lock, [this] { return stop || !functionQueue.empty(); });
                if (stop && functionQueue.empty()) return;
                task = std::move(functionQueue.front());
                functionQueue.pop();
            }
            task();
        }
    }

    vector<thread> threads;
    queue<function<void()>> functionQueue;
    condition_variable cv;
    mutex m;
    bool stop;
};

void smallSort(int l, int r, vector<int>& array) {
    sort(array.begin() + l, array.begin() + r + 1);
}

void merge(int l, int r, int ll, int rr, vector<int> &array) {

    for (int i = l; i <= rr; ++i) {
        temp[i] = array[i];
    }

    int i = l;
    int j = ll;
    int id = l;
    while (i <= r && j <= rr) {

        if (temp[i] <= temp[j]) {
            array[id++] = temp[i++];
        } else {
            array[id++] = temp[j++];
        }
    }

    while (i <= r) {
        array[id++] = temp[i++];
    }
    while (j <= rr) {
        array[id++] = temp[j++];
    }
}


int main() {
    int n;
    cin >> n;
    temp.resize(n+1);
    vector<int> array(n);
    ThreadPool pool(thread::hardware_concurrency() - 1); // Use available threads
    srand(static_cast<unsigned>(time(nullptr))); // Fixed missing parenthesis

    for (int i = 0; i < n; i++)
        array[i] = rand() % 1000000;
    int blockSize = (1<<17);
    int sum = 0;
    auto start = chrono::high_resolution_clock::now();
    vector<future<void>> tasks;

    for (int i = 0; i < n; i += blockSize) {
        int l = i;
        int r = min(i + blockSize - 1, n - 1);
        tasks.push_back(pool.addTask([l, r, &array] { smallSort(l, r, array); }));
    }

    for (auto& t : tasks) {
        t.get();
    }

    while (blockSize < n) {
        tasks.clear();
        for (int i = 0; i < n; i += blockSize * 2) {
            if (i + blockSize >= n) {
                continue;
            }
            int l = i;
            int r = i + blockSize - 1;
            int ll = min(n - 1, i + blockSize);
            int rr = min(n - 1, i + 2 * blockSize - 1);
            tasks.push_back(pool.addTask([l, r, ll, rr, &array] { merge(l, r, ll, rr, array); }));
            sum++;
        }
        blockSize *= 2;

        for (auto& t : tasks) {
            t.get();
        }
    }

    //cout << "Total Sorts: " << sum << endl;

    auto end = chrono::high_resolution_clock::now();
    auto duration = chrono::duration_cast<chrono::milliseconds>(end - start);
    cout << "Time taken: " << duration.count() << " milliseconds" << endl;

    return 0;
}
