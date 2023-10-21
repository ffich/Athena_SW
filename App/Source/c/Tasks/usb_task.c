/************************************************************************
*                               Usb Task                                *
*************************************************************************
* FileName:         usb_task.c                                          *
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
* F.Ficili     28/02/15    1.0          First release                   *
************************************************************************/

/************************************************************************
* Includes
************************************************************************/
#include "usb_task.h"

/************************************************************************
* Global Variables
************************************************************************/
UINT8 WriteState;
/* Activation/deactivation events */
EventStructureType ActivateUsbTask = {NO_MASK, EventIdle};
EventStructureType DeactivateUsbTask = {NO_MASK, EventIdle};

/************************************************************************
* Static Variables
************************************************************************/
/* Data buffer */
static UINT8 DataBuffer[DATA_BUFFER_LENGHT] = {'H','e','l','l','o',' ','W','o','r','l','d','!'};

/************************************************************************
* LOCAL Function Prototypes
************************************************************************/
void LoggingStateMachine (void);

/************************************************************************
* GLOBAL Function Prototypes
************************************************************************/

/************************************************************************
* Function:     UsbTask
* Input:        None
* Output:       None
* Author:	    F.Ficili
* Description:  Manage Usb tasks and state machines
* Date:         28/02/15
************************************************************************/
void UsbTask (void)
{
    /* Task status */
    static UINT8 TaskStatus = K_TASK_NOT_RUNNING;

    switch (SystemState)
    {
        /* System Initialization Phase */
        case InitializationState:
            /* Initialize USB layers */
            USBInitialize(0);
            break;

        /* System Normal operation Phase */
        case RunningState:
            /* Check activation/deactivation events */
            if (ReceiveEvt(&ActivateUsbTask))
            {
                /* Activate task */
                TaskStatus = K_TASK_RUNNING;
            }
            else if (ReceiveEvt(&DeactivateUsbTask))
            {
                /* Deactivate task */
                TaskStatus = K_TASK_NOT_RUNNING;
            }
            else
            {
                /* Do nothing */
            }

            /* Check task status */
            if (TaskStatus == K_TASK_RUNNING)
            {
                /* Run Usb Host Task */
                USBTasks();
                /* Call loggin state machine */
                LoggingStateMachine();
            }
            break;

        /* Default */
        default:
            break;
    }
}

/************************************************************************
* LOCAL Function Prototypes
************************************************************************/

/************************************************************************
* Function:     void LoggingStateMachine (void)
* Input:        None
* Output:       None
* Author:	    F.Ficili
* Description:  Logging task state machine
* Date:         11/04/15
************************************************************************/
void LoggingStateMachine (void)
{
    /* Logging state machine state */
    static LoggingSmStateType LoggingSmState = CheckDeviceDetected;
    static MassStorageStatusType MsStatus = DeviceDetached;
    static FSFILE *LogFile;
    static UINT8 DelayCounter = 0;

    switch (LoggingSmState)
    {
        case CheckDeviceDetected:
            /* Check device status */
            if(USBHostMSDSCSIMediaDetect())
            {
                /* Device attached */
                MsStatus = DeviceAttached;
                /* Jump to CheckFsInitialized */
                LoggingSmState = CheckFsInitialized;
            }
            else
            {
                /* Device detached */
                MsStatus = DeviceDetached;
            }
            break;

        case CheckFsInitialized:
            /* If file system is initialized */
            if(FSInit())
            {
                /* Jump to OpenFile */
                LoggingSmState = OpenFile;
            }
            break;

        case OpenFile:
            /* Clear LCD display */
            Lcd_WriteCommand(CLEAR_DISPLAY);
            /* Move to line 1 */
            Lcd_WriteCommand(CURSOR_HOME);
            Lcd_WriteConstString("Writing...");
            /* Move to line 2 */
            Lcd_WriteCommand(CURSOR_LINE_2);
            Lcd_WriteConstString(EXIT_INDICATION);
            /* Open file */
            LogFile = FSfopen("LogFile.txt",FS_WRITE);
            /* Jump to WaitOpening */
            LoggingSmState = WaitOpening;
            break;

        case WaitOpening:
            /* Increment counter */
            DelayCounter++;

            /* If counter expires */
            if (DelayCounter >= OPENING_FILE_DELAY_MS)
            {
                /* Reset colunter */
                DelayCounter = 0;
                /* Jump to WaitLogEvent */
                LoggingSmState = WriteLogData;
            }
            break;

        case WriteLogData:
            /* Write data to USB key */
            FSfwrite(DataBuffer,1,sizeof(DataBuffer),LogFile);
            /* Put new line */
            FSfwrite("\r\n",1,2,LogFile);
            /* Jump back  CloseFile */
            LoggingSmState = CloseFile;
            break;

        case CloseFile:
            /* Close file */
            FSfclose(LogFile);
           /* Clear LCD display */
            Lcd_WriteCommand(CLEAR_DISPLAY);
            /* Move to line 1 */
            Lcd_WriteCommand(CURSOR_HOME);
            Lcd_WriteConstString("Done!!!");
            /* Move to line 2 */
            Lcd_WriteCommand(CURSOR_LINE_2);
            Lcd_WriteConstString(EXIT_INDICATION);
            /* Jump to Stop */
            LoggingSmState = StopLogging;
            break;

        case StopLogging:
            /* Do nothing */
            break;

        default:
            break;
    }
}

/****************************************************************************
  Function:
    BOOL USB_ApplicationEventHandler( BYTE address, USB_EVENT event,
                void *data, DWORD size )

  Summary:
    This is the application event handler.  It is called when the stack has
    an event that needs to be handled by the application layer rather than
    by the client driver.

  Description:
    This is the application event handler.  It is called when the stack has
    an event that needs to be handled by the application layer rather than
    by the client driver.  If the application is able to handle the event, it
    returns TRUE.  Otherwise, it returns FALSE.

  Precondition:
    None

  Parameters:
    BYTE address    - Address of device where event occurred
    USB_EVENT event - Identifies the event that occured
    void *data      - Pointer to event-specific data
    DWORD size      - Size of the event-specific data

  Return Values:
    TRUE    - The event was handled
    FALSE   - The event was not handled

  Remarks:
    The application may also implement an event handling routine if it
    requires knowledge of events.  To do so, it must implement a routine that
    matches this function signature and define the USB_HOST_APP_EVENT_HANDLER
    macro as the name of that function.
  ***************************************************************************/

BOOL USB_ApplicationEventHandler( BYTE address, USB_EVENT event, void *data, DWORD size )
{
    #ifndef MINIMUM_BUILD
        switch( event )
        {
            case EVENT_VBUS_REQUEST_POWER:
                /*
                    The data pointer points to a byte that represents the amount of power
                    requested in mA, divided by two.  If the device wants too much power,
                    we reject it.
                */
                if (((USB_VBUS_POWER_EVENT_DATA*)data)->current <= (MAX_ALLOWED_CURRENT / 2))
                {
                    return TRUE;
                }
                else
                {
                    /* Device require more current */
                }
                break;

            case EVENT_VBUS_RELEASE_POWER:
                /* Turn off Vbus power */
                return TRUE;
                break;
                
            case EVENT_DETACH:
                /* Turn off Vbus power */
                return TRUE;
                break;

            case EVENT_HUB_ATTACH:
                /* USB Error - hubs are not supported */
                return TRUE;
                break;

            case EVENT_UNSUPPORTED_DEVICE:
                /* USB Error - device is not supported  */
                return TRUE;
                break;

            case EVENT_CANNOT_ENUMERATE:
                /* USB Error - cannot enumerate device  */
                return TRUE;
                break;

            case EVENT_CLIENT_INIT_ERROR:
                /* USB Error - client driver initialization error  */
                return TRUE;
                break;

            case EVENT_OUT_OF_MEMORY:
                /* USB Error - out of heap memory  */
                return TRUE;
                break;

            case EVENT_UNSPECIFIED_ERROR:
                /* USB Error - unspecified  */
                return TRUE;
                break;

            default:
                break;
        }
    #endif

    return FALSE;
}


