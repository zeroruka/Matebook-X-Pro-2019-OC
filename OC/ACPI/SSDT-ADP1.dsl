/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of iASLYNyZO6.aml, Fri Sep 10 14:13:20 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000064 (100)
 *     Revision         0x02
 *     Checksum         0x0F
 *     OEM ID           "hack"
 *     OEM Table ID     "ADP1"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180427 (538444839)
 */
DefinitionBlock ("", "SSDT", 2, "besooz", "ADP1", 0x00000000)
{
    External (_SB_.ADP1, DeviceObj)    // (from opcode)

    If (_OSI ("Darwin"))
    {
        Scope (\_SB.ADP1)
        {
            Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
            {
                0x18, 
                0x03
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }
    }
}

