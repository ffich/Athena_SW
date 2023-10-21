
/************************************************************************
*                           MCP23008 Task                               *
*************************************************************************
* FileName:         mcp23008_task.c                                     *
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
* F.Ficili     14/09/15    1.0          First release                   *
************************************************************************/

/************************************************************************
* Includes
************************************************************************/
#include "mcp23008_task.h"
#include "i2c_driver.h"

/************************************************************************
* Global Variables
************************************************************************/
/* Activation/deactivation events */
EventStructureType ActivateMcp23008Task = {NO_MASK, EventIdle};
EventStructureType DeactivateMcp23008Task = {NO_MASK, EventIdle};

/************************************************************************
* Static Variables
************************************************************************/
/* I2c tx packet */
static I2cWritePacketType I2cPacket;
static UINT8 I2cTaskProtection = ACCESSIBLE;

/************************************************************************
* Local Prototypes
************************************************************************/
void SupercarEffect (void);
void InitMcp23008Port (void);
void SetMcp23008OutputState (UINT8 PortState);
void WriteMcp23008OutputState (UINT8 Packet, UINT8 *Start);

/************************************************************************
* Function Implementations
************************************************************************/

/************************************************************************
* GLOBAL Function Prototypes
************************************************************************/

/************************************************************************
* Function:     Mcp23008Task
* Input:        None
* Output:       None
* Author:	    F.Ficili
* Description:	 Port expander task.
* Date:         14/09/15
************************************************************************/
void Mcp23008Task (void)
{
    /* Task status */
    static UINT8 TaskStatus = K_TASK_NOT_RUNNING;
    UINT8 StartI2cWrite;

    switch (SystemState)
    {
        /* System Initialization Phase */
        case InitializationState:
            /* Init i2c module */
            I2c_SetConfig();
            I2c_InitI2cModule();
            break;

        /* System Normal operation Phase */
        case RunningState:                                 
            if (I2cTaskProtection == ACCESSIBLE)
            {
               /* Check activation/deactivation events */
               if (ReceiveEvt(&ActivateMcp23008Task))
               {
                   /* Activate task */
                   TaskStatus = K_TASK_RUNNING;
               }
               else if (ReceiveEvt(&DeactivateMcp23008Task))
               {
                   /* Deactivate task */
                   TaskStatus = K_TASK_NOT_RUNNING;
                   /* Trigger the write procedure */
                   StartI2cWrite = BEGIN_WRITE_PROCEDURE;
               }
               else
               {
                   /* Do nothing */
               }            
            }  

            /* Check task status */
            if (TaskStatus == K_TASK_RUNNING)
            {
                /* Supercar Effect */
                SupercarEffect();
            }
            else
            {
                /* Turn off all leds */
                WriteMcp23008OutputState(LED_ALL_OFF,&StartI2cWrite);
            }
            break;

        /* Default */
        default:
            break;
    }
}

/************************************************************************
* Function:     SupercarEffect
* Input:        None
* Output:       None
* Author:	    F.Ficili
* Description:	 Supercar effect using MCP23008 port expander.
* Date:         14/09/15
************************************************************************/
void SupercarEffect (void)
{
    static SupercarStateType SupercarState = InitPortExState;
    static SupercarStateType NextState = InitPortExState;
    static ShiftDirectionType ShiftDirection = GoRight;
    static UINT8 StepCounter = 0;
    static UINT16 Counter = 0;
    static UINT16 ShiftDelay = SHIFT_DELAY_MS;

    switch (SupercarState)
    {
        case InitPortExState:
            /* Init port expander */
            InitMcp23008Port();
            /* Load next state */
            NextState = InitOutputState;
            /* Send data state */
            SupercarState = SendDataState;
            break;

        case InitOutputState:
            /* Set output */
            SetMcp23008OutputState(LED_ALL_OFF);
            /* Load next state */
            NextState = ShiftState;
            /* Send data state */
            SupercarState = SendDataState;
            break;

        case ShiftState:
            /* Increment step */
            StepCounter++;
            /* Check shift direction */
            if (ShiftDirection == GoRight)
            {

                /* Set output */
                SetMcp23008OutputState(LED_ON_RIGHT << StepCounter);
            }
            else
            {
                /* Set output */
                SetMcp23008OutputState(LED_ON_LEFT >> StepCounter);
            }
            /* Load next state */
            NextState = WaitState;
            /* Send data state */
            SupercarState = SendDataState;
            /* Protect task */
            I2cTaskProtection = NOT_ACCESSIBLE;
            break;

        case SendDataState:
            if ((I2c_WriteData(&I2cPacket)) != I2cWriteInProgress)
            {
                /* Jump to next state */
                SupercarState = NextState;
            }
            break;

        case WaitState:           
            /* Increment counter */
            Counter++;
            /* Check counter */
            if (Counter >= ShiftDelay)
            {
                /* Increment/Decrement supercar effect speed */
                if (Joystick_GetJoystickState() == JoystickUp)
                {
                    if (ShiftDelay < MAX_TH_MS)
                    {
                        ShiftDelay = ((ShiftDelay++)/MCP23008_TASK_PERIOD_MS/SCHEDULER_PERIOD_MS);
                    }
                }
                else if (Joystick_GetJoystickState() == JoystickDown)
                {
                    if (ShiftDelay > MIN_TH_MS)
                    {
                        ShiftDelay = ((ShiftDelay--)/MCP23008_TASK_PERIOD_MS/SCHEDULER_PERIOD_MS);
                    }
                }
                else
                {
                    /* Do nothing */
                }

                /* Reset counter */
                Counter = 0;
                /* Check direction */
                if (StepCounter >= MAX_STEP_NUMB)
                {
                    StepCounter = 0;
                    /* Invert */
                    ShiftDirection = !ShiftDirection;
                }
                /* Jump to ShiftState*/
                SupercarState = ShiftState;
                /* Unprotect task */
                I2cTaskProtection = ACCESSIBLE;
            }
            break;

        default:
            break;
    }
}

/************************************************************************
* Function:     InitMcp23008Port
* Input:        None
* Output:       None
* Author:	    F.Ficili
* Description:	 Initialize MCP23008 output port.
* Date:         14/09/15
************************************************************************/
void InitMcp23008Port (void)
{
    /* Transmit buffer */
   static UINT8 TxBuffer[TX_BUFFER_ELEMENTS];

   /* Set Payload */
   TxBuffer[0] = MCP23008_DDR_REG;
   TxBuffer[1] = MCP23008_ALL_PIN_OUTPUT;
   I2cPacket.SlaveAddress = MCP23008_I2C_ADDR;
   I2cPacket.ReadWrite = WRITE_OP;
   I2cPacket.Lenght = TX_BUFFER_ELEMENTS;
   I2cPacket.Buffer = TxBuffer;
}

/************************************************************************
* Function:     SetMcp23008OutputState
* Input:        UINT8 PortState
* Output:       None
* Author:	    F.Ficili
* Description:	 Set the MPC23008 output.
* Date:         14/09/15
************************************************************************/
void SetMcp23008OutputState (UINT8 PortState)
{
   /* Transmit buffer */
   static UINT8 TxBuffer[TX_BUFFER_ELEMENTS];

   /* Set Payload */
   TxBuffer[0] = MCP23008_PORT_REG;
   TxBuffer[1] = PortState;
   I2cPacket.SlaveAddress = MCP23008_I2C_ADDR;
   I2cPacket.ReadWrite = WRITE_OP;
   I2cPacket.Lenght = TX_BUFFER_ELEMENTS;
   I2cPacket.Buffer = TxBuffer;
}

/************************************************************************
* Function:     WriteI2cPacket
* Input:        UINT8 Packet
* Output:       None
* Author:	    F.Ficili
* Description:	 Write a specific MCP23008 output state
* Date:         30/09/15
************************************************************************/
void WriteMcp23008OutputState (UINT8 Packet, UINT8 *Start)
{
   static WriteStateType WriteState = SetValue;
   static UINT8 Counter = 0;
   
   switch (WriteState)
   {
       case Idle:
           /* Start write procedure */
           if (*Start == BEGIN_WRITE_PROCEDURE)
           {
               *Start = IDLE;
               /* Change state */
               WriteState = SetValue;
           }
           break;

       case SetValue:
           /* Set output */
           SetMcp23008OutputState(Packet);
           /* Change state */
           WriteState = Write;
           break;

       case Write:
           /* Write packet */
           if ((I2c_WriteData(&I2cPacket)) != I2cWriteInProgress)
           {
              /* Inc. counter */
              Counter++;
              /* Check tentative number */
              if (Counter <= TENTATIVE_NUMBER)
              {
                 /* Change state */
                 WriteState = SetValue;                     
              }
              else
              {
                 /* Reset so that next time you can do more tentatives */
                 Counter = 0;
                 /* Change state */
                 WriteState = Complete;               
              }
           }
           break;

       case Complete:
           /* Change state */
           WriteState = Idle;
           break;

       default:
           break;
   }
}


