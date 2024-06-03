# CMake generated Testfile for 
# Source directory: /home/frattah/old/products/gentoo
# Build directory: /home/frattah/old/build/gentoo
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(ansible-playbook-syntax-check-gentoo "/home/frattah/old/tests/ansible_playbook_check.sh" "/usr/bin/ansible-playbook" "/home/frattah/old/build/ansible" "gentoo")
set_tests_properties(ansible-playbook-syntax-check-gentoo PROPERTIES  _BACKTRACE_TRIPLES "/home/frattah/old/cmake/SSGCommon.cmake;249;add_test;/home/frattah/old/cmake/SSGCommon.cmake;710;ssg_build_remediations;/home/frattah/old/products/gentoo/CMakeLists.txt;6;ssg_build_product;/home/frattah/old/products/gentoo/CMakeLists.txt;0;")
add_test(validate-ssg-gentoo-cpe-dictionary.xml "/usr/bin/oscap" "cpe" "validate" "/home/frattah/old/build/ssg-gentoo-cpe-dictionary.xml")
set_tests_properties(validate-ssg-gentoo-cpe-dictionary.xml PROPERTIES  _BACKTRACE_TRIPLES "/home/frattah/old/cmake/SSGCommon.cmake;401;add_test;/home/frattah/old/cmake/SSGCommon.cmake;722;ssg_build_cpe_dictionary;/home/frattah/old/products/gentoo/CMakeLists.txt;6;ssg_build_product;/home/frattah/old/products/gentoo/CMakeLists.txt;0;")
add_test(validate-ssg-gentoo-cpe-oval.xml "/usr/bin/oscap" "oval" "validate" "/home/frattah/old/build/ssg-gentoo-cpe-oval.xml")
set_tests_properties(validate-ssg-gentoo-cpe-oval.xml PROPERTIES  _BACKTRACE_TRIPLES "/home/frattah/old/cmake/SSGCommon.cmake;405;add_test;/home/frattah/old/cmake/SSGCommon.cmake;722;ssg_build_cpe_dictionary;/home/frattah/old/products/gentoo/CMakeLists.txt;6;ssg_build_product;/home/frattah/old/products/gentoo/CMakeLists.txt;0;")
add_test(xccdf-values-gentoo "/home/frattah/old/tests/test_xccdf_values_in_ds.sh" "/home/frattah/old/build/ssg-gentoo-ds.xml")
set_tests_properties(xccdf-values-gentoo PROPERTIES  LABELS "quick" _BACKTRACE_TRIPLES "/home/frattah/old/cmake/SSGCommon.cmake;463;add_test;/home/frattah/old/cmake/SSGCommon.cmake;726;ssg_build_sds;/home/frattah/old/products/gentoo/CMakeLists.txt;6;ssg_build_product;/home/frattah/old/products/gentoo/CMakeLists.txt;0;")
add_test(reference-titles-in-benchmark-gentoo "env" "PYTHONPATH=/home/frattah/old" "/usr/bin/python3" "/home/frattah/old/tests/test_reference_titles_in_benchmark.py" "/home/frattah/old/build/ssg-gentoo-ds.xml" "/home/frattah/old/build/gentoo/product.yml")
set_tests_properties(reference-titles-in-benchmark-gentoo PROPERTIES  LABELS "quick" _BACKTRACE_TRIPLES "/home/frattah/old/cmake/SSGCommon.cmake;469;add_test;/home/frattah/old/cmake/SSGCommon.cmake;726;ssg_build_sds;/home/frattah/old/products/gentoo/CMakeLists.txt;6;ssg_build_product;/home/frattah/old/products/gentoo/CMakeLists.txt;0;")
add_test(validate-ssg-gentoo-ds.xml "/usr/bin/oscap" "ds" "sds-validate" "/home/frattah/old/build/ssg-gentoo-ds.xml")
set_tests_properties(validate-ssg-gentoo-ds.xml PROPERTIES  _BACKTRACE_TRIPLES "/home/frattah/old/cmake/SSGCommon.cmake;492;add_test;/home/frattah/old/cmake/SSGCommon.cmake;726;ssg_build_sds;/home/frattah/old/products/gentoo/CMakeLists.txt;6;ssg_build_product;/home/frattah/old/products/gentoo/CMakeLists.txt;0;")
add_test(verify-references-ssg-gentoo-ds.xml "env" "PYTHONPATH=/home/frattah/old" "/usr/bin/python3" "/home/frattah/old/build-scripts/verify_references.py" "--rules-with-invalid-checks" "--base-dir" "/home/frattah/old/build" "--ovaldefs-unused" "/home/frattah/old/build/ssg-gentoo-ds.xml")
set_tests_properties(verify-references-ssg-gentoo-ds.xml PROPERTIES  LABELS "quick" _BACKTRACE_TRIPLES "/home/frattah/old/cmake/SSGCommon.cmake;497;add_test;/home/frattah/old/cmake/SSGCommon.cmake;726;ssg_build_sds;/home/frattah/old/products/gentoo/CMakeLists.txt;6;ssg_build_product;/home/frattah/old/products/gentoo/CMakeLists.txt;0;")
add_test(validate-ssg-gentoo-oval.xml "/usr/bin/oscap" "oval" "validate" "/home/frattah/old/build/ssg-gentoo-oval.xml")
set_tests_properties(validate-ssg-gentoo-oval.xml PROPERTIES  _BACKTRACE_TRIPLES "/home/frattah/old/cmake/SSGCommon.cmake;730;add_test;/home/frattah/old/products/gentoo/CMakeLists.txt;6;ssg_build_product;/home/frattah/old/products/gentoo/CMakeLists.txt;0;")
