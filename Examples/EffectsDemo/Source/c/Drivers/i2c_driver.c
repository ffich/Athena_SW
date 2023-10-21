/************************************************************************
*                               I2C Driver                              *
*************************************************************************
* FileName:         i2c_driver.c                                        *
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
* Author       Date         Version      Comment                        *
* ---------------------------------------------------------------------	*
* F.Ficili     09/09/15     1.0          First release			*
************************************************************************/

/************************************************************************
* Includes
************************************************************************/
#include "i2c_driver.h"

/************************************************************************
* Defines
************************************************************************/


/************************************************************************
* Global Variables
************************************************************************/


/************************************************************************
* Static Variables
************************************************************************/
static I2cConfigType I2cConfig;

/************************************************************************
* Local Prototypes
************************************************************************/
void I2c_SetBaudRate (UINT32 DesiredI2cBusClockHz, UINT32 PeripheralBusClockHz);
void StartCondition (void);
void RestartCondition (void);
void StopCondition (void);
UINT8 CheckAckStatus (void);
UINT8 CheckTxStatus (void);
void WriteByte (UINT8 Byte);

/************************************************************************
* LOCAL Functions Implementation
************************************************************************/

/************************************************************************
* Function:     SetBaudRate
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Set the I2c module baud rate.
* Date:		16/09/15
************************************************************************/
void SetBaudRate (UINT32 DesiredI2cBusClockHz, UINT32 PeripheralBusClockHz)
{
    /* Calculate baud rate */
    I2C_BRG_REG = ((((1/(2*DesiredI2cBusClockHz)) - PGD_S) * PeripheralBusClockHz) - 2);
}

/************************************************************************
* Function:     StartCondition
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Initiate a start condition.
* Date:		16/09/15
************************************************************************/
void StartCondition (void)
{
    /* Initiate a start condition on bus */
    I2C_CONTROL_REG |= (INITIATE_START_COND) << START_COND_SHIFT;
}

/************************************************************************
* Function:     RestartCondition
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Initiate a re-start condition.
* Date:		16/09/15
************************************************************************/
void RestartCondition (void)
{
    /* Initiate a re-start condition on bus */
    I2C_CONTROL_REG |= (INITIATE_RESTART_COND) << RESTART_COND_SHIFT;
}

/************************************************************************
* Function:     StopCondition
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Initiate a stop condition.
* Date:		16/09/15
************************************************************************/
void StopCondition (void)
{
    /* Initiate a stop condition on bus */
    I2C_CONTROL_REG |= (INITIATE_STOP_COND) << STOP_COND_SHIFT;
}

/************************************************************************
* Function:     CheckAckStatus
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Return the ack status of the last byte tx.
* Date:		16/09/15
************************************************************************/
UINT8 CheckAckStatus (void)
{
    /* Return ack status  */
    return ((I2C_STATUS_REG & ACK_STATUS_MASK) >> ACK_STATUS_SHIFT);
}

/************************************************************************
* Function:     CheckTxStatus
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Return the tx status (in progress or completed).
* Date:		16/09/15
************************************************************************/
UINT8 CheckTxStatus (void)
{
    /* Return ack status  */
    return ((I2C_STATUS_REG & TX_STATUS_MASK) >> TX_STATUS_SHIFT);
}

/************************************************************************
* Function:     WriteByte
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Write a byte on tx register.
* Date:		16/09/15
************************************************************************/
void WriteByte (UINT8 Byte)
{
    /* Write byte */
    I2C_TX_BUFFER = Byte;
}

/************************************************************************
* GLOBAL Functions Implementation
************************************************************************/

/************************************************************************
* Function:     I2c_SetConfig
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Set the I2c module configuration.
* Date:		16/09/15
************************************************************************/
void I2c_SetConfig (void)
{
    I2cConfig.ModuleNumber = I2C_MODULE_2;
    I2cConfig.I2cBaudRateHz = DESIRED_I2C_BUS_CLOCK_HZ;
    I2cConfig.PeripheralBusClockHz = PERIPHERAL_FREQUENCY_VALUE_HZ;
    I2cConfig.AddressMode = ADDRESS_MODE_7_BIT;
    I2cConfig.StartConditionInt = START_COND_INT_DISABLED;
    I2cConfig.StopConditionInt = STOP_COND_INT_DISABLED;
    I2cConfig.EnableI2cModule = I2C_MODULE_ON;
}

/************************************************************************
* Function:     I2c_InitI2cModule
* Input:        None
* Output:       None
* Author:	F.Ficili
* Description:	Initialize I2C module.
* Date:		16/09/15
************************************************************************/
void I2c_InitI2cModule (void)
{
    /* Control register settings */
    I2C_CONTROL_REG = 0x00000000;
    I2C_CONTROL_REG |= (I2cConfig.StartConditionInt) << START_COND_INT_SHIFT;
    I2C_CONTROL_REG |= (I2cConfig.StopConditionInt) << STOP_COND_INT_SHIFT;
    I2C_CONTROL_REG |= (I2cConfig.AddressMode) << ADDR_MODE_SHIFT;

    /* Baud rate settings */
    SetBaudRate (I2cConfig.I2cBaudRateHz, I2cConfig.PeripheralBusClockHz);

    /* ON bit set */
    I2C_CONTROL_REG |= (I2cConfig.EnableI2cModule) << ENABLE_MODULE_SHIFT;
}

/************************************************************************
* Function:     I2c_WriteByte
* Input:        I2cWritePacketType WritePacket
* Output:       I2cWriteStsType
* Author:	F.Ficili
* Description:	Write a byte to I2C slave.
* Date:		16/09/15
************************************************************************/
I2cWriteStsType I2c_WriteData (I2cWritePacketType *WritePacket)
{
    /* Write state */
    static I2cWriteStateType I2cWriteState = AssertStart;
    static I2cWriteStateType I2cNextState = AssertStart;
    static UINT8 TentativeCounter = 0;
    static I2cWriteStsType WriteStatus;

    switch (I2cWriteState)
    {
        case AssertStart:
            /* Assert start condition on I2c bus */
            StartCondition();
            /* Update status */
            WriteStatus = I2cWriteInProgress;
            /* Jump to SendSlaveAddress */
            I2cWriteState = SendSlaveAddress;
            break;

        case SendSlaveAddress:
            /* Add R/W bit */
            WritePacket->SlaveAddress |= WritePacket->ReadWrite;
            /* Write slave address */
            WriteByte(WritePacket->SlaveAddress);
            /* Jump to SendSlaveAddress */
            I2cWriteState = SendSlaveAddress;
            /* Check transmission status */
            if (CheckTxStatus() == TX_COMPLETED)
            {
                /* Store next state */
                I2cNextState = SendDataByte;
                /* Jump to CheckAckStatus */
                I2cWriteState = CheckAck;
            }
            break;

        case SendDataByte:
            /* Write data */
            WriteByte(*(WritePacket->Buffer));
            /* Check transmission status */
            if (CheckTxStatus() == TX_COMPLETED)
            {
                /* Store next CheckLenght */
                I2cNextState = CheckLenght;
                /* Jump to CheckAckStatus */
                I2cWriteState = CheckAck;
            }
            break;

        case CheckLenght:
            /* Decrement lenght */
            (WritePacket->Lenght)--;
            /* Increment buffer pointer */
            WritePacket->Buffer++;
            /* Check lenght */
            if (WritePacket->Lenght == 0)
            {
                /* Jump to AssertStop */
                I2cWriteState = AssertStop;
            }
            else
            {
                /* Jump to SendDataByte */
                I2cWriteState = SendDataByte;
            }
            break;

        case AssertStop:
            /* Assert stop condition */
            StopCondition();
            /* Jump to TxCompleted */
            I2cWriteState = TxCompleted;
            break;

        case CheckAck:
            /* Increment tentatives */
            TentativeCounter++;
            /* Check ack status */
            if (CheckAckStatus() == ACK_RECEIVED)
            {
                /* Reset counter */
                TentativeCounter = 0;
                /* Jump to next state */
                I2cWriteState = I2cNextState;
            }
            else
            {
                /* Check number of tentatives */
                if (TentativeCounter >= MAX_NUMBER_OF_TENTATIVE)
                {
                    /* Jump to ErrorStatus */
                    I2cWriteState = ErrorStatus;
                }
            }
            break;

        case TxCompleted:
            /* Tx completed, re-init states */
            I2cWriteState = AssertStart;
            I2cNextState = AssertStart;
            /* Update status */
            WriteStatus = I2cWriteOk;
            break;

        case ErrorStatus:
            /* Error, re-init states */
            I2cWriteState = AssertStart;
            I2cNextState = AssertStart;
            /* Update status */
            WriteStatus = I2cWriteNotOk;
            break;

        default:
            break;
    }

    /* Return status */
    return WriteStatus;
}


