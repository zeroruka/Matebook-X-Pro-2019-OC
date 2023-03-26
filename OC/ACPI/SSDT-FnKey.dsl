/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of iASL8hiZCf.aml, Fri Sep 10 14:14:10 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000001C4 (452)
 *     Revision         0x02
 *     Checksum         0x23
 *     OEM ID           "ACDT"
 *     OEM Table ID     "BrightFN"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180427 (538444839)
 */
DefinitionBlock ("", "SSDT", 2, "besooz", "BrightFN", 0x00000000)
{
    External (_SB_.AMW0, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.HWEC, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.HWEC.ECRD, MethodObj)    // 1 Arguments (from opcode)
    External (_SB_.PCI0.LPCB.HWEC.ECWT, MethodObj)    // 2 Arguments (from opcode)
    External (_SB_.PCI0.LPCB.HWEC.LID_, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.HWEC.WMEN, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.HWEC.XQ0A, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PCI0.LPCB.HWEC.XQ0B, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)    // (from opcode)
    External (ADBG, MethodObj)    // 1 Arguments (from opcode)
    External (LDST, FieldUnitObj)    // (from opcode)

    Scope (_SB.PCI0.LPCB.HWEC)
    {
        Method (_Q0A, 0, NotSerialized)  // _Qxx: EC Query
        {
            If (_OSI ("Darwin"))
            {
                Notify (PS2K, 0x0205)
                Notify (PS2K, 0x0285)
            }
            Else
            {
                XQ0A ()
            }
        }

        Method (_Q0B, 0, NotSerialized)  // _Qxx: EC Query
        {
            If (_OSI ("Darwin"))
            {
                Notify (PS2K, 0x0206)
                Notify (PS2K, 0x0286)
            }
            Else
            {
                XQ0B ()
            }
        }

        Method (_Q10, 0, NotSerialized)  // _Qxx: EC Query
        {
            ADBG ("Fn+F7")
            If (LEqual (ECRD (RefOf (LDST)), Zero))
            {
                ECWT (One, RefOf (LDST))
            }
            Else
            {
                ECWT (Zero, RefOf (LDST))
            }

            Notify (LID, 0x80)
            Store (0x0287, WMEN)
            Notify (AMW0, 0xA0)
        }
    }
}

