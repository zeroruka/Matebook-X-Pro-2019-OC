/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of iASLsTq2bs.aml, Fri Sep 10 14:15:29 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000018B (395)
 *     Revision         0x02
 *     Checksum         0x83
 *     OEM ID           "hack"
 *     OEM Table ID     "ADP1"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180427 (538444839)
 */
DefinitionBlock ("", "SSDT", 2, "besooz", "ZWAK", 0x00000000)
{
    External (_SB_.PCI0.RP05.PXSX._OFF, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PCI0.RP05.PXSX._ON_, MethodObj)    // 0 Arguments (from opcode)
    External (ZPTS, MethodObj)    // 1 Arguments (from opcode)
    External (ZWAK, MethodObj)    // 1 Arguments (from opcode)

    Device (DGPU)
    {
        Name (_HID, "DGPU1000")  // _HID: Hardware ID
        Name (RMEN, One)
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            _OFF ()
        }

        Method (_ON, 0, NotSerialized)  // _ON_: Power On
        {
            If (CondRefOf (\_SB.PCI0.RP05.PXSX._ON))
            {
                \_SB.PCI0.RP05.PXSX._ON ()
            }
        }

        Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
        {
            If (CondRefOf (\_SB.PCI0.RP05.PXSX._OFF))
            {
                \_SB.PCI0.RP05.PXSX._OFF ()
            }
        }
    }

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        If (CondRefOf (\_SB.PCI0.RP05.PXSX._ON))
        {
            \_SB.PCI0.RP05.PXSX._ON ()
        }

        ZPTS (Arg0)
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        Store (ZWAK (Arg0), Local0)
        If (CondRefOf (\_SB.PCI0.RP05.PXSX._OFF))
        {
            \_SB.PCI0.RP05.PXSX._OFF ()
        }

        Return (Local0)
    }
}

