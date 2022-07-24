find_path(DPP_INCLUDE_DIR NAMES dpp/dpp.h HINTS ${DPP_ROOT_DIR} ${CMAKE_SOURCE_DIR}/deps/dpp/install/include)

find_library(DPP_LIBRARIES NAMES dpp "libdpp.dylib" HINTS ${DPP_ROOT_DIR} ${CMAKE_SOURCE_DIR}/deps/dpp/install/lib)

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(DPP DEFAULT_MSG DPP_LIBRARIES DPP_INCLUDE_DIR)
