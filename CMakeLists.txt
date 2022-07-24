cmake_minimum_required(VERSION 3.16) # Required to build dependency DPP
project(TwoBot LANGUAGES CXX) # Might use Lua later also

set(CMAKE_CXX_STANDARD 20) # That's the entire point, really.

set(CMAKE_EXPORT_COMPILE_COMMANDS ON) # We need this lol.
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# add the executable
add_executable(TwoBot main.cpp)

find_package(Threads REQUIRED)
find_package(DPP)
find_package(OpenSSL REQUIRED)

target_include_directories(TwoBot PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/include
    ${OPENSSL_INCLUDE_DIR}
)

target_link_libraries(TwoBot
    dl
    ${CMAKE_THREAD_LIBS_INIT}
    ${OPENSSL_CRYPTO_LIBRARY} 
    ${OPENSSL_SSL_LIBRARY}
)

# We need to build DPP as a dependency
target_link_libraries(TwoBot ${DPP_LIBRARIES})
target_include_directories(TwoBot PUBLIC ${DPP_INCLUDE_DIR})


# target_compile_definitions(WitchHutFinder PRIVATE -DOPTIMIZE_SEED=${OPTIMIZE_SEED})
