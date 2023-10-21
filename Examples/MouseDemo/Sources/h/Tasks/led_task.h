/************************************************************************
*                               Led Task                                *
*************************************************************************
* FileName:         led_task.h                                          *
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
* F.Ficili     28/02/15   1.0          First release			*
************************************************************************/

#ifndef LED_TASK_H
#define	LED_TASK_H

/************************************************************************
* Includes
************************************************************************/
#include "xc.h"
#include "scheduler.h"

/************************************************************************
* Defines
************************************************************************/
/* Task period in ms */
#define LED_TASK_PERIOD_MS                      ((UINT16)(10)/SCHEDULER_PERIOD_MS)
/* Blink period in ms */
#define LED_1_BLINK_PERIOD_MS                   ((UINT16)(500)/LED_TASK_PERIOD_MS)/(SCHEDULER_PERIOD_MS)
#define LED_2_BLINK_OFF_PERIOD_MS               ((UINT16)(950)/LED_TASK_PERIOD_MS)/(SCHEDULER_PERIOD_MS)
#define LED_2_BLINK_ON_PERIOD_MS                ((UINT16)(50)/LED_TASK_PERIOD_MS)/(SCHEDULER_PERIOD_MS)

/************************************************************************
* Global Variables
************************************************************************/

/************************************************************************
* Typedef
************************************************************************/
/* LED output state */
typedef enum LedOutEnum
{
    OffState,
    OnState
} LedOutType;

typedef enum LedBlinkSm1En
{
    WaitState,
    ToggleState,
} LedBlinkSm1Type;

/* LED blink 2 state enum */
typedef enum LedBlinkSm2En
{
    WaitStateL2,
    OnStateL2,
    OffStateL2,
} LedBlinkSm2Type;


/************************************************************************
* Function
************************************************************************/
/* Led task */
void LedTask (void);

#endif	/* LED_TASK_H */

