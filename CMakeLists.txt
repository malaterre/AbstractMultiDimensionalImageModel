cmake_minimum_required(VERSION 3.0)
# A.2 Abstract Multi-Dimensional Image Model
project(AMDIM NONE)

find_program(TRANG_EXECUTABLE trang)
find_program(JING_EXECUTABLE jing)

add_custom_command(
  OUTPUT  AbstractImage.rng
  COMMAND ${TRANG_EXECUTABLE} -I rnc -O rng ${CMAKE_CURRENT_SOURCE_DIR}/AbstractImage.rnc AbstractImage.rng
  DEPENDS AbstractImage.rnc
  COMMENT "Create RNG from RNC"
  )

add_custom_target(Simple3DVolume ALL 
  COMMAND ${JING_EXECUTABLE} AbstractImage.rng ${CMAKE_CURRENT_SOURCE_DIR}/Simple3DVolume.xml
  DEPENDS AbstractImage.rng ${CMAKE_CURRENT_SOURCE_DIR}/Simple3DVolume.xml
  COMMENT "Validate: Simple3DVolume.xml"
)
