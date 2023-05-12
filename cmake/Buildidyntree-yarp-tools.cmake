# Copyright (C) Fondazione Istituto Italiano di Tecnologia
# CopyPolicy: Released under the terms of the LGPLv2.1 or later, see LGPL.TXT

include(YCMEPHelper)

find_or_build_package(iDynTree QUIET)
find_or_build_package(YARP QUIET)
find_or_build_package(ICUB QUIET)

ycm_ep_helper(idyntree-yarp-tools TYPE GIT
              STYLE GITHUB
              REPOSITORY robotology/idyntree-yarp-tools.git
              TAG main
              COMPONENT dynamics
              FOLDER src
              DEPENDS iDynTree
                      YARP
                      ICUB
              CMAKE_ARGS -DIDYNTREE_YARP_TOOLS_USES_ICUB_MAIN:BOOL=ON
                         -DIDYNTREE_YARP_TOOLS_USES_QT:BOOL=${ROBOTOLOGY_USES_GUI}
                         -DIDYNTREE_YARP_TOOLS_USES_QT_CHARTS:BOOL=OFF)

set(idyntree-yarp-tools_CONDA_DEPENDENCIES eigen)

if(ROBOTOLOGY_USES_GUI)
  list(APPEND idyntree-yarp-tools_CONDA_DEPENDENCIES qt-main)
endif()
