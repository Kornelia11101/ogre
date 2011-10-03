#-------------------------------------------------------------------
# This file is part of the CMake build system for OGRE
#     (Object-oriented Graphics Rendering Engine)
# For the latest info, see http://www.ogre3d.org/
#
# The contents of this file are placed in the public domain. Feel
# free to make use of it in any way you like.
#-------------------------------------------------------------------

# strip spaces from render system name
string(REPLACE " " "" TEST_CONTEXT_RENDER_SYSTEM_NOSPACE ${TEST_CONTEXT_RENDER_SYSTEM})

# delete any existing results first
exec_program("cmake -E remove ${TEST_CONTEXT_RESULT_DIR}/TestResults_${TEST_CONTEXT_RENDER_SYSTEM_NOSPACE}.txt")

# needs the ./ in Unix-like systems
if (UNIX)
  set (TEST_CONTEXT_EXECUTABLE ./${TEST_CONTEXT_EXECUTABLE})
endif (UNIX)

# now run the context
exec_program("cmake" ARGS -E chdir ${TEST_CONTEXT_PATH} ${TEST_CONTEXT_EXECUTABLE} 
  -rs "\"${TEST_CONTEXT_RENDER_SYSTEM}\""                 # Pick rendersystem
  -n "AutomatedTest"                                      # Name it, so it overwrites itself each run
  -m "\"Automated Test - ${TEST_CONTEXT_RENDER_SYSTEM}\"" # A brief comment
  -o "\"${TEST_CONTEXT_RESULT_DIR}\"")                    # Where to output result summary
