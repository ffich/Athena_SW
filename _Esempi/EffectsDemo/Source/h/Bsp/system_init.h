/************************************************************************
*                             System Init                               *
*************************************************************************
* FileName:         system_init.h                                       *
* Processor:        Pic32MX                                             *
* Compiler:         XC32                                                *
* Author:           F.Ficili                                            *
*									*
* Software License Agreement						*
*									*
* THIS SOFTWARE IS PROVIDED IN AN "AS IS" CONDITION. NO WARRANTIES,     *
* WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT NOT LIMITED     *
* TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A		*
* PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. THE AUTHOR SHALL NOT,	*
* IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL OR		*
* CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.			*
*									*
* --------------------------------------------------------------------- *
* Responsible For This File: Francesco Ficili				*
*									*
* --------------------------------------------------------------------- *
* Author       Date        Version      Comment                         *
* ---------------------------------------------------------------------	*
* F.Ficili     14/02/15    1.0          First release			*
************************************************************************/

#ifndef SYSTEM_INIT_H
#define	SYSTEM_INIT_H

/************************************************************************
* Includes
************************************************************************/
#include "xc.h"
#include "common.h"
#include "hw_profile.h"
#include "scheduler.h"

/************************************************************************
* Defines
************************************************************************/

//#define USE_BOOTLOADER

/* oscillator options */
#ifdef USE_BOOTLOADER
    #define SYSTEM_FREQUENCY_VALUE_HZ                   ((UINT32)(80000000))
#endif

#ifndef USE_BOOTLOADER
    #define SYSTEM_FREQUENCY_VALUE_HZ                   ((UINT32)(60000000))
#endif

#define PER_CLK_PRESCALER                           ((UINT32)(1))
#define PERIPHERAL_FREQUENCY_VALUE_HZ               (SYSTEM_FREQUENCY_VALUE_HZ/PER_CLK_PRESCALER)

/* timer options */
#define TMR_16_BIT_MODE                             ((UINT8)(0))
#define TMR_32_BIT_MODE                             ((UINT8)(1))
#define TMR_CS_PBCLK                                ((UINT8)(0))
#define TMR_PRESCALER_8                             ((UINT8)(3))
#define TMR_PRESCALER_VALUE                         ((UINT8)(8))

/* interrutp&timing options */
#define MATCH_CYCLES                                ((UINT32)(1000))
#define INT_MATCH_VALUE                             ((PERIPHERAL_FREQUENCY_VALUE_HZ/(UINT32)TMR_PRESCALER_VALUE)/MATCH_CYCLES)
#define T2_INT_DISABLE                              ((UINT8)(0))
#define T2_INT_ENABLE                               ((UINT8)(1))
#define T2_INT_PRIO_1                               ((UINT8)(1))
#define T2_INT_SUB_PRIO_0                           ((UINT8)(0))

/************************************************************************
* Global Variables
************************************************************************/

/************************************************************************
* Typedef
************************************************************************/

/************************************************************************
* Function
************************************************************************/
/* Initialization function */
void SystemInit (void);

#endif	/* SYSTEM_INIT_H */

