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
FINAL_IMAGE=${DISTDIR}/sando168_ADC.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/sando168_ADC.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS
SUB_IMAGE_ADDRESS_COMMAND=--image-address $(SUB_IMAGE_ADDRESS)
else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED="../../OneDrive/Desktop/Class/Senior Year/Semester 1/EE 3951W/lab_6/adcLib.c" "../../OneDrive/Desktop/Class/Senior Year/Semester 1/EE 3951W/lab_6/displayLCD.c" "../../OneDrive/Desktop/Class/Senior Year/Semester 1/EE 3951W/lab_6/sando_lab6_core.c"

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/956707321/adcLib.o ${OBJECTDIR}/_ext/956707321/displayLCD.o ${OBJECTDIR}/_ext/956707321/sando_lab6_core.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/956707321/adcLib.o.d ${OBJECTDIR}/_ext/956707321/displayLCD.o.d ${OBJECTDIR}/_ext/956707321/sando_lab6_core.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/956707321/adcLib.o ${OBJECTDIR}/_ext/956707321/displayLCD.o ${OBJECTDIR}/_ext/956707321/sando_lab6_core.o

# Source Files
SOURCEFILES=../../OneDrive/Desktop/Class/Senior Year/Semester 1/EE 3951W/lab_6/adcLib.c ../../OneDrive/Desktop/Class/Senior Year/Semester 1/EE 3951W/lab_6/displayLCD.c ../../OneDrive/Desktop/Class/Senior Year/Semester 1/EE 3951W/lab_6/sando_lab6_core.c



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
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/sando168_ADC.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ32GA002
MP_LINKER_FILE_OPTION=,--script=p24FJ32GA002.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/956707321/adcLib.o: ../../OneDrive/Desktop/Class/Senior\ Year/Semester\ 1/EE\ 3951W/lab_6/adcLib.c  .generated_files/flags/default/97b47a97ba07d1be7906e47b362f2da8f6701616 .generated_files/flags/default/3a60306d929cd76682dbf87396049a279970adbd
	@${MKDIR} "${OBJECTDIR}/_ext/956707321" 
	@${RM} ${OBJECTDIR}/_ext/956707321/adcLib.o.d 
	@${RM} ${OBJECTDIR}/_ext/956707321/adcLib.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../../OneDrive/Desktop/Class/Senior Year/Semester 1/EE 3951W/lab_6/adcLib.c"  -o ${OBJECTDIR}/_ext/956707321/adcLib.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/956707321/adcLib.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/956707321/displayLCD.o: ../../OneDrive/Desktop/Class/Senior\ Year/Semester\ 1/EE\ 3951W/lab_6/displayLCD.c  .generated_files/flags/default/9de45cc5ce0ab8189336d60f5c2cd7fff0331a8e .generated_files/flags/default/3a60306d929cd76682dbf87396049a279970adbd
	@${MKDIR} "${OBJECTDIR}/_ext/956707321" 
	@${RM} ${OBJECTDIR}/_ext/956707321/displayLCD.o.d 
	@${RM} ${OBJECTDIR}/_ext/956707321/displayLCD.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../../OneDrive/Desktop/Class/Senior Year/Semester 1/EE 3951W/lab_6/displayLCD.c"  -o ${OBJECTDIR}/_ext/956707321/displayLCD.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/956707321/displayLCD.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/956707321/sando_lab6_core.o: ../../OneDrive/Desktop/Class/Senior\ Year/Semester\ 1/EE\ 3951W/lab_6/sando_lab6_core.c  .generated_files/flags/default/6be423467890fa278762e0e28daee3f363d308a3 .generated_files/flags/default/3a60306d929cd76682dbf87396049a279970adbd
	@${MKDIR} "${OBJECTDIR}/_ext/956707321" 
	@${RM} ${OBJECTDIR}/_ext/956707321/sando_lab6_core.o.d 
	@${RM} ${OBJECTDIR}/_ext/956707321/sando_lab6_core.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../../OneDrive/Desktop/Class/Senior Year/Semester 1/EE 3951W/lab_6/sando_lab6_core.c"  -o ${OBJECTDIR}/_ext/956707321/sando_lab6_core.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/956707321/sando_lab6_core.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/_ext/956707321/adcLib.o: ../../OneDrive/Desktop/Class/Senior\ Year/Semester\ 1/EE\ 3951W/lab_6/adcLib.c  .generated_files/flags/default/6544c4685cff031100e74dbf6d920ea4908b13c0 .generated_files/flags/default/3a60306d929cd76682dbf87396049a279970adbd
	@${MKDIR} "${OBJECTDIR}/_ext/956707321" 
	@${RM} ${OBJECTDIR}/_ext/956707321/adcLib.o.d 
	@${RM} ${OBJECTDIR}/_ext/956707321/adcLib.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../../OneDrive/Desktop/Class/Senior Year/Semester 1/EE 3951W/lab_6/adcLib.c"  -o ${OBJECTDIR}/_ext/956707321/adcLib.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/956707321/adcLib.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/956707321/displayLCD.o: ../../OneDrive/Desktop/Class/Senior\ Year/Semester\ 1/EE\ 3951W/lab_6/displayLCD.c  .generated_files/flags/default/66748bf371e36db81abd42b9a7f8527ec9d0ae20 .generated_files/flags/default/3a60306d929cd76682dbf87396049a279970adbd
	@${MKDIR} "${OBJECTDIR}/_ext/956707321" 
	@${RM} ${OBJECTDIR}/_ext/956707321/displayLCD.o.d 
	@${RM} ${OBJECTDIR}/_ext/956707321/displayLCD.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../../OneDrive/Desktop/Class/Senior Year/Semester 1/EE 3951W/lab_6/displayLCD.c"  -o ${OBJECTDIR}/_ext/956707321/displayLCD.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/956707321/displayLCD.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/_ext/956707321/sando_lab6_core.o: ../../OneDrive/Desktop/Class/Senior\ Year/Semester\ 1/EE\ 3951W/lab_6/sando_lab6_core.c  .generated_files/flags/default/f2fda092f6e3d120ca23a330dc88cdb0bedccfa9 .generated_files/flags/default/3a60306d929cd76682dbf87396049a279970adbd
	@${MKDIR} "${OBJECTDIR}/_ext/956707321" 
	@${RM} ${OBJECTDIR}/_ext/956707321/sando_lab6_core.o.d 
	@${RM} ${OBJECTDIR}/_ext/956707321/sando_lab6_core.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../../OneDrive/Desktop/Class/Senior Year/Semester 1/EE 3951W/lab_6/sando_lab6_core.c"  -o ${OBJECTDIR}/_ext/956707321/sando_lab6_core.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/956707321/sando_lab6_core.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
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
${DISTDIR}/sando168_ADC.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/sando168_ADC.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/sando168_ADC.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/sando168_ADC.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex ${DISTDIR}/sando168_ADC.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
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

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
