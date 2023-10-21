/************************************************************************
*                              Interrupts                               *
*************************************************************************
* FileName:         interrupts.c                                        *
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
* F.Ficili     14/02/15    1.0          First release                   *
************************************************************************/

/************************************************************************
* Includes
************************************************************************/
#include <xc.h>
#include <stdint.h>        /* Includes uint16_t definition */
#include <stdbool.h>       /* Includes true/false definition */
#include <scheduler.h>

/************************************************************************
* Interrupts Routines
************************************************************************/

/************************************************************************
* Function:     void __ISR(_TIMER_2_VECTOR, ipl1) Timer2InterruptHandler (void)
* Input:        None
* Output:       None
* Author:	    F.Ficili
* Description:	Timer 2 ISR.
* Date:         14/02/15
************************************************************************/
void __ISR(_TIMER_2_VECTOR, ipl1) Timer2InterruptHandler (void)
{
    /* local counter */
    static UINT16 InterruptCounter = 0;

    /* clear interrupt flag */
    IFS0bits.T2IF = 0;
    /* Increment local counter */
    InterruptCounter++;
    /* If the scheduler period is elapsed */
    if (InterruptCounter >= SCHEDULER_PERIOD_MS)
    {
        /* Reset counter */
        InterruptCounter = 0;
        /* Main scheduler timebase flag */
        MainSystemTimebaseFlag = CallTaskPhase;
    }
}
