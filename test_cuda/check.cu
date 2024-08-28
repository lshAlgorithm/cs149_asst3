#include <iostream>
#include <cuda_runtime.h>

int main() {
    int driverVersion = 0, runtimeVersion = 0;
    cudaDriverGetVersion(&driverVersion);
    cudaRuntimeGetVersion(&runtimeVersion);
    std::cout << driverVersion << " " << runtimeVersion << std::endl;
    if (driverVersion / 1000 == runtimeVersion / 1000) {
        std::cout << "CUDA Driver API and Runtime API versions are compatible." << std::endl;
    } else {
        std::cout << "WARNING: CUDA Driver API and Runtime API versions are NOT COMPATIBLE." << std::endl;
    }

    int deviceCount;
    cudaError_t error = cudaGetDeviceCount(&deviceCount);
    if (error == cudaSuccess && deviceCount > 0) {
        std::cout << "CUDA is available and there are " << deviceCount << " devices." << std::endl;
        for (int i = 0; i < deviceCount; ++i) {
            cudaDeviceProp prop;
            cudaGetDeviceProperties(&prop, i);
            std::cout << "Device " << i << ": " << prop.name << std::endl;
        }
    } else {
        std::cout << "No CUDA devices found or CUDA is not available." << std::endl;
    }

    return 0;
}
