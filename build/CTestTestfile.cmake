# CMake generated Testfile for 
# Source directory: /home/fra/gentoo_scap
# Build directory: /home/fra/gentoo_scap/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(unique-cces "/home/fra/gentoo_scap/tests/assert_reference_unique.py" "/home/fra/gentoo_scap" "cce")
set_tests_properties(unique-cces PROPERTIES  LABELS "quick" _BACKTRACE_TRIPLES "/home/fra/gentoo_scap/cmake/SSGCommon.cmake;1250;add_test;/home/fra/gentoo_scap/CMakeLists.txt;485;ssg_define_guide_and_table_tests;/home/fra/gentoo_scap/CMakeLists.txt;0;")
subdirs("tests")
subdirs("gentoo")
