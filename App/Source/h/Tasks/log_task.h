/************************************************************************
*                               Log Task                                *
*************************************************************************
* FileName:         log_task.h                                          *
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

#ifndef LOG_TASK_H
#define	LOG_TASK_H

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
#define LOG_TASK_PERIOD_MS                      ((UINT16)(50)/SCHEDULER_PERIOD_MS)
/* Delay */
#define OPENING_FILE_DELAY_MS                   ((UINT16)(1000)/LOG_TASK_PERIOD_MS)/(SCHEDULER_PERIOD_MS)
/* Second Delay */
#define SECOND_DELAY_MS                         ((UINT16)(1000)/LOG_TASK_PERIOD_MS)/(SCHEDULER_PERIOD_MS)
/* Acquisition timeout in seconds */
#define ACQ_TIMEOUT_S                           ((UINT8)(30))

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
    WaitLogEvent,
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

/* Enum type for term option */
typedef enum TermOptEnum 
{
    NoTermination,
    AppendEolCr,
    AppendEol,
    AppenCr
} TermOptType;

/* Log status enum */
typedef enum LogStatusEnum
{
    NotLogging,
    Logging,
} LogStatusType;

/* Adc state machine states */
typedef enum SecCounterStateEnum
{
    CntIdle,
    WaitSecDelay,
    IncreaseCnt,
    Stop
} SecCounterStateType;

/* Log data struct */
typedef struct LogDataStruct
{
    UINT8 *DataToWrite;
    UINT8 DataLenght;
    TermOptType LineTerm;
} LogDataType;

#ifdef TEST_FUNCTIONS
/* Enum type for MSD testing */
typedef enum MassStorageTestEnum
{
    CheckDeviceDetected,
    CheckFsInitialized,
    OpenFile,
    WriteString,
    CloseFile,
    Stop,
} MassStorageTestType;
#endif

/************************************************************************
* Global Variables
************************************************************************/
/* Events */
extern EventStructureType LoggerReady;
extern EventStructureType LogDataEvt;
extern EventStructureType CloseLogFile;
extern EventStructureType StopLog;

/* Log task status */
extern LogStatusType LogStatus;

/************************************************************************
* Function
************************************************************************/
/* Log task */
void LogTask (void);

#endif	/* LOG_TASK_H */

