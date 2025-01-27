# Parent project does not export its library target, so this CML implicitly
# depends on being added from it, i.e. the testing is done only from the build
# tree and is not feasible from an install location

project(network-stackTests LANGUAGES CXX)

# ---- Tests ----

find_package(GTest)
include(GoogleTest)

add_executable(network-stack_test source/network-stack_test.cpp)
target_link_libraries(network-stack_test PRIVATE 
    network-stack_lib
    GTest::gtest_main
)
gtest_discover_tests(network-stack_test)

add_test(NAME network-stack_test COMMAND network-stack_test)

# ---- End-of-file commands ----

add_folders(Test)
