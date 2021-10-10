cmake_minimum_required(VERSION 3.20)
project(APFInteractionExperiment)
set(CMAKE_CXX_STANDARD 17)


add_executable(APFIExperiment
        main.mm
        )

target_include_directories(APFIExperiment PUBLIC
        ./include/CoreBrightness.framework
        )

target_link_libraries(APFIExperiment
        "-framework Foundation"
        "-iframework /System/Library/PrivateFrameworks -framework CoreBrightness"
        )