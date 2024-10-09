import subprocess
import random
import time

# Function to run the C++ executable and check for success
def run_test(array_size):
    # Generate a random array of the given size
    array = [random.randint(0, 1000000) for _ in range(array_size)]

    # Prepare the input string for the C++ program
    input_str = f"{array_size}\n" + " ".join(map(str, array)) + "\n"

    try:
        # Start the process and pass the array as input
        result = subprocess.run(
            ["./sort"],  # Adjust if the executable is in a different location
            input=input_str,
            text=True,
            capture_output=True,
            timeout=1200  # 20-minute timeout
        )

        # If the process returns 0 (successful execution), return True
        if result.returncode == 0:
            print(f"Test with array size {array_size}: Success")
            return True
        else:
            print(f"Test with array size {array_size}: Failure")
            print(result.stderr)  # Print the error message from C++ program if needed
            return False
    except subprocess.TimeoutExpired:
        print(f"Test with array size {array_size}: Timed out")
        return False

# Run stress tests with various array sizes
if __name__ == "__main__":
    max_array_size = int(1e7)  # Max size set to 100 million
    num_tests = 50

    for test in range(num_tests):
        array_size = random.randint(1, max_array_size)  # Random size between 1 and 1e8
        print(f"Running test {test + 1}/{num_tests} with array size {array_size}")
        start_time = time.time()
        success = run_test(array_size)
        elapsed_time = time.time() - start_time
        print(f"Elapsed time for array size {array_size}: {elapsed_time:.2f} seconds\n")
