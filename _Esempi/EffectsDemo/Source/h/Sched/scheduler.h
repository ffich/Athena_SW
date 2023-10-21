/************************************************************************
*                               Scheduler				*
*************************************************************************
* FileName:         Scheduler.h                                         *
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

#ifndef _SCHEDULER_
#define _SCHEDULER_

/************************************************************************
* Includes
************************************************************************/
#include "xc.h"
#include <p32xxxx.h>
#include "common.h"
#include "hw_profile.h"
#include <plib.h>
#include <GenericTypeDefs.h>

/************************************************************************
* Defines
************************************************************************/
/* Possible choiches for scheduler period */
#define MILLISECOND_1000_MS			((UINT16)(1000))
#define MILLISECOND_500_MS                      ((UINT16)(500))
#define MILLISECOND_100_MS			((UINT16)(100))
#define MILLISECOND_10_MS			((UINT16)(10))
#define MILLISECOND_1_MS			((UINT16)(1))

/* Scheduler period */
#define SCHEDULER_PERIOD_MS                     MILLISECOND_1_MS

/* Event Options */
#define NO_MASK                                 ((UINT8)(0))
#define MASK_RECEIVE                            ((UINT8)(1))
#define MASK_GENERATE                           ((UINT8)(2))
#define MASK_ALL                                ((UINT8)(3))

/************************************************************************
* Typedef
************************************************************************/
/* Main system timebase flag type */
typedef enum MainSystemTimebaseEnum
{
    CallTaskPhase,
    WaitTriggerPhase,
} MainSystemTimebaseType;

/* Main system state type */
typedef enum SystemStateEnum
{
    InitializationState,
    RunningState
} SystemStateType;

/* Event Status */
typedef enum EventStatusEnum
{
    EventIdle,
    EventReceived,
    EventSent,
    EventNotSent,
} EventStatusType;

/* Event Structure */
typedef struct EventStructure
{
    UINT8 EventOptions;
    EventStatusType EventStatus;
} EventStructureType;

/************************************************************************
* Imports
************************************************************************/
/* -- Import your modules here -- */

/* System module */
#include "system_init.h"

/* Drivers */
#include "joystick_driver.h"
#include "lcd_driver.h"
#include "uart_driver.h"
#include "i2c_driver.h"
#include "adc_driver.h"

/* Tasks */
#include "app_task.h"
#include "led_task.h"
#include "mcp23008_task.h"
#include "adc_task.h"
#include "tcpip_task.h"
#include "usb_task.h"
#include "com_task.h"
#include "test_task.h"

/************************************************************************
* Global Variables
************************************************************************/
/* Main system timebase flag */
extern MainSystemTimebaseType MainSystemTimebaseFlag;
/* System state */
extern SystemStateType SystemState;

/************************************************************************
* Main Function
************************************************************************/
/* System main scheduler */
void MainScheduler (void);

/************************************************************************
* Events Function
************************************************************************/
/* Generate events */
EventStatusType GenerateEvt (EventStructureType *Event);
/* Receive events */
EventStatusType ReceiveEvt (EventStructureType *Event);
/* Mask reception of a particular event */
void MaskEvtRec (EventStructureType *Event);
/* Mask send of a particular event */
void MaskEvtSend (EventStructureType *Event);
/* Mask a particular event */
void MaskEvt (EventStructureType *Event);
/* Unmask a particular event */
void UnmaskEvt (EventStructureType *Event);

#endif