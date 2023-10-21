
/************************************************************************
*                               Com Task                                *
*************************************************************************
* FileName:         com_task.c                                          *
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
* F.Ficili     16/09/15    1.0          First release                   *
************************************************************************/

/************************************************************************
* Includes
************************************************************************/
#include "com_task.h"


/************************************************************************
* Global Variables
************************************************************************/
/* Activation/deactivation events */
EventStructureType ActivateComTask = {NO_MASK, EventIdle};
EventStructureType DeactivateComTask = {NO_MASK, EventIdle};

/************************************************************************
* Static Variables
************************************************************************/


/************************************************************************
* Local Prototypes
************************************************************************/
void ComInit (void);
void UartComTask (void);

/************************************************************************
* Function Implementations
************************************************************************/

/************************************************************************
* GLOBAL Function Prototypes
************************************************************************/

/************************************************************************
* Function:     ComTask
* Input:        None
* Output:       None
* Author:	    F.Ficili
* Description:	 Manages UART communication task.
* Date:         16/09/15
************************************************************************/
void ComTask (void)
{
    /* Task status */
    static UINT8 TaskStatus = K_TASK_NOT_RUNNING;

    switch (SystemState)
    {
        /* System Initialization Phase */
        case InitializationState:
            /* Init uart */
            ComInit();
            break;

        /* System Normal operation Phase */
        case RunningState:
            /* Check activation/deactivation events */
            if (ReceiveEvt(&ActivateComTask))
            {
                /* Activate task */
                TaskStatus = K_TASK_RUNNING;
            }
            else if (ReceiveEvt(&DeactivateComTask))
            {
                /* Deactivate task */
                TaskStatus = K_TASK_NOT_RUNNING;;
            }
            else
            {
                /* Do nothing */
            }

            /* Check task status */
            if (TaskStatus == K_TASK_RUNNING)
            {
                /* Call COM task */
                UartComTask();
            }

            break;

        /* Default */
        default:
            break;
    }
}

/************************************************************************
* Function:     ComInit
* Input:        None
* Output:       None
* Author:	    F.Ficili
* Description:	 Init application variables.
* Date:         16/09/15
************************************************************************/
void ComInit (void)
{
   /* Set uart module config */
   Uart_SetConfig();
   /* Init uart module */
   Uart_InitUartModule(&Uart_UartConfig);
}

/************************************************************************
* Function:     UartComTask
* Input:        None
* Output:       None
* Author:	    F.Ficili
* Description:	 Uart communication task.
* Date:         16/09/15
************************************************************************/
void UartComTask (void)
{
   static ComStateType ComState = ComIn;
   static UINT16 Counter = 0;
   static UINT8 LedState = COM_LEDS_ALL_OFF;
   
   switch(ComState)
   {
      case ComIn:
         /* Make necessary initializations */
         
         /* Jump to ComSendUartMsg */
         ComState = ComSendUartMsg;
         break;
         
      case ComSendUartMsg:
         /* Send led state */
         Uart_WriteByte(LedState);
         
         if (LedState < COM_LED_1_ON_2_ON)
         {
            /* Increment state */
            LedState++;
         }
         else
         {
            /* Restart */
            LedState = COM_LEDS_ALL_OFF;
         }
                  
         /* Jump to ComWait */
         ComState = ComWait;         
         break;

      case ComWait:
         /* Inc counter */
         Counter++;
         /* Check counter*/
         if (Counter > COM_TAS_DELAY_MS)
         {
            /* Reset counter */
            Counter = 0;
            /* Jump to ComSendUartMsg */
            ComState = ComSendUartMsg;             
         }
         break;
         
      default:
         break;
   }
}
