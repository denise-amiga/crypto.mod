'
'  Copyright (C) 2019-2020 Bruce A Henderson
'
'  This software is provided 'as-is', without any express or implied
'  warranty.  In no event will the authors be held liable for any damages
'  arising from the use of this software.
'
'  Permission is granted to anyone to use this software for any purpose,
'  including commercial applications, and to alter it and redistribute it
'  freely, subject to the following restrictions:
'
'  1. The origin of this software must not be misrepresented; you must not
'     claim that you wrote the original software. If you use this software
'     in a product, an acknowledgment in the product documentation would be
'     appreciated but is not required.
'  2. Altered source versions must be plainly marked as such, and must not be
'     misrepresented as being the original software.
'  3. This notice may not be removed or altered from any source distribution.
'
SuperStrict

Rem
bbdoc: Camellia Symmetric Key Block Cipher.
about: Camellia has a block size of 128 bits and key sizes of 128, 192 and 256 bits. 

See https://en.wikipedia.org/wiki/Camellia_(cipher)
End Rem
Module Crypto.CamelliaCipher


ModuleInfo "CC_OPTS: -DLTC_NO_TEST -DLTC_NO_FILE"
ModuleInfo "CC_OPTS: -DLTC_CAMELLIA"

Import "common.bmx"

New TCamelliaCipherFactory(bmx_crypto_camellia_register())

Type TCamelliaCipher Extends TCipher

	Method KeySize:Int(key:Int) Override
		Return bmx_crypto_camellia_keysize(key)
	End Method
	
	Method Name:String() Override
		Return "camellia"
	End Method

End Type

Type TCamelliaCipherFactory Extends TCipherFactory
	Method Find:TCipher(index:Int) Override
		If index = Self.index Then
			Return New TCamelliaCipher(index)
		End If
	End Method
End Type
