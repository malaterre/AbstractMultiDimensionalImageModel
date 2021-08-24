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

add_custom_command(
  OUTPUT  AbstractImage.xsd
  COMMAND ${TRANG_EXECUTABLE} -I rnc -O xsd ${CMAKE_CURRENT_SOURCE_DIR}/AbstractImage.rnc AbstractImage.xsd
  DEPENDS AbstractImage.rnc
  COMMENT "Create XSD from RNC. xsdcxx cxx-tree AbstractImage.xsd"
  )

set(examples
  Simple3DVolume
  Simple4DVolume
  2DUltrasound
  3DMRMetaboliteMapSingleComponent
  3DMRMetaboliteMapMultipleComponent
  )
foreach(example ${examples})
  add_custom_target(${example} ALL
    COMMAND ${JING_EXECUTABLE} AbstractImage.rng ${CMAKE_CURRENT_SOURCE_DIR}/${example}.xml
    DEPENDS AbstractImage.xsd AbstractImage.rng ${CMAKE_CURRENT_SOURCE_DIR}/${example}.xml
    COMMENT "Validate: ${example}.xml"
    )
endforeach()
