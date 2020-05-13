Option Explicit

Dim Arguments()   ' 引数 ファイル名が入る
Dim NetworkDrives ' ネットワークドライブのドライブレターとUNC
Set NetworkDrives = CreateObject("Scripting.Dictionary")

' 引数を配列へ格納する
Call SetArguments()

' ネットワークドライブ情報を取得する
Call SetNetworkDrives()

' ネットワークドライブの場合はUNC形式にする
Call ConvUNC()

' クリップボードへセットする
Call SetClip(Join(Arguments, vbNewLine))

' 終了する
WScript.Quit




' 引数を配列へ格納する
Sub SetArguments()
 Dim i
 ReDim Arguments(WScript.Arguments.Count -1)
 For i = 0 To WScript.Arguments.Count -1
  Arguments(i) = WScript.Arguments(i)
 Next
End Sub


' ネットワークドライブ情報を取得する
Sub SetNetworkDrives()
 Dim i
 Dim Network ' WScript.Networkオブジェクト
 Set Network = CreateObject("WScript.Network")
 For i = 0 To Network.EnumNetworkDrives.Count -1 Step 2
  If Network.EnumNetworkDrives.Item(i) <> "" Then ' ドライブレターが割り当てられてる場合のみ
   NetworkDrives.Add Network.EnumNetworkDrives.Item(i), Network.EnumNetworkDrives.Item(i+1)
  End If
 Next
End Sub


' ネットワークドライブの場合はUNC形式にする
Sub ConvUNC()
 Dim i
 Dim DriveName
 Dim PathAndFileName
 For i = 0 To UBound(Arguments)
  DriveName = CreateObject("Scripting.FileSystemObject").GetDriveName(Arguments(i))
  If NetworkDrives.Exists(DriveName) = True Then ' ネットワークドライブの場合はUNC形式にする
   PathAndFileName = Mid(Arguments(i), Len(DriveName)+1)
   Arguments(i) = NetworkDrives.Item(DriveName) & PathAndFileName
  End If
 Next
End Sub


' クリップボードにセットする
Sub SetClip(TextData)
    Dim FF
    Dim TB
    Set FF = CreateObject("Forms.Form.1")
    If IsEmpty(FF) Then
        Exit Sub
    End If
    Set TB = FF.Controls.Add("Forms.TextBox.1").Object
    TB.MultiLine = True
    TB.Text = TextData
    TB.SelStart = 0
    TB.SelLength = TB.TextLength
    TB.Copy
    Set TB = Nothing
    Set FF = Nothing
End Sub
