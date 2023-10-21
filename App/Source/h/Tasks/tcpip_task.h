/************************************************************************
*                             TcpIp Task                                *
*************************************************************************
* FileName:         tcpip_task.h                                        *
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
* F.Ficili     31/05/15     1.0          First release                  *
************************************************************************/

#ifndef TCPIP_TASK_H
#define	TCPIP_TASK_H

/************************************************************************
* Includes
************************************************************************/
#include "xc.h"
#include "scheduler.h"
#include "TCPIP.h"

/************************************************************************
* Defines
************************************************************************/
/* Task period in ms */
#define TCPIP_TASK_PERIOD_MS                        ((UINT16)(50)/SCHEDULER_PERIOD_MS)
/* Mac address lenght in byte */
#define MAC_LENGHT                                  ((UINT8)(6))

/************************************************************************
* Global Variables
************************************************************************/
/* Declare AppConfig structure */
extern APP_CONFIG AppConfig;
/* Activation/deactivation events */
extern EventStructureType ActivateTcpIpTask;
extern EventStructureType DeactivateTcpIpTask;

/************************************************************************
* Typedef
************************************************************************/

/************************************************************************
* Function
************************************************************************/
/* Led task */
void TcpIpTask (void);

#endif	/* TCPIP_TASK_H */


