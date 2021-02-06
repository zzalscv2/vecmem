# VecMem project, part of the ACTS project (R&D line)
#
# (c) 2021 CERN for the benefit of the ACTS project
#
# Mozilla Public License Version 2.0

# CMake include(s).
include( CPack )

# Export the configuration of the project.
include( CMakePackageConfigHelpers )
set( CMAKE_INSTALL_CMAKEDIR
   "${CMAKE_INSTALL_LIBDIR}/cmake/vecmem-${PROJECT_VERSION}" )
install( EXPORT vecmem-exports
   NAMESPACE "vecmem::"
   FILE "vecmem-config-targets.cmake"
   DESTINATION "${CMAKE_INSTALL_CMAKEDIR}" )
configure_package_config_file(
   "${CMAKE_CURRENT_SOURCE_DIR}/cmake/vecmem-config.cmake.in"
   "${CMAKE_CURRENT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/vecmem-config.cmake"
   INSTALL_DESTINATION "${CMAKE_INSTALL_CMAKEDIR}"
   PATH_VARS CMAKE_INSTALL_INCLUDEDIR CMAKE_INSTALL_LIBDIR
             CMAKE_INSTALL_CMAKEDIR
   NO_CHECK_REQUIRED_COMPONENTS_MACRO )
write_basic_package_version_file(
   "${CMAKE_CURRENT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/vecmem-config-version.cmake"
   COMPATIBILITY "AnyNewerVersion" )
install( FILES
   "${CMAKE_CURRENT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/vecmem-config.cmake"
   "${CMAKE_CURRENT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/vecmem-config-version.cmake"
   DESTINATION "${CMAKE_INSTALL_CMAKEDIR}" )
