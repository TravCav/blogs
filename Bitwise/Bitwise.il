
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
// MVID: {5028A6E8-3DDF-443F-9F07-74E4B98E2A02}
.imagebase 0x00400000
.file alignment 0x00000200
.stackreserve 0x00100000
.subsystem 0x0003       // WINDOWS_CUI
.corflags 0x00000001    //  ILONLY
// Image base: 0x00350000


// =============== CLASS MEMBERS DECLARATION ===================

.class public auto ansi beforefieldinit BlogStuff.Bitwise
       extends [mscorlib]System.Object
{
  .class auto ansi sealed nested private UserPermissions
         extends [mscorlib]System.Enum
  {
    .custom instance void [mscorlib]System.FlagsAttribute::.ctor() = ( 01 00 00 00 ) 
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype BlogStuff.Bitwise/UserPermissions View = int32(0x00000001)
    .field public static literal valuetype BlogStuff.Bitwise/UserPermissions Create = int32(0x00000002)
    .field public static literal valuetype BlogStuff.Bitwise/UserPermissions Edit = int32(0x00000004)
    .field public static literal valuetype BlogStuff.Bitwise/UserPermissions Delete = int32(0x00000008)
    .field public static literal valuetype BlogStuff.Bitwise/UserPermissions ViewPayRates = int32(0x00000010)
    .field public static literal valuetype BlogStuff.Bitwise/UserPermissions ManageRoles = int32(0x00000020)
  } // end of class UserPermissions

  .method public hidebysig static void  Main() cil managed
  {
    .entrypoint
    // 
    .maxstack  2
    .locals init (valuetype BlogStuff.Bitwise/UserPermissions V_0,
             valuetype BlogStuff.Bitwise/UserPermissions V_1,
             valuetype BlogStuff.Bitwise/UserPermissions V_2,
             bool V_3)
    IL_0000:  nop
    IL_0001:  ldc.i4.s   17
    IL_0003:  stloc.0
    IL_0004:  ldloc.0
    IL_0005:  stloc.1
    IL_0006:  ldloc.1
    IL_0007:  ldc.i4.1
    IL_0008:  and
    IL_0009:  ldc.i4.1
    IL_000a:  ceq
    IL_000c:  ldc.i4.0
    IL_000d:  ceq
    IL_000f:  stloc.3
    IL_0010:  ldloc.3
    IL_0011:  brtrue.s   IL_0020

    IL_0013:  nop
    IL_0014:  ldstr      "I can view user info"
    IL_0019:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_001e:  nop
    IL_001f:  nop
    IL_0020:  ldloc.1
    IL_0021:  ldc.i4.4
    IL_0022:  and
    IL_0023:  ldc.i4.4
    IL_0024:  ceq
    IL_0026:  ldc.i4.0
    IL_0027:  ceq
    IL_0029:  stloc.3
    IL_002a:  ldloc.3
    IL_002b:  brtrue.s   IL_003a

    IL_002d:  nop
    IL_002e:  ldstr      "I can edit user info"
    IL_0033:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_0038:  nop
    IL_0039:  nop
    IL_003a:  ldloc.1
    IL_003b:  ldc.i4.2
    IL_003c:  or
    IL_003d:  stloc.1
    IL_003e:  ldloc.1
    IL_003f:  ldloc.0
    IL_0040:  ceq
    IL_0042:  ldc.i4.0
    IL_0043:  ceq
    IL_0045:  stloc.3
    IL_0046:  ldloc.3
    IL_0047:  brtrue.s   IL_0056

    IL_0049:  nop
    IL_004a:  ldstr      "I only have View and ViewPayRates and nothing else."
    IL_004f:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_0054:  nop
    IL_0055:  nop
    IL_0056:  ldc.i4.s   17
    IL_0058:  stloc.2
    IL_0059:  ldloc.1
    IL_005a:  ldloc.2
    IL_005b:  and
    IL_005c:  ldloc.2
    IL_005d:  ceq
    IL_005f:  ldc.i4.0
    IL_0060:  ceq
    IL_0062:  stloc.3
    IL_0063:  ldloc.3
    IL_0064:  brtrue.s   IL_0073

    IL_0066:  nop
    IL_0067:  ldstr      "I have view and ViewPayRates and maybe other thing"
    + "s or not."
    IL_006c:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_0071:  nop
    IL_0072:  nop
    IL_0073:  ldloc.1
    IL_0074:  ldc.i4.s   16
    IL_0076:  clt
    IL_0078:  stloc.3
    IL_0079:  ldloc.3
    IL_007a:  brtrue.s   IL_0089

    IL_007c:  nop
    IL_007d:  ldstr      "I have admin permissions"
    IL_0082:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_0087:  nop
    IL_0088:  nop
    IL_0089:  ldstr      "Press any key to exit."
    IL_008e:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_0093:  nop
    IL_0094:  call       int32 [mscorlib]System.Console::Read()
    IL_0099:  pop
    IL_009a:  ret
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
