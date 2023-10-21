/************************************************************************
*                               Test Task                               *
*************************************************************************
* FileName:         test_task.h                                         *
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
* F.Ficili     13/09/15   1.0          First release			*
************************************************************************/

#ifndef TEST_TASK_H
#define	TEST_TASK_H

/************************************************************************
* Includes
************************************************************************/
#include "xc.h"
#include "scheduler.h"

/************************************************************************
* Defines
************************************************************************/
/* Task period in ms */
#define TEST_TASK_PERIOD_MS                      ((UINT16)(100)/SCHEDULER_PERIOD_MS)

/************************************************************************
* Global Variables
************************************************************************/
extern UINT8 ADC_AdcResPerc;

/************************************************************************
* Typedef
************************************************************************/


/************************************************************************
* Function
************************************************************************/
/* Test task */
void TestTask (void);

#endif	/* TEST_TASK_H */

