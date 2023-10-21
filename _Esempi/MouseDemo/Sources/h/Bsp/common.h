/************************************************************************
*                               Common					*
*************************************************************************
* FileName:         common.h                                            *
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
* F.Ficili     14/02/15    1.0          First release			*
************************************************************************/

#ifndef COMMON_H
#define	COMMON_H

/************************************************************************
* Compiler Switches
************************************************************************/
//#define USE_SCH_TYPE_REDEFINITIONS
#define USE_COMMON_CONSTANT
#define USE_PLIB_WARNING_SUPRESSION

/************************************************************************
* Basic Type Redefinition
************************************************************************/
#ifdef USE_SCH_TYPE_REDEFINITIONS
    #define INT_8                                       char
    #define UINT_8					unsigned char
    #define INT1_6					int
    #define UINT_16					unsigned int
    #define INT_16					int
    #define UINT_16					unsigned int
    #define INT_32					long
    #define UINT_32					unsigned long
#endif

/************************************************************************
* Common Constants
************************************************************************/
#ifdef USE_COMMON_CONSTANT
    #define K_ON                                            ((UINT8)(1))
    #define K_OFF                                           ((UINT8)(0))

    #define K_HIGH                                          ((UINT8)(1))
    #define K_LOW                                           ((UINT8)(0))

    #define K_MCHP_INPUT                                    ((UINT8)(1))
    #define K_MCHP_OUTPUT                                   ((UINT8)(0))
#endif

/************************************************************************
* Plib Waring Suppression
************************************************************************/
#ifdef USE_PLIB_WARNING_SUPRESSION
    #define _SUPPRESS_PLIB_WARNING
#endif

#endif	/* COMMON_H */

