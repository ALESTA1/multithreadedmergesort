import subprocess
import matplotlib.pyplot as plt

def run_sort(executable, array_length):
    # Run the executable and provide input through stdin
    result = subprocess.run(
        [executable],
        input=str(array_length) + '\n',  # Provide the input followed by a newline
        capture_output=True,
        text=True
    )

    # Extract time taken from the output
    for line in result.stdout.splitlines():
        if "Time taken" in line:
            time_taken = float(line.split(": ")[1].split(" ")[0])  # Get the time in milliseconds
            return time_taken
    return None

def main():
    lengths = [
        100, 500, 1000, 5000, 10000,
        50000, 100000, 500000, 1000000,
        5000000, 10000000 , 100000000  # Maximum length is now 10 million
    ]

    multithreaded_times = []
    singlethreaded_times = []

    # Run tests for multithreaded sort
    for length in lengths:
        print(f"Running multithreaded sort for array length: {length}")
        time_taken = run_sort('./sort', length)  # Providing input for multithreaded sort
        multithreaded_times.append(time_taken)
        print(f"Time taken (multithreaded): {time_taken} ms")

    # Run tests for single-threaded sort
    for length in lengths:
        print(f"Running single-threaded sort for array length: {length}")
        time_taken = run_sort('./singlesort', length)  # Providing input for single-threaded sort
        singlethreaded_times.append(time_taken)
        print(f"Time taken (single-threaded): {time_taken} ms")

    # Plot the results
    plt.figure(figsize=(10, 6))
    plt.plot(lengths, multithreaded_times, label='Multithreaded Sort', marker='o')
    plt.plot(lengths, singlethreaded_times, label='Single-threaded Sort', marker='o')
    plt.xscale('log')
    plt.yscale('log')
    plt.xlabel('Array Length (log scale)')
    plt.ylabel('Time Taken (ms, log scale)')
    plt.title('Multithreaded vs Single-threaded Merge Sort Performance')
    plt.legend()
    plt.grid(True)

    # Save the plot
    plt.savefig('merge_sort_performance.png', dpi=300)
    plt.close()

if __name__ == '__main__':
    main()
