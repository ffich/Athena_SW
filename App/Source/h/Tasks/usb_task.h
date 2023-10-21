/************************************************************************
*                               Usb Task                                *
*************************************************************************
* FileName:         usb_task.h                                          *
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

#ifndef USB_TASK_H
#define	USB_TASK_H

/************************************************************************
* Includes
************************************************************************/
#include "xc.h"
#include "scheduler.h"
#include "usb_host.h"
#include "fsio.h"
#include "usb_common.h"

/************************************************************************
* Defines
************************************************************************/
/* Task period in ms */
#define USB_TASK_PERIOD_MS                      ((UINT16)(50)/SCHEDULER_PERIOD_MS)
/* Delay */
#define OPENING_FILE_DELAY_MS                   ((UINT16)(500)/USB_TASK_PERIOD_MS)
/* Data buffer lenght */
#define DATA_BUFFER_LENGHT                      ((UINT16)(12))

/************************************************************************
* Global Variables
************************************************************************/
/* Activation/deactivation events */
extern EventStructureType ActivateUsbTask;
extern EventStructureType DeactivateUsbTask;

/************************************************************************
* Typedef
************************************************************************/
/* Logging state machine state typedef */
typedef enum LoggingSmStateEnum
{
    CheckDeviceDetected,
    CheckFsInitialized,
    OpenFile,
    WaitOpening,
    WriteLogData,
    CloseFile,
    StopLogging,
} LoggingSmStateType;

/* Enum type for MSD status */
typedef enum MassStorageStatusEnum
{
    DeviceDetached,
    DeviceAttached,
} MassStorageStatusType;


/************************************************************************
* Function
************************************************************************/
/* Usb task */
void UsbTask (void);
/* Usb application event handler */
BOOL USB_ApplicationEventHandler( BYTE address, USB_EVENT event, void *data, DWORD size );

#endif	/* USB_TASK_H */

