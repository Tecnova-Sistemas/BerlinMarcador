; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [355 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [1065 x i64] [
	i64 u0x001e58127c546039, ; 0: lib_System.Globalization.dll.so => 42
	i64 u0x0024d0f62dee05bd, ; 1: Xamarin.KotlinX.Coroutines.Core.dll => 303
	i64 u0x006b9d7c1c7e1c42, ; 2: de/Microsoft.Data.SqlClient.resources => 308
	i64 u0x0071cf2d27b7d61e, ; 3: lib_Xamarin.AndroidX.SwipeRefreshLayout.dll.so => 282
	i64 u0x01109b0e4d99e61f, ; 4: System.ComponentModel.Annotations.dll => 13
	i64 u0x02123411c4e01926, ; 5: lib_Xamarin.AndroidX.Navigation.Runtime.dll.so => 270
	i64 u0x02827b47e97f2378, ; 6: System.Security.Cryptography.Pkcs.dll => 213
	i64 u0x0284512fad379f7e, ; 7: System.Runtime.Handles => 107
	i64 u0x029b2c18aaa0996c, ; 8: lib-ko-Microsoft.Data.SqlClient.resources.dll.so => 313
	i64 u0x02a4c5a44384f885, ; 9: Microsoft.Extensions.Caching.Memory => 185
	i64 u0x02abedc11addc1ed, ; 10: lib_Mono.Android.Runtime.dll.so => 174
	i64 u0x02f55bf70672f5c8, ; 11: lib_System.IO.FileSystem.DriveInfo.dll.so => 48
	i64 u0x032267b2a94db371, ; 12: lib_Xamarin.AndroidX.AppCompat.dll.so => 224
	i64 u0x03621c804933a890, ; 13: System.Buffers => 7
	i64 u0x0399610510a38a38, ; 14: lib_System.Private.DataContractSerialization.dll.so => 88
	i64 u0x043032f1d071fae0, ; 15: ru/Microsoft.Maui.Controls.resources => 344
	i64 u0x044440a55165631e, ; 16: lib-cs-Microsoft.Maui.Controls.resources.dll.so => 322
	i64 u0x046eb1581a80c6b0, ; 17: vi/Microsoft.Maui.Controls.resources => 350
	i64 u0x0470607fd33c32db, ; 18: Microsoft.IdentityModel.Abstractions.dll => 198
	i64 u0x047408741db2431a, ; 19: Xamarin.AndroidX.DynamicAnimation => 244
	i64 u0x0517ef04e06e9f76, ; 20: System.Net.Primitives => 72
	i64 u0x0565d18c6da3de38, ; 21: Xamarin.AndroidX.RecyclerView => 274
	i64 u0x0581db89237110e9, ; 22: lib_System.Collections.dll.so => 12
	i64 u0x05989cb940b225a9, ; 23: Microsoft.Maui.dll => 206
	i64 u0x05a1c25e78e22d87, ; 24: lib_System.Runtime.CompilerServices.Unsafe.dll.so => 104
	i64 u0x05d8ca8ee551619f, ; 25: zh-Hant/Microsoft.Data.SqlClient.resources => 319
	i64 u0x06073ed944b92dc4, ; 26: lib-tr-Microsoft.Data.SqlClient.resources.dll.so => 317
	i64 u0x06076b5d2b581f08, ; 27: zh-HK/Microsoft.Maui.Controls.resources => 351
	i64 u0x06388ffe9f6c161a, ; 28: System.Xml.Linq.dll => 159
	i64 u0x06600c4c124cb358, ; 29: System.Configuration.dll => 19
	i64 u0x067f95c5ddab55b3, ; 30: lib_Xamarin.AndroidX.Fragment.Ktx.dll.so => 249
	i64 u0x0680a433c781bb3d, ; 31: Xamarin.AndroidX.Collection.Jvm => 231
	i64 u0x069fff96ec92a91d, ; 32: System.Xml.XPath.dll => 164
	i64 u0x070b0847e18dab68, ; 33: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 246
	i64 u0x0739448d84d3b016, ; 34: lib_Xamarin.AndroidX.VectorDrawable.dll.so => 286
	i64 u0x07469f2eecce9e85, ; 35: mscorlib.dll => 170
	i64 u0x07c57877c7ba78ad, ; 36: ru/Microsoft.Maui.Controls.resources.dll => 344
	i64 u0x07dcdc7460a0c5e4, ; 37: System.Collections.NonGeneric => 10
	i64 u0x08015600dcbf6dc7, ; 38: it/Microsoft.Data.SqlClient.resources.dll => 311
	i64 u0x08122e52765333c8, ; 39: lib_Microsoft.Extensions.Logging.Debug.dll.so => 195
	i64 u0x088610fc2509f69e, ; 40: lib_Xamarin.AndroidX.VectorDrawable.Animated.dll.so => 287
	i64 u0x08a7c865576bbde7, ; 41: System.Reflection.Primitives => 98
	i64 u0x08c9d051a4a817e5, ; 42: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 242
	i64 u0x08f3c9788ee2153c, ; 43: Xamarin.AndroidX.DrawerLayout => 243
	i64 u0x09138715c92dba90, ; 44: lib_System.ComponentModel.Annotations.dll.so => 13
	i64 u0x0919c28b89381a0b, ; 45: lib_Microsoft.Extensions.Options.dll.so => 196
	i64 u0x092266563089ae3e, ; 46: lib_System.Collections.NonGeneric.dll.so => 10
	i64 u0x09d144a7e214d457, ; 47: System.Security.Cryptography => 129
	i64 u0x09e2b9f743db21a8, ; 48: lib_System.Reflection.Metadata.dll.so => 97
	i64 u0x0a805f95d98f597b, ; 49: lib_Microsoft.Extensions.Caching.Abstractions.dll.so => 184
	i64 u0x0abb3e2b271edc45, ; 50: System.Threading.Channels.dll => 143
	i64 u0x0adeb6c0f5699d33, ; 51: Microsoft.Data.SqlClient.dll => 181
	i64 u0x0b06b1feab070143, ; 52: System.Formats.Tar => 39
	i64 u0x0b3b632c3bbee20c, ; 53: sk/Microsoft.Maui.Controls.resources => 345
	i64 u0x0b6aff547b84fbe9, ; 54: Xamarin.KotlinX.Serialization.Core.Jvm => 306
	i64 u0x0be2e1f8ce4064ed, ; 55: Xamarin.AndroidX.ViewPager => 289
	i64 u0x0c3ca6cc978e2aae, ; 56: pt-BR/Microsoft.Maui.Controls.resources => 341
	i64 u0x0c59ad9fbbd43abe, ; 57: Mono.Android => 175
	i64 u0x0c65741e86371ee3, ; 58: lib_Xamarin.Android.Glide.GifDecoder.dll.so => 218
	i64 u0x0c74af560004e816, ; 59: Microsoft.Win32.Registry.dll => 5
	i64 u0x0c7790f60165fc06, ; 60: lib_Microsoft.Maui.Essentials.dll.so => 207
	i64 u0x0c83c82812e96127, ; 61: lib_System.Net.Mail.dll.so => 68
	i64 u0x0cce4bce83380b7f, ; 62: Xamarin.AndroidX.Security.SecurityCrypto => 279
	i64 u0x0d13cd7cce4284e4, ; 63: System.Security.SecureString => 132
	i64 u0x0d63f4f73521c24f, ; 64: lib_Xamarin.AndroidX.SavedState.SavedState.Ktx.dll.so => 278
	i64 u0x0e04e702012f8463, ; 65: Xamarin.AndroidX.Emoji2 => 245
	i64 u0x0e14e73a54dda68e, ; 66: lib_System.Net.NameResolution.dll.so => 69
	i64 u0x0f37dd7a62ae99af, ; 67: lib_Xamarin.AndroidX.Collection.Ktx.dll.so => 232
	i64 u0x0f5e7abaa7cf470a, ; 68: System.Net.HttpListener => 67
	i64 u0x0fbe06392ef90569, ; 69: lib-ja-Microsoft.Data.SqlClient.resources.dll.so => 312
	i64 u0x1001f97bbe242e64, ; 70: System.IO.UnmanagedMemoryStream => 57
	i64 u0x102a31b45304b1da, ; 71: Xamarin.AndroidX.CustomView => 241
	i64 u0x1065c4cb554c3d75, ; 72: System.IO.IsolatedStorage.dll => 52
	i64 u0x108cf0e0ba098a51, ; 73: es/Microsoft.Data.SqlClient.resources => 309
	i64 u0x10bde46c4142194d, ; 74: Microsoft.Data.SqlClient.Internal.Logging => 183
	i64 u0x10f6cfcbcf801616, ; 75: System.IO.Compression.Brotli => 43
	i64 u0x114443cdcf2091f1, ; 76: System.Security.Cryptography.Primitives => 127
	i64 u0x11a603952763e1d4, ; 77: System.Net.Mail => 68
	i64 u0x11a70d0e1009fb11, ; 78: System.Net.WebSockets.dll => 83
	i64 u0x11f26371eee0d3c1, ; 79: lib_Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll.so => 259
	i64 u0x12128b3f59302d47, ; 80: lib_System.Xml.Serialization.dll.so => 161
	i64 u0x123639456fb056da, ; 81: System.Reflection.Emit.Lightweight.dll => 94
	i64 u0x12521e9764603eaa, ; 82: lib_System.Resources.Reader.dll.so => 101
	i64 u0x125b7f94acb989db, ; 83: Xamarin.AndroidX.RecyclerView.dll => 274
	i64 u0x126ee4b0de53cbfd, ; 84: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 202
	i64 u0x12d3b63863d4ab0b, ; 85: lib_System.Threading.Overlapped.dll.so => 144
	i64 u0x134eab1061c395ee, ; 86: System.Transactions => 154
	i64 u0x138567fa954faa55, ; 87: Xamarin.AndroidX.Browser => 228
	i64 u0x13a01de0cbc3f06c, ; 88: lib-fr-Microsoft.Maui.Controls.resources.dll.so => 328
	i64 u0x13beedefb0e28a45, ; 89: lib_System.Xml.XmlDocument.dll.so => 165
	i64 u0x13f1e5e209e91af4, ; 90: lib_Java.Interop.dll.so => 172
	i64 u0x13f1e880c25d96d1, ; 91: he/Microsoft.Maui.Controls.resources => 329
	i64 u0x13fd5cd93094a4e2, ; 92: BCrypt.Net-Next => 178
	i64 u0x1416d64c6430cb36, ; 93: Microsoft.Data.SqlClient.Internal.Logging.dll => 183
	i64 u0x143a1f6e62b82b56, ; 94: Microsoft.IdentityModel.Protocols.OpenIdConnect => 202
	i64 u0x143d8ea60a6a4011, ; 95: Microsoft.Extensions.DependencyInjection.Abstractions => 189
	i64 u0x1497051b917530bd, ; 96: lib_System.Net.WebSockets.dll.so => 83
	i64 u0x14d612a531c79c05, ; 97: Xamarin.JSpecify.dll => 300
	i64 u0x14e68447938213b7, ; 98: Xamarin.AndroidX.Collection.Ktx.dll => 232
	i64 u0x152a448bd1e745a7, ; 99: Microsoft.Win32.Primitives => 4
	i64 u0x1557de0138c445f4, ; 100: lib_Microsoft.Win32.Registry.dll.so => 5
	i64 u0x159cc6c81072f00e, ; 101: lib_System.Diagnostics.EventLog.dll.so => 211
	i64 u0x15bdc156ed462f2f, ; 102: lib_System.IO.FileSystem.dll.so => 51
	i64 u0x15e300c2c1668655, ; 103: System.Resources.Writer.dll => 103
	i64 u0x162be8a76b00cd97, ; 104: lib-de-Microsoft.Data.SqlClient.resources.dll.so => 308
	i64 u0x16bf2a22df043a09, ; 105: System.IO.Pipes.dll => 56
	i64 u0x16ea2b318ad2d830, ; 106: System.Security.Cryptography.Algorithms => 122
	i64 u0x16eeae54c7ebcc08, ; 107: System.Reflection.dll => 100
	i64 u0x1706ac686f4c5135, ; 108: lib_Microsoft.Data.SqlClient.Extensions.Abstractions.dll.so => 182
	i64 u0x17125c9a85b4929f, ; 109: lib_netstandard.dll.so => 171
	i64 u0x1716866f7416792e, ; 110: lib_System.Security.AccessControl.dll.so => 120
	i64 u0x174f71c46216e44a, ; 111: Xamarin.KotlinX.Coroutines.Core => 303
	i64 u0x1752c12f1e1fc00c, ; 112: System.Core => 21
	i64 u0x17b56e25558a5d36, ; 113: lib-hu-Microsoft.Maui.Controls.resources.dll.so => 332
	i64 u0x17f9358913beb16a, ; 114: System.Text.Encodings.Web => 139
	i64 u0x1809fb23f29ba44a, ; 115: lib_System.Reflection.TypeExtensions.dll.so => 99
	i64 u0x18402a709e357f3b, ; 116: lib_Xamarin.KotlinX.Serialization.Core.Jvm.dll.so => 306
	i64 u0x18a9befae51bb361, ; 117: System.Net.WebClient => 79
	i64 u0x18f0ce884e87d89a, ; 118: nb/Microsoft.Maui.Controls.resources.dll => 338
	i64 u0x19777fba3c41b398, ; 119: Xamarin.AndroidX.Startup.StartupRuntime.dll => 281
	i64 u0x19a4c090f14ebb66, ; 120: System.Security.Claims => 121
	i64 u0x1a91866a319e9259, ; 121: lib_System.Collections.Concurrent.dll.so => 8
	i64 u0x1aac34d1917ba5d3, ; 122: lib_System.dll.so => 168
	i64 u0x1aad60783ffa3e5b, ; 123: lib-th-Microsoft.Maui.Controls.resources.dll.so => 347
	i64 u0x1aea8f1c3b282172, ; 124: lib_System.Net.Ping.dll.so => 71
	i64 u0x1b4b7a1d0d265fa2, ; 125: Xamarin.Android.Glide.DiskLruCache => 217
	i64 u0x1bbdb16cfa73e785, ; 126: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android => 260
	i64 u0x1bc766e07b2b4241, ; 127: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 275
	i64 u0x1c753b5ff15bce1b, ; 128: Mono.Android.Runtime.dll => 174
	i64 u0x1cd47467799d8250, ; 129: System.Threading.Tasks.dll => 148
	i64 u0x1d23eafdc6dc346c, ; 130: System.Globalization.Calendars.dll => 40
	i64 u0x1da4110562816681, ; 131: Xamarin.AndroidX.Security.SecurityCrypto.dll => 279
	i64 u0x1db6820994506bf5, ; 132: System.IO.FileSystem.AccessControl.dll => 47
	i64 u0x1dbb0c2c6a999acb, ; 133: System.Diagnostics.StackTrace => 30
	i64 u0x1e3d87657e9659bc, ; 134: Xamarin.AndroidX.Navigation.UI => 272
	i64 u0x1e71143913d56c10, ; 135: lib-ko-Microsoft.Maui.Controls.resources.dll.so => 336
	i64 u0x1e7c31185e2fb266, ; 136: lib_System.Threading.Tasks.Parallel.dll.so => 147
	i64 u0x1ed8fcce5e9b50a0, ; 137: Microsoft.Extensions.Options.dll => 196
	i64 u0x1f055d15d807e1b2, ; 138: System.Xml.XmlSerializer => 166
	i64 u0x1f1ed22c1085f044, ; 139: lib_System.Diagnostics.FileVersionInfo.dll.so => 28
	i64 u0x1f2dff310f9323ee, ; 140: BerlinMarcador.dll => 0
	i64 u0x1f61df9c5b94d2c1, ; 141: lib_System.Numerics.dll.so => 86
	i64 u0x1f750bb5421397de, ; 142: lib_Xamarin.AndroidX.Tracing.Tracing.dll.so => 283
	i64 u0x20237ea48006d7a8, ; 143: lib_System.Net.WebClient.dll.so => 79
	i64 u0x209375905fcc1bad, ; 144: lib_System.IO.Compression.Brotli.dll.so => 43
	i64 u0x20fab3cf2dfbc8df, ; 145: lib_System.Diagnostics.Process.dll.so => 29
	i64 u0x2110167c128cba15, ; 146: System.Globalization => 42
	i64 u0x21419508838f7547, ; 147: System.Runtime.CompilerServices.VisualC => 105
	i64 u0x2174319c0d835bc9, ; 148: System.Runtime => 119
	i64 u0x2198e5bc8b7153fa, ; 149: Xamarin.AndroidX.Annotation.Experimental.dll => 222
	i64 u0x219ea1b751a4dee4, ; 150: lib_System.IO.Compression.ZipFile.dll.so => 45
	i64 u0x21cc7e445dcd5469, ; 151: System.Reflection.Emit.ILGeneration => 93
	i64 u0x220fd4f2e7c48170, ; 152: th/Microsoft.Maui.Controls.resources => 347
	i64 u0x224538d85ed15a82, ; 153: System.IO.Pipes => 56
	i64 u0x22908438c6bed1af, ; 154: lib_System.Threading.Timer.dll.so => 151
	i64 u0x237be844f1f812c7, ; 155: System.Threading.Thread.dll => 149
	i64 u0x23852b3bdc9f7096, ; 156: System.Resources.ResourceManager => 102
	i64 u0x23986dd7e5d4fc01, ; 157: System.IO.FileSystem.Primitives.dll => 49
	i64 u0x23f599165f90dd7a, ; 158: lib-cs-Microsoft.Data.SqlClient.resources.dll.so => 307
	i64 u0x2407aef2bbe8fadf, ; 159: System.Console => 20
	i64 u0x240abe014b27e7d3, ; 160: Xamarin.AndroidX.Core.dll => 237
	i64 u0x247619fe4413f8bf, ; 161: System.Runtime.Serialization.Primitives.dll => 116
	i64 u0x24de8d301281575e, ; 162: Xamarin.Android.Glide => 215
	i64 u0x252073cc3caa62c2, ; 163: fr/Microsoft.Maui.Controls.resources.dll => 328
	i64 u0x256b8d41255f01b1, ; 164: Xamarin.Google.Crypto.Tink.Android => 296
	i64 u0x2662c629b96b0b30, ; 165: lib_Xamarin.Kotlin.StdLib.dll.so => 301
	i64 u0x268c1439f13bcc29, ; 166: lib_Microsoft.Extensions.Primitives.dll.so => 197
	i64 u0x26a670e154a9c54b, ; 167: System.Reflection.Extensions.dll => 96
	i64 u0x26d077d9678fe34f, ; 168: System.IO.dll => 58
	i64 u0x270a44600c921861, ; 169: System.IdentityModel.Tokens.Jwt => 212
	i64 u0x273f3515de5faf0d, ; 170: id/Microsoft.Maui.Controls.resources.dll => 333
	i64 u0x2742545f9094896d, ; 171: hr/Microsoft.Maui.Controls.resources => 331
	i64 u0x274d85d83ad40513, ; 172: lib_Xamarin.AndroidX.Window.WindowCore.dll.so => 292
	i64 u0x2759af78ab94d39b, ; 173: System.Net.WebSockets => 83
	i64 u0x27b2b16f3e9de038, ; 174: Xamarin.Google.Crypto.Tink.Android.dll => 296
	i64 u0x27b410442fad6cf1, ; 175: Java.Interop.dll => 172
	i64 u0x27b97e0d52c3034a, ; 176: System.Diagnostics.Debug => 26
	i64 u0x2801845a2c71fbfb, ; 177: System.Net.Primitives.dll => 72
	i64 u0x286835e259162700, ; 178: lib_Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll.so => 273
	i64 u0x28e52865585a1ebe, ; 179: Microsoft.Extensions.Diagnostics.Abstractions.dll => 190
	i64 u0x2949f3617a02c6b2, ; 180: Xamarin.AndroidX.ExifInterface => 247
	i64 u0x29aeab763a527e52, ; 181: lib_Xamarin.AndroidX.Navigation.Common.Android.dll.so => 268
	i64 u0x2a128783efe70ba0, ; 182: uk/Microsoft.Maui.Controls.resources.dll => 349
	i64 u0x2a3b095612184159, ; 183: lib_System.Net.NetworkInformation.dll.so => 70
	i64 u0x2a6507a5ffabdf28, ; 184: System.Diagnostics.TraceSource.dll => 33
	i64 u0x2ad156c8e1354139, ; 185: fi/Microsoft.Maui.Controls.resources => 327
	i64 u0x2ad5d6b13b7a3e04, ; 186: System.ComponentModel.DataAnnotations.dll => 14
	i64 u0x2af298f63581d886, ; 187: System.Text.RegularExpressions.dll => 141
	i64 u0x2af615542f04da50, ; 188: System.IdentityModel.Tokens.Jwt.dll => 212
	i64 u0x2afc1c4f898552ee, ; 189: lib_System.Formats.Asn1.dll.so => 38
	i64 u0x2b148910ed40fbf9, ; 190: zh-Hant/Microsoft.Maui.Controls.resources.dll => 353
	i64 u0x2b6989d78cba9a15, ; 191: Xamarin.AndroidX.Concurrent.Futures.dll => 233
	i64 u0x2c8bd14bb93a7d82, ; 192: lib-pl-Microsoft.Maui.Controls.resources.dll.so => 340
	i64 u0x2cbd9262ca785540, ; 193: lib_System.Text.Encoding.CodePages.dll.so => 136
	i64 u0x2cc9e1fed6257257, ; 194: lib_System.Reflection.Emit.Lightweight.dll.so => 94
	i64 u0x2cd723e9fe623c7c, ; 195: lib_System.Private.Xml.Linq.dll.so => 90
	i64 u0x2ce66f4c8733e883, ; 196: pt-BR/Microsoft.Data.SqlClient.resources.dll => 315
	i64 u0x2d169d318a968379, ; 197: System.Threading.dll => 152
	i64 u0x2d20145f27cfc1d2, ; 198: Xamarin.AndroidX.Window.WindowCore.Jvm.dll => 293
	i64 u0x2d47774b7d993f59, ; 199: sv/Microsoft.Maui.Controls.resources.dll => 346
	i64 u0x2d5ffcae1ad0aaca, ; 200: System.Data.dll => 24
	i64 u0x2db915caf23548d2, ; 201: System.Text.Json.dll => 140
	i64 u0x2dcaa0bb15a4117a, ; 202: System.IO.UnmanagedMemoryStream.dll => 57
	i64 u0x2e2ced2c3c6a1edc, ; 203: lib_System.Threading.AccessControl.dll.so => 142
	i64 u0x2e5a40c319acb800, ; 204: System.IO.FileSystem => 51
	i64 u0x2e6f1f226821322a, ; 205: el/Microsoft.Maui.Controls.resources.dll => 325
	i64 u0x2e711f37bbc64143, ; 206: lib_BerlinMarcador.dll.so => 0
	i64 u0x2f02f94df3200fe5, ; 207: System.Diagnostics.Process => 29
	i64 u0x2f2e98e1c89b1aff, ; 208: System.Xml.ReaderWriter => 160
	i64 u0x2f40b2521deba305, ; 209: lib_Microsoft.SqlServer.Server.dll.so => 209
	i64 u0x2f5911d9ba814e4e, ; 210: System.Diagnostics.Tracing => 34
	i64 u0x2f84070a459bc31f, ; 211: lib_System.Xml.dll.so => 167
	i64 u0x2feb4d2fcda05cfd, ; 212: Microsoft.Extensions.Caching.Abstractions.dll => 184
	i64 u0x309ee9eeec09a71e, ; 213: lib_Xamarin.AndroidX.Fragment.dll.so => 248
	i64 u0x309f2bedefa9a318, ; 214: Microsoft.IdentityModel.Abstractions => 198
	i64 u0x30c6dda129408828, ; 215: System.IO.IsolatedStorage => 52
	i64 u0x31195fef5d8fb552, ; 216: _Microsoft.Android.Resource.Designer.dll => 354
	i64 u0x312c8ed623cbfc8d, ; 217: Xamarin.AndroidX.Window.dll => 291
	i64 u0x31496b779ed0663d, ; 218: lib_System.Reflection.DispatchProxy.dll.so => 92
	i64 u0x32243413e774362a, ; 219: Xamarin.AndroidX.CardView.dll => 229
	i64 u0x3235427f8d12dae1, ; 220: lib_System.Drawing.Primitives.dll.so => 35
	i64 u0x329753a17a517811, ; 221: fr/Microsoft.Maui.Controls.resources => 328
	i64 u0x32aa989ff07a84ff, ; 222: lib_System.Xml.ReaderWriter.dll.so => 160
	i64 u0x33829542f112d59b, ; 223: System.Collections.Immutable => 9
	i64 u0x33a31443733849fe, ; 224: lib-es-Microsoft.Maui.Controls.resources.dll.so => 326
	i64 u0x341abc357fbb4ebf, ; 225: lib_System.Net.Sockets.dll.so => 78
	i64 u0x346a212343615ac5, ; 226: lib_System.Linq.AsyncEnumerable.dll.so => 59
	i64 u0x348d598f4054415e, ; 227: Microsoft.SqlServer.Server => 209
	i64 u0x3496c1e2dcaf5ecc, ; 228: lib_System.IO.Pipes.AccessControl.dll.so => 55
	i64 u0x34dfd74fe2afcf37, ; 229: Microsoft.Maui => 206
	i64 u0x34e292762d9615df, ; 230: cs/Microsoft.Maui.Controls.resources.dll => 322
	i64 u0x3508234247f48404, ; 231: Microsoft.Maui.Controls => 204
	i64 u0x353590da528c9d22, ; 232: System.ComponentModel.Annotations => 13
	i64 u0x3549870798b4cd30, ; 233: lib_Xamarin.AndroidX.ViewPager2.dll.so => 290
	i64 u0x355282fc1c909694, ; 234: Microsoft.Extensions.Configuration => 186
	i64 u0x3552fc5d578f0fbf, ; 235: Xamarin.AndroidX.Arch.Core.Common => 226
	i64 u0x355c649948d55d97, ; 236: lib_System.Runtime.Intrinsics.dll.so => 111
	i64 u0x35ea9d1c6834bc8c, ; 237: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 263
	i64 u0x3628ab68db23a01a, ; 238: lib_System.Diagnostics.Tools.dll.so => 32
	i64 u0x3673b042508f5b6b, ; 239: lib_System.Runtime.Extensions.dll.so => 106
	i64 u0x36740f1a8ecdc6c4, ; 240: System.Numerics => 86
	i64 u0x36b2b50fdf589ae2, ; 241: System.Reflection.Emit.Lightweight => 94
	i64 u0x36cada77dc79928b, ; 242: System.IO.MemoryMappedFiles => 53
	i64 u0x374ef46b06791af6, ; 243: System.Reflection.Primitives.dll => 98
	i64 u0x376bf93e521a5417, ; 244: lib_Xamarin.Jetbrains.Annotations.dll.so => 299
	i64 u0x37bc29f3183003b6, ; 245: lib_System.IO.dll.so => 58
	i64 u0x380134e03b1e160a, ; 246: System.Collections.Immutable.dll => 9
	i64 u0x38049b5c59b39324, ; 247: System.Runtime.CompilerServices.Unsafe => 104
	i64 u0x382b20286945c849, ; 248: lib_Microsoft.Bcl.Cryptography.dll.so => 180
	i64 u0x385c17636bb6fe6e, ; 249: Xamarin.AndroidX.CustomView.dll => 241
	i64 u0x38869c811d74050e, ; 250: System.Net.NameResolution.dll => 69
	i64 u0x38e93ec1c057cdf6, ; 251: Microsoft.IdentityModel.Protocols => 201
	i64 u0x39251dccb84bdcaa, ; 252: lib_System.Configuration.ConfigurationManager.dll.so => 210
	i64 u0x393c226616977fdb, ; 253: lib_Xamarin.AndroidX.ViewPager.dll.so => 289
	i64 u0x395e37c3334cf82a, ; 254: lib-ca-Microsoft.Maui.Controls.resources.dll.so => 321
	i64 u0x39c3107c28752af1, ; 255: lib_Microsoft.Extensions.FileProviders.Abstractions.dll.so => 191
	i64 u0x3ab5859054645f72, ; 256: System.Security.Cryptography.Primitives.dll => 127
	i64 u0x3ad75090c3fac0e9, ; 257: lib_Xamarin.AndroidX.ResourceInspection.Annotation.dll.so => 275
	i64 u0x3ae44ac43a1fbdbb, ; 258: System.Runtime.Serialization => 118
	i64 u0x3b860f9932505633, ; 259: lib_System.Text.Encoding.Extensions.dll.so => 137
	i64 u0x3be99b43dd39dd37, ; 260: Xamarin.AndroidX.SavedState.SavedState.Android => 277
	i64 u0x3bea9ebe8c027c01, ; 261: lib_Microsoft.IdentityModel.Tokens.dll.so => 203
	i64 u0x3c3aafb6b3a00bf6, ; 262: lib_System.Security.Cryptography.X509Certificates.dll.so => 128
	i64 u0x3c3bc99634ca0e6f, ; 263: lib_Microsoft.Data.SqlClient.Internal.Logging.dll.so => 183
	i64 u0x3c4049146b59aa90, ; 264: System.Runtime.InteropServices.JavaScript => 108
	i64 u0x3c5f19e4acdcebd8, ; 265: lib_Microsoft.Data.SqlClient.dll.so => 181
	i64 u0x3c7c495f58ac5ee9, ; 266: Xamarin.Kotlin.StdLib => 301
	i64 u0x3c7e5ed3d5db71bb, ; 267: System.Security => 133
	i64 u0x3cd9d281d402eb9b, ; 268: Xamarin.AndroidX.Browser.dll => 228
	i64 u0x3d1c50cc001a991e, ; 269: Xamarin.Google.Guava.ListenableFuture.dll => 298
	i64 u0x3d2b1913edfc08d7, ; 270: lib_System.Threading.ThreadPool.dll.so => 150
	i64 u0x3d46f0b995082740, ; 271: System.Xml.Linq => 159
	i64 u0x3d8a8f400514a790, ; 272: Xamarin.AndroidX.Fragment.Ktx.dll => 249
	i64 u0x3d9c2a242b040a50, ; 273: lib_Xamarin.AndroidX.Core.dll.so => 237
	i64 u0x3dbb6b9f5ab90fa7, ; 274: lib_Xamarin.AndroidX.DynamicAnimation.dll.so => 244
	i64 u0x3e0b360b2840f096, ; 275: it/Microsoft.Data.SqlClient.resources => 311
	i64 u0x3e5441657549b213, ; 276: Xamarin.AndroidX.ResourceInspection.Annotation => 275
	i64 u0x3e57d4d195c53c2e, ; 277: System.Reflection.TypeExtensions => 99
	i64 u0x3e616ab4ed1f3f15, ; 278: lib_System.Data.dll.so => 24
	i64 u0x3f1d226e6e06db7e, ; 279: Xamarin.AndroidX.SlidingPaneLayout.dll => 280
	i64 u0x3f510adf788828dd, ; 280: System.Threading.Tasks.Extensions => 146
	i64 u0x3f6f5914291cdcf7, ; 281: Microsoft.Extensions.Hosting.Abstractions => 192
	i64 u0x407a10bb4bf95829, ; 282: lib_Xamarin.AndroidX.Navigation.Common.dll.so => 267
	i64 u0x40c98b6bd77346d4, ; 283: Microsoft.VisualBasic.dll => 3
	i64 u0x415e36f6b13ff6f3, ; 284: System.Configuration.ConfigurationManager.dll => 210
	i64 u0x41833cf766d27d96, ; 285: mscorlib => 170
	i64 u0x41cab042be111c34, ; 286: lib_Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so => 225
	i64 u0x423a9ecc4d905a88, ; 287: lib_System.Resources.ResourceManager.dll.so => 102
	i64 u0x423bf51ae7def810, ; 288: System.Xml.XPath => 164
	i64 u0x42462ff15ddba223, ; 289: System.Resources.Reader.dll => 101
	i64 u0x4291015ff4e5ef71, ; 290: Xamarin.AndroidX.Core.ViewTree.dll => 239
	i64 u0x42a31b86e6ccc3f0, ; 291: System.Diagnostics.Contracts => 25
	i64 u0x430e95b891249788, ; 292: lib_System.Reflection.Emit.dll.so => 95
	i64 u0x43375950ec7c1b6a, ; 293: netstandard.dll => 171
	i64 u0x434c4e1d9284cdae, ; 294: Mono.Android.dll => 175
	i64 u0x43505013578652a0, ; 295: lib_Xamarin.AndroidX.Activity.Ktx.dll.so => 220
	i64 u0x437d06c381ed575a, ; 296: lib_Microsoft.VisualBasic.dll.so => 3
	i64 u0x43950f84de7cc79a, ; 297: pl/Microsoft.Maui.Controls.resources.dll => 340
	i64 u0x43c077442b230f64, ; 298: Xamarin.AndroidX.Tracing.Tracing.Android => 284
	i64 u0x43e8ca5bc927ff37, ; 299: lib_Xamarin.AndroidX.Emoji2.ViewsHelper.dll.so => 246
	i64 u0x448bd33429269b19, ; 300: Microsoft.CSharp => 1
	i64 u0x4499fa3c8e494654, ; 301: lib_System.Runtime.Serialization.Primitives.dll.so => 116
	i64 u0x4515080865a951a5, ; 302: Xamarin.Kotlin.StdLib.dll => 301
	i64 u0x4545802489b736b9, ; 303: Xamarin.AndroidX.Fragment.Ktx => 249
	i64 u0x454b4d1e66bb783c, ; 304: Xamarin.AndroidX.Lifecycle.Process => 256
	i64 u0x458d2df79ac57c1d, ; 305: lib_System.IdentityModel.Tokens.Jwt.dll.so => 212
	i64 u0x45c40276a42e283e, ; 306: System.Diagnostics.TraceSource => 33
	i64 u0x45d443f2a29adc37, ; 307: System.AppContext.dll => 6
	i64 u0x46a4213bc97fe5ae, ; 308: lib-ru-Microsoft.Maui.Controls.resources.dll.so => 344
	i64 u0x47358bd471172e1d, ; 309: lib_System.Xml.Linq.dll.so => 159
	i64 u0x47daf4e1afbada10, ; 310: pt/Microsoft.Maui.Controls.resources => 342
	i64 u0x480c0a47dd42dd81, ; 311: lib_System.IO.MemoryMappedFiles.dll.so => 53
	i64 u0x49e952f19a4e2022, ; 312: System.ObjectModel => 87
	i64 u0x49f9e6948a8131e4, ; 313: lib_Xamarin.AndroidX.VersionedParcelable.dll.so => 288
	i64 u0x4a5667b2462a664b, ; 314: lib_Xamarin.AndroidX.Navigation.UI.dll.so => 272
	i64 u0x4a75d156cedf4b97, ; 315: Microsoft.Data.SqlClient.Extensions.Abstractions => 182
	i64 u0x4a7a18981dbd56bc, ; 316: System.IO.Compression.FileSystem.dll => 44
	i64 u0x4aa5c60350917c06, ; 317: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll.so => 255
	i64 u0x4b07a0ed0ab33ff4, ; 318: System.Runtime.Extensions.dll => 106
	i64 u0x4b576d47ac054f3c, ; 319: System.IO.FileSystem.AccessControl => 47
	i64 u0x4b7b6532ded934b7, ; 320: System.Text.Json => 140
	i64 u0x4c2029a97af23a8d, ; 321: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android => 265
	i64 u0x4c7755cf07ad2d5f, ; 322: System.Net.Http.Json.dll => 65
	i64 u0x4cc5f15266470798, ; 323: lib_Xamarin.AndroidX.Loader.dll.so => 266
	i64 u0x4cf6f67dc77aacd2, ; 324: System.Net.NetworkInformation.dll => 70
	i64 u0x4d3183dd245425d4, ; 325: System.Net.WebSockets.Client.dll => 82
	i64 u0x4d479f968a05e504, ; 326: System.Linq.Expressions.dll => 60
	i64 u0x4d55a010ffc4faff, ; 327: System.Private.Xml => 91
	i64 u0x4d5cbe77561c5b2e, ; 328: System.Web.dll => 157
	i64 u0x4d77512dbd86ee4c, ; 329: lib_Xamarin.AndroidX.Arch.Core.Common.dll.so => 226
	i64 u0x4d7793536e79c309, ; 330: System.ServiceProcess => 135
	i64 u0x4d95fccc1f67c7ca, ; 331: System.Runtime.Loader.dll => 112
	i64 u0x4db014bf0ff1c9c1, ; 332: System.Linq.AsyncEnumerable => 59
	i64 u0x4dcf44c3c9b076a2, ; 333: it/Microsoft.Maui.Controls.resources.dll => 334
	i64 u0x4dd9247f1d2c3235, ; 334: Xamarin.AndroidX.Loader.dll => 266
	i64 u0x4e2aeee78e2c4a87, ; 335: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 273
	i64 u0x4e32f00cb0937401, ; 336: Mono.Android.Runtime => 174
	i64 u0x4e5eea4668ac2b18, ; 337: System.Text.Encoding.CodePages => 136
	i64 u0x4ebd0c4b82c5eefc, ; 338: lib_System.Threading.Channels.dll.so => 143
	i64 u0x4ee8eaa9c9c1151a, ; 339: System.Globalization.Calendars => 40
	i64 u0x4f21ee6ef9eb527e, ; 340: ca/Microsoft.Maui.Controls.resources => 321
	i64 u0x4f27ca9d6e02176c, ; 341: cs/Microsoft.Data.SqlClient.resources => 307
	i64 u0x4ffd65baff757598, ; 342: Microsoft.IdentityModel.Tokens => 203
	i64 u0x50320f2a19424f3f, ; 343: lib-it-Microsoft.Data.SqlClient.resources.dll.so => 311
	i64 u0x5037f0be3c28c7a3, ; 344: lib_Microsoft.Maui.Controls.dll.so => 204
	i64 u0x50c3a29b21050d45, ; 345: System.Linq.Parallel.dll => 61
	i64 u0x5131bbe80989093f, ; 346: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 262
	i64 u0x5146d4e23aed3198, ; 347: ja/Microsoft.Data.SqlClient.resources => 312
	i64 u0x516324a5050a7e3c, ; 348: System.Net.WebProxy => 81
	i64 u0x516d6f0b21a303de, ; 349: lib_System.Diagnostics.Contracts.dll.so => 25
	i64 u0x51bb8a2afe774e32, ; 350: System.Drawing => 36
	i64 u0x5247c5c32a4140f0, ; 351: System.Resources.Reader => 101
	i64 u0x526bb15e3c386364, ; 352: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 259
	i64 u0x526ce79eb8e90527, ; 353: lib_System.Net.Primitives.dll.so => 72
	i64 u0x52829f00b4467c38, ; 354: lib_System.Data.Common.dll.so => 22
	i64 u0x5290402954d7bce0, ; 355: zh-Hans/Microsoft.Data.SqlClient.resources => 318
	i64 u0x529ffe06f39ab8db, ; 356: Xamarin.AndroidX.Core => 237
	i64 u0x52ff996554dbf352, ; 357: Microsoft.Maui.Graphics => 208
	i64 u0x535f7e40e8fef8af, ; 358: lib-sk-Microsoft.Maui.Controls.resources.dll.so => 345
	i64 u0x53978aac584c666e, ; 359: lib_System.Security.Cryptography.Cng.dll.so => 123
	i64 u0x53a96d5c86c9e194, ; 360: System.Net.NetworkInformation => 70
	i64 u0x53be1038a61e8d44, ; 361: System.Runtime.InteropServices.RuntimeInformation.dll => 109
	i64 u0x53c3014b9437e684, ; 362: lib-zh-HK-Microsoft.Maui.Controls.resources.dll.so => 351
	i64 u0x5435e6f049e9bc37, ; 363: System.Security.Claims.dll => 121
	i64 u0x54795225dd1587af, ; 364: lib_System.Runtime.dll.so => 119
	i64 u0x547a34f14e5f6210, ; 365: Xamarin.AndroidX.Lifecycle.Common.dll => 251
	i64 u0x54b851bc9b470503, ; 366: Xamarin.AndroidX.Navigation.Common.Android => 268
	i64 u0x556e8b63b660ab8b, ; 367: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 252
	i64 u0x5588627c9a108ec9, ; 368: System.Collections.Specialized => 11
	i64 u0x55a898e4f42e3fae, ; 369: Microsoft.VisualBasic.Core.dll => 2
	i64 u0x55fa0c610fe93bb1, ; 370: lib_System.Security.Cryptography.OpenSsl.dll.so => 126
	i64 u0x56442b99bc64bb47, ; 371: System.Runtime.Serialization.Xml.dll => 117
	i64 u0x56a8b26e1aeae27b, ; 372: System.Threading.Tasks.Dataflow => 145
	i64 u0x56f932d61e93c07f, ; 373: System.Globalization.Extensions => 41
	i64 u0x571c5cfbec5ae8e2, ; 374: System.Private.Uri => 89
	i64 u0x576499c9f52fea31, ; 375: Xamarin.AndroidX.Annotation => 221
	i64 u0x579a06fed6eec900, ; 376: System.Private.CoreLib.dll => 177
	i64 u0x57adda3c951abb33, ; 377: Microsoft.Extensions.Hosting.Abstractions.dll => 192
	i64 u0x57c542c14049b66d, ; 378: System.Diagnostics.DiagnosticSource => 27
	i64 u0x581a8bd5cfda563e, ; 379: System.Threading.Timer => 151
	i64 u0x58601b2dda4a27b9, ; 380: lib-ja-Microsoft.Maui.Controls.resources.dll.so => 335
	i64 u0x58688d9af496b168, ; 381: Microsoft.Extensions.DependencyInjection.dll => 188
	i64 u0x588c167a79db6bfb, ; 382: lib_Xamarin.Google.ErrorProne.Annotations.dll.so => 297
	i64 u0x5906028ae5151104, ; 383: Xamarin.AndroidX.Activity.Ktx => 220
	i64 u0x595a356d23e8da9a, ; 384: lib_Microsoft.CSharp.dll.so => 1
	i64 u0x59f9e60b9475085f, ; 385: lib_Xamarin.AndroidX.Annotation.Experimental.dll.so => 222
	i64 u0x5a745f5101a75527, ; 386: lib_System.IO.Compression.FileSystem.dll.so => 44
	i64 u0x5a89a886ae30258d, ; 387: lib_Xamarin.AndroidX.CoordinatorLayout.dll.so => 236
	i64 u0x5a8f6699f4a1caa9, ; 388: lib_System.Threading.dll.so => 152
	i64 u0x5ae9cd33b15841bf, ; 389: System.ComponentModel => 18
	i64 u0x5b54391bdc6fcfe6, ; 390: System.Private.DataContractSerialization => 88
	i64 u0x5b5f0e240a06a2a2, ; 391: da/Microsoft.Maui.Controls.resources.dll => 323
	i64 u0x5b8109e8e14c5e3e, ; 392: System.Globalization.Extensions.dll => 41
	i64 u0x5bddd04d72a9e350, ; 393: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 255
	i64 u0x5bdf16b09da116ab, ; 394: Xamarin.AndroidX.Collection => 230
	i64 u0x5c019d5266093159, ; 395: lib_Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android.dll.so => 260
	i64 u0x5c30a4a35f9cc8c4, ; 396: lib_System.Reflection.Extensions.dll.so => 96
	i64 u0x5c393624b8176517, ; 397: lib_Microsoft.Extensions.Logging.dll.so => 193
	i64 u0x5c53c29f5073b0c9, ; 398: System.Diagnostics.FileVersionInfo => 28
	i64 u0x5c87463c575c7616, ; 399: lib_System.Globalization.Extensions.dll.so => 41
	i64 u0x5d0a4a29b02d9d3c, ; 400: System.Net.WebHeaderCollection.dll => 80
	i64 u0x5d33da2f84c1de97, ; 401: lib-pt-BR-Microsoft.Data.SqlClient.resources.dll.so => 315
	i64 u0x5d40c9b15181641f, ; 402: lib_Xamarin.AndroidX.Emoji2.dll.so => 245
	i64 u0x5d6ca10d35e9485b, ; 403: lib_Xamarin.AndroidX.Concurrent.Futures.dll.so => 233
	i64 u0x5d7960d446a1890e, ; 404: lib-pl-Microsoft.Data.SqlClient.resources.dll.so => 314
	i64 u0x5d7ec76c1c703055, ; 405: System.Threading.Tasks.Parallel => 147
	i64 u0x5db0cbbd1028510e, ; 406: lib_System.Runtime.InteropServices.dll.so => 110
	i64 u0x5db30905d3e5013b, ; 407: Xamarin.AndroidX.Collection.Jvm.dll => 231
	i64 u0x5e467bc8f09ad026, ; 408: System.Collections.Specialized.dll => 11
	i64 u0x5e5173b3208d97e7, ; 409: System.Runtime.Handles.dll => 107
	i64 u0x5ea92fdb19ec8c4c, ; 410: System.Text.Encodings.Web.dll => 139
	i64 u0x5eb8046dd40e9ac3, ; 411: System.ComponentModel.Primitives => 16
	i64 u0x5ec272d219c9aba4, ; 412: System.Security.Cryptography.Csp.dll => 124
	i64 u0x5eee1376d94c7f5e, ; 413: System.Net.HttpListener.dll => 67
	i64 u0x5f36ccf5c6a57e24, ; 414: System.Xml.ReaderWriter.dll => 160
	i64 u0x5f4294b9b63cb842, ; 415: System.Data.Common => 22
	i64 u0x5f9a2d823f664957, ; 416: lib-el-Microsoft.Maui.Controls.resources.dll.so => 325
	i64 u0x5fa6da9c3cd8142a, ; 417: lib_Xamarin.KotlinX.Serialization.Core.dll.so => 305
	i64 u0x5fac98e0b37a5b9d, ; 418: System.Runtime.CompilerServices.Unsafe.dll => 104
	i64 u0x609f4b7b63d802d4, ; 419: lib_Microsoft.Extensions.DependencyInjection.dll.so => 188
	i64 u0x60cd4e33d7e60134, ; 420: Xamarin.KotlinX.Coroutines.Core.Jvm => 304
	i64 u0x60f62d786afcf130, ; 421: System.Memory => 64
	i64 u0x61bb78c89f867353, ; 422: System.IO => 58
	i64 u0x61be8d1299194243, ; 423: Microsoft.Maui.Controls.Xaml => 205
	i64 u0x61d2cba29557038f, ; 424: de/Microsoft.Maui.Controls.resources => 324
	i64 u0x61d88f399afb2f45, ; 425: lib_System.Runtime.Loader.dll.so => 112
	i64 u0x6219beeff33faa04, ; 426: cs/Microsoft.Data.SqlClient.resources.dll => 307
	i64 u0x622eef6f9e59068d, ; 427: System.Private.CoreLib => 177
	i64 u0x625def565caafc1c, ; 428: tr/Microsoft.Data.SqlClient.resources.dll => 317
	i64 u0x62812a93be7f3265, ; 429: Microsoft.Bcl.Cryptography => 180
	i64 u0x6343137981652865, ; 430: BerlinMarcador => 0
	i64 u0x639fb99a7bef11de, ; 431: Xamarin.AndroidX.Navigation.Runtime.Android.dll => 271
	i64 u0x63d5e3aa4ef9b931, ; 432: Xamarin.KotlinX.Coroutines.Android.dll => 302
	i64 u0x63f1f6883c1e23c2, ; 433: lib_System.Collections.Immutable.dll.so => 9
	i64 u0x6400f68068c1e9f1, ; 434: Xamarin.Google.Android.Material.dll => 294
	i64 u0x640e3b14dbd325c2, ; 435: System.Security.Cryptography.Algorithms.dll => 122
	i64 u0x64587004560099b9, ; 436: System.Reflection => 100
	i64 u0x6468947914df5c9c, ; 437: Microsoft.Bcl.Cryptography.dll => 180
	i64 u0x64b1529a438a3c45, ; 438: lib_System.Runtime.Handles.dll.so => 107
	i64 u0x64b61dd9da8a4d57, ; 439: System.Net.ServerSentEvents.dll => 76
	i64 u0x6565fba2cd8f235b, ; 440: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 263
	i64 u0x65ecac39144dd3cc, ; 441: Microsoft.Maui.Controls.dll => 204
	i64 u0x65ece51227bfa724, ; 442: lib_System.Runtime.Numerics.dll.so => 113
	i64 u0x661722438787b57f, ; 443: Xamarin.AndroidX.Annotation.Jvm.dll => 223
	i64 u0x6679b2337ee6b22a, ; 444: lib_System.IO.FileSystem.Primitives.dll.so => 49
	i64 u0x667c66a03dd97d40, ; 445: System.Linq.AsyncEnumerable.dll => 59
	i64 u0x6692e924eade1b29, ; 446: lib_System.Console.dll.so => 20
	i64 u0x66a4e5c6a3fb0bae, ; 447: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so => 262
	i64 u0x66d13304ce1a3efa, ; 448: Xamarin.AndroidX.CursorAdapter => 240
	i64 u0x674303f65d8fad6f, ; 449: lib_System.Net.Quic.dll.so => 73
	i64 u0x6756ca4cad62e9d6, ; 450: lib_Xamarin.AndroidX.ConstraintLayout.Core.dll.so => 235
	i64 u0x67c0802770244408, ; 451: System.Windows.dll => 158
	i64 u0x68100b69286e27cd, ; 452: lib_System.Formats.Tar.dll.so => 39
	i64 u0x68558ec653afa616, ; 453: lib-da-Microsoft.Maui.Controls.resources.dll.so => 323
	i64 u0x6872ec7a2e36b1ac, ; 454: System.Drawing.Primitives.dll => 35
	i64 u0x68fbbbe2eb455198, ; 455: System.Formats.Asn1 => 38
	i64 u0x69063fc0ba8e6bdd, ; 456: he/Microsoft.Maui.Controls.resources.dll => 329
	i64 u0x6a4d7577b2317255, ; 457: System.Runtime.InteropServices.dll => 110
	i64 u0x6ace3b74b15ee4a4, ; 458: nb/Microsoft.Maui.Controls.resources => 338
	i64 u0x6afcedb171067e2b, ; 459: System.Core.dll => 21
	i64 u0x6bef98e124147c24, ; 460: Xamarin.Jetbrains.Annotations => 299
	i64 u0x6ce874bff138ce2b, ; 461: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 261
	i64 u0x6d0a12b2adba20d8, ; 462: System.Security.Cryptography.ProtectedData.dll => 214
	i64 u0x6d12bfaa99c72b1f, ; 463: lib_Microsoft.Maui.Graphics.dll.so => 208
	i64 u0x6d3b7628f8253e93, ; 464: pl/Microsoft.Data.SqlClient.resources => 314
	i64 u0x6d70755158ca866e, ; 465: lib_System.ComponentModel.EventBasedAsync.dll.so => 15
	i64 u0x6d79993361e10ef2, ; 466: Microsoft.Extensions.Primitives => 197
	i64 u0x6d7eeca99577fc8b, ; 467: lib_System.Net.WebProxy.dll.so => 81
	i64 u0x6d8515b19946b6a2, ; 468: System.Net.WebProxy.dll => 81
	i64 u0x6d86d56b84c8eb71, ; 469: lib_Xamarin.AndroidX.CursorAdapter.dll.so => 240
	i64 u0x6d9bea6b3e895cf7, ; 470: Microsoft.Extensions.Primitives.dll => 197
	i64 u0x6e25a02c3833319a, ; 471: lib_Xamarin.AndroidX.Navigation.Fragment.dll.so => 269
	i64 u0x6e79c6bd8627412a, ; 472: Xamarin.AndroidX.SavedState.SavedState.Ktx => 278
	i64 u0x6e838d9a2a6f6c9e, ; 473: lib_System.ValueTuple.dll.so => 155
	i64 u0x6e9965ce1095e60a, ; 474: lib_System.Core.dll.so => 21
	i64 u0x6fd2265da78b93a4, ; 475: lib_Microsoft.Maui.dll.so => 206
	i64 u0x6fdfc7de82c33008, ; 476: cs/Microsoft.Maui.Controls.resources => 322
	i64 u0x6ffc4967cc47ba57, ; 477: System.IO.FileSystem.Watcher.dll => 50
	i64 u0x701cd46a1c25a5fe, ; 478: System.IO.FileSystem.dll => 51
	i64 u0x70e99f48c05cb921, ; 479: tr/Microsoft.Maui.Controls.resources.dll => 348
	i64 u0x70fd3deda22442d2, ; 480: lib-nb-Microsoft.Maui.Controls.resources.dll.so => 338
	i64 u0x71485e7ffdb4b958, ; 481: System.Reflection.Extensions => 96
	i64 u0x7162a2fce67a945f, ; 482: lib_Xamarin.Android.Glide.Annotations.dll.so => 216
	i64 u0x717530326f808838, ; 483: lib_Microsoft.Extensions.Diagnostics.Abstractions.dll.so => 190
	i64 u0x71a495ea3761dde8, ; 484: lib-it-Microsoft.Maui.Controls.resources.dll.so => 334
	i64 u0x71ad672adbe48f35, ; 485: System.ComponentModel.Primitives.dll => 16
	i64 u0x71bc142d620e986a, ; 486: lib_System.Security.Cryptography.Pkcs.dll.so => 213
	i64 u0x720f102581a4a5c8, ; 487: Xamarin.AndroidX.Core.ViewTree => 239
	i64 u0x725f5a9e82a45c81, ; 488: System.Security.Cryptography.Encoding => 125
	i64 u0x72b1fb4109e08d7b, ; 489: lib-hr-Microsoft.Maui.Controls.resources.dll.so => 331
	i64 u0x72e0300099accce1, ; 490: System.Xml.XPath.XDocument => 163
	i64 u0x730bfb248998f67a, ; 491: System.IO.Compression.ZipFile => 45
	i64 u0x732b2d67b9e5c47b, ; 492: Xamarin.Google.ErrorProne.Annotations.dll => 297
	i64 u0x734b76fdc0dc05bb, ; 493: lib_GoogleGson.dll.so => 179
	i64 u0x73a6be34e822f9d1, ; 494: lib_System.Runtime.Serialization.dll.so => 118
	i64 u0x73e4ce94e2eb6ffc, ; 495: lib_System.Memory.dll.so => 64
	i64 u0x743a1eccf080489a, ; 496: WindowsBase.dll => 169
	i64 u0x755a91767330b3d4, ; 497: lib_Microsoft.Extensions.Configuration.dll.so => 186
	i64 u0x75c326eb821b85c4, ; 498: lib_System.ComponentModel.DataAnnotations.dll.so => 14
	i64 u0x76012e7334db86e5, ; 499: lib_Xamarin.AndroidX.SavedState.dll.so => 276
	i64 u0x76ca07b878f44da0, ; 500: System.Runtime.Numerics.dll => 113
	i64 u0x7736c8a96e51a061, ; 501: lib_Xamarin.AndroidX.Annotation.Jvm.dll.so => 223
	i64 u0x778a805e625329ef, ; 502: System.Linq.Parallel => 61
	i64 u0x77d9074d8f33a303, ; 503: lib_System.Net.ServerSentEvents.dll.so => 76
	i64 u0x77f8a4acc2fdc449, ; 504: System.Security.Cryptography.Cng.dll => 123
	i64 u0x780bc73597a503a9, ; 505: lib-ms-Microsoft.Maui.Controls.resources.dll.so => 337
	i64 u0x782c5d8eb99ff201, ; 506: lib_Microsoft.VisualBasic.Core.dll.so => 2
	i64 u0x783606d1e53e7a1a, ; 507: th/Microsoft.Maui.Controls.resources.dll => 347
	i64 u0x78a45e51311409b6, ; 508: Xamarin.AndroidX.Fragment.dll => 248
	i64 u0x78ed4ab8f9d800a1, ; 509: Xamarin.AndroidX.Lifecycle.ViewModel => 261
	i64 u0x79eb916f2d11e1f0, ; 510: zh-Hans/Microsoft.Data.SqlClient.resources.dll => 318
	i64 u0x7a5207a7c82d30b4, ; 511: lib_Xamarin.JSpecify.dll.so => 300
	i64 u0x7a7e7eddf79c5d26, ; 512: lib_Xamarin.AndroidX.Lifecycle.ViewModel.dll.so => 261
	i64 u0x7a9a57d43b0845fa, ; 513: System.AppContext => 6
	i64 u0x7ad0f4f1e5d08183, ; 514: Xamarin.AndroidX.Collection.dll => 230
	i64 u0x7adb8da2ac89b647, ; 515: fi/Microsoft.Maui.Controls.resources.dll => 327
	i64 u0x7b13d9eaa944ade8, ; 516: Xamarin.AndroidX.DynamicAnimation.dll => 244
	i64 u0x7b4927e421291c41, ; 517: Microsoft.IdentityModel.JsonWebTokens.dll => 199
	i64 u0x7bef86a4335c4870, ; 518: System.ComponentModel.TypeConverter => 17
	i64 u0x7c0820144cd34d6a, ; 519: sk/Microsoft.Maui.Controls.resources.dll => 345
	i64 u0x7c2a0bd1e0f988fc, ; 520: lib-de-Microsoft.Maui.Controls.resources.dll.so => 324
	i64 u0x7c41d387501568ba, ; 521: System.Net.WebClient.dll => 79
	i64 u0x7c482cd79bd24b13, ; 522: lib_Xamarin.AndroidX.ConstraintLayout.dll.so => 234
	i64 u0x7c60acf6404e96b6, ; 523: Xamarin.AndroidX.Navigation.Common.Android.dll => 268
	i64 u0x7cd2ec8eaf5241cd, ; 524: System.Security.dll => 133
	i64 u0x7cf9ae50dd350622, ; 525: Xamarin.Jetbrains.Annotations.dll => 299
	i64 u0x7d649b75d580bb42, ; 526: ms/Microsoft.Maui.Controls.resources.dll => 337
	i64 u0x7d8ee2bdc8e3aad1, ; 527: System.Numerics.Vectors => 85
	i64 u0x7df5df8db8eaa6ac, ; 528: Microsoft.Extensions.Logging.Debug => 195
	i64 u0x7dfc3d6d9d8d7b70, ; 529: System.Collections => 12
	i64 u0x7e2e564fa2f76c65, ; 530: lib_System.Diagnostics.Tracing.dll.so => 34
	i64 u0x7e302e110e1e1346, ; 531: lib_System.Security.Claims.dll.so => 121
	i64 u0x7e4465b3f78ad8d0, ; 532: Xamarin.KotlinX.Serialization.Core.dll => 305
	i64 u0x7e571cad5915e6c3, ; 533: lib_Xamarin.AndroidX.Lifecycle.Process.dll.so => 256
	i64 u0x7e6ac99e4e8df72f, ; 534: System.IO.Hashing => 176
	i64 u0x7e6b1ca712437d7d, ; 535: Xamarin.AndroidX.Emoji2.ViewsHelper => 246
	i64 u0x7e946809d6008ef2, ; 536: lib_System.ObjectModel.dll.so => 87
	i64 u0x7ea0272c1b4a9635, ; 537: lib_Xamarin.Android.Glide.dll.so => 215
	i64 u0x7ecc13347c8fd849, ; 538: lib_System.ComponentModel.dll.so => 18
	i64 u0x7f00ddd9b9ca5a13, ; 539: Xamarin.AndroidX.ViewPager.dll => 289
	i64 u0x7f9351cd44b1273f, ; 540: Microsoft.Extensions.Configuration.Abstractions => 187
	i64 u0x7fbd557c99b3ce6f, ; 541: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 254
	i64 u0x8076a9a44a2ca331, ; 542: System.Net.Quic => 73
	i64 u0x80da183a87731838, ; 543: System.Reflection.Metadata => 97
	i64 u0x812c069d5cdecc17, ; 544: System.dll => 168
	i64 u0x81381be520a60adb, ; 545: Xamarin.AndroidX.Interpolator.dll => 250
	i64 u0x81657cec2b31e8aa, ; 546: System.Net => 84
	i64 u0x81ab745f6c0f5ce6, ; 547: zh-Hant/Microsoft.Maui.Controls.resources => 353
	i64 u0x8277f2be6b5ce05f, ; 548: Xamarin.AndroidX.AppCompat => 224
	i64 u0x828f06563b30bc50, ; 549: lib_Xamarin.AndroidX.CardView.dll.so => 229
	i64 u0x82b399cb01b531c4, ; 550: lib_System.Web.dll.so => 157
	i64 u0x82df8f5532a10c59, ; 551: lib_System.Drawing.dll.so => 36
	i64 u0x82f0b6e911d13535, ; 552: lib_System.Transactions.dll.so => 154
	i64 u0x82f6403342e12049, ; 553: uk/Microsoft.Maui.Controls.resources => 349
	i64 u0x83a7afd2c49adc86, ; 554: lib_Microsoft.IdentityModel.Abstractions.dll.so => 198
	i64 u0x83c14ba66c8e2b8c, ; 555: zh-Hans/Microsoft.Maui.Controls.resources => 352
	i64 u0x846ce984efea52c7, ; 556: System.Threading.Tasks.Parallel.dll => 147
	i64 u0x84ae73148a4557d2, ; 557: lib_System.IO.Pipes.dll.so => 56
	i64 u0x84b01102c12a9232, ; 558: System.Runtime.Serialization.Json.dll => 115
	i64 u0x850c5ba0b57ce8e7, ; 559: lib_Xamarin.AndroidX.Collection.dll.so => 230
	i64 u0x851d02edd334b044, ; 560: Xamarin.AndroidX.VectorDrawable => 286
	i64 u0x8528b82bdbc15371, ; 561: ko/Microsoft.Data.SqlClient.resources => 313
	i64 u0x85c919db62150978, ; 562: Xamarin.AndroidX.Transition.dll => 285
	i64 u0x8662aaeb94fef37f, ; 563: lib_System.Dynamic.Runtime.dll.so => 37
	i64 u0x86a909228dc7657b, ; 564: lib-zh-Hant-Microsoft.Maui.Controls.resources.dll.so => 353
	i64 u0x86b3e00c36b84509, ; 565: Microsoft.Extensions.Configuration.dll => 186
	i64 u0x86b62cb077ec4fd7, ; 566: System.Runtime.Serialization.Xml => 117
	i64 u0x8706ffb12bf3f53d, ; 567: Xamarin.AndroidX.Annotation.Experimental => 222
	i64 u0x872a5b14c18d328c, ; 568: System.ComponentModel.DataAnnotations => 14
	i64 u0x872fb9615bc2dff0, ; 569: Xamarin.Android.Glide.Annotations.dll => 216
	i64 u0x87c69b87d9283884, ; 570: lib_System.Threading.Thread.dll.so => 149
	i64 u0x87f6569b25707834, ; 571: System.IO.Compression.Brotli.dll => 43
	i64 u0x8842b3a5d2d3fb36, ; 572: Microsoft.Maui.Essentials => 207
	i64 u0x88926583efe7ee86, ; 573: Xamarin.AndroidX.Activity.Ktx.dll => 220
	i64 u0x88ba6bc4f7762b03, ; 574: lib_System.Reflection.dll.so => 100
	i64 u0x88bda98e0cffb7a9, ; 575: lib_Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so => 304
	i64 u0x890cb548fd490ab9, ; 576: Microsoft.Data.SqlClient.Extensions.Abstractions.dll => 182
	i64 u0x8930322c7bd8f768, ; 577: netstandard => 171
	i64 u0x897a606c9e39c75f, ; 578: lib_System.ComponentModel.Primitives.dll.so => 16
	i64 u0x898a5c6bc9e47ec1, ; 579: lib_Xamarin.AndroidX.SavedState.SavedState.Android.dll.so => 277
	i64 u0x89911a22005b92b7, ; 580: System.IO.FileSystem.DriveInfo.dll => 48
	i64 u0x89c5188089ec2cd5, ; 581: lib_System.Runtime.InteropServices.RuntimeInformation.dll.so => 109
	i64 u0x8a19e3dc71b34b2c, ; 582: System.Reflection.TypeExtensions.dll => 99
	i64 u0x8a399a706fcbce4b, ; 583: Microsoft.Extensions.Caching.Abstractions => 184
	i64 u0x8ad229ea26432ee2, ; 584: Xamarin.AndroidX.Loader => 266
	i64 u0x8b4ff5d0fdd5faa1, ; 585: lib_System.Diagnostics.DiagnosticSource.dll.so => 27
	i64 u0x8b541d476eb3774c, ; 586: System.Security.Principal.Windows => 130
	i64 u0x8b8d01333a96d0b5, ; 587: System.Diagnostics.Process.dll => 29
	i64 u0x8b9ceca7acae3451, ; 588: lib-he-Microsoft.Maui.Controls.resources.dll.so => 329
	i64 u0x8c156fe7f184f137, ; 589: tr/Microsoft.Data.SqlClient.resources => 317
	i64 u0x8c575135aa1ccef4, ; 590: Microsoft.Extensions.FileProviders.Abstractions => 191
	i64 u0x8cb8f612b633affb, ; 591: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 278
	i64 u0x8cdfdb4ce85fb925, ; 592: lib_System.Security.Principal.Windows.dll.so => 130
	i64 u0x8cdfe7b8f4caa426, ; 593: System.IO.Compression.FileSystem => 44
	i64 u0x8d0f420977c2c1c7, ; 594: Xamarin.AndroidX.CursorAdapter.dll => 240
	i64 u0x8d52f7ea2796c531, ; 595: Xamarin.AndroidX.Emoji2.dll => 245
	i64 u0x8d7b8ab4b3310ead, ; 596: System.Threading => 152
	i64 u0x8da188285aadfe8e, ; 597: System.Collections.Concurrent => 8
	i64 u0x8e8f269ad1e1ff94, ; 598: lib_Xamarin.AndroidX.Tracing.Tracing.Android.dll.so => 284
	i64 u0x8ed3cdd722b4d782, ; 599: System.Diagnostics.EventLog => 211
	i64 u0x8ed807bfe9858dfc, ; 600: Xamarin.AndroidX.Navigation.Common => 267
	i64 u0x8ee08b8194a30f48, ; 601: lib-hi-Microsoft.Maui.Controls.resources.dll.so => 330
	i64 u0x8ef7601039857a44, ; 602: lib-ro-Microsoft.Maui.Controls.resources.dll.so => 343
	i64 u0x8f32c6f611f6ffab, ; 603: pt/Microsoft.Maui.Controls.resources.dll => 342
	i64 u0x8f44b45eb046bbd1, ; 604: System.ServiceModel.Web.dll => 134
	i64 u0x8f8829d21c8985a4, ; 605: lib-pt-BR-Microsoft.Maui.Controls.resources.dll.so => 341
	i64 u0x8fbf5b0114c6dcef, ; 606: System.Globalization.dll => 42
	i64 u0x8fcc8c2a81f3d9e7, ; 607: Xamarin.KotlinX.Serialization.Core => 305
	i64 u0x90263f8448b8f572, ; 608: lib_System.Diagnostics.TraceSource.dll.so => 33
	i64 u0x903101b46fb73a04, ; 609: _Microsoft.Android.Resource.Designer => 354
	i64 u0x90393bd4865292f3, ; 610: lib_System.IO.Compression.dll.so => 46
	i64 u0x905e2b8e7ae91ae6, ; 611: System.Threading.Tasks.Extensions.dll => 146
	i64 u0x90634f86c5ebe2b5, ; 612: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 262
	i64 u0x907b636704ad79ef, ; 613: lib_Microsoft.Maui.Controls.Xaml.dll.so => 205
	i64 u0x90e9efbfd68593e0, ; 614: lib_Xamarin.AndroidX.Lifecycle.LiveData.dll.so => 253
	i64 u0x91418dc638b29e68, ; 615: lib_Xamarin.AndroidX.CustomView.dll.so => 241
	i64 u0x9157bd523cd7ed36, ; 616: lib_System.Text.Json.dll.so => 140
	i64 u0x91a74f07b30d37e2, ; 617: System.Linq.dll => 63
	i64 u0x91cb86ea3b17111d, ; 618: System.ServiceModel.Web => 134
	i64 u0x91fa41a87223399f, ; 619: ca/Microsoft.Maui.Controls.resources.dll => 321
	i64 u0x92054e486c0c7ea7, ; 620: System.IO.FileSystem.DriveInfo => 48
	i64 u0x928614058c40c4cd, ; 621: lib_System.Xml.XPath.XDocument.dll.so => 163
	i64 u0x92b138fffca2b01e, ; 622: lib_Xamarin.AndroidX.Arch.Core.Runtime.dll.so => 227
	i64 u0x92dfc2bfc6c6a888, ; 623: Xamarin.AndroidX.Lifecycle.LiveData => 253
	i64 u0x933da2c779423d68, ; 624: Xamarin.Android.Glide.Annotations => 216
	i64 u0x93489853b6098685, ; 625: es/Microsoft.Data.SqlClient.resources.dll => 309
	i64 u0x9388aad9b7ae40ce, ; 626: lib_Xamarin.AndroidX.Lifecycle.Common.dll.so => 251
	i64 u0x93cfa73ab28d6e35, ; 627: ms/Microsoft.Maui.Controls.resources => 337
	i64 u0x941c00d21e5c0679, ; 628: lib_Xamarin.AndroidX.Transition.dll.so => 285
	i64 u0x944077d8ca3c6580, ; 629: System.IO.Compression.dll => 46
	i64 u0x948cffedc8ed7960, ; 630: System.Xml => 167
	i64 u0x948d746a7702861f, ; 631: Microsoft.IdentityModel.Logging.dll => 200
	i64 u0x94bbeab0d4764588, ; 632: System.IO.Hashing.dll => 176
	i64 u0x94c8990839c4bdb1, ; 633: lib_Xamarin.AndroidX.Interpolator.dll.so => 250
	i64 u0x9502fd818eed2359, ; 634: lib_Microsoft.IdentityModel.Protocols.OpenIdConnect.dll.so => 202
	i64 u0x9564283c37ed59a9, ; 635: lib_Microsoft.IdentityModel.Logging.dll.so => 200
	i64 u0x965d480cfb8de46d, ; 636: pl/Microsoft.Data.SqlClient.resources.dll => 314
	i64 u0x967fc325e09bfa8c, ; 637: es/Microsoft.Maui.Controls.resources => 326
	i64 u0x9686161486d34b81, ; 638: lib_Xamarin.AndroidX.ExifInterface.dll.so => 247
	i64 u0x9732d8dbddea3d9a, ; 639: id/Microsoft.Maui.Controls.resources => 333
	i64 u0x978be80e5210d31b, ; 640: Microsoft.Maui.Graphics.dll => 208
	i64 u0x97b8c771ea3e4220, ; 641: System.ComponentModel.dll => 18
	i64 u0x97e144c9d3c6976e, ; 642: System.Collections.Concurrent.dll => 8
	i64 u0x984184e3c70d4419, ; 643: GoogleGson => 179
	i64 u0x9843944103683dd3, ; 644: Xamarin.AndroidX.Core.Core.Ktx => 238
	i64 u0x98b05cc81e6f333c, ; 645: Xamarin.AndroidX.SavedState.SavedState.Android.dll => 277
	i64 u0x98d720cc4597562c, ; 646: System.Security.Cryptography.OpenSsl => 126
	i64 u0x991d510397f92d9d, ; 647: System.Linq.Expressions => 60
	i64 u0x996ceeb8a3da3d67, ; 648: System.Threading.Overlapped.dll => 144
	i64 u0x99a00ca5270c6878, ; 649: Xamarin.AndroidX.Navigation.Runtime => 270
	i64 u0x99cdc6d1f2d3a72f, ; 650: ko/Microsoft.Maui.Controls.resources.dll => 336
	i64 u0x9a01b1da98b6ee10, ; 651: Xamarin.AndroidX.Lifecycle.Runtime.dll => 257
	i64 u0x9a0cc42c6f36dfc9, ; 652: lib_Microsoft.IdentityModel.Protocols.dll.so => 201
	i64 u0x9a5ccc274fd6e6ee, ; 653: Jsr305Binding.dll => 295
	i64 u0x9ae6940b11c02876, ; 654: lib_Xamarin.AndroidX.Window.dll.so => 291
	i64 u0x9b211a749105beac, ; 655: System.Transactions.Local => 153
	i64 u0x9b8734714671022d, ; 656: System.Threading.Tasks.Dataflow.dll => 145
	i64 u0x9bc6aea27fbf034f, ; 657: lib_Xamarin.KotlinX.Coroutines.Core.dll.so => 303
	i64 u0x9c244ac7cda32d26, ; 658: System.Security.Cryptography.X509Certificates.dll => 128
	i64 u0x9c465f280cf43733, ; 659: lib_Xamarin.KotlinX.Coroutines.Android.dll.so => 302
	i64 u0x9c8f6872beab6408, ; 660: System.Xml.XPath.XDocument.dll => 163
	i64 u0x9ce01cf91101ae23, ; 661: System.Xml.XmlDocument => 165
	i64 u0x9d128180c81d7ce6, ; 662: Xamarin.AndroidX.CustomView.PoolingContainer => 242
	i64 u0x9d5dbcf5a48583fe, ; 663: lib_Xamarin.AndroidX.Activity.dll.so => 219
	i64 u0x9d74dee1a7725f34, ; 664: Microsoft.Extensions.Configuration.Abstractions.dll => 187
	i64 u0x9dd0e195825d65c6, ; 665: lib_Xamarin.AndroidX.Navigation.Runtime.Android.dll.so => 271
	i64 u0x9e4534b6adaf6e84, ; 666: nl/Microsoft.Maui.Controls.resources => 339
	i64 u0x9e4b95dec42769f7, ; 667: System.Diagnostics.Debug.dll => 26
	i64 u0x9eaf1efdf6f7267e, ; 668: Xamarin.AndroidX.Navigation.Common.dll => 267
	i64 u0x9ef542cf1f78c506, ; 669: Xamarin.AndroidX.Lifecycle.LiveData.Core => 254
	i64 u0xa00832eb975f56a8, ; 670: lib_System.Net.dll.so => 84
	i64 u0xa0ad78236b7b267f, ; 671: Xamarin.AndroidX.Window => 291
	i64 u0xa0d8259f4cc284ec, ; 672: lib_System.Security.Cryptography.dll.so => 129
	i64 u0xa0e17ca50c77a225, ; 673: lib_Xamarin.Google.Crypto.Tink.Android.dll.so => 296
	i64 u0xa0ff9b3e34d92f11, ; 674: lib_System.Resources.Writer.dll.so => 103
	i64 u0xa12fbfb4da97d9f3, ; 675: System.Threading.Timer.dll => 151
	i64 u0xa1440773ee9d341e, ; 676: Xamarin.Google.Android.Material => 294
	i64 u0xa18c39c44cdc3465, ; 677: Xamarin.AndroidX.Window.WindowCore => 292
	i64 u0xa1b9d7c27f47219f, ; 678: Xamarin.AndroidX.Navigation.UI.dll => 272
	i64 u0xa2572680829d2c7c, ; 679: System.IO.Pipelines.dll => 54
	i64 u0xa26597e57ee9c7f6, ; 680: System.Xml.XmlDocument.dll => 165
	i64 u0xa308401900e5bed3, ; 681: lib_mscorlib.dll.so => 170
	i64 u0xa395572e7da6c99d, ; 682: lib_System.Security.dll.so => 133
	i64 u0xa3c64c49e90a9987, ; 683: System.Security.Cryptography.Pkcs => 213
	i64 u0xa3e683f24b43af6f, ; 684: System.Dynamic.Runtime.dll => 37
	i64 u0xa4145becdee3dc4f, ; 685: Xamarin.AndroidX.VectorDrawable.Animated => 287
	i64 u0xa46aa1eaa214539b, ; 686: ko/Microsoft.Maui.Controls.resources => 336
	i64 u0xa4edc8f2ceae241a, ; 687: System.Data.Common.dll => 22
	i64 u0xa5494f40f128ce6a, ; 688: System.Runtime.Serialization.Formatters.dll => 114
	i64 u0xa54b74df83dce92b, ; 689: System.Reflection.DispatchProxy => 92
	i64 u0xa5b7152421ed6d98, ; 690: lib_System.IO.FileSystem.Watcher.dll.so => 50
	i64 u0xa5c3844f17b822db, ; 691: lib_System.Linq.Parallel.dll.so => 61
	i64 u0xa5ce5c755bde8cb8, ; 692: lib_System.Security.Cryptography.Csp.dll.so => 124
	i64 u0xa5e599d1e0524750, ; 693: System.Numerics.Vectors.dll => 85
	i64 u0xa5f1ba49b85dd355, ; 694: System.Security.Cryptography.dll => 129
	i64 u0xa61975a5a37873ea, ; 695: lib_System.Xml.XmlSerializer.dll.so => 166
	i64 u0xa6593e21584384d2, ; 696: lib_Jsr305Binding.dll.so => 295
	i64 u0xa66cbee0130865f7, ; 697: lib_WindowsBase.dll.so => 169
	i64 u0xa67dbee13e1df9ca, ; 698: Xamarin.AndroidX.SavedState.dll => 276
	i64 u0xa684b098dd27b296, ; 699: lib_Xamarin.AndroidX.Security.SecurityCrypto.dll.so => 279
	i64 u0xa68a420042bb9b1f, ; 700: Xamarin.AndroidX.DrawerLayout.dll => 243
	i64 u0xa6d26156d1cacc7c, ; 701: Xamarin.Android.Glide.dll => 215
	i64 u0xa71fe7d6f6f93efd, ; 702: Microsoft.Data.SqlClient => 181
	i64 u0xa75386b5cb9595aa, ; 703: Xamarin.AndroidX.Lifecycle.Runtime.Android => 258
	i64 u0xa763fbb98df8d9fb, ; 704: lib_Microsoft.Win32.Primitives.dll.so => 4
	i64 u0xa78ce3745383236a, ; 705: Xamarin.AndroidX.Lifecycle.Common.Jvm => 252
	i64 u0xa7c31b56b4dc7b33, ; 706: hu/Microsoft.Maui.Controls.resources => 332
	i64 u0xa7eab29ed44b4e7a, ; 707: Mono.Android.Export => 173
	i64 u0xa8195217cbf017b7, ; 708: Microsoft.VisualBasic.Core => 2
	i64 u0xa859a95830f367ff, ; 709: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll.so => 263
	i64 u0xa8b52f21e0dbe690, ; 710: System.Runtime.Serialization.dll => 118
	i64 u0xa8e6320dd07580ef, ; 711: lib_Microsoft.IdentityModel.JsonWebTokens.dll.so => 199
	i64 u0xa8ee4ed7de2efaee, ; 712: Xamarin.AndroidX.Annotation.dll => 221
	i64 u0xa95590e7c57438a4, ; 713: System.Configuration => 19
	i64 u0xaa2219c8e3449ff5, ; 714: Microsoft.Extensions.Logging.Abstractions => 194
	i64 u0xaa443ac34067eeef, ; 715: System.Private.Xml.dll => 91
	i64 u0xaa52de307ef5d1dd, ; 716: System.Net.Http => 66
	i64 u0xaa9a7b0214a5cc5c, ; 717: System.Diagnostics.StackTrace.dll => 30
	i64 u0xaaaf86367285a918, ; 718: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 189
	i64 u0xaaf84bb3f052a265, ; 719: el/Microsoft.Maui.Controls.resources => 325
	i64 u0xab9af77b5b67a0b8, ; 720: Xamarin.AndroidX.ConstraintLayout.Core => 235
	i64 u0xab9c1b2687d86b0b, ; 721: lib_System.Linq.Expressions.dll.so => 60
	i64 u0xac2af3fa195a15ce, ; 722: System.Runtime.Numerics => 113
	i64 u0xac5376a2a538dc10, ; 723: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 254
	i64 u0xac5acae88f60357e, ; 724: System.Diagnostics.Tools.dll => 32
	i64 u0xac79c7e46047ad98, ; 725: System.Security.Principal.Windows.dll => 130
	i64 u0xac98d31068e24591, ; 726: System.Xml.XDocument => 162
	i64 u0xacd46e002c3ccb97, ; 727: ro/Microsoft.Maui.Controls.resources => 343
	i64 u0xacdd9e4180d56dda, ; 728: Xamarin.AndroidX.Concurrent.Futures => 233
	i64 u0xacf42eea7ef9cd12, ; 729: System.Threading.Channels => 143
	i64 u0xad89c07347f1bad6, ; 730: nl/Microsoft.Maui.Controls.resources.dll => 339
	i64 u0xadbb53caf78a79d2, ; 731: System.Web.HttpUtility => 156
	i64 u0xadc90ab061a9e6e4, ; 732: System.ComponentModel.TypeConverter.dll => 17
	i64 u0xadca1b9030b9317e, ; 733: Xamarin.AndroidX.Collection.Ktx => 232
	i64 u0xadd8eda2edf396ad, ; 734: Xamarin.Android.Glide.GifDecoder => 218
	i64 u0xadf4cf30debbeb9a, ; 735: System.Net.ServicePoint.dll => 77
	i64 u0xadf511667bef3595, ; 736: System.Net.Security => 75
	i64 u0xae0aaa94fdcfce0f, ; 737: System.ComponentModel.EventBasedAsync.dll => 15
	i64 u0xae282bcd03739de7, ; 738: Java.Interop => 172
	i64 u0xae53579c90db1107, ; 739: System.ObjectModel.dll => 87
	i64 u0xaf732d0b2193b8f5, ; 740: System.Security.Cryptography.OpenSsl.dll => 126
	i64 u0xafdb94dbccd9d11c, ; 741: Xamarin.AndroidX.Lifecycle.LiveData.dll => 253
	i64 u0xafe29f45095518e7, ; 742: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so => 264
	i64 u0xb03ae931fb25607e, ; 743: Xamarin.AndroidX.ConstraintLayout => 234
	i64 u0xb05cc42cd94c6d9d, ; 744: lib-sv-Microsoft.Maui.Controls.resources.dll.so => 346
	i64 u0xb0ac21bec8f428c5, ; 745: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android.dll => 260
	i64 u0xb0bb43dc52ea59f9, ; 746: System.Diagnostics.Tracing.dll => 34
	i64 u0xb1dd05401aa8ee63, ; 747: System.Security.AccessControl => 120
	i64 u0xb220631954820169, ; 748: System.Text.RegularExpressions => 141
	i64 u0xb2376e1dbf8b4ed7, ; 749: System.Security.Cryptography.Csp => 124
	i64 u0xb2a1959fe95c5402, ; 750: lib_System.Runtime.InteropServices.JavaScript.dll.so => 108
	i64 u0xb2a3f67f3bf29fce, ; 751: da/Microsoft.Maui.Controls.resources => 323
	i64 u0xb3874072ee0ecf8c, ; 752: Xamarin.AndroidX.VectorDrawable.Animated.dll => 287
	i64 u0xb398860d6ed7ba2f, ; 753: System.Security.Cryptography.ProtectedData => 214
	i64 u0xb3f0a0fcda8d3ebc, ; 754: Xamarin.AndroidX.CardView => 229
	i64 u0xb46be1aa6d4fff93, ; 755: hi/Microsoft.Maui.Controls.resources => 330
	i64 u0xb477491be13109d8, ; 756: ar/Microsoft.Maui.Controls.resources => 320
	i64 u0xb4bd7015ecee9d86, ; 757: System.IO.Pipelines => 54
	i64 u0xb4c53d9749c5f226, ; 758: lib_System.IO.FileSystem.AccessControl.dll.so => 47
	i64 u0xb4ff710863453fda, ; 759: System.Diagnostics.FileVersionInfo.dll => 28
	i64 u0xb54092076b15e062, ; 760: System.Threading.AccessControl => 142
	i64 u0xb5c38bf497a4cfe2, ; 761: lib_System.Threading.Tasks.dll.so => 148
	i64 u0xb5c7fcdafbc67ee4, ; 762: Microsoft.Extensions.Logging.Abstractions.dll => 194
	i64 u0xb5ea31d5244c6626, ; 763: System.Threading.ThreadPool.dll => 150
	i64 u0xb7212c4683a94afe, ; 764: System.Drawing.Primitives => 35
	i64 u0xb7b7753d1f319409, ; 765: sv/Microsoft.Maui.Controls.resources => 346
	i64 u0xb81a2c6e0aee50fe, ; 766: lib_System.Private.CoreLib.dll.so => 177
	i64 u0xb8c60af47c08d4da, ; 767: System.Net.ServicePoint => 77
	i64 u0xb8e68d20aad91196, ; 768: lib_System.Xml.XPath.dll.so => 164
	i64 u0xb9185c33a1643eed, ; 769: Microsoft.CSharp.dll => 1
	i64 u0xb960d6b2200ba320, ; 770: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.dll => 265
	i64 u0xb9b8001adf4ed7cc, ; 771: lib_Xamarin.AndroidX.SlidingPaneLayout.dll.so => 280
	i64 u0xb9f64d3b230def68, ; 772: lib-pt-Microsoft.Maui.Controls.resources.dll.so => 342
	i64 u0xb9fc3c8a556e3691, ; 773: ja/Microsoft.Maui.Controls.resources => 335
	i64 u0xba4670aa94a2b3c6, ; 774: lib_System.Xml.XDocument.dll.so => 162
	i64 u0xba48785529705af9, ; 775: System.Collections.dll => 12
	i64 u0xba965b8c86359996, ; 776: lib_System.Windows.dll.so => 158
	i64 u0xbb286883bc35db36, ; 777: System.Transactions.dll => 154
	i64 u0xbb65706fde942ce3, ; 778: System.Net.Sockets => 78
	i64 u0xbba28979413cad9e, ; 779: lib_System.Runtime.CompilerServices.VisualC.dll.so => 105
	i64 u0xbbd180354b67271a, ; 780: System.Runtime.Serialization.Formatters => 114
	i64 u0xbc260cdba33291a3, ; 781: Xamarin.AndroidX.Arch.Core.Common.dll => 226
	i64 u0xbcd22b365b764643, ; 782: lib-zh-Hans-Microsoft.Data.SqlClient.resources.dll.so => 318
	i64 u0xbd0aaf9dbfcc3376, ; 783: fr/Microsoft.Data.SqlClient.resources.dll => 310
	i64 u0xbd0e2c0d55246576, ; 784: System.Net.Http.dll => 66
	i64 u0xbd3c2d7a8325e11b, ; 785: lib-fr-Microsoft.Data.SqlClient.resources.dll.so => 310
	i64 u0xbd3fbd85b9e1cb29, ; 786: lib_System.Net.HttpListener.dll.so => 67
	i64 u0xbd437a2cdb333d0d, ; 787: Xamarin.AndroidX.ViewPager2 => 290
	i64 u0xbd4aef17dbfb0390, ; 788: ru/Microsoft.Data.SqlClient.resources => 316
	i64 u0xbd4f572d2bd0a789, ; 789: System.IO.Compression.ZipFile.dll => 45
	i64 u0xbd5d0b88d3d647a5, ; 790: lib_Xamarin.AndroidX.Browser.dll.so => 228
	i64 u0xbd877b14d0b56392, ; 791: System.Runtime.Intrinsics.dll => 111
	i64 u0xbe65a49036345cf4, ; 792: lib_System.Buffers.dll.so => 7
	i64 u0xbee38d4a88835966, ; 793: Xamarin.AndroidX.AppCompat.AppCompatResources => 225
	i64 u0xbef9919db45b4ca7, ; 794: System.IO.Pipes.AccessControl => 55
	i64 u0xbf0fa68611139208, ; 795: lib_Xamarin.AndroidX.Annotation.dll.so => 221
	i64 u0xbfc1e1fb3095f2b3, ; 796: lib_System.Net.Http.Json.dll.so => 65
	i64 u0xc040a4ab55817f58, ; 797: ar/Microsoft.Maui.Controls.resources.dll => 320
	i64 u0xc07cadab29efeba0, ; 798: Xamarin.AndroidX.Core.Core.Ktx.dll => 238
	i64 u0xc0d928351ab5ca77, ; 799: System.Console.dll => 20
	i64 u0xc0f5a221a9383aea, ; 800: System.Runtime.Intrinsics => 111
	i64 u0xc111030af54d7191, ; 801: System.Resources.Writer => 103
	i64 u0xc12b8b3afa48329c, ; 802: lib_System.Linq.dll.so => 63
	i64 u0xc183ca0b74453aa9, ; 803: lib_System.Threading.Tasks.Dataflow.dll.so => 145
	i64 u0xc1ff9ae3cdb6e1e6, ; 804: Xamarin.AndroidX.Activity.dll => 219
	i64 u0xc26c064effb1dea9, ; 805: System.Buffers.dll => 7
	i64 u0xc278de356ad8a9e3, ; 806: Microsoft.IdentityModel.Logging => 200
	i64 u0xc28c50f32f81cc73, ; 807: ja/Microsoft.Maui.Controls.resources.dll => 335
	i64 u0xc2902f6cf5452577, ; 808: lib_Mono.Android.Export.dll.so => 173
	i64 u0xc2a3bca55b573141, ; 809: System.IO.FileSystem.Watcher => 50
	i64 u0xc2bcfec99f69365e, ; 810: Xamarin.AndroidX.ViewPager2.dll => 290
	i64 u0xc30b52815b58ac2c, ; 811: lib_System.Runtime.Serialization.Xml.dll.so => 117
	i64 u0xc36d7d89c652f455, ; 812: System.Threading.Overlapped => 144
	i64 u0xc38b5d7cc4abbd1c, ; 813: BCrypt.Net-Next.dll => 178
	i64 u0xc396b285e59e5493, ; 814: GoogleGson.dll => 179
	i64 u0xc3c86c1e5e12f03d, ; 815: WindowsBase => 169
	i64 u0xc421b61fd853169d, ; 816: lib_System.Net.WebSockets.Client.dll.so => 82
	i64 u0xc463e077917aa21d, ; 817: System.Runtime.Serialization.Json => 115
	i64 u0xc4d3858ed4d08512, ; 818: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 264
	i64 u0xc4d69851fe06342f, ; 819: lib_Microsoft.Extensions.Caching.Memory.dll.so => 185
	i64 u0xc50fded0ded1418c, ; 820: lib_System.ComponentModel.TypeConverter.dll.so => 17
	i64 u0xc519125d6bc8fb11, ; 821: lib_System.Net.Requests.dll.so => 74
	i64 u0xc5293b19e4dc230e, ; 822: Xamarin.AndroidX.Navigation.Fragment => 269
	i64 u0xc5325b2fcb37446f, ; 823: lib_System.Private.Xml.dll.so => 91
	i64 u0xc535cb9a21385d9b, ; 824: lib_Xamarin.Android.Glide.DiskLruCache.dll.so => 217
	i64 u0xc583d8477b5d3bac, ; 825: zh-Hant/Microsoft.Data.SqlClient.resources.dll => 319
	i64 u0xc5a0f4b95a699af7, ; 826: lib_System.Private.Uri.dll.so => 89
	i64 u0xc5cdcd5b6277579e, ; 827: lib_System.Security.Cryptography.Algorithms.dll.so => 122
	i64 u0xc5ec286825cb0bf4, ; 828: Xamarin.AndroidX.Tracing.Tracing => 283
	i64 u0xc6706bc8aa7fe265, ; 829: Xamarin.AndroidX.Annotation.Jvm => 223
	i64 u0xc74d70d4aa96cef3, ; 830: Xamarin.AndroidX.Navigation.Runtime.Android => 271
	i64 u0xc7c01e7d7c93a110, ; 831: System.Text.Encoding.Extensions.dll => 137
	i64 u0xc7ce851898a4548e, ; 832: lib_System.Web.HttpUtility.dll.so => 156
	i64 u0xc809d4089d2556b2, ; 833: System.Runtime.InteropServices.JavaScript.dll => 108
	i64 u0xc858a28d9ee5a6c5, ; 834: lib_System.Collections.Specialized.dll.so => 11
	i64 u0xc8ac7c6bf1c2ec51, ; 835: System.Reflection.DispatchProxy.dll => 92
	i64 u0xc9c62c8f354ac568, ; 836: lib_System.Diagnostics.TextWriterTraceListener.dll.so => 31
	i64 u0xca32340d8d54dcd5, ; 837: Microsoft.Extensions.Caching.Memory.dll => 185
	i64 u0xca3a723e7342c5b6, ; 838: lib-tr-Microsoft.Maui.Controls.resources.dll.so => 348
	i64 u0xca5801070d9fccfb, ; 839: System.Text.Encoding => 138
	i64 u0xca5c0406fdba256b, ; 840: lib_BCrypt.Net-Next.dll.so => 178
	i64 u0xcab3493c70141c2d, ; 841: pl/Microsoft.Maui.Controls.resources => 340
	i64 u0xcacfddc9f7c6de76, ; 842: ro/Microsoft.Maui.Controls.resources.dll => 343
	i64 u0xcadbc92899a777f0, ; 843: Xamarin.AndroidX.Startup.StartupRuntime => 281
	i64 u0xcba1cb79f45292b5, ; 844: Xamarin.Android.Glide.GifDecoder.dll => 218
	i64 u0xcbb5f80c7293e696, ; 845: lib_System.Globalization.Calendars.dll.so => 40
	i64 u0xcbd4fdd9cef4a294, ; 846: lib__Microsoft.Android.Resource.Designer.dll.so => 354
	i64 u0xcc15da1e07bbd994, ; 847: Xamarin.AndroidX.SlidingPaneLayout => 280
	i64 u0xcc2876b32ef2794c, ; 848: lib_System.Text.RegularExpressions.dll.so => 141
	i64 u0xcc5c3bb714c4561e, ; 849: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 304
	i64 u0xcc76886e09b88260, ; 850: Xamarin.KotlinX.Serialization.Core.Jvm.dll => 306
	i64 u0xcc9fa2923aa1c9ef, ; 851: System.Diagnostics.Contracts.dll => 25
	i64 u0xccae9bb73e2326bd, ; 852: lib_System.IO.Hashing.dll.so => 176
	i64 u0xccf25c4b634ccd3a, ; 853: zh-Hans/Microsoft.Maui.Controls.resources.dll => 352
	i64 u0xcd10a42808629144, ; 854: System.Net.Requests => 74
	i64 u0xcdca1b920e9f53ba, ; 855: Xamarin.AndroidX.Interpolator => 250
	i64 u0xcdd0c48b6937b21c, ; 856: Xamarin.AndroidX.SwipeRefreshLayout => 282
	i64 u0xcf140ed700bc8e66, ; 857: Microsoft.SqlServer.Server.dll => 209
	i64 u0xcf23d8093f3ceadf, ; 858: System.Diagnostics.DiagnosticSource.dll => 27
	i64 u0xcf5ff6b6b2c4c382, ; 859: System.Net.Mail.dll => 68
	i64 u0xcf8fc898f98b0d34, ; 860: System.Private.Xml.Linq => 90
	i64 u0xd04b5f59ed596e31, ; 861: System.Reflection.Metadata.dll => 97
	i64 u0xd063299fcfc0c93f, ; 862: lib_System.Runtime.Serialization.Json.dll.so => 115
	i64 u0xd0de8a113e976700, ; 863: System.Diagnostics.TextWriterTraceListener => 31
	i64 u0xd0fc33d5ae5d4cb8, ; 864: System.Runtime.Extensions => 106
	i64 u0xd1194e1d8a8de83c, ; 865: lib_Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so => 252
	i64 u0xd12beacdfc14f696, ; 866: System.Dynamic.Runtime => 37
	i64 u0xd16fd7fb9bbcd43e, ; 867: Microsoft.Extensions.Diagnostics.Abstractions => 190
	i64 u0xd198e7ce1b6a8344, ; 868: System.Net.Quic.dll => 73
	i64 u0xd22a0c4630f2fe66, ; 869: lib_System.Security.Cryptography.ProtectedData.dll.so => 214
	i64 u0xd2dffb59201927bd, ; 870: de/Microsoft.Data.SqlClient.resources.dll => 308
	i64 u0xd3144156a3727ebe, ; 871: Xamarin.Google.Guava.ListenableFuture => 298
	i64 u0xd333d0af9e423810, ; 872: System.Runtime.InteropServices => 110
	i64 u0xd33a415cb4278969, ; 873: System.Security.Cryptography.Encoding.dll => 125
	i64 u0xd3426d966bb704f5, ; 874: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 225
	i64 u0xd3651b6fc3125825, ; 875: System.Private.Uri.dll => 89
	i64 u0xd373685349b1fe8b, ; 876: Microsoft.Extensions.Logging.dll => 193
	i64 u0xd3801faafafb7698, ; 877: System.Private.DataContractSerialization.dll => 88
	i64 u0xd3e4c8d6a2d5d470, ; 878: it/Microsoft.Maui.Controls.resources => 334
	i64 u0xd3edcc1f25459a50, ; 879: System.Reflection.Emit => 95
	i64 u0xd4645626dffec99d, ; 880: lib_Microsoft.Extensions.DependencyInjection.Abstractions.dll.so => 189
	i64 u0xd4fa0abb79079ea9, ; 881: System.Security.Principal.dll => 131
	i64 u0xd5507e11a2b2839f, ; 882: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 264
	i64 u0xd5858610826f1c08, ; 883: lib-ru-Microsoft.Data.SqlClient.resources.dll.so => 316
	i64 u0xd5d04bef8478ea19, ; 884: Xamarin.AndroidX.Tracing.Tracing.dll => 283
	i64 u0xd60815f26a12e140, ; 885: Microsoft.Extensions.Logging.Debug.dll => 195
	i64 u0xd6694f8359737e4e, ; 886: Xamarin.AndroidX.SavedState => 276
	i64 u0xd6949e129339eae5, ; 887: lib_Xamarin.AndroidX.Core.Core.Ktx.dll.so => 238
	i64 u0xd6d21782156bc35b, ; 888: Xamarin.AndroidX.SwipeRefreshLayout.dll => 282
	i64 u0xd6de019f6af72435, ; 889: Xamarin.AndroidX.ConstraintLayout.Core.dll => 235
	i64 u0xd70956d1e6deefb9, ; 890: Jsr305Binding => 295
	i64 u0xd72329819cbbbc44, ; 891: lib_Microsoft.Extensions.Configuration.Abstractions.dll.so => 187
	i64 u0xd72c760af136e863, ; 892: System.Xml.XmlSerializer.dll => 166
	i64 u0xd753f071e44c2a03, ; 893: lib_System.Security.SecureString.dll.so => 132
	i64 u0xd7b3764ada9d341d, ; 894: lib_Microsoft.Extensions.Logging.Abstractions.dll.so => 194
	i64 u0xd7f0088bc5ad71f2, ; 895: Xamarin.AndroidX.VersionedParcelable => 288
	i64 u0xd824ef6ab33f8f7a, ; 896: Xamarin.AndroidX.Window.WindowCore.dll => 292
	i64 u0xd8fb25e28ae30a12, ; 897: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 273
	i64 u0xda1dfa4c534a9251, ; 898: Microsoft.Extensions.DependencyInjection => 188
	i64 u0xdad05a11827959a3, ; 899: System.Collections.NonGeneric.dll => 10
	i64 u0xdaefdfe71aa53cf9, ; 900: System.IO.FileSystem.Primitives => 49
	i64 u0xdb5383ab5865c007, ; 901: lib-vi-Microsoft.Maui.Controls.resources.dll.so => 350
	i64 u0xdb58816721c02a59, ; 902: lib_System.Reflection.Emit.ILGeneration.dll.so => 93
	i64 u0xdbeda89f832aa805, ; 903: vi/Microsoft.Maui.Controls.resources.dll => 350
	i64 u0xdbf2a779fbc3ac31, ; 904: System.Transactions.Local.dll => 153
	i64 u0xdbf9607a441b4505, ; 905: System.Linq => 63
	i64 u0xdbfc90157a0de9b0, ; 906: lib_System.Text.Encoding.dll.so => 138
	i64 u0xdc75032002d1a212, ; 907: lib_System.Transactions.Local.dll.so => 153
	i64 u0xdca8be7403f92d4f, ; 908: lib_System.Linq.Queryable.dll.so => 62
	i64 u0xdce2c53525640bf3, ; 909: Microsoft.Extensions.Logging => 193
	i64 u0xdd2b722d78ef5f43, ; 910: System.Runtime.dll => 119
	i64 u0xdd67031857c72f96, ; 911: lib_System.Text.Encodings.Web.dll.so => 139
	i64 u0xdd70765ad6162057, ; 912: Xamarin.JSpecify => 300
	i64 u0xdd92e229ad292030, ; 913: System.Numerics.dll => 86
	i64 u0xdde30e6b77aa6f6c, ; 914: lib-zh-Hans-Microsoft.Maui.Controls.resources.dll.so => 352
	i64 u0xde110ae80fa7c2e2, ; 915: System.Xml.XDocument.dll => 162
	i64 u0xde4726fcdf63a198, ; 916: Xamarin.AndroidX.Transition => 285
	i64 u0xde572c2b2fb32f93, ; 917: lib_System.Threading.Tasks.Extensions.dll.so => 146
	i64 u0xde8769ebda7d8647, ; 918: hr/Microsoft.Maui.Controls.resources.dll => 331
	i64 u0xdee075f3477ef6be, ; 919: Xamarin.AndroidX.ExifInterface.dll => 247
	i64 u0xdf4b773de8fb1540, ; 920: System.Net.dll => 84
	i64 u0xdf9c7682560a9629, ; 921: System.Net.ServerSentEvents => 76
	i64 u0xdfa254ebb4346068, ; 922: System.Net.Ping => 71
	i64 u0xe0142572c095a480, ; 923: Xamarin.AndroidX.AppCompat.dll => 224
	i64 u0xe021eaa401792a05, ; 924: System.Text.Encoding.dll => 138
	i64 u0xe02f89350ec78051, ; 925: Xamarin.AndroidX.CoordinatorLayout.dll => 236
	i64 u0xe0496b9d65ef5474, ; 926: Xamarin.Android.Glide.DiskLruCache.dll => 217
	i64 u0xe0ea30f1ac5b7731, ; 927: ko/Microsoft.Data.SqlClient.resources.dll => 313
	i64 u0xe0ee2e61123c1478, ; 928: lib-es-Microsoft.Data.SqlClient.resources.dll.so => 309
	i64 u0xe10b760bb1462e7a, ; 929: lib_System.Security.Cryptography.Primitives.dll.so => 127
	i64 u0xe12265280d0b036d, ; 930: fr/Microsoft.Data.SqlClient.resources => 310
	i64 u0xe192a588d4410686, ; 931: lib_System.IO.Pipelines.dll.so => 54
	i64 u0xe1a08bd3fa539e0d, ; 932: System.Runtime.Loader => 112
	i64 u0xe1a77eb8831f7741, ; 933: System.Security.SecureString.dll => 132
	i64 u0xe1b52f9f816c70ef, ; 934: System.Private.Xml.Linq.dll => 90
	i64 u0xe1e199c8ab02e356, ; 935: System.Data.DataSetExtensions.dll => 23
	i64 u0xe1ecfdb7fff86067, ; 936: System.Net.Security.dll => 75
	i64 u0xe2252a80fe853de4, ; 937: lib_System.Security.Principal.dll.so => 131
	i64 u0xe22fa4c9c645db62, ; 938: System.Diagnostics.TextWriterTraceListener.dll => 31
	i64 u0xe24095a7afddaab3, ; 939: lib_Microsoft.Extensions.Hosting.Abstractions.dll.so => 192
	i64 u0xe2420585aeceb728, ; 940: System.Net.Requests.dll => 74
	i64 u0xe26692647e6bcb62, ; 941: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 259
	i64 u0xe29b73bc11392966, ; 942: lib-id-Microsoft.Maui.Controls.resources.dll.so => 333
	i64 u0xe2ad448dee50fbdf, ; 943: System.Xml.Serialization => 161
	i64 u0xe2d920f978f5d85c, ; 944: System.Data.DataSetExtensions => 23
	i64 u0xe2e426c7714fa0bc, ; 945: Microsoft.Win32.Primitives.dll => 4
	i64 u0xe332bacb3eb4a806, ; 946: Mono.Android.Export.dll => 173
	i64 u0xe3811d68d4fe8463, ; 947: pt-BR/Microsoft.Maui.Controls.resources.dll => 341
	i64 u0xe3b7cbae5ad66c75, ; 948: lib_System.Security.Cryptography.Encoding.dll.so => 125
	i64 u0xe4292b48f3224d5b, ; 949: lib_Xamarin.AndroidX.Core.ViewTree.dll.so => 239
	i64 u0xe494f7ced4ecd10a, ; 950: hu/Microsoft.Maui.Controls.resources.dll => 332
	i64 u0xe4a9b1e40d1e8917, ; 951: lib-fi-Microsoft.Maui.Controls.resources.dll.so => 327
	i64 u0xe4f74a0b5bf9703f, ; 952: System.Runtime.Serialization.Primitives => 116
	i64 u0xe5434e8a119ceb69, ; 953: lib_Mono.Android.dll.so => 175
	i64 u0xe55703b9ce5c038a, ; 954: System.Diagnostics.Tools => 32
	i64 u0xe57013c8afc270b5, ; 955: Microsoft.VisualBasic => 3
	i64 u0xe57d22ca4aeb4900, ; 956: System.Configuration.ConfigurationManager => 210
	i64 u0xe62913cc36bc07ec, ; 957: System.Xml.dll => 167
	i64 u0xe7bea09c4900a191, ; 958: Xamarin.AndroidX.VectorDrawable.dll => 286
	i64 u0xe7e03cc18dcdeb49, ; 959: lib_System.Diagnostics.StackTrace.dll.so => 30
	i64 u0xe7e147ff99a7a380, ; 960: lib_System.Configuration.dll.so => 19
	i64 u0xe86b0df4ba9e5db8, ; 961: lib_Xamarin.AndroidX.Lifecycle.Runtime.Android.dll.so => 258
	i64 u0xe896622fe0902957, ; 962: System.Reflection.Emit.dll => 95
	i64 u0xe89a2a9ef110899b, ; 963: System.Drawing.dll => 36
	i64 u0xe8c5f8c100b5934b, ; 964: Microsoft.Win32.Registry => 5
	i64 u0xe98163eb702ae5c5, ; 965: Xamarin.AndroidX.Arch.Core.Runtime => 227
	i64 u0xe994f23ba4c143e5, ; 966: Xamarin.KotlinX.Coroutines.Android => 302
	i64 u0xe9b9c8c0458fd92a, ; 967: System.Windows => 158
	i64 u0xe9d166d87a7f2bdb, ; 968: lib_Xamarin.AndroidX.Startup.StartupRuntime.dll.so => 281
	i64 u0xea5a4efc2ad81d1b, ; 969: Xamarin.Google.ErrorProne.Annotations => 297
	i64 u0xeb2313fe9d65b785, ; 970: Xamarin.AndroidX.ConstraintLayout.dll => 234
	i64 u0xed19c616b3fcb7eb, ; 971: Xamarin.AndroidX.VersionedParcelable.dll => 288
	i64 u0xed6ef763c6fb395f, ; 972: System.Diagnostics.EventLog.dll => 211
	i64 u0xedc4817167106c23, ; 973: System.Net.Sockets.dll => 78
	i64 u0xedc632067fb20ff3, ; 974: System.Memory.dll => 64
	i64 u0xedc8e4ca71a02a8b, ; 975: Xamarin.AndroidX.Navigation.Runtime.dll => 270
	i64 u0xee81f5b3f1c4f83b, ; 976: System.Threading.ThreadPool => 150
	i64 u0xeeb7ebb80150501b, ; 977: lib_Xamarin.AndroidX.Collection.Jvm.dll.so => 231
	i64 u0xeefc635595ef57f0, ; 978: System.Security.Cryptography.Cng => 123
	i64 u0xef03b1b5a04e9709, ; 979: System.Text.Encoding.CodePages.dll => 136
	i64 u0xef5bcbe61622ee5f, ; 980: Xamarin.AndroidX.Tracing.Tracing.Android.dll => 284
	i64 u0xef602c523fe2e87a, ; 981: lib_Xamarin.Google.Guava.ListenableFuture.dll.so => 298
	i64 u0xef72742e1bcca27a, ; 982: Microsoft.Maui.Essentials.dll => 207
	i64 u0xefd0396433f04886, ; 983: pt-BR/Microsoft.Data.SqlClient.resources => 315
	i64 u0xefd1e0c4e5c9b371, ; 984: System.Resources.ResourceManager.dll => 102
	i64 u0xefe8f8d5ed3c72ea, ; 985: System.Formats.Tar.dll => 39
	i64 u0xefec0b7fdc57ec42, ; 986: Xamarin.AndroidX.Activity => 219
	i64 u0xeff59cbde4363ec3, ; 987: System.Threading.AccessControl.dll => 142
	i64 u0xf00c29406ea45e19, ; 988: es/Microsoft.Maui.Controls.resources.dll => 326
	i64 u0xf09e47b6ae914f6e, ; 989: System.Net.NameResolution => 69
	i64 u0xf0ac2b489fed2e35, ; 990: lib_System.Diagnostics.Debug.dll.so => 26
	i64 u0xf0bb49dadd3a1fe1, ; 991: lib_System.Net.ServicePoint.dll.so => 77
	i64 u0xf0c16dff90fbf5d6, ; 992: Xamarin.AndroidX.Window.WindowCore.Jvm => 293
	i64 u0xf0de2537ee19c6ca, ; 993: lib_System.Net.WebHeaderCollection.dll.so => 80
	i64 u0xf1138779fa181c68, ; 994: lib_Xamarin.AndroidX.Lifecycle.Runtime.dll.so => 257
	i64 u0xf11b621fc87b983f, ; 995: Microsoft.Maui.Controls.Xaml.dll => 205
	i64 u0xf161f4f3c3b7e62c, ; 996: System.Data => 24
	i64 u0xf16eb650d5a464bc, ; 997: System.ValueTuple => 155
	i64 u0xf1c4b4005493d871, ; 998: System.Formats.Asn1.dll => 38
	i64 u0xf22514cfad2d598b, ; 999: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.dll.so => 265
	i64 u0xf238bd79489d3a96, ; 1000: lib-nl-Microsoft.Maui.Controls.resources.dll.so => 339
	i64 u0xf2feea356ba760af, ; 1001: Xamarin.AndroidX.Arch.Core.Runtime.dll => 227
	i64 u0xf300e085f8acd238, ; 1002: lib_System.ServiceProcess.dll.so => 135
	i64 u0xf34e52b26e7e059d, ; 1003: System.Runtime.CompilerServices.VisualC.dll => 105
	i64 u0xf37221fda4ef8830, ; 1004: lib_Xamarin.Google.Android.Material.dll.so => 294
	i64 u0xf3ad9b8fb3eefd12, ; 1005: lib_System.IO.UnmanagedMemoryStream.dll.so => 57
	i64 u0xf3ddfe05336abf29, ; 1006: System => 168
	i64 u0xf408654b2a135055, ; 1007: System.Reflection.Emit.ILGeneration.dll => 93
	i64 u0xf4103170a1de5bd0, ; 1008: System.Linq.Queryable.dll => 62
	i64 u0xf42d20c23173d77c, ; 1009: lib_System.ServiceModel.Web.dll.so => 134
	i64 u0xf4c1dd70a5496a17, ; 1010: System.IO.Compression => 46
	i64 u0xf4ecf4b9afc64781, ; 1011: System.ServiceProcess.dll => 135
	i64 u0xf4eeeaa566e9b970, ; 1012: lib_Xamarin.AndroidX.CustomView.PoolingContainer.dll.so => 242
	i64 u0xf518f63ead11fcd1, ; 1013: System.Threading.Tasks => 148
	i64 u0xf5e59d7ac34b50aa, ; 1014: Microsoft.IdentityModel.Protocols.dll => 201
	i64 u0xf5fc7602fe27b333, ; 1015: System.Net.WebHeaderCollection => 80
	i64 u0xf6077741019d7428, ; 1016: Xamarin.AndroidX.CoordinatorLayout => 236
	i64 u0xf61ade9836ad4692, ; 1017: Microsoft.IdentityModel.Tokens.dll => 203
	i64 u0xf6742cbf457c450b, ; 1018: Xamarin.AndroidX.Lifecycle.Runtime.Android.dll => 258
	i64 u0xf6c0e7d55a7a4e4f, ; 1019: Microsoft.IdentityModel.JsonWebTokens => 199
	i64 u0xf6e8de2aebcbb422, ; 1020: lib_Xamarin.AndroidX.Window.WindowCore.Jvm.dll.so => 293
	i64 u0xf70c0a7bf8ccf5af, ; 1021: System.Web => 157
	i64 u0xf77b20923f07c667, ; 1022: de/Microsoft.Maui.Controls.resources.dll => 324
	i64 u0xf7be8a85d06b4b64, ; 1023: ru/Microsoft.Data.SqlClient.resources.dll => 316
	i64 u0xf7e2cac4c45067b3, ; 1024: lib_System.Numerics.Vectors.dll.so => 85
	i64 u0xf7e74930e0e3d214, ; 1025: zh-HK/Microsoft.Maui.Controls.resources.dll => 351
	i64 u0xf83775f330791063, ; 1026: ja/Microsoft.Data.SqlClient.resources.dll => 312
	i64 u0xf84773b5c81e3cef, ; 1027: lib-uk-Microsoft.Maui.Controls.resources.dll.so => 349
	i64 u0xf8aac5ea82de1348, ; 1028: System.Linq.Queryable => 62
	i64 u0xf8b77539b362d3ba, ; 1029: lib_System.Reflection.Primitives.dll.so => 98
	i64 u0xf8cd217ba1bbfdc8, ; 1030: lib-zh-Hant-Microsoft.Data.SqlClient.resources.dll.so => 319
	i64 u0xf8e045dc345b2ea3, ; 1031: lib_Xamarin.AndroidX.RecyclerView.dll.so => 274
	i64 u0xf915dc29808193a1, ; 1032: System.Web.HttpUtility.dll => 156
	i64 u0xf96c777a2a0686f4, ; 1033: hi/Microsoft.Maui.Controls.resources.dll => 330
	i64 u0xf9be54c8bcf8ff3b, ; 1034: System.Security.AccessControl.dll => 120
	i64 u0xf9eec5bb3a6aedc6, ; 1035: Microsoft.Extensions.Options => 196
	i64 u0xfa0e82300e67f913, ; 1036: lib_System.AppContext.dll.so => 6
	i64 u0xfa2fdb27e8a2c8e8, ; 1037: System.ComponentModel.EventBasedAsync => 15
	i64 u0xfa3f278f288b0e84, ; 1038: lib_System.Net.Security.dll.so => 75
	i64 u0xfa504dfa0f097d72, ; 1039: Microsoft.Extensions.FileProviders.Abstractions.dll => 191
	i64 u0xfa5ed7226d978949, ; 1040: lib-ar-Microsoft.Maui.Controls.resources.dll.so => 320
	i64 u0xfa645d91e9fc4cba, ; 1041: System.Threading.Thread => 149
	i64 u0xfad4d2c770e827f9, ; 1042: lib_System.IO.IsolatedStorage.dll.so => 52
	i64 u0xfb06dd2338e6f7c4, ; 1043: System.Net.Ping.dll => 71
	i64 u0xfb087abe5365e3b7, ; 1044: lib_System.Data.DataSetExtensions.dll.so => 23
	i64 u0xfb846e949baff5ea, ; 1045: System.Xml.Serialization.dll => 161
	i64 u0xfbad3e4ce4b98145, ; 1046: System.Security.Cryptography.X509Certificates => 128
	i64 u0xfbf0a31c9fc34bc4, ; 1047: lib_System.Net.Http.dll.so => 66
	i64 u0xfc6b7527cc280b3f, ; 1048: lib_System.Runtime.Serialization.Formatters.dll.so => 114
	i64 u0xfc719aec26adf9d9, ; 1049: Xamarin.AndroidX.Navigation.Fragment.dll => 269
	i64 u0xfc82690c2fe2735c, ; 1050: Xamarin.AndroidX.Lifecycle.Process.dll => 256
	i64 u0xfc93fc307d279893, ; 1051: System.IO.Pipes.AccessControl.dll => 55
	i64 u0xfcd302092ada6328, ; 1052: System.IO.MemoryMappedFiles.dll => 53
	i64 u0xfd22f00870e40ae0, ; 1053: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 243
	i64 u0xfd49b3c1a76e2748, ; 1054: System.Runtime.InteropServices.RuntimeInformation => 109
	i64 u0xfd536c702f64dc47, ; 1055: System.Text.Encoding.Extensions => 137
	i64 u0xfd583f7657b6a1cb, ; 1056: Xamarin.AndroidX.Fragment => 248
	i64 u0xfd8dd91a2c26bd5d, ; 1057: Xamarin.AndroidX.Lifecycle.Runtime => 257
	i64 u0xfda36abccf05cf5c, ; 1058: System.Net.WebSockets.Client => 82
	i64 u0xfddbe9695626a7f5, ; 1059: Xamarin.AndroidX.Lifecycle.Common => 251
	i64 u0xfeae9952cf03b8cb, ; 1060: tr/Microsoft.Maui.Controls.resources => 348
	i64 u0xfebe1950717515f9, ; 1061: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 255
	i64 u0xff270a55858bac8d, ; 1062: System.Security.Principal => 131
	i64 u0xff9b54613e0d2cc8, ; 1063: System.Net.Http.Json => 65
	i64 u0xffdb7a971be4ec73 ; 1064: System.ValueTuple.dll => 155
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [1065 x i32] [
	i32 42, i32 303, i32 308, i32 282, i32 13, i32 270, i32 213, i32 107,
	i32 313, i32 185, i32 174, i32 48, i32 224, i32 7, i32 88, i32 344,
	i32 322, i32 350, i32 198, i32 244, i32 72, i32 274, i32 12, i32 206,
	i32 104, i32 319, i32 317, i32 351, i32 159, i32 19, i32 249, i32 231,
	i32 164, i32 246, i32 286, i32 170, i32 344, i32 10, i32 311, i32 195,
	i32 287, i32 98, i32 242, i32 243, i32 13, i32 196, i32 10, i32 129,
	i32 97, i32 184, i32 143, i32 181, i32 39, i32 345, i32 306, i32 289,
	i32 341, i32 175, i32 218, i32 5, i32 207, i32 68, i32 279, i32 132,
	i32 278, i32 245, i32 69, i32 232, i32 67, i32 312, i32 57, i32 241,
	i32 52, i32 309, i32 183, i32 43, i32 127, i32 68, i32 83, i32 259,
	i32 161, i32 94, i32 101, i32 274, i32 202, i32 144, i32 154, i32 228,
	i32 328, i32 165, i32 172, i32 329, i32 178, i32 183, i32 202, i32 189,
	i32 83, i32 300, i32 232, i32 4, i32 5, i32 211, i32 51, i32 103,
	i32 308, i32 56, i32 122, i32 100, i32 182, i32 171, i32 120, i32 303,
	i32 21, i32 332, i32 139, i32 99, i32 306, i32 79, i32 338, i32 281,
	i32 121, i32 8, i32 168, i32 347, i32 71, i32 217, i32 260, i32 275,
	i32 174, i32 148, i32 40, i32 279, i32 47, i32 30, i32 272, i32 336,
	i32 147, i32 196, i32 166, i32 28, i32 0, i32 86, i32 283, i32 79,
	i32 43, i32 29, i32 42, i32 105, i32 119, i32 222, i32 45, i32 93,
	i32 347, i32 56, i32 151, i32 149, i32 102, i32 49, i32 307, i32 20,
	i32 237, i32 116, i32 215, i32 328, i32 296, i32 301, i32 197, i32 96,
	i32 58, i32 212, i32 333, i32 331, i32 292, i32 83, i32 296, i32 172,
	i32 26, i32 72, i32 273, i32 190, i32 247, i32 268, i32 349, i32 70,
	i32 33, i32 327, i32 14, i32 141, i32 212, i32 38, i32 353, i32 233,
	i32 340, i32 136, i32 94, i32 90, i32 315, i32 152, i32 293, i32 346,
	i32 24, i32 140, i32 57, i32 142, i32 51, i32 325, i32 0, i32 29,
	i32 160, i32 209, i32 34, i32 167, i32 184, i32 248, i32 198, i32 52,
	i32 354, i32 291, i32 92, i32 229, i32 35, i32 328, i32 160, i32 9,
	i32 326, i32 78, i32 59, i32 209, i32 55, i32 206, i32 322, i32 204,
	i32 13, i32 290, i32 186, i32 226, i32 111, i32 263, i32 32, i32 106,
	i32 86, i32 94, i32 53, i32 98, i32 299, i32 58, i32 9, i32 104,
	i32 180, i32 241, i32 69, i32 201, i32 210, i32 289, i32 321, i32 191,
	i32 127, i32 275, i32 118, i32 137, i32 277, i32 203, i32 128, i32 183,
	i32 108, i32 181, i32 301, i32 133, i32 228, i32 298, i32 150, i32 159,
	i32 249, i32 237, i32 244, i32 311, i32 275, i32 99, i32 24, i32 280,
	i32 146, i32 192, i32 267, i32 3, i32 210, i32 170, i32 225, i32 102,
	i32 164, i32 101, i32 239, i32 25, i32 95, i32 171, i32 175, i32 220,
	i32 3, i32 340, i32 284, i32 246, i32 1, i32 116, i32 301, i32 249,
	i32 256, i32 212, i32 33, i32 6, i32 344, i32 159, i32 342, i32 53,
	i32 87, i32 288, i32 272, i32 182, i32 44, i32 255, i32 106, i32 47,
	i32 140, i32 265, i32 65, i32 266, i32 70, i32 82, i32 60, i32 91,
	i32 157, i32 226, i32 135, i32 112, i32 59, i32 334, i32 266, i32 273,
	i32 174, i32 136, i32 143, i32 40, i32 321, i32 307, i32 203, i32 311,
	i32 204, i32 61, i32 262, i32 312, i32 81, i32 25, i32 36, i32 101,
	i32 259, i32 72, i32 22, i32 318, i32 237, i32 208, i32 345, i32 123,
	i32 70, i32 109, i32 351, i32 121, i32 119, i32 251, i32 268, i32 252,
	i32 11, i32 2, i32 126, i32 117, i32 145, i32 41, i32 89, i32 221,
	i32 177, i32 192, i32 27, i32 151, i32 335, i32 188, i32 297, i32 220,
	i32 1, i32 222, i32 44, i32 236, i32 152, i32 18, i32 88, i32 323,
	i32 41, i32 255, i32 230, i32 260, i32 96, i32 193, i32 28, i32 41,
	i32 80, i32 315, i32 245, i32 233, i32 314, i32 147, i32 110, i32 231,
	i32 11, i32 107, i32 139, i32 16, i32 124, i32 67, i32 160, i32 22,
	i32 325, i32 305, i32 104, i32 188, i32 304, i32 64, i32 58, i32 205,
	i32 324, i32 112, i32 307, i32 177, i32 317, i32 180, i32 0, i32 271,
	i32 302, i32 9, i32 294, i32 122, i32 100, i32 180, i32 107, i32 76,
	i32 263, i32 204, i32 113, i32 223, i32 49, i32 59, i32 20, i32 262,
	i32 240, i32 73, i32 235, i32 158, i32 39, i32 323, i32 35, i32 38,
	i32 329, i32 110, i32 338, i32 21, i32 299, i32 261, i32 214, i32 208,
	i32 314, i32 15, i32 197, i32 81, i32 81, i32 240, i32 197, i32 269,
	i32 278, i32 155, i32 21, i32 206, i32 322, i32 50, i32 51, i32 348,
	i32 338, i32 96, i32 216, i32 190, i32 334, i32 16, i32 213, i32 239,
	i32 125, i32 331, i32 163, i32 45, i32 297, i32 179, i32 118, i32 64,
	i32 169, i32 186, i32 14, i32 276, i32 113, i32 223, i32 61, i32 76,
	i32 123, i32 337, i32 2, i32 347, i32 248, i32 261, i32 318, i32 300,
	i32 261, i32 6, i32 230, i32 327, i32 244, i32 199, i32 17, i32 345,
	i32 324, i32 79, i32 234, i32 268, i32 133, i32 299, i32 337, i32 85,
	i32 195, i32 12, i32 34, i32 121, i32 305, i32 256, i32 176, i32 246,
	i32 87, i32 215, i32 18, i32 289, i32 187, i32 254, i32 73, i32 97,
	i32 168, i32 250, i32 84, i32 353, i32 224, i32 229, i32 157, i32 36,
	i32 154, i32 349, i32 198, i32 352, i32 147, i32 56, i32 115, i32 230,
	i32 286, i32 313, i32 285, i32 37, i32 353, i32 186, i32 117, i32 222,
	i32 14, i32 216, i32 149, i32 43, i32 207, i32 220, i32 100, i32 304,
	i32 182, i32 171, i32 16, i32 277, i32 48, i32 109, i32 99, i32 184,
	i32 266, i32 27, i32 130, i32 29, i32 329, i32 317, i32 191, i32 278,
	i32 130, i32 44, i32 240, i32 245, i32 152, i32 8, i32 284, i32 211,
	i32 267, i32 330, i32 343, i32 342, i32 134, i32 341, i32 42, i32 305,
	i32 33, i32 354, i32 46, i32 146, i32 262, i32 205, i32 253, i32 241,
	i32 140, i32 63, i32 134, i32 321, i32 48, i32 163, i32 227, i32 253,
	i32 216, i32 309, i32 251, i32 337, i32 285, i32 46, i32 167, i32 200,
	i32 176, i32 250, i32 202, i32 200, i32 314, i32 326, i32 247, i32 333,
	i32 208, i32 18, i32 8, i32 179, i32 238, i32 277, i32 126, i32 60,
	i32 144, i32 270, i32 336, i32 257, i32 201, i32 295, i32 291, i32 153,
	i32 145, i32 303, i32 128, i32 302, i32 163, i32 165, i32 242, i32 219,
	i32 187, i32 271, i32 339, i32 26, i32 267, i32 254, i32 84, i32 291,
	i32 129, i32 296, i32 103, i32 151, i32 294, i32 292, i32 272, i32 54,
	i32 165, i32 170, i32 133, i32 213, i32 37, i32 287, i32 336, i32 22,
	i32 114, i32 92, i32 50, i32 61, i32 124, i32 85, i32 129, i32 166,
	i32 295, i32 169, i32 276, i32 279, i32 243, i32 215, i32 181, i32 258,
	i32 4, i32 252, i32 332, i32 173, i32 2, i32 263, i32 118, i32 199,
	i32 221, i32 19, i32 194, i32 91, i32 66, i32 30, i32 189, i32 325,
	i32 235, i32 60, i32 113, i32 254, i32 32, i32 130, i32 162, i32 343,
	i32 233, i32 143, i32 339, i32 156, i32 17, i32 232, i32 218, i32 77,
	i32 75, i32 15, i32 172, i32 87, i32 126, i32 253, i32 264, i32 234,
	i32 346, i32 260, i32 34, i32 120, i32 141, i32 124, i32 108, i32 323,
	i32 287, i32 214, i32 229, i32 330, i32 320, i32 54, i32 47, i32 28,
	i32 142, i32 148, i32 194, i32 150, i32 35, i32 346, i32 177, i32 77,
	i32 164, i32 1, i32 265, i32 280, i32 342, i32 335, i32 162, i32 12,
	i32 158, i32 154, i32 78, i32 105, i32 114, i32 226, i32 318, i32 310,
	i32 66, i32 310, i32 67, i32 290, i32 316, i32 45, i32 228, i32 111,
	i32 7, i32 225, i32 55, i32 221, i32 65, i32 320, i32 238, i32 20,
	i32 111, i32 103, i32 63, i32 145, i32 219, i32 7, i32 200, i32 335,
	i32 173, i32 50, i32 290, i32 117, i32 144, i32 178, i32 179, i32 169,
	i32 82, i32 115, i32 264, i32 185, i32 17, i32 74, i32 269, i32 91,
	i32 217, i32 319, i32 89, i32 122, i32 283, i32 223, i32 271, i32 137,
	i32 156, i32 108, i32 11, i32 92, i32 31, i32 185, i32 348, i32 138,
	i32 178, i32 340, i32 343, i32 281, i32 218, i32 40, i32 354, i32 280,
	i32 141, i32 304, i32 306, i32 25, i32 176, i32 352, i32 74, i32 250,
	i32 282, i32 209, i32 27, i32 68, i32 90, i32 97, i32 115, i32 31,
	i32 106, i32 252, i32 37, i32 190, i32 73, i32 214, i32 308, i32 298,
	i32 110, i32 125, i32 225, i32 89, i32 193, i32 88, i32 334, i32 95,
	i32 189, i32 131, i32 264, i32 316, i32 283, i32 195, i32 276, i32 238,
	i32 282, i32 235, i32 295, i32 187, i32 166, i32 132, i32 194, i32 288,
	i32 292, i32 273, i32 188, i32 10, i32 49, i32 350, i32 93, i32 350,
	i32 153, i32 63, i32 138, i32 153, i32 62, i32 193, i32 119, i32 139,
	i32 300, i32 86, i32 352, i32 162, i32 285, i32 146, i32 331, i32 247,
	i32 84, i32 76, i32 71, i32 224, i32 138, i32 236, i32 217, i32 313,
	i32 309, i32 127, i32 310, i32 54, i32 112, i32 132, i32 90, i32 23,
	i32 75, i32 131, i32 31, i32 192, i32 74, i32 259, i32 333, i32 161,
	i32 23, i32 4, i32 173, i32 341, i32 125, i32 239, i32 332, i32 327,
	i32 116, i32 175, i32 32, i32 3, i32 210, i32 167, i32 286, i32 30,
	i32 19, i32 258, i32 95, i32 36, i32 5, i32 227, i32 302, i32 158,
	i32 281, i32 297, i32 234, i32 288, i32 211, i32 78, i32 64, i32 270,
	i32 150, i32 231, i32 123, i32 136, i32 284, i32 298, i32 207, i32 315,
	i32 102, i32 39, i32 219, i32 142, i32 326, i32 69, i32 26, i32 77,
	i32 293, i32 80, i32 257, i32 205, i32 24, i32 155, i32 38, i32 265,
	i32 339, i32 227, i32 135, i32 105, i32 294, i32 57, i32 168, i32 93,
	i32 62, i32 134, i32 46, i32 135, i32 242, i32 148, i32 201, i32 80,
	i32 236, i32 203, i32 258, i32 199, i32 293, i32 157, i32 324, i32 316,
	i32 85, i32 351, i32 312, i32 349, i32 62, i32 98, i32 319, i32 274,
	i32 156, i32 330, i32 120, i32 196, i32 6, i32 15, i32 75, i32 191,
	i32 320, i32 149, i32 52, i32 71, i32 23, i32 161, i32 128, i32 66,
	i32 114, i32 269, i32 256, i32 55, i32 53, i32 243, i32 109, i32 137,
	i32 248, i32 257, i32 82, i32 251, i32 348, i32 255, i32 131, i32 65,
	i32 155
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 u0x0000000000000000, ; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.mm.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.mm.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/10.0.1xx @ 9a2d211ba972d3a0c4c108e043def432f3ec2620"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
