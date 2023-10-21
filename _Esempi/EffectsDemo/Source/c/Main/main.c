/************************************************************************
*                               Main					*
*************************************************************************
* FileName:         main.c                                              *
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
*************************************************************************/
#include "xc.h"
#include "scheduler.h"
#include "config_bits.h"

/************************************************************************
* Defines
************************************************************************/

/************************************************************************
* Global Variables
************************************************************************/

/************************************************************************
* Local Prototypes
************************************************************************/

/************************************************************************
* Main Function
************************************************************************/

/************************************************************************
* Function:     void main (void)
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Main function
* Date:         14/02/15
************************************************************************/
INT16 main(void)
{
    /* Call System Initialization */
    SystemInit();

    /* Call Main Scheduler */
    MainScheduler();
    
    /* execution should never reach this point */
    return EXIT_SUCCESS;
}
