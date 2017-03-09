
//  Microsoft (R) .NET Framework IL Disassembler.  Version 4.6.1055.0
//  Copyright (c) Microsoft Corporation.  All rights reserved.



// Metadata version: v4.0.30319
.assembly extern mscorlib
{
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 )                         // .z\V.4..
  .ver 4:0:0:0
}
.assembly Bitwise
{
  .custom instance void [mscorlib]System.Runtime.CompilerServices.CompilationRelaxationsAttribute::.ctor(int32) = ( 01 00 08 00 00 00 00 00 ) 
  .custom instance void [mscorlib]System.Runtime.CompilerServices.RuntimeCompatibilityAttribute::.ctor() = ( 01 00 01 00 54 02 16 57 72 61 70 4E 6F 6E 45 78   // ....T..WrapNonEx
                                                                                                             63 65 70 74 69 6F 6E 54 68 72 6F 77 73 01 )       // ceptionThrows.
  .hash algorithm 0x00008004
  .ver 0:0:0:0
}
.module Bitwise.exe
// MVID: {D2F35B30-B75C-4FC4-97D9-B5FB6F33E3B2}
.imagebase 0x00400000
.file alignment 0x00000200
.stackreserve 0x00100000
.subsystem 0x0003       // WINDOWS_CUI
.corflags 0x00000001    //  ILONLY
// Image base: 0x01670000


// =============== CLASS MEMBERS DECLARATION ===================

.class private auto ansi beforefieldinit BlogStuff.Bitwise
       extends [mscorlib]System.Object
{
  .class auto ansi sealed nested private Flags
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype BlogStuff.Bitwise/Flags Console = int32(0x00000001)
    .field public static literal valuetype BlogStuff.Bitwise/Flags File = int32(0x00000002)
    .field public static literal valuetype BlogStuff.Bitwise/Flags Db = int32(0x00000004)
    .field public static literal valuetype BlogStuff.Bitwise/Flags Email = int32(0x00000008)
  } // end of class Flags

  .method public hidebysig static void  Main() cil managed
  {
    .entrypoint
    // 
    .maxstack  2
    .locals init (valuetype BlogStuff.Bitwise/Flags V_0,
             bool V_1)
    IL_0000:  nop
    IL_0001:  ldc.i4.3
    IL_0002:  stloc.0
    IL_0003:  ldloc.0
    IL_0004:  ldc.i4.1
    IL_0005:  and
    IL_0006:  ldc.i4.1
    IL_0007:  ceq
    IL_0009:  ldc.i4.0
    IL_000a:  ceq
    IL_000c:  stloc.1
    IL_000d:  ldloc.1
    IL_000e:  brtrue.s   IL_001d

    IL_0010:  nop
    IL_0011:  ldstr      "Log to console"
    IL_0016:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_001b:  nop
    IL_001c:  nop
    IL_001d:  ldloc.0
    IL_001e:  ldc.i4.2
    IL_001f:  and
    IL_0020:  ldc.i4.2
    IL_0021:  ceq
    IL_0023:  ldc.i4.0
    IL_0024:  ceq
    IL_0026:  stloc.1
    IL_0027:  ldloc.1
    IL_0028:  brtrue.s   IL_0037

    IL_002a:  nop
    IL_002b:  ldstr      "Log to file"
    IL_0030:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_0035:  nop
    IL_0036:  nop
    IL_0037:  ldloc.0
    IL_0038:  ldc.i4.4
    IL_0039:  and
    IL_003a:  ldc.i4.4
    IL_003b:  ceq
    IL_003d:  ldc.i4.0
    IL_003e:  ceq
    IL_0040:  stloc.1
    IL_0041:  ldloc.1
    IL_0042:  brtrue.s   IL_0051

    IL_0044:  nop
    IL_0045:  ldstr      "Log to database"
    IL_004a:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_004f:  nop
    IL_0050:  nop
    IL_0051:  ldloc.0
    IL_0052:  ldc.i4.8
    IL_0053:  and
    IL_0054:  ldc.i4.8
    IL_0055:  ceq
    IL_0057:  ldc.i4.0
    IL_0058:  ceq
    IL_005a:  stloc.1
    IL_005b:  ldloc.1
    IL_005c:  brtrue.s   IL_006b

    IL_005e:  nop
    IL_005f:  ldstr      "Log to email"
    IL_0064:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_0069:  nop
    IL_006a:  nop
    IL_006b:  ldstr      "Press any key to exit."
    IL_0070:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_0075:  nop
    IL_0076:  call       valuetype [mscorlib]System.ConsoleKeyInfo [mscorlib]System.Console::ReadKey()
    IL_007b:  pop
    IL_007c:  ret
  } // end of method Bitwise::Main

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // 
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  call       instance void [mscorlib]System.Object::.ctor()
    IL_0006:  ret
  } // end of method Bitwise::.ctor

} // end of class BlogStuff.Bitwise


// =============================================================

// 
// 
