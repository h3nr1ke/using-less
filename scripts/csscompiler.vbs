' Compila o css gerado dentro da pasta less
' Necessario instalar o node.js (https://nodejs.org/)
' e instalar o less compiler (http://lesscss.org/)
' Escrito por Henrique Deodato <h3nr1ke@gmail.com>

' caminhos para as pastas....
' http://blogs.technet.com/b/heyscriptingguy/archive/2006/04/05/how-can-i-determine-the-path-to-the-folder-where-a-script-is-running.aspx

'objeto para executar comandos...
Dim objShell
Set objShell = WScript.CreateObject("WScript.Shell")

'para escrever no console 
Set objStdOut = WScript.StdOut

objStdOut.Write "--------------------------------------"
objStdOut.WriteBlankLines(1)
objStdOut.Write "Compilador de less"
objStdOut.WriteBlankLines(1)
objStdOut.Write "--------------------------------------"
objStdOut.WriteBlankLines(1)


'defina aqui os caminhos para as pastas, podem ser fixo ou relativos
'por padrao eu deixei relativo, compilo a pasta less no mesmo nivel
'para gerar resultados na pasta css em um nivel superior

Dim filesys, lessFolder, cssFolder

Set filesys = CreateObject("Scripting.FileSystemObject")
varPathCurrent = filesys.GetParentFolderName(WScript.ScriptFullName)
varPathParent = filesys.GetParentFolderName(varPathCurrent)
'varPathGrandParent = filesys.GetParentFolderName(varPathParent)

'pastas de origem e destino dos arquivos...
'podem ser definidas como quiser
lessFolder = varPathCurrent & "\less"
cssFolder = varPathParent & "\css"

'objetos para serem usados com os arquivos...
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFolder = objFSO.GetFolder(lessFolder)
Set colFiles = objFolder.Files

'obj para testar a extensao do arquivo....
Set x = CreateObject("scripting.filesystemobject")

'loop em todos os arquivos na pasta less e saida na pasta definida
For Each objFile in colFiles
  If x.GetExtensionName(objFile) = "less" then
   'o arquivo vars.less nao eh compilado
    If fileNameOnly(objFile.Name) <> "vars" then
      objStdOut.WriteBlankLines(1)
      objStdOut.Write "Compilando " & objFile.Name & " para " &fileNameOnly(objFile.Name) & ".css"
      'executa o comando para compilacao
      objShell.run "lessc " & lessFolder & "\" & objFile.Name & " " & cssFolder & "\" &fileNameOnly(objFile.Name) & ".css -x"
    else
      objStdOut.WriteBlankLines(1)
      objStdOut.Write "Ignorando " & objFile.Name 
    end if
  end if
Next

objStdOut.WriteBlankLines(1)
objStdOut.WriteBlankLines(1)

objStdOut.Write "--------------------------------------"
objStdOut.WriteBlankLines(1)
objStdOut.Write "Fim do processo de compilacao"
objStdOut.WriteBlankLines(1)
objStdOut.Write "--------------------------------------"

'--------------------------------------------------------
'    Funcoes
'--------------------------------------------------------
Function fileNameOnly(ByVal FileName)
  Dim Result, i
  Result = FileName
  i = InStrRev(FileName, ".")
  If ( i > 0 ) Then
    Result = Mid(FileName, 1, i - 1)
  End If
  fileNameOnly = Result
End Function