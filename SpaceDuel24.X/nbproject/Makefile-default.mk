#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/SpaceDuel24.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/SpaceDuel24.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../code/app/game.c ../code/app/main.c ../code/audio/audio.c ../code/board/board.c ../code/board/config_bits.c ../code/display/renderer.c ../code/drivers/adc.c ../code/drivers/spi.c ../code/joystick/joystick.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1425171858/game.o ${OBJECTDIR}/_ext/1425171858/main.o ${OBJECTDIR}/_ext/504552675/audio.o ${OBJECTDIR}/_ext/505294835/board.o ${OBJECTDIR}/_ext/505294835/config_bits.o ${OBJECTDIR}/_ext/1876839055/renderer.o ${OBJECTDIR}/_ext/2125438744/adc.o ${OBJECTDIR}/_ext/2125438744/spi.o ${OBJECTDIR}/_ext/1124241679/joystick.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1425171858/game.o.d ${OBJECTDIR}/_ext/1425171858/main.o.d ${OBJECTDIR}/_ext/504552675/audio.o.d ${OBJECTDIR}/_ext/505294835/board.o.d ${OBJECTDIR}/_ext/505294835/config_bits.o.d ${OBJECTDIR}/_ext/1876839055/renderer.o.d ${OBJECTDIR}/_ext/2125438744/adc.o.d ${OBJECTDIR}/_ext/2125438744/spi.o.d ${OBJECTDIR}/_ext/1124241679/joystick.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1425171858/game.o ${OBJECTDIR}/_ext/1425171858/main.o ${OBJECTDIR}/_ext/504552675/audio.o ${OBJECTDIR}/_ext/505294835/board.o ${OBJECTDIR}/_ext/505294835/config_bits.o ${OBJECTDIR}/_ext/1876839055/renderer.o ${OBJECTDIR}/_ext/2125438744/adc.o ${OBJECTDIR}/_ext/2125438744/spi.o ${OBJECTDIR}/_ext/1124241679/joystick.o

# Source Files
SOURCEFILES=../code/app/game.c ../code/app/main.c ../code/audio/audio.c ../code/board/board.c ../code/board/config_bits.c ../code/display/renderer.c ../code/drivers/adc.c ../code/drivers/spi.c ../code/joystick/joystick.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/SpaceDuel24.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ64GA002
MP_LINKER_FILE_OPTION=,--script=p24FJ64GA002.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1425171858/game.o: ../code/app/game.c  .generated_files/flags/default/7cb4d602e7158da5d8842f1cd3a1bc59ee339dda .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1425171858" 
	@${RM} ${OBJECTDIR}/_ext/1425171858/game.o.d 
	@${RM} ${OBJECTDIR}/_ext/1425171858/game.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../code/app/game.c  -o ${OBJECTDIR}/_ext/1425171858/game.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1425171858/game.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1425171858/main.o: ../code/app/main.c  .generated_files/flags/default/3d9e5f33fc18622bfd7425ded6e525ced49d281d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1425171858" 
	@${RM} ${OBJECTDIR}/_ext/1425171858/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1425171858/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../code/app/main.c  -o ${OBJECTDIR}/_ext/1425171858/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1425171858/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/504552675/audio.o: ../code/audio/audio.c  .generated_files/flags/default/142d4a13119e4541e718b2cecfc317a1b1c24219 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/504552675" 
	@${RM} ${OBJECTDIR}/_ext/504552675/audio.o.d 
	@${RM} ${OBJECTDIR}/_ext/504552675/audio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../code/audio/audio.c  -o ${OBJECTDIR}/_ext/504552675/audio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/504552675/audio.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/505294835/board.o: ../code/board/board.c  .generated_files/flags/default/caa8235a0adbf057d77334cde03b84c4ab91a475 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/505294835" 
	@${RM} ${OBJECTDIR}/_ext/505294835/board.o.d 
	@${RM} ${OBJECTDIR}/_ext/505294835/board.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../code/board/board.c  -o ${OBJECTDIR}/_ext/505294835/board.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/505294835/board.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/505294835/config_bits.o: ../code/board/config_bits.c  .generated_files/flags/default/8c7734c118b8178a44799a1514bec5b7940744c1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/505294835" 
	@${RM} ${OBJECTDIR}/_ext/505294835/config_bits.o.d 
	@${RM} ${OBJECTDIR}/_ext/505294835/config_bits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../code/board/config_bits.c  -o ${OBJECTDIR}/_ext/505294835/config_bits.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/505294835/config_bits.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1876839055/renderer.o: ../code/display/renderer.c  .generated_files/flags/default/9fc35c924651d20c23a988a0739882bdbac109d1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1876839055" 
	@${RM} ${OBJECTDIR}/_ext/1876839055/renderer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1876839055/renderer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../code/display/renderer.c  -o ${OBJECTDIR}/_ext/1876839055/renderer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1876839055/renderer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/2125438744/adc.o: ../code/drivers/adc.c  .generated_files/flags/default/a0536020d7f0d2f807eea6c9d34075c0a9666f0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2125438744" 
	@${RM} ${OBJECTDIR}/_ext/2125438744/adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/2125438744/adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../code/drivers/adc.c  -o ${OBJECTDIR}/_ext/2125438744/adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/2125438744/adc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/2125438744/spi.o: ../code/drivers/spi.c  .generated_files/flags/default/77118cd5bb59b4cb562e2e14cbf324f82ab80d3d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2125438744" 
	@${RM} ${OBJECTDIR}/_ext/2125438744/spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/2125438744/spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../code/drivers/spi.c  -o ${OBJECTDIR}/_ext/2125438744/spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/2125438744/spi.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1124241679/joystick.o: ../code/joystick/joystick.c  .generated_files/flags/default/fc79f934d38126b5d7b1a391c16c3bde77fcb4b0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1124241679" 
	@${RM} ${OBJECTDIR}/_ext/1124241679/joystick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1124241679/joystick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../code/joystick/joystick.c  -o ${OBJECTDIR}/_ext/1124241679/joystick.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1124241679/joystick.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/_ext/1425171858/game.o: ../code/app/game.c  .generated_files/flags/default/6f3efb254b228f2a41a3787f917ffed4f3497a1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1425171858" 
	@${RM} ${OBJECTDIR}/_ext/1425171858/game.o.d 
	@${RM} ${OBJECTDIR}/_ext/1425171858/game.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../code/app/game.c  -o ${OBJECTDIR}/_ext/1425171858/game.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1425171858/game.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1425171858/main.o: ../code/app/main.c  .generated_files/flags/default/284f009c80fd8a3609a275cf03bdb78b9818ce9c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1425171858" 
	@${RM} ${OBJECTDIR}/_ext/1425171858/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1425171858/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../code/app/main.c  -o ${OBJECTDIR}/_ext/1425171858/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1425171858/main.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/504552675/audio.o: ../code/audio/audio.c  .generated_files/flags/default/251f4409b6c2d520a27e1aa244586b61067c58dc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/504552675" 
	@${RM} ${OBJECTDIR}/_ext/504552675/audio.o.d 
	@${RM} ${OBJECTDIR}/_ext/504552675/audio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../code/audio/audio.c  -o ${OBJECTDIR}/_ext/504552675/audio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/504552675/audio.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/505294835/board.o: ../code/board/board.c  .generated_files/flags/default/8b38b49f302e22753a12b115a5e51cf2e44c99aa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/505294835" 
	@${RM} ${OBJECTDIR}/_ext/505294835/board.o.d 
	@${RM} ${OBJECTDIR}/_ext/505294835/board.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../code/board/board.c  -o ${OBJECTDIR}/_ext/505294835/board.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/505294835/board.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/505294835/config_bits.o: ../code/board/config_bits.c  .generated_files/flags/default/504b52cd29610b1d0dd306b066cf640da86cd8c4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/505294835" 
	@${RM} ${OBJECTDIR}/_ext/505294835/config_bits.o.d 
	@${RM} ${OBJECTDIR}/_ext/505294835/config_bits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../code/board/config_bits.c  -o ${OBJECTDIR}/_ext/505294835/config_bits.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/505294835/config_bits.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1876839055/renderer.o: ../code/display/renderer.c  .generated_files/flags/default/a72dbe1f29a8effed655a0111cd11fbd63068698 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1876839055" 
	@${RM} ${OBJECTDIR}/_ext/1876839055/renderer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1876839055/renderer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../code/display/renderer.c  -o ${OBJECTDIR}/_ext/1876839055/renderer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1876839055/renderer.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/2125438744/adc.o: ../code/drivers/adc.c  .generated_files/flags/default/bc89a30c012add180c210afbf4748f8588a4c99 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2125438744" 
	@${RM} ${OBJECTDIR}/_ext/2125438744/adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/2125438744/adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../code/drivers/adc.c  -o ${OBJECTDIR}/_ext/2125438744/adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/2125438744/adc.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/2125438744/spi.o: ../code/drivers/spi.c  .generated_files/flags/default/c76329c4e6fe5e838f2807c6bc87be0dafaf78a8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2125438744" 
	@${RM} ${OBJECTDIR}/_ext/2125438744/spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/2125438744/spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../code/drivers/spi.c  -o ${OBJECTDIR}/_ext/2125438744/spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/2125438744/spi.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/1124241679/joystick.o: ../code/joystick/joystick.c  .generated_files/flags/default/3ea4d59fe3baf75345de7dd38d979e8c16d92b42 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1124241679" 
	@${RM} ${OBJECTDIR}/_ext/1124241679/joystick.o.d 
	@${RM} ${OBJECTDIR}/_ext/1124241679/joystick.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../code/joystick/joystick.c  -o ${OBJECTDIR}/_ext/1124241679/joystick.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1124241679/joystick.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/SpaceDuel24.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/SpaceDuel24.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/SpaceDuel24.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/SpaceDuel24.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex ${DISTDIR}/SpaceDuel24.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
