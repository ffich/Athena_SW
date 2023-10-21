
/************************************************************************
*                               Usb Task                                *
*************************************************************************
* FileName:         usb_task.c                                          *
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
* F.Ficili     28/02/15    1.0          First release			*
************************************************************************/

/************************************************************************
* Includes
************************************************************************/
#include "usb_task.h"

/************************************************************************
* Global Variables
************************************************************************/
UINT8 HidReportIn[HID_INT_IN_EP_SIZE];
INT8 HidBuffer[HID_INT_IN_EP_SIZE];
USB_VOLATILE USB_HANDLE LastTransmission = 0;


/************************************************************************
* Static Variables
************************************************************************/

/************************************************************************
* Local Prototypes
************************************************************************/
void JoystickTask (void);
void JoystickHidSendTask (void);

/************************************************************************
* Function Prototypes
************************************************************************/

/************************************************************************
* GLOBAL Function Prototypes
************************************************************************/

/************************************************************************
* Function:     UsbTask
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Manage Usb tasks and state machines
* Date:		28/02/15
************************************************************************/
void UsbTask (void)
{
    switch (SystemState)
    {
        /* System Initialization Phase */
        case InitializationState:

            AD1PCFG = 0xFFFF;
            /* Initialize JOYSTICK pins */
            BSP_JOYSTICK_UP_TRIS     =   LINE_DIRECTION_INPUT;
            BSP_JOYSTICK_RIGHT_TRIS  =   LINE_DIRECTION_INPUT;
            BSP_JOYSTICK_LEFT_TRIS   =   LINE_DIRECTION_INPUT;
            BSP_JOYSTICK_DOWN_TRIS   =   LINE_DIRECTION_INPUT;
            BSP_JOYSTICK_FIRE_TRIS   =   LINE_DIRECTION_INPUT;
            
            /* Init LCD */
            Lcd_SetConfig();
            Lcd_InitLcdInterface();
            
            /* Clear LCD display */
            Lcd_WriteCommand(CLEAR_DISPLAY);
            /* Move to line 1 */
            Lcd_WriteCommand(CURSOR_HOME);
            Lcd_WriteConstString("  USB HID DEMO  ");
            /* Move to line 2 */
            Lcd_WriteCommand(CURSOR_LINE_2);
            Lcd_WriteConstString("----------------");
            /* Set backlight on */
            Lcd_Backlight(BacklightOn);              

            /* Init Usb device */
            USBDeviceInit();
            break;

        /* System Normal operaion Phase */
        case RunningState:
            /* Usb stack task */
            USBDeviceTasks();
            /* Emulate joystick */
            JoystickTask();
            /* Manage joystick */
            JoystickHidSendTask();
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
* Function:     JoystickEmulationSm
* Input:        void
* Output:       void
* Author:       F.Ficili
* Description:  Emulate joystick movement
* Date:		07/03/15
************************************************************************/
void JoystickTask (void)
{
    /* Joystick state variable */
    JoystickStateType JoystickState = DoNothing;

            if (BSP_JOYSTICK_UP == LINE_STATE_LOW)
            {
               /* Jump to MoveUP */
               JoystickState = MoveUp;
               /* Move to line 2 */
               Lcd_WriteCommand(CURSOR_LINE_2);
               Lcd_WriteConstString("--Joystick Up");                
            }
            else if (BSP_JOYSTICK_RIGHT == LINE_STATE_LOW)
            {
               /* Jump to MoveRight */
               JoystickState = MoveRight;
               /* Move to line 2 */
               Lcd_WriteCommand(CURSOR_LINE_2);
               Lcd_WriteConstString("-Joystick Right");                   
            } 
            else if (BSP_JOYSTICK_LEFT == LINE_STATE_LOW)
            {
               /* Jump to MoveLeft */
               JoystickState = MoveLeft;
               /* Move to line 2 */
               Lcd_WriteCommand(CURSOR_LINE_2);
               Lcd_WriteConstString("-Joystick Left");                   
            }
            else if (BSP_JOYSTICK_DOWN == LINE_STATE_LOW)
            {
               /* Jump to MoveDown */
               JoystickState = MoveDown;
               /* Move to line 2 */               
               Lcd_WriteCommand(CURSOR_LINE_2);
               Lcd_WriteConstString("-Joystick Down");                 
            }
            else if (BSP_JOYSTICK_FIRE == LINE_STATE_LOW)
            {
                /* Jump to MoveDown */
                JoystickState = FireButton;
               /* Move to line 2 */               
               Lcd_WriteCommand(CURSOR_LINE_2);
               Lcd_WriteConstString("-Joystick Fire");                   
            }
            else
            {
               JoystickState = DoNothing;
               /* Move to line 2 */                 
               Lcd_WriteCommand(CURSOR_LINE_2);
               Lcd_WriteConstString("----------------");                
            }

            switch (JoystickState)
            {
                case MoveUp:
                    /* Move the joystick up */
                    HidBuffer[HID_REPORT_BUTTON] = 0;
                    HidBuffer[HID_REPORT_X_AXIS] = 0;
                    HidBuffer[HID_REPORT_Y_AXIS] = JOY_SPEED*MOVE_UP;
                    break;

                case MoveDown:
                    /* Move the joystick down */
                    HidBuffer[HID_REPORT_BUTTON] = 0;
                    HidBuffer[HID_REPORT_X_AXIS] = 0;
                    HidBuffer[HID_REPORT_Y_AXIS] = JOY_SPEED*MOVE_DOWN;
                    break;

                case MoveLeft:
                    /* Move the joystick down */
                    HidBuffer[HID_REPORT_BUTTON] = 0;
                    HidBuffer[HID_REPORT_X_AXIS] = JOY_SPEED*MOVE_LEFT;
                    HidBuffer[HID_REPORT_Y_AXIS] = 0;
                    break;

                case MoveRight:
                    /* Move the joystick down */
                    HidBuffer[HID_REPORT_BUTTON] = 0;
                    HidBuffer[HID_REPORT_X_AXIS] = JOY_SPEED*MOVE_RIGHT;
                    HidBuffer[HID_REPORT_Y_AXIS] = 0;
                    break;

                case FireButton:
                    /* Move the joystick down */
                    HidBuffer[HID_REPORT_BUTTON] = FIRE_ON;
                    HidBuffer[HID_REPORT_X_AXIS] = 0;
                    HidBuffer[HID_REPORT_Y_AXIS] = 0;
                    break;

                case DoNothing:
                    /* Move the joystick down */
                    HidBuffer[HID_REPORT_BUTTON] = 0;
                    HidBuffer[HID_REPORT_X_AXIS] = 0;
                    HidBuffer[HID_REPORT_Y_AXIS] = 0;
                    break;

                default:
                    break;
            }
    
}

/************************************************************************
* Function:     JoystickHidSendTask
* Input:        void
* Output:       void
* Author:       F.Ficili
* Description:  Send HID data to Host
* Date:		07/03/15
************************************************************************/
void JoystickHidSendTask (void)
{
    /* Copy over the data to the HID buffer */
    HidReportIn[HID_REPORT_BUTTON] = HidBuffer[HID_REPORT_BUTTON];
    HidReportIn[HID_REPORT_X_AXIS] = HidBuffer[HID_REPORT_X_AXIS];
    HidReportIn[HID_REPORT_Y_AXIS] = HidBuffer[HID_REPORT_Y_AXIS];

    /* Send the 3 byte packet over USB to the host */
    LastTransmission = HIDTxPacket(HID_EP, (BYTE*)HidReportIn, 0x03);
}
