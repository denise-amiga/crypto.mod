SuperStrict

Framework BRL.StandardIO
Import Crypto.SHA3Digest

Local data:String = "Hello Digest World !!"

Local digest:TMessageDigest = GetMessageDigest("SHA3-256")

If digest Then
	Print digest.Digest(data)
End If
