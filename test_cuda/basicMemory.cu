#include <iostream>
#include <cuda_runtime.h>

int main() {
    const int N = 10;
    float *h_data, *d_data;

    // Allocate memory on the host
    h_data = new float[N];
    for (int i = 0; i < N; ++i) {
        h_data[i] = i;
    }

    // Allocate memory on the device
    cudaMalloc((void**)&d_data, N * sizeof(float));

    // Copy data from host to device
    cudaMemcpy(d_data, h_data, N * sizeof(float), cudaMemcpyHostToDevice);

    // Copy data back from device to host
    cudaMemcpy(h_data, d_data, N * sizeof(float), cudaMemcpyDeviceToHost);

    // Free memory on the device
    cudaFree(d_data);

    // Print the data on the host to verify correctness
    std::cout << "Data on the host after copying from the device:" << std::endl;
    for (int i = 0; i < N; ++i) {
        std::cout << h_data[i] << " ";
    }
    std::cout << std::endl;

    // Free memory on the host
    delete[] h_data;

    return 0;
}
