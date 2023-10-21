/************************************************************************
*                               I2C Driver                              *
*************************************************************************
* FileName:         i2c_driver.h                                        *
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
* F.Ficili     09/09/15     1.0          First release                  *
************************************************************************/

#ifndef I2C_DRIVER_H
#define	I2C_DRIVER_H

/************************************************************************
* Includes
************************************************************************/
#include "xc.h"
#include "GenericTypeDefs.h"
#include "hw_profile.h"
#include "common.h"
#include "system_init.h"

/************************************************************************
* Defines
************************************************************************/
/* Define I2c module to use */
//#define I2C_MODULE_1                                        ((UINT8)(1))
#define I2C_MODULE_2                                        ((UINT8)(2))
//#define I2C_MODULE_3                                        ((UINT8)(3))
//#define I2C_MODULE_4                                        ((UINT8)(4))

#ifdef I2C_MODULE_1
    #define I2C_CONTROL_REG                                 I2C1CON
    #define I2C_STATUS_REG                                  I2C1STAT
    #define I2C_BRG_REG                                     I2C1BRG
    #define I2C_ADDRESS_REG                                 I2C1ADD
    #define I2C_TX_BUFFER                                   I2C1TRN
    #define I2C_RX_BUFFER                                   I2C1RCV
#endif

#ifdef I2C_MODULE_2
    #define I2C_CONTROL_REG                                 I2C2CON
    #define I2C_STATUS_REG                                  I2C2STAT
    #define I2C_BRG_REG                                     I2C2BRG
    #define I2C_ADDRESS_REG                                 I2C2ADD
    #define I2C_TX_BUFFER                                   I2C2TRN
    #define I2C_RX_BUFFER                                   I2C2RCV
#endif

#ifdef I2C_MODULE_3
    #define I2C_CONTROL_REG                                 I2C3CON
    #define I2C_STATUS_REG                                  I2C3STAT
    #define I2C_BRG_REG                                     I2C3BRG
    #define I2C_ADDRESS_REG                                 I2C3ADD
    #define I2C_TX_BUFFER                                   I2C3TRN
    #define I2C_RX_BUFFER                                   I2C3RCV
#endif

#ifdef I2C_MODULE_4
    #define I2C_CONTROL_REG                                 I2C4CON
    #define I2C_STATUS_REG                                  I2C4STAT
    #define I2C_BRG_REG                                     I2C4BRG
    #define I2C_ADDRESS_REG                                 I2C4ADD
    #define I2C_TX_BUFFER                                   I2C4TRN
    #define I2C_RX_BUFFER                                   I2C4RCV
#endif

/* Baud Rate generator parameters */
#define DESIRED_I2C_BUS_CLOCK_HZ                        ((UINT32)(400000))
#define PGD_S                                           ((float)(0.000000104))

/* Control register parameters */
#define STOP_COND_INT_SHIFT                             ((UINT8)(22))
#define STOP_COND_INT_DISABLED                          ((UINT8)(0))
#define STOP_COND_INT_ENABLED                           ((UINT8)(1))

#define START_COND_INT_SHIFT                            ((UINT8)(21))
#define START_COND_INT_DISABLED                         ((UINT8)(0))
#define START_COND_INT_ENABLED                          ((UINT8)(1))

#define ADDR_MODE_SHIFT                                 ((UINT8)(10))
#define ADDRESS_MODE_7_BIT                              ((UINT8)(0))
#define ADDRESS_MODE_10_BIT                             ((UINT8)(1))

#define ENABLE_MODULE_SHIFT                             ((UINT8)(15))
#define I2C_MODULE_OFF                                  ((UINT8)(0))
#define I2C_MODULE_ON                                   ((UINT8)(1))

/* -- Communication control parameters -- */

/* CONTROL Register */
#define START_COND_SHIFT                                ((UINT8)(0))
#define INITIATE_START_COND                             ((UINT8)(1))

#define RESTART_COND_SHIFT                              ((UINT8)(1))
#define INITIATE_RESTART_COND                           ((UINT8)(1))

#define STOP_COND_SHIFT                                 ((UINT8)(2))
#define INITIATE_STOP_COND                              ((UINT8)(1))

/* STATUS Register */
#define ACK_STATUS_MASK                                 ((UINT8)(0x8000))
#define ACK_STATUS_SHIFT                                ((UINT8)(15))
#define ACK_RECEIVED                                    ((UINT8)(0))
#define ACK_NOT_RECEIVED                                ((UINT8)(1))
#define MAX_NUMBER_OF_TENTATIVE                         ((UINT8)(10))

#define TX_STATUS_MASK                                  ((UINT8)(0x4000))
#define TX_STATUS_SHIFT                                 ((UINT8)(14))
#define TX_COMPLETED                                    ((UINT8)(0))
#define TX_NOT_COMPLETED                                ((UINT8)(1))

#define WRITE_OP                                        ((UINT8)(0))
#define READ_OP                                         ((UINT8)(1))

/************************************************************************
* Typedef
************************************************************************/
typedef enum _I2cWriteSts
{
    I2cWriteInProgress,
    I2cWriteNotOk,
    I2cWriteOk
} I2cWriteStsType;

/* I2c write state */
typedef enum _I2cWriteState
{
    AssertStart,
    SendSlaveAddress,
    SendDataByte,
    CheckLenght,
    AssertStop,
    TxCompleted,
    CheckAck,
    ErrorStatus
} I2cWriteStateType;

/* I2C configuration */
typedef struct _I2cConfig
{
    UINT8 ModuleNumber;
    UINT32 I2cBaudRateHz;
    UINT32 PeripheralBusClockHz;
    UINT8 StopConditionInt;
    UINT8 StartConditionInt;
    UINT8 AddressMode;
    UINT8 EnableI2cModule;
} I2cConfigType;

/* I2c data packet */
typedef struct _I2cWritePacket
{
    UINT8 SlaveAddress;
    UINT8 ReadWrite;
    UINT8 *Buffer;
    UINT8 Lenght;
} I2cWritePacketType;

/************************************************************************
* Global Variables
************************************************************************/


/************************************************************************
* Function
************************************************************************/
void I2c_SetConfig (void);
void I2c_InitI2cModule (void);
I2cWriteStsType I2c_WriteData (I2cWritePacketType *WritePacket);

#endif	/* I2C_DRIVER_H */

