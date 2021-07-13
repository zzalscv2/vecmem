# VecMem project, part of the ACTS project (R&D line)
#
# (c) 2021 CERN for the benefit of the ACTS project
#
# Mozilla Public License Version 2.0

# Set up how HIP object file compilation should go.
set( CMAKE_HIP_COMPILE_OBJECT
   "HIP_PLATFORM=${CMAKE_HIP_PLATFORM} <CMAKE_HIP_COMPILER> <DEFINES> <INCLUDES> <FLAGS> ${CMAKE_HIP_COMPILE_SOURCE_TYPE_FLAG} -o <OBJECT> -c <SOURCE>" )

# Set up how shared library building should go.
if( NOT DEFINED CMAKE_SHARED_LIBRARY_CREATE_HIP_FLAGS )
   set( CMAKE_SHARED_LIBRARY_CREATE_HIP_FLAGS
      "${CMAKE_SHARED_LIBRARY_CREATE_CXX_FLAGS}" )
endif()
if( NOT DEFINED CMAKE_SHARED_LIBRARY_HIP_FLAGS )
   set( CMAKE_SHARED_LIBRARY_HIP_FLAGS "${CMAKE_SHARED_LIBRARY_CXX_FLAGS}" )
endif()
if( NOT DEFINED CMAKE_SHARED_LIBRARY_LINK_HIP_FLAGS )
   set( CMAKE_SHARED_LIBRARY_LINK_HIP_FLAGS
      "${CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS}" )
endif()
if( NOT DEFINED CMAKE_SHARED_LIBRARY_RUNTIME_HIP_FLAG )
   set( CMAKE_SHARED_LIBRARY_RUNTIME_HIP_FLAG
      "${CMAKE_SHARED_LIBRARY_RUNTIME_CXX_FLAG}" )
endif()
if( NOT DEFINED CMAKE_SHARED_LIBRARY_RUNTIME_HIP_FLAG_SEP )
   set( CMAKE_SHARED_LIBRARY_RUNTIME_HIP_FLAG_SEP
      "${CMAKE_SHARED_LIBRARY_RUNTIME_CXX_FLAG_SEP}" )
endif()
if( NOT DEFINED CMAKE_SHARED_LIBRARY_RPATH_LINK_HIP_FLAG )
   set( CMAKE_SHARED_LIBRARY_RPATH_LINK_HIP_FLAG
      "${CMAKE_SHARED_LIBRARY_RPATH_LINK_CXX_FLAG}" )
endif()
if( NOT DEFINED CMAKE_SHARED_LIBRARY_EXPORTS_HIP_FLAG )
   set( CMAKE_SHARED_LIBRARY_EXPORTS_HIP_FLAG
      "${CMAKE_SHARED_LIBRARY_EXPORTS_CXX_FLAG}" )
endif()
if( NOT DEFINED CMAKE_SHARED_LIBRARY_SONAME_HIP_FLAG )
   set( CMAKE_SHARED_LIBRARY_SONAME_HIP_FLAG
      "${CMAKE_SHARED_LIBRARY_SONAME_CXX_FLAG}" )
endif()
set( CMAKE_HIP_CREATE_SHARED_LIBRARY
   "${CMAKE_HIP_HOST_LINKER} <CMAKE_SHARED_LIBRARY_HIP_FLAGS> <LANGUAGE_COMPILE_FLAGS> <LINK_FLAGS> <CMAKE_SHARED_LIBRARY_CREATE_HIP_FLAGS> <SONAME_FLAG><TARGET_SONAME> -o <TARGET> <OBJECTS> <LINK_LIBRARIES> ${CMAKE_HIP_IMPLICIT_LINK_LIBRARIES}" )

# Set up how module library building should go.
if( NOT DEFINED CMAKE_SHARED_MODULE_CREATE_HIP_FLAGS )
   set( CMAKE_SHARED_MODULE_CREATE_HIP_FLAGS
      "${CMAKE_SHARED_MODULE_CREATE_CXX_FLAGS}" )
endif()
if( NOT DEFINED CMAKE_SHARED_MODULE_HIP_FLAGS )
   set( CMAKE_SHARED_MODULE_HIP_FLAGS "${CMAKE_SHARED_MODULE_CXX_FLAGS}" )
endif()
if( NOT DEFINED CMAKE_SHARED_MODULE_LINK_HIP_FLAGS )
   set( CMAKE_SHARED_MODULE_LINK_HIP_FLAGS
      "${CMAKE_SHARED_MODULE_LINK_CXX_FLAGS}" )
endif()
if( NOT DEFINED CMAKE_SHARED_MODULE_RUNTIME_HIP_FLAG )
   set( CMAKE_SHARED_MODULE_RUNTIME_HIP_FLAG
      "${CMAKE_SHARED_MODULE_RUNTIME_CXX_FLAG}" )
endif()
if( NOT DEFINED CMAKE_SHARED_MODULE_RUNTIME_HIP_FLAG_SEP )
   set( CMAKE_SHARED_MODULE_RUNTIME_HIP_FLAG_SEP
      "${CMAKE_SHARED_MODULE_RUNTIME_CXX_FLAG_SEP}" )
endif()
if( NOT DEFINED CMAKE_SHARED_MODULE_RPATH_LINK_HIP_FLAG )
   set( CMAKE_SHARED_MODULE_RPATH_LINK_HIP_FLAG
      "${CMAKE_SHARED_MODULE_RPATH_LINK_CXX_FLAG}" )
endif()
if( NOT DEFINED CMAKE_SHARED_MODULE_EXPORTS_HIP_FLAG )
   set( CMAKE_SHARED_MODULE_EXPORTS_HIP_FLAG
      "${CMAKE_SHARED_MODULE_EXPORTS_CXX_FLAG}" )
endif()
if( NOT DEFINED CMAKE_SHARED_MODULE_SONAME_HIP_FLAG )
   set( CMAKE_SHARED_MODULE_SONAME_HIP_FLAG
      "${CMAKE_SHARED_MODULE_SONAME_CXX_FLAG}" )
endif()
set( CMAKE_HIP_CREATE_SHARED_MODULE
   "${CMAKE_HIP_HOST_LINKER} <CMAKE_SHARED_MODULE_HIP_FLAGS> <LANGUAGE_COMPILE_FLAGS> <LINK_FLAGS> <CMAKE_SHARED_MODULE_CREATE_HIP_FLAGS> -o <TARGET> <OBJECTS> <LINK_LIBRARIES> ${CMAKE_HIP_IMPLICIT_LINK_LIBRARIES}" )

# Set up how executable building shoul go.
if( NOT DEFINED CMAKE_HIP_LINK_FLAGS )
   set( CMAKE_HIP_LINK_FLAGS "${CMAKE_CXX_LINK_FLAGS}" )
endif()
if( NOT DEFINED CMAKE_EXECUTABLE_RUNTIME_HIP_FLAG )
   set( CMAKE_EXECUTABLE_RUNTIME_HIP_FLAG
      "${CMAKE_EXECUTABLE_RUNTIME_CXX_FLAG}" )
endif()
if( NOT DEFINED CMAKE_EXECUTABLE_RUNTIME_HIP_FLAG_SEP )
   set( CMAKE_EXECUTABLE_RUNTIME_HIP_FLAG_SEP
      "${CMAKE_EXECUTABLE_RUNTIME_CXX_FLAG_SEP}" )
endif()
if( NOT DEFINED CMAKE_EXECUTABLE_RPATH_LINK_HIP_FLAG )
   set( CMAKE_EXECUTABLE_RPATH_LINK_HIP_FLAG
      "${CMAKE_EXECUTABLE_RPATH_LINK_CXX_FLAG}" )
endif()
set( CMAKE_HIP_LINK_EXECUTABLE
   "${CMAKE_HIP_HOST_LINKER} <FLAGS> <CMAKE_HIP_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> -o <TARGET> <LINK_LIBRARIES> ${CMAKE_HIP_IMPLICIT_LINK_LIBRARIES}" )

# Set up the default flags for the HIP build.
set( CMAKE_HIP_FLAGS_INIT "$ENV{HIPFLAGS} ${CMAKE_HIP_FLAGS_INIT}" )
cmake_initialize_per_config_variable( CMAKE_HIP_FLAGS
   "Flags used by the HIP compiler" )

# Tell CMake that the information was loaded.
set( CMAKE_HIP_INFORMATION_LOADED TRUE )
