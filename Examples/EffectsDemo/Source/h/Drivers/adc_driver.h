/************************************************************************
*                          Adc Driver                                   *
*************************************************************************
* FileName:         adc_driver.h                                        *
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
* F.Ficili     16/09/15     1.0          First release			*
************************************************************************/

#ifndef ADC_DRIVER_H
#define	ADC_DRIVER_H

/************************************************************************
* Includes
************************************************************************/
#include "xc.h"
#include "GenericTypeDefs.h"
#include "hw_profile.h"
#include "common.h"

/************************************************************************
* Defines
************************************************************************/
/* ADC registers */
#define ADC_CONTROL_REG_1                               AD1CON1
#define ADC_CONTROL_REG_2                               AD1CON2
#define ADC_CONTROL_REG_3                               AD1CON3
#define ADC_INPUT_SELECT_REG                            AD1CHS
#define ADC_PORT_CONFIG_REG                             AD1PCFG
#define ADC_INPUT_SCAN_SELECT_REG                       AD1CSSL

/* Adc result buffer */
#define ADC_BUFFER(x)                                   ADC1BUF##x

/* ADCCON1 */
#define ADC_OP_MODE_SHIFT                               ((UINT8)(15))
#define ADC_STOP                                        ((UINT8)(0))
#define ADC_OPERATING                                   ((UINT8)(1))

#define DATA_OUTPUT_FORMAT_SHIFT                        ((UINT8)(8))
#define SIGNED_FRACTIONAL_16_BIT                        ((UINT8)(0b011))
#define UNSIGNED_FRACTIONAL_16_BIT                      ((UINT8)(0b010))
#define SIGNED_INTEGER_16_BIT                           ((UINT8)(0b001))
#define UNSIGNED_INTEGER_16_BIT                         ((UINT8)(0b000))
#define SIGNED_FRACTIONAL_32_BIT                        ((UINT8)(0b111))
#define UNSIGNED_FRACTIONAL_32_BIT                      ((UINT8)(0b110))
#define SIGNED_INTEGER_32_BIT                           ((UINT8)(0b101))
#define UNSIGNED_INTEGER_32_BIT                         ((UINT8)(0b100))

#define CONVERSION_TRIGGER_SOURCE_SHIFT                 ((UINT8)(5))
#define INTERNAL_COUNTER                                ((UINT8)(0b111))
#define TIMER_3                                         ((UINT8)(0b010))
#define ACTIVE_TRANSITION_INT0                          ((UINT8)(0b001))
#define CLEAR_SAMP_BIT                                  ((UINT8)(0b000))

#define AUTO_SAMPLE_SHIFT                               ((UINT8)(2))
#define AUTO_SAMPLE_ON                                  ((UINT8)(1))
#define AUTO_SAMPLE_OFF                                 ((UINT8)(0))

#define SAMPLE_BIT_SHIFT                                ((UINT8)(1))
#define ADC_SAMPLE_DATA                                 ((UINT8)(1))
#define ADC_HOLD_DATA                                   ((UINT8)(0))

#define DONE_BIT_SHIFT                                  ((UINT8)(0))
#define DONE_BIT_MASK                                   ((UINT8)(0x0001))
#define ADC_CONV_DONE                                   ((UINT8)(1))
#define ADC_CONV_NOT_DONE                               ((UINT8)(0))

/* ADCCON2 */
#define ADC_VOLTAGE_REFERENCE_SHIFT                     ((UINT8)(13))
#define A_VDD_A_VSS                                     ((UINT8)(0b000))
#define V_REF_POS_A_VSS                                 ((UINT8)(0b001))
#define A_VDD_V_REF_NEG                                 ((UINT8)(0b010))
#define V_REF_POS_V_REF_NEG                             ((UINT8)(0b010))

#define ADC_OFF_CAL_SHIFT                               ((UINT8)(12))
#define OFF_CAL_ENABLE                                  ((UINT8)(1))
#define OFF_CAL_DISABLE                                 ((UINT8)(0))

#define SAMPLE_CONVERT_SEQ_INTERRUPT_SHIFT              ((UINT8)(2))
#define COMPLETION_OF_16_SEQ                            ((UINT8)(0b1111))
#define COMPLETION_OF_15_SEQ                            ((UINT8)(0b1110))
#define COMPLETION_OF_14_SEQ                            ((UINT8)(0b1101))
#define COMPLETION_OF_13_SEQ                            ((UINT8)(0b1100))
#define COMPLETION_OF_12_SEQ                            ((UINT8)(0b1011))
#define COMPLETION_OF_11_SEQ                            ((UINT8)(0b1010))
#define COMPLETION_OF_10_SEQ                            ((UINT8)(0b1001))
#define COMPLETION_OF_9_SEQ                             ((UINT8)(0b1000))
#define COMPLETION_OF_8_SEQ                             ((UINT8)(0b0111))
#define COMPLETION_OF_7_SEQ                             ((UINT8)(0b0110))
#define COMPLETION_OF_6_SEQ                             ((UINT8)(0b0101))
#define COMPLETION_OF_5_SEQ                             ((UINT8)(0b0100))
#define COMPLETION_OF_4_SEQ                             ((UINT8)(0b0011))
#define COMPLETION_OF_3_SEQ                             ((UINT8)(0b0010))
#define COMPLETION_OF_2_SEQ                             ((UINT8)(0b0001))
#define COMPLETION_OF_EACH_SEQUENCE                     ((UINT8)(0b0000))

#define ADC_BUFFER_MODE_SHIFT                           ((UINT8)(1))
#define BUFFER_MODE_2_BUF                               ((UINT8)(1))
#define BUFFER_MODE_1_BUF                               ((UINT8)(0))

/* ADCCON3 */
#define ADC_CLOCK_SOURCE_SHIFT                          ((UINT8)(15))
#define INTERNAL_RC                                     ((UINT8)(1))
#define P_BUS_CLOCK                                     ((UINT8)(0))

#define ADC_AUTO_SAMPLE_TIME_SHIFT                      ((UINT8)(8))
/* Define a value when needed*/
#define S_31_TAD                                        ((UINT8)(0b11111))
#define S_1_TAD                                         ((UINT8)(0b00001))
#define S_0_TAD /* Not allowed*/                        ((UINT8)(0b00000))

#define ADC_CLOCK_SELECT_BIT                            ((UINT8)(0))
/* Define a value when needed*/
#define C_512_T_PB                                      ((UINT8)(0b111111))
#define C_8_T_PB                                        ((UINT8)(0b000010))
#define C_4_T_PB                                        ((UINT8)(0b000001))
#define C_2_T_PB                                        ((UINT8)(0b000000))

/* AD1CHS */
#define ADC_NEGATIVE_INPUT_MUX_B_SHIFT                  ((UINT8)(31))
#define NEG_MUX_B_AN1                                   ((UINT8)(1))
#define NEG_MUX_B_VR_MINUS                              ((UINT8)(0))

#define ADC_POSITIVE_INPUT_MUX_B_SHIFT                  ((UINT8)(24))
#define POS_MUX_B_AN15                                  ((UINT8)(0b1111))
#define POS_MUX_B_AN14                                  ((UINT8)(0b1110))
#define POS_MUX_B_AN13                                  ((UINT8)(0b1101))
#define POS_MUX_B_AN12                                  ((UINT8)(0b1100))
#define POS_MUX_B_AN11                                  ((UINT8)(0b1011))
#define POS_MUX_B_AN10                                  ((UINT8)(0b1010))
#define POS_MUX_B_AN9                                   ((UINT8)(0b1001))
#define POS_MUX_B_AN8                                   ((UINT8)(0b1000))
#define POS_MUX_B_AN7                                   ((UINT8)(0b0111))
#define POS_MUX_B_AN6                                   ((UINT8)(0b0110))
#define POS_MUX_B_AN5                                   ((UINT8)(0b0101))
#define POS_MUX_B_AN4                                   ((UINT8)(0b0100))
#define POS_MUX_B_AN3                                   ((UINT8)(0b0011))
#define POS_MUX_B_AN2                                   ((UINT8)(0b0010))
#define POS_MUX_B_AN1                                   ((UINT8)(0b0001))
#define POS_MUX_B_AN0                                   ((UINT8)(0b0000))

#define ADC_NEGATIVE_INPUT_MUX_A_SHIFT                  ((UINT8)(23))
#define NEG_MUX_A_AN1                                   ((UINT8)(1))
#define NEG_MUX_A_VR_MINUS                              ((UINT8)(0))

#define ADC_POSITIVE_INPUT_MUX_A_SHIFT                  ((UINT8)(16))
#define POS_MUX_A_AN15                                  ((UINT8)(0b1111))
#define POS_MUX_A_AN14                                  ((UINT8)(0b1110))
#define POS_MUX_A_AN13                                  ((UINT8)(0b1101))
#define POS_MUX_A_AN12                                  ((UINT8)(0b1100))
#define POS_MUX_A_AN11                                  ((UINT8)(0b1011))
#define POS_MUX_A_AN10                                  ((UINT8)(0b1010))
#define POS_MUX_A_AN9                                   ((UINT8)(0b1001))
#define POS_MUX_A_AN8                                   ((UINT8)(0b1000))
#define POS_MUX_A_AN7                                   ((UINT8)(0b0111))
#define POS_MUX_A_AN6                                   ((UINT8)(0b0110))
#define POS_MUX_A_AN5                                   ((UINT8)(0b0101))
#define POS_MUX_A_AN4                                   ((UINT8)(0b0100))
#define POS_MUX_A_AN3                                   ((UINT8)(0b0011))
#define POS_MUX_A_AN2                                   ((UINT8)(0b0010))
#define POS_MUX_A_AN1                                   ((UINT8)(0b0001))
#define POS_MUX_A_AN0                                   ((UINT8)(0b0000))

/* AD1PCFG */
#define ADC_PCFG_15_SHIFT                               ((UINT8)(15))
#define ADC_PCFG_14_SHIFT                               ((UINT8)(14))
#define ADC_PCFG_13_SHIFT                               ((UINT8)(13))
#define ADC_PCFG_12_SHIFT                               ((UINT8)(12))
#define ADC_PCFG_11_SHIFT                               ((UINT8)(11))
#define ADC_PCFG_10_SHIFT                               ((UINT8)(10))
#define ADC_PCFG_9_SHIFT                                ((UINT8)(9))
#define ADC_PCFG_8_SHIFT                                ((UINT8)(8))
#define ADC_PCFG_7_SHIFT                                ((UINT8)(7))
#define ADC_PCFG_6_SHIFT                                ((UINT8)(6))
#define ADC_PCFG_5_SHIFT                                ((UINT8)(5))
#define ADC_PCFG_4_SHIFT                                ((UINT8)(4))
#define ADC_PCFG_3_SHIFT                                ((UINT8)(3))
#define ADC_PCFG_2_SHIFT                                ((UINT8)(2))
#define ADC_PCFG_1_SHIFT                                ((UINT8)(1))
#define ADC_PCFG_0_SHIFT                                ((UINT8)(0))

#define PCFG_CONF_DIGITAL                               ((UINT8)(1))
#define PCFG_CONF_ANALOG                                ((UINT8)(0))

/* AD1CSSL */
#define ADC_CSSL_15_SHIFT                               ((UINT8)(15))
#define ADC_CSSL_14_SHIFT                               ((UINT8)(14))
#define ADC_CSSL_13_SHIFT                               ((UINT8)(13))
#define ADC_CSSL_12_SHIFT                               ((UINT8)(12))
#define ADC_CSSL_11_SHIFT                               ((UINT8)(11))
#define ADC_CSSL_10_SHIFT                               ((UINT8)(10))
#define ADC_CSSL_9_SHIFT                                ((UINT8)(9))
#define ADC_CSSL_8_SHIFT                                ((UINT8)(8))
#define ADC_CSSL_7_SHIFT                                ((UINT8)(7))
#define ADC_CSSL_6_SHIFT                                ((UINT8)(6))
#define ADC_CSSL_5_SHIFT                                ((UINT8)(5))
#define ADC_CSSL_4_SHIFT                                ((UINT8)(4))
#define ADC_CSSL_3_SHIFT                                ((UINT8)(3))
#define ADC_CSSL_2_SHIFT                                ((UINT8)(2))
#define ADC_CSSL_1_SHIFT                                ((UINT8)(1))
#define ADC_CSSL_0_SHIFT                                ((UINT8)(0))

#define AN_INPUT_SCAN_SELECTED                          ((UINT8)(1))
#define AN_INPUT_SCAN_NOT_SELECTED                      ((UINT8)(0))

#define ADC_DIN_V                                       ((float)(3.3))
#define ADC_RES                                         ((UINT16)(1024))

/************************************************************************
* Typedef
************************************************************************/
/* Conv Status */
typedef enum _ConvSts
{
    ConvInProgress,
    ConvComplete
} ConvStsType;

/* Input config type */
typedef struct _AdcConfig
{
    UINT8 AdcOpMode;
    UINT8 DataFormat;
    UINT8 ConvTriggerSource;
    UINT8 AutoSample;
    UINT8 VoltageReferenceConf;
    UINT8 OffCal;
    UINT8 IntSeqCompletion;
    UINT8 BufferMode;
    UINT8 ClockSource;
    UINT8 AutoSampleTime;
    UINT8 AdcClockSel;
} AdcConfigType;

/* Input config type */
typedef struct _InputConfig
{
    UINT8 NegativeInputMuxA;
    UINT8 PositiveInputMuxA;
    UINT8 NegativeInputMuxB;
    UINT8 PositiveInputMuxB;
} InputConfigType;

/* Port config type */
typedef struct _PortConfig
{
    UINT8 Pcfg15Config;
    UINT8 Pcfg14Config;
    UINT8 Pcfg13Config;
    UINT8 Pcfg12Config;
    UINT8 Pcfg11Config;
    UINT8 Pcfg10Config;
    UINT8 Pcfg9Config;
    UINT8 Pcfg8Config;
    UINT8 Pcfg7Config;
    UINT8 Pcfg6Config;
    UINT8 Pcfg5Config;
    UINT8 Pcfg4Config;
    UINT8 Pcfg3Config;
    UINT8 Pcfg2Config;
    UINT8 Pcfg1Config;
    UINT8 Pcfg0Config;
} PortConfigType;

/* Auto scan config type */
typedef struct _AutoScanConfig
{
    UINT8 AutoScan15Config;
    UINT8 AutoScan14Config;
    UINT8 AutoScan13Config;
    UINT8 AutoScan12Config;
    UINT8 AutoScan11Config;
    UINT8 AutoScan10Config;
    UINT8 AutoScan9Config;
    UINT8 AutoScan8Config;
    UINT8 AutoScan7Config;
    UINT8 AutoScan6Config;
    UINT8 AutoScan5Config;
    UINT8 AutoScan4Config;
    UINT8 AutoScan3Config;
    UINT8 AutoScan2Config;
    UINT8 AutoScan1Config;
    UINT8 AutoScan0Config;
} AutoScanConfigType;

/************************************************************************
* Global Variables
************************************************************************/
/* Adc config */
extern AdcConfigType Adc_AdcConfig;
/* Adc input config */
extern InputConfigType Adc_InputConfig;
/* Adc port config */
extern PortConfigType Adc_PortConfig;
/* Adc autoscan config */
extern AutoScanConfigType Adc_AutoscanConfig;

/************************************************************************
* Function
************************************************************************/
void Adc_SetConfig (void);
void Adc_InitAdcModule (AdcConfigType *AdcConfig);
void Adc_SetInputConfig (InputConfigType *InputConfig);
void Adc_SetPortConfig (PortConfigType *PortConfig);
void Adc_AutoScanConfig (AutoScanConfigType *AutoScanConfig);
void Adc_SampleData (void);
void Adc_ConvertData (void);
ConvStsType Adc_IsConvComplete (void);
UINT32 Adc_GetConvResultRaw (void);
float Adc_GetConvResultVolt (void);
UINT8 Adc_GetConvResultPerc (void);

#endif	/* ADC_DRIVER_H */

