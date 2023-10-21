/************************************************************************
*                           Adc Driver                                  *
*************************************************************************
* FileName:         adc_driver.c                                        *
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
* F.Ficili     16/09/15     1.0          First release                  *
************************************************************************/

/************************************************************************
* Includes
************************************************************************/
#include "adc_driver.h"

/************************************************************************
* Global Variables
************************************************************************/


/************************************************************************
* Static Variables
************************************************************************/
/* Adc config */
AdcConfigType Adc_AdcConfig;
/* Adc input config */
InputConfigType Adc_InputConfig;
/* Adc port config */
PortConfigType Adc_PortConfig;
/* Adc autoscan config */
AutoScanConfigType Adc_AutoscanConfig;

/************************************************************************
* Local Prototypes
************************************************************************/


/************************************************************************
* LOCAL Functions Implementation
************************************************************************/


/************************************************************************
* GLOBAL Functions Implementation
************************************************************************/
/************************************************************************
* Function:     Adc_SetConfig
* Input:        None
* Output:       None
* Author:	    F.Ficili
* Description:	Set Adc configuration.
* Date:		20/09/15
************************************************************************/
void Adc_SetConfig (void)
{
    /* General configs */
    Adc_AdcConfig.AdcOpMode = ADC_OPERATING;
    Adc_AdcConfig.DataFormat = UNSIGNED_INTEGER_32_BIT;
    Adc_AdcConfig.ConvTriggerSource = CLEAR_SAMP_BIT;
    Adc_AdcConfig.AutoSample = AUTO_SAMPLE_OFF;

    Adc_AdcConfig.VoltageReferenceConf = A_VDD_A_VSS;
    Adc_AdcConfig.OffCal = OFF_CAL_DISABLE;
    Adc_AdcConfig.IntSeqCompletion = COMPLETION_OF_EACH_SEQUENCE;
    Adc_AdcConfig.BufferMode = BUFFER_MODE_1_BUF;

    Adc_AdcConfig.ClockSource = P_BUS_CLOCK;
    Adc_AdcConfig.AutoSampleTime = S_0_TAD;
    Adc_AdcConfig.AdcClockSel = C_8_T_PB;

    /* Input configurations */
    Adc_InputConfig.NegativeInputMuxA = NEG_MUX_A_VR_MINUS;
    Adc_InputConfig.NegativeInputMuxB = NEG_MUX_B_VR_MINUS;
    Adc_InputConfig.PositiveInputMuxA = POS_MUX_A_AN7;
    Adc_InputConfig.PositiveInputMuxB = POS_MUX_B_AN0;

    /* Port configurations */
    Adc_PortConfig.Pcfg0Config = PCFG_CONF_DIGITAL;
    Adc_PortConfig.Pcfg1Config = PCFG_CONF_DIGITAL;
    Adc_PortConfig.Pcfg2Config = PCFG_CONF_DIGITAL;
    Adc_PortConfig.Pcfg3Config = PCFG_CONF_DIGITAL;
    Adc_PortConfig.Pcfg4Config = PCFG_CONF_DIGITAL;
    Adc_PortConfig.Pcfg5Config = PCFG_CONF_DIGITAL;
    Adc_PortConfig.Pcfg6Config = PCFG_CONF_ANALOG;
    Adc_PortConfig.Pcfg7Config = PCFG_CONF_ANALOG;
    Adc_PortConfig.Pcfg8Config = PCFG_CONF_DIGITAL;
    Adc_PortConfig.Pcfg9Config = PCFG_CONF_DIGITAL;
    Adc_PortConfig.Pcfg10Config = PCFG_CONF_DIGITAL;
    Adc_PortConfig.Pcfg11Config = PCFG_CONF_DIGITAL;
    Adc_PortConfig.Pcfg12Config = PCFG_CONF_DIGITAL;
    Adc_PortConfig.Pcfg13Config = PCFG_CONF_DIGITAL;
    Adc_PortConfig.Pcfg14Config = PCFG_CONF_DIGITAL;
    Adc_PortConfig.Pcfg15Config = PCFG_CONF_DIGITAL;

    /* Auitoscan configurations */
    Adc_AutoscanConfig.AutoScan0Config = AN_INPUT_SCAN_NOT_SELECTED;
    Adc_AutoscanConfig.AutoScan1Config = AN_INPUT_SCAN_NOT_SELECTED;
    Adc_AutoscanConfig.AutoScan2Config = AN_INPUT_SCAN_NOT_SELECTED;
    Adc_AutoscanConfig.AutoScan3Config = AN_INPUT_SCAN_NOT_SELECTED;
    Adc_AutoscanConfig.AutoScan4Config = AN_INPUT_SCAN_NOT_SELECTED;
    Adc_AutoscanConfig.AutoScan5Config = AN_INPUT_SCAN_NOT_SELECTED;
    Adc_AutoscanConfig.AutoScan6Config = AN_INPUT_SCAN_NOT_SELECTED;
    Adc_AutoscanConfig.AutoScan7Config = AN_INPUT_SCAN_NOT_SELECTED;
    Adc_AutoscanConfig.AutoScan8Config = AN_INPUT_SCAN_NOT_SELECTED;
    Adc_AutoscanConfig.AutoScan9Config = AN_INPUT_SCAN_NOT_SELECTED;
    Adc_AutoscanConfig.AutoScan10Config = AN_INPUT_SCAN_NOT_SELECTED;
    Adc_AutoscanConfig.AutoScan11Config = AN_INPUT_SCAN_NOT_SELECTED;
    Adc_AutoscanConfig.AutoScan12Config = AN_INPUT_SCAN_NOT_SELECTED;
    Adc_AutoscanConfig.AutoScan13Config = AN_INPUT_SCAN_NOT_SELECTED;
    Adc_AutoscanConfig.AutoScan14Config = AN_INPUT_SCAN_NOT_SELECTED;
    Adc_AutoscanConfig.AutoScan15Config = AN_INPUT_SCAN_NOT_SELECTED;
}

/************************************************************************
* Function:     Adc_InitAdcModule
* Input:        AdcConfigType *AdcConfig
* Output:       None
* Author:	    F.Ficili
* Description:	Initialize ADC Module.
* Date:		20/09/15
************************************************************************/
void Adc_InitAdcModule (AdcConfigType *AdcConfig)
{
    /* AD1CON1 */
    ADC_CONTROL_REG_1 = 0x00000000;
    ADC_CONTROL_REG_1 |= (AdcConfig->AdcOpMode) << ADC_OP_MODE_SHIFT;
    ADC_CONTROL_REG_1 |= (AdcConfig->DataFormat) << DATA_OUTPUT_FORMAT_SHIFT;
    ADC_CONTROL_REG_1 |= (AdcConfig->ConvTriggerSource) << CONVERSION_TRIGGER_SOURCE_SHIFT;
    ADC_CONTROL_REG_1 |= (AdcConfig->AutoSample) << AUTO_SAMPLE_SHIFT;

    /* AD1CON2 */
    ADC_CONTROL_REG_2 = 0x00000000;
    ADC_CONTROL_REG_2 |= (AdcConfig->VoltageReferenceConf) << ADC_VOLTAGE_REFERENCE_SHIFT;
    ADC_CONTROL_REG_2 |= (AdcConfig->OffCal) << ADC_OFF_CAL_SHIFT;
    ADC_CONTROL_REG_2 |= (AdcConfig->IntSeqCompletion) << SAMPLE_CONVERT_SEQ_INTERRUPT_SHIFT;
    ADC_CONTROL_REG_2 |= (AdcConfig->BufferMode) << ADC_BUFFER_MODE_SHIFT;

    /* AD1CON3 */
    ADC_CONTROL_REG_3 = 0x00000000;
    ADC_CONTROL_REG_3 |= (AdcConfig->ClockSource) << ADC_CLOCK_SOURCE_SHIFT;
    ADC_CONTROL_REG_3 |= (AdcConfig->AutoSampleTime) << ADC_AUTO_SAMPLE_TIME_SHIFT;
    ADC_CONTROL_REG_3 |= (AdcConfig->AdcClockSel) << ADC_CLOCK_SELECT_BIT;
}

/************************************************************************
* Function:     Adc_SetInputConfig
* Input:        InputConfigType *InputConfig
* Output:       None
* Author:	    F.Ficili
* Description:	Set the ADC module input configuration.
* Date:		20/09/15
************************************************************************/
void Adc_SetInputConfig (InputConfigType *InputConfig)
{
    /* Set input configuration */
    ADC_INPUT_SELECT_REG = 0x00000000;
    ADC_INPUT_SELECT_REG |= (InputConfig->NegativeInputMuxA) << ADC_NEGATIVE_INPUT_MUX_A_SHIFT;
    ADC_INPUT_SELECT_REG |= (InputConfig->PositiveInputMuxA) << ADC_POSITIVE_INPUT_MUX_A_SHIFT;
    ADC_INPUT_SELECT_REG |= (InputConfig->NegativeInputMuxB) << ADC_NEGATIVE_INPUT_MUX_B_SHIFT;
    ADC_INPUT_SELECT_REG |= (InputConfig->PositiveInputMuxB) << ADC_POSITIVE_INPUT_MUX_B_SHIFT;
}

/************************************************************************
* Function:     Adc_SetPortConfig
* Input:        PortConfigType *PortConfig
* Output:       None
* Author:	    F.Ficili
* Description:	Set the ADC module port configuration.
* Date:		20/09/15
************************************************************************/
void Adc_SetPortConfig (PortConfigType *PortConfig)
{
    ADC_PORT_CONFIG_REG = 0x00000000;
    ADC_PORT_CONFIG_REG |= (PortConfig->Pcfg15Config) << ADC_PCFG_15_SHIFT;
    ADC_PORT_CONFIG_REG |= (PortConfig->Pcfg14Config) << ADC_PCFG_14_SHIFT;
    ADC_PORT_CONFIG_REG |= (PortConfig->Pcfg13Config) << ADC_PCFG_13_SHIFT;
    ADC_PORT_CONFIG_REG |= (PortConfig->Pcfg12Config) << ADC_PCFG_12_SHIFT;
    ADC_PORT_CONFIG_REG |= (PortConfig->Pcfg11Config) << ADC_PCFG_11_SHIFT;
    ADC_PORT_CONFIG_REG |= (PortConfig->Pcfg10Config) << ADC_PCFG_10_SHIFT;
    ADC_PORT_CONFIG_REG |= (PortConfig->Pcfg9Config) << ADC_PCFG_9_SHIFT;
    ADC_PORT_CONFIG_REG |= (PortConfig->Pcfg8Config) << ADC_PCFG_8_SHIFT;
    ADC_PORT_CONFIG_REG |= (PortConfig->Pcfg7Config) << ADC_PCFG_7_SHIFT;
    ADC_PORT_CONFIG_REG |= (PortConfig->Pcfg6Config) << ADC_PCFG_6_SHIFT;
    ADC_PORT_CONFIG_REG |= (PortConfig->Pcfg5Config) << ADC_PCFG_5_SHIFT;
    ADC_PORT_CONFIG_REG |= (PortConfig->Pcfg4Config) << ADC_PCFG_4_SHIFT;
    ADC_PORT_CONFIG_REG |= (PortConfig->Pcfg3Config) << ADC_PCFG_3_SHIFT;
    ADC_PORT_CONFIG_REG |= (PortConfig->Pcfg2Config) << ADC_PCFG_2_SHIFT;
    ADC_PORT_CONFIG_REG |= (PortConfig->Pcfg1Config) << ADC_PCFG_1_SHIFT;
    ADC_PORT_CONFIG_REG |= (PortConfig->Pcfg0Config) << ADC_PCFG_0_SHIFT;
}

/************************************************************************
* Function:     Adc_AutoScanConfig
* Input:        AutoScanConfigType *AutoScanConfig
* Output:       None
* Author:	    F.Ficili
* Description:	Set the ADC module auto-scan configuration.
* Date:		20/09/15
************************************************************************/
void Adc_AutoScanConfig (AutoScanConfigType *AutoScanConfig)
{
    ADC_INPUT_SCAN_SELECT_REG = 0x00000000;
    ADC_INPUT_SCAN_SELECT_REG |= (AutoScanConfig->AutoScan15Config) << ADC_CSSL_15_SHIFT;
    ADC_INPUT_SCAN_SELECT_REG |= (AutoScanConfig->AutoScan14Config) << ADC_CSSL_14_SHIFT;
    ADC_INPUT_SCAN_SELECT_REG |= (AutoScanConfig->AutoScan13Config) << ADC_CSSL_13_SHIFT;
    ADC_INPUT_SCAN_SELECT_REG |= (AutoScanConfig->AutoScan12Config) << ADC_CSSL_12_SHIFT;
    ADC_INPUT_SCAN_SELECT_REG |= (AutoScanConfig->AutoScan11Config) << ADC_CSSL_11_SHIFT;
    ADC_INPUT_SCAN_SELECT_REG |= (AutoScanConfig->AutoScan10Config) << ADC_CSSL_10_SHIFT;
    ADC_INPUT_SCAN_SELECT_REG |= (AutoScanConfig->AutoScan9Config) << ADC_CSSL_9_SHIFT;
    ADC_INPUT_SCAN_SELECT_REG |= (AutoScanConfig->AutoScan8Config) << ADC_CSSL_8_SHIFT;
    ADC_INPUT_SCAN_SELECT_REG |= (AutoScanConfig->AutoScan7Config) << ADC_CSSL_7_SHIFT;
    ADC_INPUT_SCAN_SELECT_REG |= (AutoScanConfig->AutoScan6Config) << ADC_CSSL_6_SHIFT;
    ADC_INPUT_SCAN_SELECT_REG |= (AutoScanConfig->AutoScan5Config) << ADC_CSSL_5_SHIFT;
    ADC_INPUT_SCAN_SELECT_REG |= (AutoScanConfig->AutoScan4Config) << ADC_CSSL_4_SHIFT;
    ADC_INPUT_SCAN_SELECT_REG |= (AutoScanConfig->AutoScan3Config) << ADC_CSSL_3_SHIFT;
    ADC_INPUT_SCAN_SELECT_REG |= (AutoScanConfig->AutoScan2Config) << ADC_CSSL_2_SHIFT;
    ADC_INPUT_SCAN_SELECT_REG |= (AutoScanConfig->AutoScan1Config) << ADC_CSSL_1_SHIFT;
    ADC_INPUT_SCAN_SELECT_REG |= (AutoScanConfig->AutoScan0Config) << ADC_CSSL_0_SHIFT;
}

/************************************************************************
* Function:     Adc_SampleData
* Input:        None
* Output:       None
* Author:	    F.Ficili
* Description:	Request a data sample to the ADC.
* Date:		20/09/15
************************************************************************/
void Adc_SampleData (void)
{
    /* Sample ADC data, manual mode */
    ADC_CONTROL_REG_1 |= (ADC_SAMPLE_DATA << SAMPLE_BIT_SHIFT);
}

/************************************************************************
* Function:     Adc_ConvertData
* Input:        None
* Output:       None
* Author:	    F.Ficili
* Description:	Stop sample data and begin conversion.
* Date:		22/09/15
************************************************************************/
void Adc_ConvertData (void)
{
    /* Convert ADC data, manual mode */
    ADC_CONTROL_REG_1 &= ~((!ADC_HOLD_DATA) << SAMPLE_BIT_SHIFT);
}

/************************************************************************
* Function:     Adc_IsConvComplete
* Input:        None
* Output:       ConvStsType
* Author:	    F.Ficili
* Description:	Check if the ADC conversion is complete.
* Date:		20/09/15
************************************************************************/
ConvStsType Adc_IsConvComplete (void)
{
    ConvStsType ConvSts;

    /* Check conversion status */
    if ((ADC_CONTROL_REG_1 & DONE_BIT_MASK) == ADC_CONV_DONE)
    {
        ConvSts = ConvComplete;
    }
    else
    {
        ConvSts = ConvInProgress;
    }

    /* Return conversion status */
    return ConvSts;
}

/************************************************************************
* Function:     Adc_GetConvResultRaw
* Input:        None
* Output:       UINT32
* Author:	    F.Ficili
* Description:	Retrieve data from buffer, in raw format.
* Date:		22/09/15
************************************************************************/
UINT32 Adc_GetConvResultRaw (void)
{
    /* Get data from ADC buffer 0 */
    return ADC_BUFFER(0);
}

/************************************************************************
* Function:     Adc_GetConvResultVolt
* Input:        None
* Output:       float
* Author:	    F.Ficili
* Description:	Retrieve data from buffer, in volt format.
* Date:		22/09/15
************************************************************************/
float Adc_GetConvResultVolt (void)
{
    UINT16 AdcResRaw = 0;
    float AdcResVolt = 0;
    
    /* Get data from ADC buffer */
    AdcResRaw = Adc_GetConvResultRaw();
    /* Calculate result in voltage */
    AdcResVolt = ((((float)AdcResRaw)*ADC_DIN_V)/(float)ADC_RES);

    /* Return result in voltage */
    return AdcResVolt;
}

/************************************************************************
* Function:     Adc_GetConvResultPerc
* Input:        None
* Output:       float
* Author:	    F.Ficili
* Description:	Retrieve data from buffer, in % format.
* Date:		22/09/15
************************************************************************/
UINT8 Adc_GetConvResultPerc (void)
{
    float AdcResVolt = 0;
    UINT8 AdcResPerc = 0;

    /* Get data from ADC buffer */
    AdcResVolt = Adc_GetConvResultVolt();
    /* Calculate result in voltage */
    AdcResPerc = (UINT8)((AdcResVolt/ADC_DIN_V)*((float)(100)));

    /* Return result in voltage */
    return AdcResPerc;
}