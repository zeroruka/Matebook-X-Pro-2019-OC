/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of iASLWxCi1E.aml, Fri Sep 10 14:14:35 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000001D1 (465)
 *     Revision         0x02
 *     Checksum         0x80
 *     OEM ID           "HUAWEI"
 *     OEM Table ID     "_LID"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180427 (538444839)
 */
DefinitionBlock ("", "SSDT", 2, "besooz", "_LID", 0x00000000)
{
    External (_SB_.PCI0.GFX0.CLID, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.HWEC, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.HWEC.ALSD, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.HWEC.LID_, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.HWEC.LIDV, MethodObj)    // 0 Arguments (from opcode)
    External (ADBG, MethodObj)    // 1 Arguments (from opcode)
    External (LIDS, FieldUnitObj)    // (from opcode)
    External (SGOV, MethodObj)    // 2 Arguments (from opcode)

    Scope (_SB.PCI0.LPCB.HWEC.LID)
    {
        Name (LIDC, Zero)
        Method (_LID, 0, NotSerialized)  // _LID: Lid Status
        {
            Store (LIDV (), Local0)
            If (LLessEqual (LIDC, One))
            {
                Add (LIDC, One, LIDC)
                Store (One, Local0)
            }

            Store (Local0, \_SB.PCI0.GFX0.CLID)
            Return (Local0)
        }
    }

    Scope (_SB.PCI0.LPCB.HWEC)
    {
        Method (_Q81, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (\_SB.PCI0.LPCB.HWEC.LID._LID (), Local0)
            If (LEqual (Local0, Zero))
            {
                ADBG ("LID-OFF")
                SGOV (0x02030009, Zero)
                SGOV (0x02060000, Zero)
            }
            Else
            {
                ADBG ("LID-ON")
                SGOV (0x02030009, One)
                SGOV (0x02060000, One)
                Notify (\_SB.PCI0.LPCB.HWEC.ALSD, 0x80)
            }

            Store (Local0, LIDS)
            Store (Local0, \_SB.PCI0.GFX0.CLID)
            Notify (LID, 0x80)
        }
    }
}

