
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
// MVID: {27E0B3EC-6726-48BF-B441-E26523F39103}
.imagebase 0x00400000
.file alignment 0x00000200
.stackreserve 0x00100000
.subsystem 0x0003       // WINDOWS_CUI
.corflags 0x00000001    //  ILONLY
// Image base: 0x001D0000


// =============== CLASS MEMBERS DECLARATION ===================

.class private auto ansi beforefieldinit BlogStuff.Bitwise
       extends [mscorlib]System.Object
{
  .class auto ansi sealed nested private Log
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype BlogStuff.Bitwise/Log None = int32(0x00000000)
    .field public static literal valuetype BlogStuff.Bitwise/Log Debug = int32(0x00000001)
    .field public static literal valuetype BlogStuff.Bitwise/Log Console = int32(0x00000002)
    .field public static literal valuetype BlogStuff.Bitwise/Log File = int32(0x00000004)
    .field public static literal valuetype BlogStuff.Bitwise/Log Db = int32(0x00000008)
    .field public static literal valuetype BlogStuff.Bitwise/Log Email = int32(0x00000010)
  } // end of class Log

  .field private static valuetype BlogStuff.Bitwise/Log Logging
  .method private hidebysig static void  Main(string[] args) cil managed
  {
    .entrypoint
    // 
    .maxstack  8
    IL_0000:  nop
    IL_0001:  ldc.i4.7
    IL_0002:  stsfld     valuetype BlogStuff.Bitwise/Log BlogStuff.Bitwise::Logging
    IL_0007:  ldstr      "Gonna log to the debug window, the console, and a "
    + "file"
    IL_000c:  call       void BlogStuff.Bitwise::DoLogging(string)
    IL_0011:  nop
    IL_0012:  ldstr      "Press any key to exit."
    IL_0017:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_001c:  nop
    IL_001d:  call       int32 [mscorlib]System.Console::Read()
    IL_0022:  pop
    IL_0023:  ret
  } // end of method Bitwise::Main

  .method private hidebysig static void  DoLogging(string msg) cil managed
  {
    // 
    .maxstack  2
    .locals init (bool V_0)
    IL_0000:  nop
    IL_0001:  ldsfld     valuetype BlogStuff.Bitwise/Log BlogStuff.Bitwise::Logging
    IL_0006:  ldc.i4.1
    IL_0007:  and
    IL_0008:  ldc.i4.1
    IL_0009:  ceq
    IL_000b:  ldc.i4.0
    IL_000c:  ceq
    IL_000e:  stloc.0
    IL_000f:  ldloc.0
    IL_0010:  brtrue.s   IL_001f

    IL_0012:  nop
    IL_0013:  ldstr      "Log to debug window"
    IL_0018:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_001d:  nop
    IL_001e:  nop
    IL_001f:  ldsfld     valuetype BlogStuff.Bitwise/Log BlogStuff.Bitwise::Logging
    IL_0024:  ldc.i4.2
    IL_0025:  and
    IL_0026:  ldc.i4.2
    IL_0027:  ceq
    IL_0029:  ldc.i4.0
    IL_002a:  ceq
    IL_002c:  stloc.0
    IL_002d:  ldloc.0
    IL_002e:  brtrue.s   IL_004e

    IL_0030:  nop
    IL_0031:  ldstr      "Log to console"
    IL_0036:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_003b:  nop
    IL_003c:  ldstr      "Log: "
    IL_0041:  ldarg.0
    IL_0042:  call       string [mscorlib]System.String::Concat(string,
                                                                string)
    IL_0047:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_004c:  nop
    IL_004d:  nop
    IL_004e:  ldsfld     valuetype BlogStuff.Bitwise/Log BlogStuff.Bitwise::Logging
    IL_0053:  ldc.i4.4
    IL_0054:  and
    IL_0055:  ldc.i4.4
    IL_0056:  ceq
    IL_0058:  ldc.i4.0
    IL_0059:  ceq
    IL_005b:  stloc.0
    IL_005c:  ldloc.0
    IL_005d:  brtrue.s   IL_006c

    IL_005f:  nop
    IL_0060:  ldstr      "Log to file"
    IL_0065:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_006a:  nop
    IL_006b:  nop
    IL_006c:  ldsfld     valuetype BlogStuff.Bitwise/Log BlogStuff.Bitwise::Logging
    IL_0071:  ldc.i4.8
    IL_0072:  and
    IL_0073:  ldc.i4.8
    IL_0074:  ceq
    IL_0076:  ldc.i4.0
    IL_0077:  ceq
    IL_0079:  stloc.0
    IL_007a:  ldloc.0
    IL_007b:  brtrue.s   IL_008a

    IL_007d:  nop
    IL_007e:  ldstr      "Log to Db"
    IL_0083:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_0088:  nop
    IL_0089:  nop
    IL_008a:  ldsfld     valuetype BlogStuff.Bitwise/Log BlogStuff.Bitwise::Logging
    IL_008f:  ldc.i4.s   16
    IL_0091:  and
    IL_0092:  ldc.i4.s   16
    IL_0094:  ceq
    IL_0096:  ldc.i4.0
    IL_0097:  ceq
    IL_0099:  stloc.0
    IL_009a:  ldloc.0
    IL_009b:  brtrue.s   IL_00aa

    IL_009d:  nop
    IL_009e:  ldstr      "Log to email"
    IL_00a3:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_00a8:  nop
    IL_00a9:  nop
    IL_00aa:  ret
  } // end of method Bitwise::DoLogging

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // 
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  call       instance void [mscorlib]System.Object::.ctor()
    IL_0006:  ret
  } // end of method Bitwise::.ctor

  .method private hidebysig specialname rtspecialname static 
          void  .cctor() cil managed
  {
    // 
    .maxstack  8
    IL_0000:  ldc.i4.0
    IL_0001:  stsfld     valuetype BlogStuff.Bitwise/Log BlogStuff.Bitwise::Logging
    IL_0006:  ret
  } // end of method Bitwise::.cctor

} // end of class BlogStuff.Bitwise


// =============================================================

// 
// 
