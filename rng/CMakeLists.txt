cmake_minimum_required(VERSION 3.16)
set(CMAKE_DEPENDS_USE_COMPILER FALSE)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-unused-command-line-argument")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-unused-command-line-argument -DEOSIO_NO_RICARDIAN")

project(escrow)

find_package(blanc)
include(EosioWasmToolchain)

add_contract(rng rng
   ${CMAKE_CURRENT_SOURCE_DIR}/src/rng.cpp
   ${CMAKE_CURRENT_SOURCE_DIR}/src/rsa.cpp
)

target_include_directories(rng
   PUBLIC
   ${CMAKE_CURRENT_SOURCE_DIR}/include
   ${CMAKE_CURRENT_SOURCE_DIR}/external
)