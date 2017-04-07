 private sealed class LogClass
        {
            public const int None = 0;
            public const int Console = 1;
            public const int File = 2;
            public const int Db = 4;
            public const int Email = 4;
            //// static LogClass(){}
        }

        private enum Log 
        {
            None = 0,
            Console = 1,
            File = 2,
            Db = 4,
            Email = 8
        }

.class auto ansi sealed nested private beforefieldinit LogClass
         extends [mscorlib]System.Object
  {
    .field public static literal int32 None = int32(0x00000000)
    .field public static literal int32 Console = int32(0x00000001)
    .field public static literal int32 File = int32(0x00000002)
    .field public static literal int32 Db = int32(0x00000004)
    .field public static literal int32 Email = int32(0x00000004)
    .method public hidebysig specialname rtspecialname 
            instance void  .ctor() cil managed
    {
      // 
      .maxstack  8
      IL_0000:  ldarg.0
      IL_0001:  call       instance void [mscorlib]System.Object::.ctor()
      IL_0006:  ret
    } // end of method LogClass::.ctor

  } // end of class LogClass

  .class auto ansi sealed nested private Log
         extends [mscorlib]System.Enum
  {
    .field public specialname rtspecialname int32 value__
    .field public static literal valuetype BlogStuff.Bitwise/Log None = int32(0x00000000)
    .field public static literal valuetype BlogStuff.Bitwise/Log Console = int32(0x00000001)
    .field public static literal valuetype BlogStuff.Bitwise/Log File = int32(0x00000002)
    .field public static literal valuetype BlogStuff.Bitwise/Log Db = int32(0x00000004)
    .field public static literal valuetype BlogStuff.Bitwise/Log Email = int32(0x00000008)
  } // end of class Log