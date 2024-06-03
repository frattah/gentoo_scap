# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/frattah/old

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/frattah/old/build

# Utility rule file for zipfile.

# Include any custom commands dependencies for this target.
include CMakeFiles/zipfile.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/zipfile.dir/progress.make

CMakeFiles/zipfile: zipfile/scap-security-guide-0.1.73.zip

zipfile/scap-security-guide-0.1.73.zip:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/frattah/old/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building zipfile at /home/frattah/old/build/zipfile/scap-security-guide-0.1.73.zip"
	/usr/bin/cmake -E remove_directory zipfile/
	/usr/bin/cmake -E make_directory zipfile/scap-security-guide-0.1.73
	/usr/bin/cmake -E copy /home/frattah/old/README.md zipfile/scap-security-guide-0.1.73
	/usr/bin/cmake -E copy /home/frattah/old/Contributors.md zipfile/scap-security-guide-0.1.73
	/usr/bin/cmake -E copy /home/frattah/old/LICENSE zipfile/scap-security-guide-0.1.73
	/usr/bin/cmake -E make_directory zipfile/scap-security-guide-0.1.73/kickstart
	/usr/bin/cmake -DSOURCE="/home/frattah/old/products/rhel*/kickstart/*-ks.cfg" -DDEST="zipfile/scap-security-guide-0.1.73/kickstart" -P /home/frattah/old/cmake/CopyFiles.cmake
	/usr/bin/cmake -DSOURCE="/home/frattah/old/build/ssg-*-ds.xml" -DDEST="zipfile/scap-security-guide-0.1.73" -P /home/frattah/old/cmake/CopyFiles.cmake
	/usr/bin/cmake -E make_directory zipfile/scap-security-guide-0.1.73/bash
	/usr/bin/cmake -DSOURCE="/home/frattah/old/build/bash/*.sh" -DDEST="zipfile/scap-security-guide-0.1.73/bash" -P /home/frattah/old/cmake/CopyFiles.cmake
	/usr/bin/cmake -E make_directory zipfile/scap-security-guide-0.1.73/ansible
	/usr/bin/cmake -DSOURCE="/home/frattah/old/build/ansible/*.yml" -DDEST="zipfile/scap-security-guide-0.1.73/ansible" -P /home/frattah/old/cmake/CopyFiles.cmake
	/usr/bin/cmake -E make_directory zipfile/scap-security-guide-0.1.73/guides
	/usr/bin/cmake -DSOURCE="/home/frattah/old/build/guides/*" -DDEST="zipfile/scap-security-guide-0.1.73/guides" -P /home/frattah/old/cmake/CopyFiles.cmake
	/usr/bin/cmake -E make_directory zipfile/scap-security-guide-0.1.73/tables
	/usr/bin/cmake -DSOURCE="/home/frattah/old/build/tables/*" -DDEST="zipfile/scap-security-guide-0.1.73/tables" -P /home/frattah/old/cmake/CopyFiles.cmake
	/usr/bin/cmake -E make_directory zipfile/scap-security-guide-0.1.73/manifests
	/usr/bin/cmake -DSOURCE="/home/frattah/old/build/*/manifest-*.json" -DDEST="zipfile/scap-security-guide-0.1.73/manifests" -P /home/frattah/old/cmake/CopyFiles.cmake
	/usr/bin/cmake -E chdir zipfile /usr/bin/cmake -E tar cvf scap-security-guide-0.1.73.zip --format=zip scap-security-guide-0.1.73
	/usr/bin/cmake -E chdir zipfile /usr/bin/cmake -E sha512sum scap-security-guide-0.1.73.zip > zipfile/scap-security-guide-0.1.73.zip.sha512

zipfile: CMakeFiles/zipfile
zipfile: zipfile/scap-security-guide-0.1.73.zip
zipfile: CMakeFiles/zipfile.dir/build.make
.PHONY : zipfile

# Rule to build all files generated by this target.
CMakeFiles/zipfile.dir/build: zipfile
.PHONY : CMakeFiles/zipfile.dir/build

CMakeFiles/zipfile.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/zipfile.dir/cmake_clean.cmake
.PHONY : CMakeFiles/zipfile.dir/clean

CMakeFiles/zipfile.dir/depend:
	cd /home/frattah/old/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/frattah/old /home/frattah/old /home/frattah/old/build /home/frattah/old/build /home/frattah/old/build/CMakeFiles/zipfile.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/zipfile.dir/depend
