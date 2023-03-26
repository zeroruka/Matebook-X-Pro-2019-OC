/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of iASLvwKUHO.aml, Wed Jul 14 12:29:58 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000057C (1404)
 *     Revision         0x02
 *     Checksum         0xB0
 *     OEM ID           "HUAWEI"
 *     OEM Table ID     "TPXX"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200110 (538968336)
 */
DefinitionBlock ("", "SSDT", 2, "besooz", "TPXX", 0x00000000)
{
    External (_SB_.GNUM, MethodObj)    // 1 Arguments (from opcode)
    External (_SB_.INUM, MethodObj)    // 1 Arguments (from opcode)
    External (_SB_.PCI0.GPI0, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.HIDD, MethodObj)    // 5 Arguments (from opcode)
    External (_SB_.PCI0.HIDG, BuffObj)    // (from opcode)
    External (_SB_.PCI0.I2C0, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.I2C1, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.TP7D, MethodObj)    // 6 Arguments (from opcode)
    External (_SB_.PCI0.TP7G, BuffObj)    // (from opcode)
    External (_SB_.SHPO, MethodObj)    // 2 Arguments (from opcode)
    External (GPEN, FieldUnitObj)    // (from opcode)
    External (SDM0, FieldUnitObj)    // (from opcode)
    External (SDM1, FieldUnitObj)    // (from opcode)
    External (SDS0, FieldUnitObj)    // (from opcode)
    External (SDS1, FieldUnitObj)    // (from opcode)
    External (TPDB, FieldUnitObj)    // (from opcode)
    External (TPDH, FieldUnitObj)    // (from opcode)
    External (TPDS, FieldUnitObj)    // (from opcode)
    External (TPDM, FieldUnitObj)    // (from opcode)
    External (TPDT, FieldUnitObj)    // (from opcode)  

  

    External (TPLM, FieldUnitObj)    // (from opcode)
    External (TPLT, FieldUnitObj)    // (from opcode)



    Scope (\)
    {
        If (_OSI ("Darwin"))
        {

            Store (Zero, SDS1)
            Store (Zero, SDS0)
        }
    }

    Scope (_SB.PCI0.I2C1)
    {
     Device (TPLX)
        {
            Name (HID2, Zero)
            Name (SBFB, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x004C, ControllerInitiated, 0x00061A80,
                    AddressingMode7Bit, "\\_SB.PCI0.I2C1",
                    0x00, ResourceConsumer, _Y5C, Exclusive,
                    )
            })
            Name (SBFG, ResourceTemplate ()
            {
                GpioInt (Level, ActiveLow, Exclusive, PullDefault, 0x0000,
                    "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x0055
                    }
            })
            Name (SBFI, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, _Y5D)
                {
                    0x00000000,
                }
            })
            CreateWordField (SBFB, \_SB.PCI0.I2C1.TPLX._Y5C._ADR, BADR)  // _ADR: Address
            CreateDWordField (SBFB, \_SB.PCI0.I2C1.TPLX._Y5C._SPE, SPED)  // _SPE: Speed
            CreateWordField (SBFG, 0x17, INT1)
            CreateDWordField (SBFI, \_SB.PCI0.I2C1.TPLX._Y5D._INT, INT2)  // _INT: Interrupts
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {


                Store (GNUM (0x0403000D), INT1)
                Store (INUM (0x0403000D), INT2)
                If (LEqual (TPLM, Zero))
                {
                    SHPO (0x0403000D, One)
                }

 

                If (LEqual (TPLT, 0x0A))
                {
                    Store ("SYNA1D31", _HID)
                    Store (0x20, HID2)
                    Store (0x15, BADR)
                    Store (0x00061A80, SPED)
                    Return (Zero)
                }
            }

            Name (_HID, "XXXX0000")  // _HID: Hardware ID
            Name (_CID, "PNP0C50")  // _CID: Compatible ID
            Name (_S0W, 0x04)  // _S0W: S0 Device Wake State
            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If (LEqual (Arg0, HIDG))
                {
                    Return (HIDD (Arg0, Arg1, Arg2, Arg3, HID2))
                }

                If (LEqual (Arg0, TP7G))
                {
                    Return (TP7D (Arg0, Arg1, Arg2, Arg3, SBFB, SBFG))
                }

                Return (Buffer (One)
                {
                     0x00                                           
                })
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                    Return (ConcatenateResTemplate (SBFB, SBFG))
            }
        }
    }

    Scope (_SB.PCI0.I2C0)
    {
        Device (TPDX)
        {
            Name (HID2, Zero)
            Name (SBFB, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x0020, ControllerInitiated, 0x00061A80,
                    AddressingMode7Bit, "\\_SB.PCI0.I2C0",
                    0x00, ResourceConsumer, _Y5A, Exclusive,
                    )
            })
            Name (SBFG, ResourceTemplate ()
            {
                GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                    "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x0091
                    }
            })
            Name (SBFI, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveLow, ExclusiveAndWake, ,, _Y5B)
                {
                    0x00000000,
                }
            })
            CreateWordField (SBFB, \_SB.PCI0.I2C0.TPDX._Y5A._ADR, BADR)  // _ADR: Address
            CreateDWordField (SBFB, \_SB.PCI0.I2C0.TPDX._Y5A._SPE, SPED)  // _SPE: Speed
            CreateWordField (SBFG, 0x17, INT1)
            CreateDWordField (SBFI, \_SB.PCI0.I2C0.TPDX._Y5B._INT, INT2)  // _INT: Interrupts
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {


                Store (GNUM (0x04060001), INT1)
                Store (INUM (0x04060001), INT2)
                If (LEqual (TPDM, Zero))
                {
                    SHPO (0x04060001, One)
                }

                If (LEqual (TPDT, One))
                {
                    Store ("SYNA2393", _HID)
                    Store (0x20, HID2)
                    Return (Zero)
                }

                If (LEqual (TPDT, 0x02))
                {
                    Store ("06CB2846", _HID)
                    Store (0x20, HID2)
                    Return (Zero)
                }

                If (LEqual (TPDT, 0x06))
                {
                    Store ("ALPS0000", _HID)
                    Store (0x20, HID2)
                    Store (0x2C, BADR)
                    Return (Zero)
                }

                If (LEqual (TPDT, 0x05))
                {
                    Store ("SYNA2393", _HID)
                    Store (TPDH, HID2)
                    Store (TPDB, BADR)
                    If (LEqual (TPDS, Zero))
                    {
                        Store (0x000186A0, SPED)
                    }

                    If (LEqual (TPDS, One))
                    {
                        Store (0x00061A80, SPED)
                    }

                    If (LEqual (TPDS, 0x02))
                    {
                        Store (0x000F4240, SPED)
                    }

                    Return (Zero)
                }
            }

            Name (_HID, "XXXX0000")  // _HID: Hardware ID
            Name (_CID, "PNP0C50")  // _CID: Compatible ID
            Name (_S0W, 0x03)  // _S0W: S0 Device Wake State
            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If (LEqual (Arg0, HIDG))
                {
                    Return (HIDD (Arg0, Arg1, Arg2, Arg3, HID2))
                }

                If (LEqual (Arg0, TP7G))
                {
                    Return (TP7D (Arg0, Arg1, Arg2, Arg3, SBFB, SBFG))
                }

                Return (Buffer (One)
                {
                     0x00                                           
                })
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                     Return (ConcatenateResTemplate (SBFB, SBFG))
            }
        }
    }
}

