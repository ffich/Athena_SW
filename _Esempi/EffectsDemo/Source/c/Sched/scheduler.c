/************************************************************************
*                               Scheduler				*
*************************************************************************
* FileName:         Scheduler.c                                         *
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

/************************************************************************
* Includes
************************************************************************/
#include "scheduler.h"

/************************************************************************
* Defines
************************************************************************/
#define FOREVER                                         ((UINT8)(1))

/************************************************************************
* Global Variables
************************************************************************/
/* Main system timebase */
MainSystemTimebaseType MainSystemTimebaseFlag = WaitTriggerPhase;
/* Main system state */
SystemStateType SystemState = InitializationState;

/************************************************************************
* Static Variables
************************************************************************/
/************************************************************************
* Note: Add a new task
* 1) Add the task function name in function pointer array TaskArray
* 2) Add the timeout in ms in TaskPeriodTimeoutMs
* 3) Initiaslize the counter at 0 in TaskPeriodCounterMs
* 4) Increment the #define ACTIVE_TASK_NUMBER by one unit
************************************************************************/
/* Maximum number of task */
#define ACTIVE_TASK_NUMBER                              ((UINT16)(2))

/* Array of task to call */
void (*TaskArray[ACTIVE_TASK_NUMBER]) (void) = 
{
    LedTask,    
    Mcp23008Task,
};

/* Array of task period timeouts */
UINT16 TaskPeriodTimeoutMs[ACTIVE_TASK_NUMBER] =
{
    LED_TASK_PERIOD_MS,
    MCP23008_TASK_PERIOD_MS,
};

/* Array of task periods */
static UINT16 TaskPeriodCounterMs[ACTIVE_TASK_NUMBER] =
{
    0,
    0,
};

/************************************************************************
* Local Prototypes
************************************************************************/
/* Service function for task initialization */
void InitializeTasks (void);
/* Service function for task scheduling */
void ScheduleTasks (void);

/************************************************************************
* Function Prototypes
************************************************************************/

/************************************************************************
* Function:     void MainScheduler (void)
* Input:        None
* Output:       None
* Author:	F.Ficili	
* Description:	Main system scheduler	       
* Date:		14/02/15
************************************************************************/
void MainScheduler (void)
{
   /* Initialize all Tasks */
   InitializeTasks();

   #ifdef USE_MEASURE_PIN
     TRISFbits.TRISF2 = 0;
   #endif

   /* Switch to running state */
   SystemState = RunningState;

   /* Infinite loop */
   while(FOREVER)
   {
       /* If the scheduler timer has expired */
       if (MainSystemTimebaseFlag == CallTaskPhase)
       {
           #ifdef USE_MEASURE_PIN
              PORTFbits.RF2 = !PORTFbits.RF2;
           #endif
           /* Start scheduling cycle */
           ScheduleTasks();
           /* Reset flag */
           MainSystemTimebaseFlag = WaitTriggerPhase;
       }
   }
}

/************************************************************************
* Function:     void InitializeTasks (void)
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Function used to initialize all tasks
* Date:         14/02/15
************************************************************************/
void InitializeTasks (void)
{
    /* Index of active task */
    UINT8 ActiveTaskIndex = 0;

    /* Call task if timeout is expired */
    for (ActiveTaskIndex = 0; ActiveTaskIndex < ACTIVE_TASK_NUMBER; ActiveTaskIndex++)
    {
        /* Initialize Task */
        TaskArray[ActiveTaskIndex]();
    }
}
/************************************************************************
* Function:     void ScheduleTasks (void)
* Input:        None
* Output:       None
* Author:	F.Ficili	
* Description:	Function used to call the task sequence with priority       
* Date:         14/02/15
************************************************************************/
void ScheduleTasks (void)
{
    /* Index of active task */
    UINT8 ActiveTaskIndex = 0;

    /* Call task if timeout is expired */
    for (ActiveTaskIndex = 0; ActiveTaskIndex < ACTIVE_TASK_NUMBER; ActiveTaskIndex++)
    {
        /* Increment task counters */
        TaskPeriodCounterMs[ActiveTaskIndex]++;

        /* Check the task timeout */
        if (TaskPeriodCounterMs[ActiveTaskIndex] >= TaskPeriodTimeoutMs[ActiveTaskIndex])
        {
            /* Reset task counter */
            TaskPeriodCounterMs[ActiveTaskIndex] = 0;
            /* Call Task */
            TaskArray[ActiveTaskIndex]();
        }
    }
}

/************************************************************************
* Function:     void GenerateEvt (EventStructureType *Event)
* Input:        EventStructureType *Event
* Output:       EventStatusType
* Author:	F.Ficili	
* Description:	Generate event      
* Date:		15/02/15
************************************************************************/
EventStatusType GenerateEvt (EventStructureType *Event)
{
    /* Event Status */
    EventStatusType EventStatus = EventIdle;

    if ((Event->EventOptions != MASK_GENERATE) && (Event->EventOptions != MASK_ALL))
    {
        /* Send the event */
        Event->EventStatus = EventSent;
        /* Update event status */
        EventStatus = EventSent;
    }
    else
    {
        /* Update event status */
        EventStatus = EventNotSent;
    }

    /* Return event status */
    return(EventStatus);
}
	
/************************************************************************
* Function:     void ReceiveEvt (EventStructureType *Event)
* Input:        EventStructureType *Event
* Output:       EventStatusType
* Author:	F.Ficili	
* Description:	Receive event      
* Date:		15/02/15
************************************************************************/
EventStatusType ReceiveEvt (EventStructureType *Event)
{
    /* Event Status */
    EventStatusType EventStatus = EventIdle;

    if ((Event->EventOptions != MASK_RECEIVE) && (Event->EventOptions != MASK_ALL))
    {
        /* Check event status */
        if (Event->EventStatus == EventSent)
        {
            /* The event is now received */
            Event->EventStatus = EventReceived;
            /* Update event status */
            EventStatus = EventReceived;
        }
        else
        {
            /* Update event status */
            EventStatus = EventIdle;
        }
    }

    /* Return event status */
    return(EventStatus);
}

/************************************************************************
* Function:     void MaskEvtRec (EventStructureType *Event)
* Input:        EventStructureType *Event
* Output:       void
* Author:	F.Ficili
* Description:	Mask reception of a particular event
* Date:		01/03/15
************************************************************************/
void MaskEvtRec (EventStructureType *Event)
{
    /* Mask event reception */
    Event->EventOptions = MASK_RECEIVE;
}

/************************************************************************
* Function:     void MaskEvtSend (EventStructureType *Event)
* Input:        EventStructureType *Event
* Output:       void
* Author:	F.Ficili
* Description:	Mask send of a particular event
* Date:		01/03/15
************************************************************************/
void MaskEvtSend (EventStructureType *Event)
{
    /* Mask event send */
    Event->EventOptions = MASK_GENERATE;
}

/************************************************************************
* Function:     void MaskEvt (EventStructureType *Event)
* Input:        EventStructureType *Event
* Output:       void
* Author:	F.Ficili
* Description:	Mask a particular event
* Date:		01/03/15
************************************************************************/
void MaskEvt (EventStructureType *Event)
{
    /* Mask event */
    Event->EventOptions = MASK_ALL;
}

/************************************************************************
* Function:     void UnmaskEvt (EventStructureType *Event)
* Input:        EventStructureType *Event
* Output:       void
* Author:	F.Ficili
* Description:	Unmask a particular event
* Date:		01/03/15
************************************************************************/
void UnmaskEvt (EventStructureType *Event)
{
    /* Mask event */
    Event->EventOptions = NO_MASK;
}