# Copyright CERN and copyright holders of ALICE O2. This software is distributed
# under the terms of the GNU General Public License v3 (GPL Version 3), copied
# verbatim in the file "COPYING".
#
# See http://alice-o2.web.cern.ch/license for full licensing information.
#
# In applying this license CERN does not waive the privileges and immunities
# granted to it by virtue of its status as an Intergovernmental Organization or
# submit itself to any jurisdiction.

# use the Geant4Config.cmake provided by the Geant4 installation to create a
# single target geant4 with the include directories and libraries we need

find_package(Geant4 NO_MODULE)
if(NOT Geant4_FOUND)
  return()
endif()

add_library(geant4 IMPORTED INTERFACE)

set_target_properties(geant4
                      PROPERTIES INTERFACE_INCLUDE_DIRECTORIES
                                 "${Geant4_INCLUDE_DIRS}")

# Promote the imported target to global visibility
# (so we can alias it)
set_target_properties(geant4 PROPERTIES IMPORTED_GLOBAL TRUE)

add_library(MC::Geant4 ALIAS geant4)
