/************************************************************************
*                               Led Task                                *
*************************************************************************
* FileName:         led_task.h                                          *
* Processor:        Pic32MX                                             *
* Compiler:         XC32                                                *
* Author:           F.Ficili                                            *
*                                                                       *
* Software License Agreement                                            *
*                                                                       *
* THIS SOFTWARE IS PROVIDED IN AN "AS IS" CONDITION. NO WARRANTIES,     *
* WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT NOT LIMITED     *
* TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A           *
* PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. THE AUTHOR SHALL NOT,      *
* IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL OR            *
* CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.                     *
*                                                                       *
* --------------------------------------------------------------------- *
* Responsible For This File: Francesco Ficili                           *
*                                                                       *
* --------------------------------------------------------------------- *
* Author       Date        Version      Comment                         *
* ---------------------------------------------------------------------	*
* F.Ficili     28/02/15   1.0          First release                    *
************************************************************************/

#ifndef LED_TASK_H
#define	LED_TASK_H

/************************************************************************
* Includes
************************************************************************/
#include "xc.h"
#include "scheduler.h"
#include "led_driver.h"

/************************************************************************
* Defines
************************************************************************/
/* Task period in ms */
#define LED_TASK_PERIOD_MS                      ((UINT16)(50)/SCHEDULER_PERIOD_MS)

/* LEDs timing constants */
#define L1_RUNNING_OFF_TIME_MS			((UINT16)(900)/LED_TASK_PERIOD_MS/SCHEDULER_PERIOD_MS)
#define L1_RUNNING_ON_TIME_MS			((UINT16)(100)/LED_TASK_PERIOD_MS/SCHEDULER_PERIOD_MS)
#define L2_RUNNING_OFF_TIME_MS			((UINT16)(900)/LED_TASK_PERIOD_MS/SCHEDULER_PERIOD_MS)
#define L2_RUNNING_ON_TIME_MS			((UINT16)(100)/LED_TASK_PERIOD_MS/SCHEDULER_PERIOD_MS)

/* LED status constants */
#define LED_ON                                  LINE_STATE_HIGH
#define LED_OFF                                 LINE_STATE_LOW

/************************************************************************
* Global Variables
************************************************************************/
extern EventStructureType Led2On;
extern EventStructureType Led2Off;

/************************************************************************
* Typedef
************************************************************************/


/************************************************************************
* Function
************************************************************************/
/* Led task */
void LedTask (void);

#endif	/* LED_TASK_H */

