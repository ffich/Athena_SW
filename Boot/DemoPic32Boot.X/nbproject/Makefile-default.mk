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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/DemoPic32Boot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/DemoPic32Boot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../Source/c/00_Main/main.c ../Source/c/02_Drivers/lcd_driver.c ../Source/c/02_Drivers/nv_mem.c ../Source/c/03_Stacks/fsio.c ../Source/c/03_Stacks/usb_config.c ../Source/c/03_Stacks/usb_host.c ../Source/c/03_Stacks/usb_host_msd.c ../Source/c/03_Stacks/usb_host_msd_scsi.c ../Source/c/04_App/framework.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/606972249/main.o ${OBJECTDIR}/_ext/1271540639/lcd_driver.o ${OBJECTDIR}/_ext/1271540639/nv_mem.o ${OBJECTDIR}/_ext/1937761014/fsio.o ${OBJECTDIR}/_ext/1937761014/usb_config.o ${OBJECTDIR}/_ext/1937761014/usb_host.o ${OBJECTDIR}/_ext/1937761014/usb_host_msd.o ${OBJECTDIR}/_ext/1937761014/usb_host_msd_scsi.o ${OBJECTDIR}/_ext/538292599/framework.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/606972249/main.o.d ${OBJECTDIR}/_ext/1271540639/lcd_driver.o.d ${OBJECTDIR}/_ext/1271540639/nv_mem.o.d ${OBJECTDIR}/_ext/1937761014/fsio.o.d ${OBJECTDIR}/_ext/1937761014/usb_config.o.d ${OBJECTDIR}/_ext/1937761014/usb_host.o.d ${OBJECTDIR}/_ext/1937761014/usb_host_msd.o.d ${OBJECTDIR}/_ext/1937761014/usb_host_msd_scsi.o.d ${OBJECTDIR}/_ext/538292599/framework.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/606972249/main.o ${OBJECTDIR}/_ext/1271540639/lcd_driver.o ${OBJECTDIR}/_ext/1271540639/nv_mem.o ${OBJECTDIR}/_ext/1937761014/fsio.o ${OBJECTDIR}/_ext/1937761014/usb_config.o ${OBJECTDIR}/_ext/1937761014/usb_host.o ${OBJECTDIR}/_ext/1937761014/usb_host_msd.o ${OBJECTDIR}/_ext/1937761014/usb_host_msd_scsi.o ${OBJECTDIR}/_ext/538292599/framework.o

# Source Files
SOURCEFILES=../Source/c/00_Main/main.c ../Source/c/02_Drivers/lcd_driver.c ../Source/c/02_Drivers/nv_mem.c ../Source/c/03_Stacks/fsio.c ../Source/c/03_Stacks/usb_config.c ../Source/c/03_Stacks/usb_host.c ../Source/c/03_Stacks/usb_host_msd.c ../Source/c/03_Stacks/usb_host_msd_scsi.c ../Source/c/04_App/framework.c



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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/DemoPic32Boot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX795F512L
MP_LINKER_FILE_OPTION=,--script="..\Source\_Linker\btl_32MX795F512L_generic.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/606972249/main.o: ../Source/c/00_Main/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/606972249" 
	@${RM} ${OBJECTDIR}/_ext/606972249/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/606972249/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/606972249/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DTRANSPORT_LAYER_USB_HOST -DDEMO_BOARD_ETH_STARTER_KIT -I"../Source/h/01_Bsp" -I"../Source/h/02_Drivers" -I"../Source/h/03_Stacks" -I"../Source/h/04_App" -MMD -MF "${OBJECTDIR}/_ext/606972249/main.o.d" -o ${OBJECTDIR}/_ext/606972249/main.o ../Source/c/00_Main/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1271540639/lcd_driver.o: ../Source/c/02_Drivers/lcd_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1271540639" 
	@${RM} ${OBJECTDIR}/_ext/1271540639/lcd_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1271540639/lcd_driver.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1271540639/lcd_driver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DTRANSPORT_LAYER_USB_HOST -DDEMO_BOARD_ETH_STARTER_KIT -I"../Source/h/01_Bsp" -I"../Source/h/02_Drivers" -I"../Source/h/03_Stacks" -I"../Source/h/04_App" -MMD -MF "${OBJECTDIR}/_ext/1271540639/lcd_driver.o.d" -o ${OBJECTDIR}/_ext/1271540639/lcd_driver.o ../Source/c/02_Drivers/lcd_driver.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1271540639/nv_mem.o: ../Source/c/02_Drivers/nv_mem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1271540639" 
	@${RM} ${OBJECTDIR}/_ext/1271540639/nv_mem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1271540639/nv_mem.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1271540639/nv_mem.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DTRANSPORT_LAYER_USB_HOST -DDEMO_BOARD_ETH_STARTER_KIT -I"../Source/h/01_Bsp" -I"../Source/h/02_Drivers" -I"../Source/h/03_Stacks" -I"../Source/h/04_App" -MMD -MF "${OBJECTDIR}/_ext/1271540639/nv_mem.o.d" -o ${OBJECTDIR}/_ext/1271540639/nv_mem.o ../Source/c/02_Drivers/nv_mem.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1937761014/fsio.o: ../Source/c/03_Stacks/fsio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1937761014" 
	@${RM} ${OBJECTDIR}/_ext/1937761014/fsio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1937761014/fsio.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1937761014/fsio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DTRANSPORT_LAYER_USB_HOST -DDEMO_BOARD_ETH_STARTER_KIT -I"../Source/h/01_Bsp" -I"../Source/h/02_Drivers" -I"../Source/h/03_Stacks" -I"../Source/h/04_App" -MMD -MF "${OBJECTDIR}/_ext/1937761014/fsio.o.d" -o ${OBJECTDIR}/_ext/1937761014/fsio.o ../Source/c/03_Stacks/fsio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1937761014/usb_config.o: ../Source/c/03_Stacks/usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1937761014" 
	@${RM} ${OBJECTDIR}/_ext/1937761014/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1937761014/usb_config.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1937761014/usb_config.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DTRANSPORT_LAYER_USB_HOST -DDEMO_BOARD_ETH_STARTER_KIT -I"../Source/h/01_Bsp" -I"../Source/h/02_Drivers" -I"../Source/h/03_Stacks" -I"../Source/h/04_App" -MMD -MF "${OBJECTDIR}/_ext/1937761014/usb_config.o.d" -o ${OBJECTDIR}/_ext/1937761014/usb_config.o ../Source/c/03_Stacks/usb_config.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1937761014/usb_host.o: ../Source/c/03_Stacks/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1937761014" 
	@${RM} ${OBJECTDIR}/_ext/1937761014/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/1937761014/usb_host.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1937761014/usb_host.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DTRANSPORT_LAYER_USB_HOST -DDEMO_BOARD_ETH_STARTER_KIT -I"../Source/h/01_Bsp" -I"../Source/h/02_Drivers" -I"../Source/h/03_Stacks" -I"../Source/h/04_App" -MMD -MF "${OBJECTDIR}/_ext/1937761014/usb_host.o.d" -o ${OBJECTDIR}/_ext/1937761014/usb_host.o ../Source/c/03_Stacks/usb_host.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1937761014/usb_host_msd.o: ../Source/c/03_Stacks/usb_host_msd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1937761014" 
	@${RM} ${OBJECTDIR}/_ext/1937761014/usb_host_msd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1937761014/usb_host_msd.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1937761014/usb_host_msd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DTRANSPORT_LAYER_USB_HOST -DDEMO_BOARD_ETH_STARTER_KIT -I"../Source/h/01_Bsp" -I"../Source/h/02_Drivers" -I"../Source/h/03_Stacks" -I"../Source/h/04_App" -MMD -MF "${OBJECTDIR}/_ext/1937761014/usb_host_msd.o.d" -o ${OBJECTDIR}/_ext/1937761014/usb_host_msd.o ../Source/c/03_Stacks/usb_host_msd.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1937761014/usb_host_msd_scsi.o: ../Source/c/03_Stacks/usb_host_msd_scsi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1937761014" 
	@${RM} ${OBJECTDIR}/_ext/1937761014/usb_host_msd_scsi.o.d 
	@${RM} ${OBJECTDIR}/_ext/1937761014/usb_host_msd_scsi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1937761014/usb_host_msd_scsi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DTRANSPORT_LAYER_USB_HOST -DDEMO_BOARD_ETH_STARTER_KIT -I"../Source/h/01_Bsp" -I"../Source/h/02_Drivers" -I"../Source/h/03_Stacks" -I"../Source/h/04_App" -MMD -MF "${OBJECTDIR}/_ext/1937761014/usb_host_msd_scsi.o.d" -o ${OBJECTDIR}/_ext/1937761014/usb_host_msd_scsi.o ../Source/c/03_Stacks/usb_host_msd_scsi.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/538292599/framework.o: ../Source/c/04_App/framework.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/538292599" 
	@${RM} ${OBJECTDIR}/_ext/538292599/framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/538292599/framework.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/538292599/framework.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DTRANSPORT_LAYER_USB_HOST -DDEMO_BOARD_ETH_STARTER_KIT -I"../Source/h/01_Bsp" -I"../Source/h/02_Drivers" -I"../Source/h/03_Stacks" -I"../Source/h/04_App" -MMD -MF "${OBJECTDIR}/_ext/538292599/framework.o.d" -o ${OBJECTDIR}/_ext/538292599/framework.o ../Source/c/04_App/framework.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
else
${OBJECTDIR}/_ext/606972249/main.o: ../Source/c/00_Main/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/606972249" 
	@${RM} ${OBJECTDIR}/_ext/606972249/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/606972249/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/606972249/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DTRANSPORT_LAYER_USB_HOST -DDEMO_BOARD_ETH_STARTER_KIT -I"../Source/h/01_Bsp" -I"../Source/h/02_Drivers" -I"../Source/h/03_Stacks" -I"../Source/h/04_App" -MMD -MF "${OBJECTDIR}/_ext/606972249/main.o.d" -o ${OBJECTDIR}/_ext/606972249/main.o ../Source/c/00_Main/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1271540639/lcd_driver.o: ../Source/c/02_Drivers/lcd_driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1271540639" 
	@${RM} ${OBJECTDIR}/_ext/1271540639/lcd_driver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1271540639/lcd_driver.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1271540639/lcd_driver.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DTRANSPORT_LAYER_USB_HOST -DDEMO_BOARD_ETH_STARTER_KIT -I"../Source/h/01_Bsp" -I"../Source/h/02_Drivers" -I"../Source/h/03_Stacks" -I"../Source/h/04_App" -MMD -MF "${OBJECTDIR}/_ext/1271540639/lcd_driver.o.d" -o ${OBJECTDIR}/_ext/1271540639/lcd_driver.o ../Source/c/02_Drivers/lcd_driver.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1271540639/nv_mem.o: ../Source/c/02_Drivers/nv_mem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1271540639" 
	@${RM} ${OBJECTDIR}/_ext/1271540639/nv_mem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1271540639/nv_mem.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1271540639/nv_mem.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DTRANSPORT_LAYER_USB_HOST -DDEMO_BOARD_ETH_STARTER_KIT -I"../Source/h/01_Bsp" -I"../Source/h/02_Drivers" -I"../Source/h/03_Stacks" -I"../Source/h/04_App" -MMD -MF "${OBJECTDIR}/_ext/1271540639/nv_mem.o.d" -o ${OBJECTDIR}/_ext/1271540639/nv_mem.o ../Source/c/02_Drivers/nv_mem.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1937761014/fsio.o: ../Source/c/03_Stacks/fsio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1937761014" 
	@${RM} ${OBJECTDIR}/_ext/1937761014/fsio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1937761014/fsio.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1937761014/fsio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DTRANSPORT_LAYER_USB_HOST -DDEMO_BOARD_ETH_STARTER_KIT -I"../Source/h/01_Bsp" -I"../Source/h/02_Drivers" -I"../Source/h/03_Stacks" -I"../Source/h/04_App" -MMD -MF "${OBJECTDIR}/_ext/1937761014/fsio.o.d" -o ${OBJECTDIR}/_ext/1937761014/fsio.o ../Source/c/03_Stacks/fsio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1937761014/usb_config.o: ../Source/c/03_Stacks/usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1937761014" 
	@${RM} ${OBJECTDIR}/_ext/1937761014/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1937761014/usb_config.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1937761014/usb_config.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DTRANSPORT_LAYER_USB_HOST -DDEMO_BOARD_ETH_STARTER_KIT -I"../Source/h/01_Bsp" -I"../Source/h/02_Drivers" -I"../Source/h/03_Stacks" -I"../Source/h/04_App" -MMD -MF "${OBJECTDIR}/_ext/1937761014/usb_config.o.d" -o ${OBJECTDIR}/_ext/1937761014/usb_config.o ../Source/c/03_Stacks/usb_config.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1937761014/usb_host.o: ../Source/c/03_Stacks/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1937761014" 
	@${RM} ${OBJECTDIR}/_ext/1937761014/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/1937761014/usb_host.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1937761014/usb_host.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DTRANSPORT_LAYER_USB_HOST -DDEMO_BOARD_ETH_STARTER_KIT -I"../Source/h/01_Bsp" -I"../Source/h/02_Drivers" -I"../Source/h/03_Stacks" -I"../Source/h/04_App" -MMD -MF "${OBJECTDIR}/_ext/1937761014/usb_host.o.d" -o ${OBJECTDIR}/_ext/1937761014/usb_host.o ../Source/c/03_Stacks/usb_host.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1937761014/usb_host_msd.o: ../Source/c/03_Stacks/usb_host_msd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1937761014" 
	@${RM} ${OBJECTDIR}/_ext/1937761014/usb_host_msd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1937761014/usb_host_msd.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1937761014/usb_host_msd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DTRANSPORT_LAYER_USB_HOST -DDEMO_BOARD_ETH_STARTER_KIT -I"../Source/h/01_Bsp" -I"../Source/h/02_Drivers" -I"../Source/h/03_Stacks" -I"../Source/h/04_App" -MMD -MF "${OBJECTDIR}/_ext/1937761014/usb_host_msd.o.d" -o ${OBJECTDIR}/_ext/1937761014/usb_host_msd.o ../Source/c/03_Stacks/usb_host_msd.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/1937761014/usb_host_msd_scsi.o: ../Source/c/03_Stacks/usb_host_msd_scsi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1937761014" 
	@${RM} ${OBJECTDIR}/_ext/1937761014/usb_host_msd_scsi.o.d 
	@${RM} ${OBJECTDIR}/_ext/1937761014/usb_host_msd_scsi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1937761014/usb_host_msd_scsi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DTRANSPORT_LAYER_USB_HOST -DDEMO_BOARD_ETH_STARTER_KIT -I"../Source/h/01_Bsp" -I"../Source/h/02_Drivers" -I"../Source/h/03_Stacks" -I"../Source/h/04_App" -MMD -MF "${OBJECTDIR}/_ext/1937761014/usb_host_msd_scsi.o.d" -o ${OBJECTDIR}/_ext/1937761014/usb_host_msd_scsi.o ../Source/c/03_Stacks/usb_host_msd_scsi.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
${OBJECTDIR}/_ext/538292599/framework.o: ../Source/c/04_App/framework.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/538292599" 
	@${RM} ${OBJECTDIR}/_ext/538292599/framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/538292599/framework.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/538292599/framework.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -D_SUPPRESS_PLIB_WARNING -DTRANSPORT_LAYER_USB_HOST -DDEMO_BOARD_ETH_STARTER_KIT -I"../Source/h/01_Bsp" -I"../Source/h/02_Drivers" -I"../Source/h/03_Stacks" -I"../Source/h/04_App" -MMD -MF "${OBJECTDIR}/_ext/538292599/framework.o.d" -o ${OBJECTDIR}/_ext/538292599/framework.o ../Source/c/04_App/framework.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/DemoPic32Boot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../Source/_Linker/btl_32MX795F512L_generic.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/DemoPic32Boot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,--defsym=_min_heap_size=10000,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map" 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/DemoPic32Boot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../Source/_Linker/btl_32MX795F512L_generic.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/DemoPic32Boot.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=10000,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map" 
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/DemoPic32Boot.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
