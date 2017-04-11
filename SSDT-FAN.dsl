// fan/temperature readings only (fan behavior is BIOS)

DefinitionBlock ("", "SSDT", 2, "hack", "fan", 0)
{
    External(\_SB.PCI0, DeviceObj)
    External(\_SB.PCI0.LPCB, DeviceObj)
    External(\_SB.PCI0.LPCB.EC, DeviceObj)
    External(\_SB.PCI0.LPCB.EC.FANH, FieldUnitObj)
    External(\_SB.PCI0.LPCB.EC.FANL, FieldUnitObj)
    External(\_SB.PCI0.LPCB.EC.FA2H, FieldUnitObj)
    External(\_SB.PCI0.LPCB.EC.FA2L, FieldUnitObj)    

    Device (SMCD)
    {
        Name (_HID, "FAN00000") // _HID: Hardware ID
        // ACPISensors.kext configuration
        Name (TACH, Package()
        {
            "System Fan", "FAN0", 
            "CPUFan", "FAN1"      
        })
        // Actual methods to implement fan/temp readings/control
        Method (FAN0, 0, Serialized)
        {                
            Store (\_SB.PCI0.LPCB.EC.FANH, Local0)
            Store (\_SB.PCI0.LPCB.EC.FANL, Local1)
            And (Local0, 0xFFFF, Local0)
            And (Local1, 0xFFFF, Local1)
            If (LNotEqual (Local0, Zero))
            {
                    //If (LEqual (Local0, 0xFFFF))
                    //{
                    //    Store (Zero, Local0)
                    //}
                    //Else
                    //{
                        Store (0x0100, Local2)
                        Multiply (Local0, Local2, Local3)
                        Add (Local1, Local3, Local4)
                        Store (Local4, Local0)
                    //}
            }
            Else
            {
                Store (Zero, Local0)
            }
            Return (Local0)
        }
        
        Method (FAN1, 0, Serialized)
        {                
            Store (\_SB.PCI0.LPCB.EC.FA2H, Local0)
            Store (\_SB.PCI0.LPCB.EC.FA2L, Local1)
            And (Local0, 0xFFFF, Local0)
            And (Local1, 0xFFFF, Local1)
            If (LNotEqual (Local0, Zero))
            {
                    //If (LEqual (Local0, 0xFFFF))
                    //{
                    //    Store (Zero, Local0)
                    //}
                    //Else
                    //{
                        Store (0x0100, Local2)
                        Multiply (Local0, Local2, Local3)
                        Add (Local1, Local3, Local4)
                        Store (Local4, Local0)
                    //}
            }
            Else
            {
                Store (Zero, Local0)
            }
            Return (Local0)
        }
     }
}
//EOF
