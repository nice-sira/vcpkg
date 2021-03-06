cmake_minimum_required(VERSION 3.0)
project(openvpncli CXX)

find_path(ASIO_HPP asio.hpp)
find_library(MBEDTLS_LIB mbedtls)
find_library(MBEDCRYPTO_LIB mbedcrypto)
find_library(MBEDX509_LIB mbedx509)

include_directories(. ${ASIO_HPP})

if(WIN32) 
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /bigobj")
endif()

add_definitions(-DNOMINMAX -DUSE_ASIO -DUSE_MBEDTLS)

add_library(ovpncli client/ovpncli.cpp)
target_link_libraries(ovpncli PRIVATE Iphlpapi.lib ${MBEDTLS_LIB} ${MBEDCRYPTO_LIB} ${MBEDX509_LIB})

install(
    TARGETS ovpncli
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
)

if(BUILD_TOOL)
    add_executable(cli test/ovpncli/cli.cpp)
    target_link_libraries(cli PRIVATE ovpncli)
endif()
