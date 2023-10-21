/************************************************************************
*                               Com Task                                *
*************************************************************************
* FileName:         com_task.h                                          *
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
* F.Ficili     16/09/15   1.0          First release			*
************************************************************************/

#ifndef COM_TASK_H
#define	COM_TASK_H

/************************************************************************
* Includes
************************************************************************/
#include "xc.h"
#include "scheduler.h"
#include "uart_driver.h"

/************************************************************************
* Defines
************************************************************************/
/* Task period in ms */
#define COM_TASK_PERIOD_MS                                  ((UINT16)(10)/SCHEDULER_PERIOD_MS)

#define COM_TAS_DELAY_MS                                    (((UINT16)(1000)/COM_TASK_PERIOD_MS)/SCHEDULER_PERIOD_MS)

#define COM_LEDS_ALL_OFF                                    ((UINT8)(0x31))
#define COM_LED_1_ON_2_OFF                                  ((UINT8)(0x32))
#define COM_LED_1_OFF_2_ON                                  ((UINT8)(0x33))
#define COM_LED_1_ON_2_ON                                   ((UINT8)(0x34))

/************************************************************************
* Typedef
************************************************************************/
/* Com state type */
typedef enum _ComState
{
   ComIn,
   ComSendUartMsg,
   ComWait,   
} ComStateType;

/************************************************************************
* Global Variables
************************************************************************/
/* Activation/deactivation events */
extern EventStructureType ActivateComTask;
extern EventStructureType DeactivateComTask;

/************************************************************************
* Function
************************************************************************/
/* Com task */
void ComTask (void);

#endif	/* COM_TASK_H */

