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
    
    External (_SB_.PCI0.I2CM, MethodObj)    // 6 Arguments (from opcode)  
    External (_SB_.PCI0.I2C1.INC1, MethodObj)    // 0 Arguments (from opcode)    
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
    External (TPLS, FieldUnitObj)    // (from opcode)
    External (TPLH, FieldUnitObj)    // (from opcode)
    External (TPLB, FieldUnitObj)    // (from opcode)
    External (SDS0, FieldUnitObj)    // (from opcode)
    External (SDS1, FieldUnitObj)    // (from opcode)
    External (TPDB, FieldUnitObj)    // (from opcode)
    External (TPDH, FieldUnitObj)    // (from opcode)
    External (TPDS, FieldUnitObj)    // (from opcode)
    External (TPDM, FieldUnitObj)    // (from opcode)
    External (TPDT, FieldUnitObj)    // (from opcode)  

  

    External (TPLM, FieldUnitObj)    // (from opcode)
    External (TPLT, FieldUnitObj)    // (from opcode)



    Scope (_SB.PCI0.I2C0)
    {
        Name (I2CN, Zero)
        Name (I2CX, Zero)
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            Store (SDS0, I2CN)
            Store (Zero, I2CX)
        }

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
                Return (ConcatenateResTemplate (I2CM (I2CX, BADR, SPED), SBFG))
            }
        }
    }

    Scope (_SB.PCI0.I2C1)
    {
        Name (I2CN, Zero)
        Name (I2CX, Zero)
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            Store (SDS1, I2CN)
            Store (One, I2CX)
            If (CondRefOf (\_SB.PCI0.I2C1.INC1))
            {
                INC1 ()
            }
        }

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

                If (LEqual (TPLT, One))
                {
                    Store ("ATML3432", _HID)
                    Store (Zero, HID2)
                    Store (0x4C, BADR)
                    Store (0x00061A80, SPED)
                    Return (Zero)
                }

                If (LEqual (TPLT, 0x02))
                {
                    Store ("ATML2952", _HID)
                    Store (Zero, HID2)
                    Store (0x4A, BADR)
                    Store (0x00061A80, SPED)
                    Return (Zero)
                }

                If (LEqual (TPLT, 0x03))
                {
                    Store ("ELAN2097", _HID)
                    Store (One, HID2)
                    Store (0x10, BADR)
                    Store (0x00061A80, SPED)
                    Return (Zero)
                }

                If (LEqual (TPLT, 0x04))
                {
                    Store ("NTRG0001", _HID)
                    Store (One, HID2)
                    Store (0x07, BADR)
                    Store (0x00061A80, SPED)
                    Return (Zero)
                }

                If (LEqual (TPLT, 0x05))
                {
                    Store ("NTRG0002", _HID)
                    Store (One, HID2)
                    Store (0x64, BADR)
                    Store (0x00061A80, SPED)
                    Return (Zero)
                }

                If (LEqual (TPLT, 0x06))
                {
                    Store ("WCOM508E", _HID)
                    Store (One, HID2)
                    Store (0x0A, BADR)
                    If (LEqual (TPLS, Zero))
                    {
                        Store (0x00061A80, SPED)
                    }

                    If (LEqual (TPLS, One))
                    {
                        Store (0x000F4240, SPED)
                    }

                    Return (Zero)
                }

                If (LEqual (TPLT, 0x07))
                {
                    Store ("CUST0000", _HID)
                    Store (TPLH, HID2)
                    Store (TPLB, BADR)
                    If (LEqual (TPLS, Zero))
                    {
                        Store (0x000186A0, SPED)
                    }

                    If (LEqual (TPLS, One))
                    {
                        Store (0x00061A80, SPED)
                    }

                    If (LEqual (TPLS, 0x02))
                    {
                        Store (0x000F4240, SPED)
                    }

                    Return (Zero)
                }

                If (LEqual (TPLT, 0x08))
                {
                    Store ("SYNA1D31", _HID)
                    Store (0x20, HID2)
                    Store (0x2C, BADR)
                    Store (0x00061A80, SPED)
                    Return (Zero)
                }

                If (LEqual (TPLT, 0x09))
                {
                    Store ("ELAN2201", _HID)
                    Store (One, HID2)
                    Store (0x15, BADR)
                    Store (0x00061A80, SPED)
                    Return (Zero)
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
                Return (ConcatenateResTemplate (I2CM (I2CX, BADR, SPED), SBFG))
            }
        }
    }


}

