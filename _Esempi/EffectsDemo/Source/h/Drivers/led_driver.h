/************************************************************************
*                               LED Driver                              *
*************************************************************************
* FileName:         led_driver.h                                        *
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
* Author       Date         Version      Comment                        *
* ---------------------------------------------------------------------	*
* F.Ficili     06/09/15     1.0          First release			*
************************************************************************/

#ifndef LED_DRIVER_H
#define	LED_DRIVER_H

/************************************************************************
* Includes
************************************************************************/
#include <xc.h>
#include "GenericTypeDefs.h"

/************************************************************************
* Defines
************************************************************************/


/************************************************************************
* Global Variables
************************************************************************/


/************************************************************************
* Typedef
************************************************************************/
/* LED blink state */
typedef enum LedBlinkSmEnum
{
    LedBlinkInit,
    LedBlinkRunning
} LedBlinkStateType;

/* LED output state */
typedef enum LedOutStateEnum
{
    OffState,
    OnState
} LedOutStateType;

/* LED output state */
typedef enum StateMachineCallEnum
{
    OnFirstCall,
    OnOtherCall,
} StateMachineCallType;

/* LED reset request enum */
typedef enum ResetRequestEnum
{
    Normal,
    ResetRequest
} ResetRequestType;

/* Led blick structure */
typedef struct LedBlinkStr
{
    LedBlinkStateType LedBlinkState;
    LedOutStateType LedOutState;
    UINT16 LedBlinkCounter;
    UINT16 LedOnTimeMs;
    UINT16 LedOffTimeMs;
} LedBlinkType;

/************************************************************************
* Function
************************************************************************/
UINT8 LedBlinkStateMachine (LedBlinkType *LedBlink, LedOutStateType LedInitStatus);

#endif	/* LED_DRIVER_H */

