#include <bits/stdc++.h>
#include <chrono>
using namespace std;


int sum = 0;
void merge(int l, int r, int ll, int rr, vector<int> &array) {
  sum++;
  vector<int> left, right;

  for (int i = l; i <= r; i++) {
    left.push_back(array[i]);
  }
  for (int i = ll; i <= rr; i++) {
    right.push_back(array[i]);
  }

  left.push_back(INT_MAX);
  right.push_back(INT_MAX);

  int x = 0, y = 0;

  for (int i = l; i <= rr; i++) {
    if (left[x] < right[y]) {
      array[i] = left[x++];
    } else {
      array[i] = right[y++];
    }
  }
}

void mergeSort(int l, int r, vector<int> &array) {
  if (l >= r)
    return;

  int mid = l + (r - l) / 2;
  mergeSort(l, mid, array);
  mergeSort(mid + 1, r, array);
  merge(l, mid, mid + 1, r, array);
}

int main() {
  int n;
  cin >> n;
  vector<int> array(n);

  srand(time(nullptr));
  for (int i = 0; i < n; i++)
    array[i] = rand() % 1000000;


  auto start = chrono::high_resolution_clock::now();
  mergeSort(0, n - 1, array);

  //cout<<"Total merge"<<sum << endl;
  auto end = chrono::high_resolution_clock::now();
  auto duration = chrono::duration_cast<chrono::milliseconds>(end - start);
  cout << "Time taken: " << duration.count() << " milliseconds" << endl;

  return 0;
}
