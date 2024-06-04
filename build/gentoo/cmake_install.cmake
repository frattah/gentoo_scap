# Install script for directory: /home/fra/gentoo_scap/products/gentoo

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/xml/scap/ssg/content" TYPE FILE FILES "/home/fra/gentoo_scap/build/ssg-gentoo-xccdf.xml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/xml/scap/ssg/content" TYPE FILE FILES "/home/fra/gentoo_scap/build/ssg-gentoo-oval.xml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/xml/scap/ssg/content" TYPE FILE FILES "/home/fra/gentoo_scap/build/ssg-gentoo-ocil.xml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/xml/scap/ssg/content" TYPE FILE FILES "/home/fra/gentoo_scap/build/ssg-gentoo-cpe-dictionary.xml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/xml/scap/ssg/content" TYPE FILE FILES "/home/fra/gentoo_scap/build/ssg-gentoo-cpe-oval.xml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/xml/scap/ssg/content" TYPE FILE FILES "/home/fra/gentoo_scap/build/ssg-gentoo-ds.xml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  
        file(GLOB GUIDE_FILES "/home/fra/gentoo_scap/build/guides/ssg-gentoo-*.html") 

        if(NOT IS_ABSOLUTE share/doc/scap-security-guide/guides)
            file(INSTALL DESTINATION "/usr/local/share/doc/scap-security-guide/guides"
                TYPE FILE FILES ${GUIDE_FILES})
        else()
            file(INSTALL DESTINATION "share/doc/scap-security-guide/guides"
                TYPE FILE FILES ${GUIDE_FILES})
        endif()
        
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  
            file(GLOB ROLE_FILES "/home/fra/gentoo_scap/build/ansible/gentoo-playbook-*.yml") 

            if(NOT IS_ABSOLUTE share/scap-security-guide/ansible)
                file(INSTALL DESTINATION "/usr/local/share/scap-security-guide/ansible"
                    TYPE FILE FILES ${ROLE_FILES})
            else()
                file(INSTALL DESTINATION "share/scap-security-guide/ansible"
                    TYPE FILE FILES ${ROLE_FILES})
            endif()
            
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  
            file(GLOB ROLE_FILES "/home/fra/gentoo_scap/build/bash/gentoo-script-*.sh") 

            if(NOT IS_ABSOLUTE share/scap-security-guide/bash)
                file(INSTALL DESTINATION "/usr/local/share/scap-security-guide/bash"
                    TYPE FILE FILES ${ROLE_FILES})
            else()
                file(INSTALL DESTINATION "share/scap-security-guide/bash"
                    TYPE FILE FILES ${ROLE_FILES})
            endif()
            
endif()

