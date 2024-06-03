# CMake generated Testfile for 
# Source directory: /home/frattah/old
# Build directory: /home/frattah/old/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(unique-cces "/home/frattah/old/tests/assert_reference_unique.py" "/home/frattah/old" "cce")
set_tests_properties(unique-cces PROPERTIES  LABELS "quick" _BACKTRACE_TRIPLES "/home/frattah/old/cmake/SSGCommon.cmake;1250;add_test;/home/frattah/old/CMakeLists.txt;485;ssg_define_guide_and_table_tests;/home/frattah/old/CMakeLists.txt;0;")
subdirs("tests")
subdirs("gentoo")
