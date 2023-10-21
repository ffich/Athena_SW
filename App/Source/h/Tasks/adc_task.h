/************************************************************************
*                               Adc Task                                *
*************************************************************************
* FileName:         adc_task.h                                          *
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
* F.Ficili     11/04/15    1.0          First release                   *
************************************************************************/

#ifndef ADC_TASK_H
#define	ADC_TASK_H

/************************************************************************
* Includes
************************************************************************/
#include "xc.h"
#include "scheduler.h"


/************************************************************************
* Defines
************************************************************************/
/* Task period in ms */
#define ADC_TASK_PERIOD_MS                      ((UINT16)(100)/SCHEDULER_PERIOD_MS)
/* Delay */
#define ACQ_DELAY_MS                            ((UINT16)(2000)/ADC_TASK_PERIOD_MS)/(SCHEDULER_PERIOD_MS)


/************************************************************************
* Global Variables
************************************************************************/
/* Activation/deactivation events */
extern EventStructureType ActivateAdcTask;
extern EventStructureType DeactivateAdcTask;

/************************************************************************
* Typedef
************************************************************************/
/* Adc state machine states */
typedef enum AdcSmStateEnum
{
    WaitLogDelay,
    AcquireData,
    LogData,
} AdcSmStateType;

/* Adc state type */
typedef enum _AdcState
{
    AdcStartSamp,
    AdcStartConv,
    AdcCheckSampConv,
    AdcGetRes,
} AdcStateType;

/************************************************************************
* Function
************************************************************************/
/* Adc task */
void AdcTask (void);

#endif	/* ADC_TASK_H */

