
/************************************************************************
*                           MCP23008 Task                               *
*************************************************************************
* FileName:         mcp23008_task.c                                     *
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
* F.Ficili     14/09/15    1.0          First release			*
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
void MixedEffects (void);
void SupercarEffect (void);
void CrossSupercarEffect (void);
void AlternateBlinking (void);
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
* Author:	F.Ficili
* Description:	Port expander task.
* Date:		14/09/15
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

            /* Init LCD */
            Lcd_SetConfig();
            Lcd_InitLcdInterface();
            
            /* Clear LCD display */
            Lcd_WriteCommand(CLEAR_DISPLAY);
            /* Move to line 1 */
            Lcd_WriteCommand(CURSOR_HOME);
            Lcd_WriteConstString("  EFFECTS DEMO  ");
            /* Move to line 2 */
            Lcd_WriteCommand(CURSOR_LINE_2);
            Lcd_WriteConstString("----------------");
            /* Set backlight on */
            Lcd_Backlight(BacklightOn);      
            
            break;

        /* System Normal operation Phase */
        case RunningState:
            /* Mixed effects */
            MixedEffects();
            break;

        /* Default */
        default:
            break;
    }
}

/************************************************************************
* Function:     MixedEffects
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Mixed effects using MCP23008 port expander.
* Date:		11/04/16
************************************************************************/
void MixedEffects (void)
{
   static MixedEffectStateType MixedEffectState = SupCarEffState;
   static UINT16 Counter = 0;
   
   /* Increment Counter */
   Counter++;
   
   switch (MixedEffectState)
   {
      case SupCarEffState:
         /* Supercar */
         SupercarEffect();
         /* Check Counter */
         if(Counter >= EFFECT_DURATION_MS)
         {
            /* Reset counter */
            Counter = 0;
            /* Switch state */
            MixedEffectState = CrsSupCarEffState;
         }
         break;
         
      case CrsSupCarEffState:
         /* CrossSupercar */
         CrossSupercarEffect(); 
         /* Check Counter */
         if(Counter >= EFFECT_DURATION_MS)
         {
            /* Reset counter */
            Counter = 0;
            /* Switch state */
            MixedEffectState = AltBlkEffState;
         }         
         break;
         
      case AltBlkEffState:
         /* Alternate Blinking */
         AlternateBlinking();
         /* Check Counter */
         if(Counter >= EFFECT_DURATION_MS)
         {
            /* Reset counter */
            Counter = 0;
            /* Switch state */
            MixedEffectState = SupCarEffState;
         }             
         break;
         
      default:
         break;
   }
   
}

/************************************************************************
* Function:     SupercarEffect
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Supercar effect using MCP23008 port expander.
* Date:		14/09/15
************************************************************************/
void SupercarEffect (void)
{
    static SupercarStateType SupercarState = InitPortExState;
    static SupercarStateType NextState = InitPortExState;
    static ShiftDirectionType ShiftDirection = GoRight;
    static UINT8 StepCounter = 0;
    static UINT16 Counter = 0;

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
            if (Counter >= SHIFT_DELAY_MS)
            {               
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
* Function:     CrossSupercarEffect
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	CrossSupercarEffect effect using MCP23008 port expander.
* Date:		14/09/15
************************************************************************/
void CrossSupercarEffect (void)
{
    static SupercarStateType SupercarState = InitPortExState;
    static SupercarStateType NextState = InitPortExState;
    static ShiftDirectionType ShiftDirection = GoRight;
    static UINT8 StepCounter = 0;
    static UINT16 Counter = 0;

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
                SetMcp23008OutputState((LED_ON_RIGHT << StepCounter)|(LED_ON_LEFT >> StepCounter));
            }
            else
            {
                /* Set output */
                SetMcp23008OutputState((LED_ON_RIGHT >> StepCounter)|(LED_ON_LEFT << StepCounter));
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
            if (Counter >= SHIFT_DELAY_MS)
            {               
                /* Reset counter */
                Counter = 0;
                /* Check direction */
                if (StepCounter >= MAX_STEP_NUMB_CS)
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
* Function:     AlternateBlinking
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Alternate blinking effect using MCP23008 port expander.
* Date:		11/04/16
************************************************************************/
void AlternateBlinking (void)
{
   static AltBlkStateType AltBlkState = OnLeftState;
   static AltBlkStateType NextState = OnLeftState;
   static UINT16 Counter = 0;
   
   switch (AltBlkState)
   {
      case OnLeftState:
         /* Increment Counter */
         Counter++;         
        /* Check Counter */
         if (Counter >= ALT_BLK_DELAY_MS)
         {
            /* Reset counter */
            Counter = 0;
            /* Set output */
            SetMcp23008OutputState(LED_RIGHT_HALF_ON);
            /* Switch state */
            NextState = OnRightState;
            AltBlkState = AbSendDataState;
         }         
         break;
         
      case OnRightState:
         /* Increment Counter */
         Counter++;         
        /* Check Counter */
         if (Counter >= ALT_BLK_DELAY_MS)
         {
            /* Reset counter */
            Counter = 0;            
            /* Set output */
            SetMcp23008OutputState(LED_LEFT_HALF_ON);
            /* Switch state */
            NextState = OnLeftState;
            AltBlkState = AbSendDataState;
         }                     
         break;
         
      case AbSendDataState:
          if ((I2c_WriteData(&I2cPacket)) != I2cWriteInProgress)
          {
              /* Jump to next state */
              AltBlkState = NextState;
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
* Author:	F.Ficili
* Description:	Initialize MCP23008 output port.
* Date:		14/09/15
************************************************************************/
void InitMcp23008Port (void)
{
    /* Transmit buffer */
    UINT8 TxBuffer[TX_BUFFER_ELEMENTS];

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
* Author:	F.Ficili
* Description:	Set the MPC23008 output.
* Date:		14/09/15
************************************************************************/
void SetMcp23008OutputState (UINT8 PortState)
{
   /* Transmit buffer */
   UINT8 TxBuffer[TX_BUFFER_ELEMENTS];

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
* Author:	F.Ficili
* Description:	Write a specific MCP23008 output state
* Date:		30/09/15
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


