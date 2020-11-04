find_library(
    Existing_LIBRARY
    NAMES           existing_lib
    PATHS           ${CMAKE_SOURCE_DIR}
    PATH_SUFFIXES   lib
)
find_path(
    Existing_INCLUDE_DIRECTORY
    NAMES           lib_header.hpp
    PATHS           ${CMAKE_SOURCE_DIR}
    PATH_SUFFIXES   lib
)

mark_as_advanced(Existing_LIBRARY Existing_INCLUDE_DIRECTORY)

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(Existing
    REQUIRED_VARS
        Existing_LIBRARY
        Existing_INCLUDE_DIRECTORY
)

if(Existing_FOUND AND NOT TARGET Existing::Existing)
    add_library(Existing::Existing UNKNOWN IMPORTED)
    set_target_properties(Existing::Existing
        PROPERTIES
            IMPORTED_LINK_INTERFACE_LANGUAGES "CXX"
            IMPORTED_LOCATION                 "${Existing_LIBRARY}"
            INTERFACE_INCLUDE_DIRECTORIES     "${Existing_INCLUDE_DIRECTORY}"
    )
endif()



