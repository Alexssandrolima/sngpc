unit uFuncoes;

interface

uses
Windows, Dialogs, Messages, SysUtils, Classes, Controls, Forms,
StdCtrls, Mask,Db, DBTables, DBIProcs, TypInfo, WinProcs, ExtCtrls, uFormMainSngpc,
DBXpress, SqlExpr, DBClient, Provider, idHash, DateUtils;

const
    MSG_OK   = 'Registro gravado com sucesso.';
    MSG_ERRO = 'Erro ao tentar gravar registro.';
    MSG_PERGUTA = 'Deseja excluir este registro?';
    MSG_PERMISSOES = 'Voc� n�o tem pemiss�o para isto';
    MSG_ERROR = 'Ocorreu um erro!';

// Func�es e procedures para o sistema.

type
  TByteArr = array of byte;
  TStringArr = array of String;
Function StrZero(Zeros:string;Quant:integer):String;
Procedure Limpar_Status;
function Empty(inString:String): Boolean;
Function Codifica( const Str1: string): String;
Function SysComputerName: string;
Function ContaCaracs(Edit:String): integer;
Function Replicate( Caracter:String; Quant:Integer ): String;
Function CPF(num: string): boolean;
Function CGC(num: string): boolean;
Function Alltrim(const Search: string): string;
Function Datafinal(dataini:tdatetime; dias_uteis:integer):tdatetime;
Function DataExtenso(Data:TDateTime): String;
Function MesExtenso (xMes : TDateTime) : string;
function StrToPChar(const Str: string): PChar;
Function Arredondar(Valor: Double; Dec: Integer): Double;
Function tbReplChar(const Ch: Char; const Len: integer): string;
Function Padr(s:string;n:integer):string;
Function Justifica(mCad:string;mMAx:integer):string;
function extenso (valor: real): string;
function Maiuscula(Texto:String): String;
Function DiadaSemana(Data : String) : string;
Function OnLine(Porta:Word):Boolean;
Function EsvaziaTabela(Tabela : TTable): Boolean;
function RemoveChar(Const Texto:String):String;
function StrIsFloat(const S: string): boolean;
function StrIsInteger(const S: string): boolean;
function CalculaCnpjCpf(Numero : String) : String;
function FormataCPF(cTexto : String) : String;
function percorreArquivoTexto ( nomeDoArquivo: String ) : String;
function mvcodigo(campo,tabela:string):integer;
function mscodigo(campo,tabela:string):string;
function NOME_PASTA(M_CDUSUA : String): String;
function Buscar_Dados_Str(campo, valor, tabela : String): boolean;
function GetTipoReceituario(M_TIPO : String): integer;
function GetUsoMedico(M_TIPO : String): integer;
function GetCRMMedico(M_NUMCRM : integer): boolean;
function GetCliente(M_IDCLIE : integer): boolean;
function GetNomeCliente(M_IDCLIE : integer): String;
function GetMedico(M_IDMEDI : integer): boolean;
function GetOrgaoExpedidor(M_IDORGAO : integer): String ;
function GetConselhoProfissao(M_IDCONS : integer): String ;
function GetTipoDocumento(M_IDTIPO : integer): String ;
function GetTipoPerda(M_NMTIPO : String): integer;
function GetUndInsumo(M_NMTIPO : String): String;
function ApagarArquivo(NOME : String) : Boolean;
function FormatarData(M_DATA : String) : String;
function Gerar_XML(M_TPOPER, M_TPPERD : Integer; M_DTINIC, M_DTFINA, M_DTNOTA, M_DTRECE : TDateTime ;
aDataSet :  TDataset; M_TPMOVI, M_NRNOTA, M_ORCNJP, M_DECNPJ : String): Boolean;
function Gerar_INSUMOS_XML(M_TPOPER : Integer; M_DTINIC, M_DTFINA, M_DTNOTA, M_DTRECE : TDateTime ;
aDataSet :  TDataset; M_TPMOVI, M_NRNOTA, M_ORCNJP, M_DECNPJ : String): Boolean;
function GetCNPJ(M_NMLOJA : String): String;
function COMPRA_INSUMOS_XML(M_TPOPER, M_TPUNID : Integer; M_DTINIC, M_DTFINA, M_DTNOTA, M_DTRECE : TDateTime ;
aDataSet :  TDataset; M_NRNOTA, M_ORCNJP, M_DECNPJ : String): Boolean;
function VENDA_INSUMOS_XML(M_TPOPER, M_TPUNID, M_TPUSOI, M_TPRECE : Integer; M_DTINIC, M_DTFINA, M_DTNOTA, M_DTRECE, M_DTPRES : TDateTime ;
aDataSet :  TDataset; M_NRNOTI, M_ORCNJP, M_DECNPJ, M_NMPRES, M_NRPRES, M_CRMPR, M_UFPRES,
M_NMCLIE, M_TPDOCU, M_NRDOCU, M_ORGAO, M_UFCLIE : String): Boolean;
function TRANSFERENCIA_INSUMOS_XML(M_TPOPER : Integer; M_DTINIC, M_DTFINA, M_DTNOTA, M_DTTRAN, M_DTPRES : TDateTime ;
aDataSet :  TDataset; M_NRNOTA, M_ORCNJP, M_DECNPJ : String): Boolean;
function PERDA_INSUMOS_XML(M_TPOPER, M_MOTIVO : Integer; M_DTINIC, M_DTFINA, M_DTPERD, M_DTPRES : TDateTime ;
aDataSet :  TDataset; M_CNJPFO : String): Boolean;
Function Verificar_Status() : Boolean;
Procedure Criar_Status(W_NMARQU : string);
Function Criar_Retorno_Venda(M_STATUS, M_NRVEND : string) : boolean;
Function Criar_Retorno_Entrada(M_STATUS, M_NRENTR : string) : boolean;
Function Criar_Retorno_Transf(M_STATUS,  M_NRTRAN : string) : boolean;
Function Criar_Retorno_Perda(M_STATUS,  M_NRPERD : string) : boolean;
function RemoveVirgula(Str:String): String;
function CriaSubDir(const NomeSubDir: string): boolean;
Procedure CopiaArquivo(scrname,destname:string);
function FormatarMS(aCodigo : String) : String;
function FormataCNPJ(CNPJ: string): string;
function StrToByte(const Value: String): TByteArr;
function ByteToString(const Value: TByteArr): String;
function IdadeAtual(Nasc : TDate): Integer;
function SubData(DataInicio, DataFinal : TDatetime) : Double;
function PasswordInputBox(const ACaption, APrompt:string): string;


implementation

uses udmDados, udmPesquisa, Math, IdHashMessageDigest;


//Criptografar um arquivo inteiro
function MD5File(const fileName: string): string;
var
idmd5 : TIdHashMessageDigest5;
fs : TFileStream;
begin
idmd5 := TIdHashMessageDigest5.Create;
fs := TFileStream.Create(fileName, fmOpenRead OR fmShareDenyWrite) ;
try
//result := idmd5.HashStreamAsHex(fs);
finally
fs.Free;
idmd5.Free;
end;
end;

function StrToByte(const Value: String): TByteArr;
var
  I: integer;
begin
  SetLength(Result, Length(Value));
  for I := 0 to Length(Value) - 1 do
    if ord(Value[I + 1]) > 48 then
       Result[I] := ord(Value[I + 1]) - 48
    else Result[I] := ord(Value[I + 1])

end;


function ByteToString(const Value: TByteArr): String;
var
  I: integer;
  S : String;
  Letra: char;
begin
  S := '';
  for I := Length(Value)-1 Downto 0 do
  begin
    letra := Chr(Value[I] + 48);
    S := letra + S;
  end;
  Result := S;
end;

function CalculaCnpjCpf(Numero : String) : String;
var
  i,j,k, Soma, Digito : Integer;
  CNPJ : Boolean;
begin
  Result := Numero;
  case Length(Numero) of
  9:
  CNPJ := False;
  12:
  CNPJ := True;
  else
  Exit;
  end;
  for j := 1 to 2 do
  begin
  k := 2;
  Soma := 0;
  for i := Length(Result) downto 1 do
  begin
  Soma := Soma + (Ord(Result[i])-Ord('0'))*k;
  Inc(k);
  if (k > 9) and CNPJ then
  k := 2;
  end;
  Digito := 11 - Soma mod 11;
  if Digito >= 10 then
  Digito := 0;
  Result := Result + Chr(Digito + Ord('0'));
  end;
end;

function FormataCPF(cTexto : String) : String;
begin
     //  999.999.999-99
     result := Copy(cTexto,1,3)+'.'+
               Copy(cTexto,4,3)+'.'+
               Copy(cTexto,7,3)+'-'+
               Copy(cTexto,10,2);
end;

function RemoveChar(Const Texto:String):String;
//
// Remove caracteres de uma string deixando apenas numeros
//
var
I: integer;
S: string;
begin
S := '';
for I := 1 To Length(Texto) Do
   begin
   if (Texto[I] in ['0'..'9']) then
       begin
       S := S + Copy(Texto, I, 1);
       end;
   end;
result := S;
end;

function StrIsInteger(const S: string): boolean;
// Verificar se uma string cont�m um valor inteiro v�lido
begin
  try
  StrToInt(S);
  Result := true;
  except
  Result := false;
  end;
end;


function StrIsFloat(const S: string): boolean;
// Verificar se uma string cont�m um valor num�rico v�lido
begin
  try
  StrToFloat(S);
  Result := true;
  except
  Result := false;
  end;
end;

function StrZero(Zeros:string;Quant:integer):String;
{Insere Zeros � frente de uma string}
var
I,Tamanho:integer;
aux: string;
begin
  aux := zeros;
  Tamanho := length(ZEROS);
  ZEROS:='';
  for I:=1 to quant-tamanho do
  ZEROS:=ZEROS + '0';
  aux := zeros + aux;
  StrZero := aux;
end;

Function Padr(s: string; n: integer): string;
{alinha uma string � direita}
begin
       Result:=Format('%'+IntToStr(n)+'.'+IntToStr(n)+'s',[s]);
end;


Function tbReplChar(const Ch: Char; const Len: integer): string;
var
  I: integer;
begin
  SetLength(Result, Len);
  for I := 1 to Len do
  Result[I] := Ch;
end;


Procedure Limpar_Status;
begin
     frmMain.Info.Panels[2].Text := ' ';
     frmMain.Info.Panels[1].Text := '';
end;

function Empty(inString:String): Boolean;
{Testa se a variavel est� vazia ou n�o}
Var
  index : Byte;
Begin
  index := 1;
  Empty := True;
  while (index <= Length(inString))and (index <> 0) do
  begin
  if inString[index] = ' ' Then
  begin
inc(index)
  end
  else
Begin
  Empty := False;
  index := 0
end;
  end;
end;

Function Codifica( const Str1: string): String;
{Encripta uma string}
var
Mascara,Str2: String;
PonM, PonS: Byte;
begin
Mascara := '#$%$'#13#12;
Str2 := '';
PonM := 1;
for PonS:=1 to length(Str1) do
  begin
  AppendStr( Str2, Chr( Ord(Str1[PonS]) Xor Ord(Mascara[PonM])));
  Inc( PonM);
  if PonM>Length(Mascara) then
  begin
  PonM:=1;
  end;
  Result := Str2;
  end;
end;

{ Sys }
function SysComputerName: string;
var
  I: DWord;
begin
  I := MAX_COMPUTERNAME_LENGTH + 1;
  SetLength(Result, I);
  Windows.GetComputerName(PChar(Result), I);
  Result := string(PChar(Result));
end;

Function ContaCaracs(Edit: String): integer;
{Retorna quantos caracteres tem um Edit especificado}
begin
     Result := Length(Edit);
end;

function Replicate(Caracter: String; Quant: Integer): String;
{Repete o mesmo caractere v�rias vezes}
var I : Integer;
begin
Result := '';
  for I := 1 to Quant do
  Result := Result + Caracter;
end;

Function CPF(num: string): boolean;
var
n1,n2,n3,n4,n5,n6,n7,n8,n9: integer;
d1,d2: integer;
digitado, calculado: string;
begin
n1:=StrToInt(num[1]);
n2:=StrToInt(num[2]);
n3:=StrToInt(num[3]);
n4:=StrToInt(num[4]);
n5:=StrToInt(num[5]);
n6:=StrToInt(num[6]);
n7:=StrToInt(num[7]);
n8:=StrToInt(num[8]);
n9:=StrToInt(num[9]);
d1:=n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
d1:=11-(d1 mod 11);
if d1>=10 then d1:=0;
d2:=d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
d2:=11-(d2 mod 11);
if d2>=10 then d2:=0;
calculado:=inttostr(d1)+inttostr(d2);
digitado:=num[10]+num[11];
if calculado=digitado then
  cpf:=true
  else
  cpf:=false;
end;

function cgc(num: string): boolean;
var
n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12: integer;
d1,d2: integer;
digitado, calculado: string;
begin
n1:=StrToInt(num[1]);
n2:=StrToInt(num[2]);
n3:=StrToInt(num[3]);
n4:=StrToInt(num[4]);
n5:=StrToInt(num[5]);
n6:=StrToInt(num[6]);
n7:=StrToInt(num[7]);
n8:=StrToInt(num[8]);
n9:=StrToInt(num[9]);
n10:=StrToInt(num[10]);
n11:=StrToInt(num[11]);
n12:=StrToInt(num[12]);
d1:=n12*2+n11*3+n10*4+n9*5+n8*6+n7*7+n6*8+n5*9+n4*2+n3*3+n2*4+n1*5;
d1:=11-(d1 mod 11);
if d1>=10 then d1:=0;
d2:=d1*2+n12*3+n11*4+n10*5+n9*6+n8*7+n7*8+n6*9+n5*2+n4*3+n3*4+n2*5+n1*6;
d2:=11-(d2 mod 11);
if d2>=10 then d2:=0;
calculado:=inttostr(d1)+inttostr(d2);
digitado:=num[13]+num[14];
if calculado=digitado then
  cgc:=true
  else
  cgc:=false;
end;

Function Alltrim(const Search: string): string;
{Remove os espa�os em branco de ambos os lados da string}
const
BlackSpace = [#33..#126];
var
Index: byte;
begin
Index:=1;
while (Index <= Length(Search)) and not (Search[Index] in BlackSpace) do
  begin
  Index:=Index + 1;
  end;
Result:=Copy(Search, Index, 255);
Index := Length(Result);
while (Index > 0) and not (Result[Index] in BlackSpace) do
  begin
  Index:=Index - 1;
  end;
Result := Copy(Result, 1, Index);
End;

Function Datafinal(dataini:tdatetime; dias_uteis:integer):tdatetime;
//
// Retorna uma data acres�ida de mais um certo n�mero de dias
//
var dw:integer;
Begin
  dw := DayOfWeek(dataini)-1;
  result := dataini+dias_uteis+((dias_uteis-1+dw) div 7)*2;
End;

function DataExtenso(Data:TDateTime): String;
{Retorna uma data por extenso}
var
  NoDia : Integer;
  DiaDaSemana : array [1..7] of String;
  Meses : array [1..12] of String;
  Dia, Mes, Ano : Word;
begin
{ Dias da Semana }
  DiaDasemana [1]:= 'domingo';
  DiaDasemana [2]:= 'segunda-feira';
  DiaDasemana [3]:= 'ter�a-feira';
  DiaDasemana [4]:= 'quarta-feira';
  DiaDasemana [5]:= 'quinta-feira';
  DiaDasemana [6]:= 'sexta-feira';
  DiaDasemana [7]:= 's�bado';
{ Meses do ano }
  Meses [1] := 'janeiro';
  Meses [2] := 'fevereiro';
  Meses [3] := 'mar�o';
  Meses [4] := 'abril';
  Meses [5] := 'maio';
  Meses [6] := 'junho';
  Meses [7] := 'julho';
  Meses [8] := 'agosto';
  Meses [9] := 'setembro';
  Meses [10]:= 'outubro';
  Meses [11]:= 'novembro';
  Meses [12]:= 'dezembro';
  DecodeDate (Data, Ano, Mes, Dia);
  NoDia := DayOfWeek (Data);
  Result :=  IntToStr(Dia) +' de ' + Meses[Mes]+ ' de ' + IntToStr(Ano)+'.';
  //DiaDaSemana[NoDia] + ', '
end;

Function MesExtenso (xMes : TDateTime) : string;
Var
Dia, Mes, Ano : Word;
begin
Mes := 0;
DecodeDate (xMes, Ano, Mes, Dia);
{Try
Mes := Round (xMes);
Except
End;}
case Mes of
1: Result := 'JAN';
2: Result := 'FEV';
3: Result := 'MAR';
4: Result := 'ABR';
5: Result := 'MAI';
6: Result := 'JUN';
7: Result := 'JUL';
8: Result := 'AGO';
9: Result := 'SET';
10: Result := 'OUT';
11: Result := 'NOV';
12: Result := 'DEZ';
else
Result := '';
end;
end;

function StrToPChar(const Str: string): PChar;
{Converte String em Pchar}
type
  TRingIndex = 0..7;
var
  Ring: array[TRingIndex] of PChar;
  RingIndex: TRingIndex;
  Ptr: PChar;
begin
  Ptr := @Str[Length(Str)];
  Inc(Ptr);
  if Ptr^ = #0 then
  begin
  Result := @Str[1];
  end
  else
  begin
  Result := StrAlloc(Length(Str)+1);
  RingIndex := (RingIndex + 1) mod (High(TRingIndex) + 1);
  StrPCopy(Result,Str);
  StrDispose(Ring[RingIndex]);
  Ring[RingIndex]:= Result;
  end;
end;

Function Arredondar(Valor: Double; Dec: Integer): Double;
var
  Valor1,
  Numero1,
  Numero2,
  Numero3: Double;
begin
  Valor1:=Exp(Ln(10) * (Dec + 1));
  Numero1:=Int(Valor * Valor1);
  Numero2:=(Numero1 / 10);
  Numero3:=Round(Numero2);
  Result:=(Numero3 / (Exp(Ln(10) * Dec)));
end;

Function Justifica(mCad:string;mMAx:integer):string;
var
mPos,mPont,mTam,mNr,mCont:integer;
mStr:string;
begin
mTam:=Length(mCad);
if mTam>=mMax then
Result:=copy(mCad,1,mMax)
else
mStr:='';
mCont:=0;
mPont:=1;
mNr:=mMax-mTam;
while mCont<mNr do
begin
mPos:=pos(mStr,copy(mCad,mPont,100));
if mPos=0 then
begin
mStr:=mStr+' ';
mPont:=1;
continue;
end
else
begin
mCont:=mCont+1;
Insert(' ',mCad,mPos+mPont);
mPont:=mPont+mPos+length(mStr);
end;
Result:=mCad;
end;
end;

function extenso (valor: real): string;
var
Centavos, Centena, Milhar, Milhao, Texto, msg: string;
const
Unidades: array[1..9] of string = ('Um', 'Dois', 'Tres', 'Quatro', 'Cinco', 'Seis', 'Sete', 'Oito', 'Nove');
Dez: array[1..9] of string = ('Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze', 'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');
Dezenas: array[1..9] of string = ('Dez', 'Vinte', 'Trinta', 'Quarenta', 'Cinquenta', 'Sessenta', 'Setenta', 'Oitenta', 'Noventa');
Centenas: array[1..9] of string = ('Cento', 'Duzentos', 'Trezentos', 'Quatrocentos', 'Quinhentos', 'Seiscentos', 'Setecentos', 'Oitocentos', 'Novecentos');
function ifs(Expressao: Boolean; CasoVerdadeiro, CasoFalso: String): String;
begin
if Expressao
then Result:=CasoVerdadeiro
else Result:=CasoFalso;
end;



function MiniExtenso (trio: string): string;
var
Unidade, Dezena, Centena: string;
begin
Unidade:='';
Dezena:='';
Centena:='';
if (trio[2]='1') and (trio[3]<>'0') then
  begin
  Unidade:=Dez[strtoint(trio[3])];
  Dezena:='';
end
else
 begin
  if trio[2]<>'0' then Dezena:=Dezenas[strtoint(trio[2])];
  if trio[3]<>'0' then Unidade:=Unidades[strtoint(trio[3])];
 end;
if (trio[1]='1') and (Unidade='') and (Dezena='')
 then Centena:='cem'
else
 if trio[1]<>'0'
  then Centena:=Centenas[strtoint(trio[1])]
  else Centena:='';
 Result:= Centena + ifs((Centena<>'') and ((Dezena<>'') or (Unidade<>'')), ' e ', '')
  + Dezena + ifs((Dezena<>'') and (Unidade<>''),' e ', '') + Unidade;
end;
begin
if (valor>999999.99) or (valor<0) then
 begin
  msg:='O valor est� fora do intervalo permitido.';
  msg:=msg+'O n�mero deve ser maior ou igual a zero e menor que 999.999,99.';
  msg:=msg+' Se n�o for corrigido o n�mero n�o ser� escrito por extenso.';
  showmessage(msg);
  Result:='';
  exit;
 end;
if valor=0 then
 begin
  Result:='';
  Exit;
 end;
Texto:=formatfloat('000000.00',valor);
Milhar:=MiniExtenso(Copy(Texto,1,3));
Centena:=MiniExtenso(Copy(Texto,4,3));
Centavos:=MiniExtenso('0'+Copy(Texto,8,2));
Result:=Milhar;
if Milhar<>'' then
  if copy(texto,4,3)='000' then
  Result:=Result+' Mil Reais'
  else
  Result:=Result+' Mil, ';
if (((copy(texto,4,2)='00') and (Milhar<>'')
  and (copy(texto,6,1)<>'0')) or (centavos=''))
  and (Centena<>'') then Result:=Result+' e ';
if (Milhar+Centena <>'') then Result:=Result+Centena;
if (Milhar='') and (copy(texto,4,3)='001') then
  Result:=Result+' Real'
 else
  if (copy(texto,4,3)<>'000') then Result:=Result+' Reais';
if Centavos='' then
 begin
  Result:=Result+'.';
  Exit;
 end
else
 begin
  if Milhar+Centena='' then
  Result:=Centavos
  else
  Result:=Result+', e '+Centavos;
if (copy(texto,8,2)='01') and (Centavos<>'') then
  Result:=Result+' Centavo'
 else
  Result:=Result+' Centavos';
end;
end;

function Maiuscula(Texto:String): String;
{Converte a primeira letra do texto especificado para
maiuscula e as restantes para minuscula}
var
OldStart: Integer;
begin
if Texto <> '' then
  begin
  Texto := UpperCase(Copy(Texto,1,1))+LowerCase(Copy(Texto,2,Length(Texto)));
  Result := Texto;
  end;
end;

Function DiadaSemana(Data : String) : string;
const
  semana : array[1..7] of string = ('Domingo','Segunda-feira','Ter�a-feira','Quarta-feira','Quinta-feira','Sexta-feira', 'Sabado');
begin
  Result := semana[DayOfWeek(strtodate(Data))]
end;

Function OnLine(Porta:Word):Boolean;
// Verificar se Impressora esta Conectada
Const
Portas :Byte = $02;
Var
Res :Byte;
Begin
{ C�digo em Assembler }
Asm
mov ah,Portas; {Requisita o acesso as portas}
mov dx,Porta;{Define a porta de teste}
Int $17; {Chama a interrup��o de Impressora}
mov Res,ah; {Guarda em Res o resultado da opera��o }
end;
Result := (Res and $80) = $80; {Testa o valor de sa�da}
End;

function EsvaziaTabela(Tabela : TTable): Boolean;
// Esvazia a tabela passada como parametro
var
lExclusivo : boolean;
begin
Tabela.Active := False;
repeat
try
  Tabela.Exclusive := True;
  Tabela.Active := True;
  Tabela.EmptyTable;
  lExclusivo := True;
  Break;
except
  on EDatabaseError do
  if MessageDlg('A tabela est� sendo usada por outro usu�rio. Tenta novamente ?', mtError,[mbOK, mbCancel], 0) <> mrOK then
  begin
  lExclusivo := False;
  raise;
  end;
  end;
until False;
Result := lExclusivo;
end;

function percorreArquivoTexto ( nomeDoArquivo: String ) : String;
var arq: TextFile;
linha: String;
begin
AssignFile ( arq, nomeDoArquivo );
Reset ( arq );
ReadLn ( arq, linha );
while not Eof ( arq ) do
begin
{ Processe a linha lida aqui. }
{ Para particionar a linha lida em peda�os, use a fun��o Copy. }
ReadLn ( arq, linha );
end;
CloseFile ( arq );
result := linha;
end;


function mvcodigo(campo, tabela: string): integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select min('+campo+') from '+tabela;
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      open;
      result := fields[0].AsInteger;
    finally
      free;
    end;
end;

function mscodigo(campo, tabela: string): string;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select min('+campo+') from '+tabela;
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      open;
      result := fields[0].AsString;
    finally
      free;
    end;   
end;

function NOME_PASTA(M_CDUSUA : String): String;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select SEN_CODIGO, SEN_PASTA from USUARIOS Where (SEN_CODIGO = :pCODIGO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsString := M_CDUSUA;
      open;
      result := fields[1].AsString;
    finally
      free;
    end;
End;

function Buscar_Dados_Str(campo, valor, tabela : String): boolean;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select '+campo+' from '+tabela + ' Where ('+ campo +' = :'+campo+')';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Clear;
      Close;
      sql.Add(texto);
      Params.ParamByName(campo).AsString := valor;
      open;
      if not (IsEmpty) Then
          Result := True
      Else
          Result := False;
    finally
      free;
    end;
End;

function GetTipoReceituario(M_TIPO : String): integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select * from TIPOUSORECEITUARIO Where (DESCRICAO = :pDESCRICAO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Clear;
      Close;
      sql.Add(texto);
      Params.ParamByName('pDESCRICAO').AsString := M_TIPO;
      open;
      if not (IsEmpty) Then
          Result := FieldByName('ID_TIPORECEITUARIO').AsInteger;
    finally
      free;
    end;
End;

function GetUsoMedico(M_TIPO : String): integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select * from TIPOUSOMEDICAMENTO Where (DESCRICAO = :pDESCRICAO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Clear;
      Close;
      sql.Add(texto);
      Params.ParamByName('pDESCRICAO').AsString := M_TIPO;
      open;
      if not (IsEmpty) Then
          Result := FieldByName('ID_TIPOMEDICAMENTO').AsInteger;
    finally
      free;
    end;
End;

Function GetCRMMedico(M_NUMCRM : integer): boolean;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select ID_MEDICO, NOME_MEDICO, NR_RG_PROFISSIONAL, CONSELHO_PROFISSIONAL, UF_CONSELHO from MEDICO Where (NR_RG_PROFISSIONAL = :pCRM)';
  //
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      Close;
      sql.Add(texto);
      Params.ParamByName('pCRM').AsInteger := M_NUMCRM;
      open;
      if not (IsEmpty) Then
          Result := True
      Else
          Result := False;
    finally
      free;
    end;
  //
  {with dmPesquisa.qryBusca do
   begin
      sql.Clear;
      Close;
      sql.Add(texto);
      Params.ParamByName('pCRM').AsInteger := M_NUMCRM;
      open;
      if not (IsEmpty) Then
          Result := True
      Else
          Result := False;
   end;}
End;

function GetMedico(M_IDMEDI : integer): boolean;
var
    texto : string;
    qraux : TSQLquery;
begin
  Result := False;
  texto := 'Select ID_MEDICO, NOME_MEDICO, NR_RG_PROFISSIONAL, CONSELHO_PROFISSIONAL, UF_CONSELHO from MEDICO Where (ID_MEDICO = :pID_MEDICO)';
  //
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pID_MEDICO').AsInteger := M_IDMEDI;
      Open;
      //
      if not (IsEmpty) Then
          Result := True;
    finally
      free;
    end;
  //
 { with dmPesquisa.qryBusca do
   begin
      sql.Clear;
      Close;
      sql.Add(texto);
      Params.ParamByName('pID_MEDICO').AsInteger := M_IDMEDI;
      open;
      if not (IsEmpty) Then
          Result := True
      Else
          Result := False;
   end; }
End;

function GetCliente(M_IDCLIE : integer): boolean;
var
    texto : string;
    qraux : TSQLquery;
begin
  Result := False;
  texto := 'Select * from COMPRADOR Where (ID_COMPRADOR = :pID_COMPRADOR)';
  //
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pID_COMPRADOR').AsInteger := M_IDCLIE;
      Open;
      //
      if not (IsEmpty) Then
          Result := True;
    finally
      free;
    end;
  //
  {with dmPesquisa.qryBusca do
   begin
      //SQLConnection := dmDados.sqlSNGPN;
      sql.Clear;
      Close;
      sql.Add(texto);
      Params.ParamByName('pID_COMPRADOR').AsInteger := M_IDCLIE;
      open;
      if not (IsEmpty) Then
          Result := True
      Else
          Result := False;
   end;   }
End;

function GetNomeCliente(M_IDCLIE : integer): String;
var
    texto : string;
    qraux : TSQLquery;
begin
  texto := 'Select ID_COMPRADOR, NOME_COMPRADOR from COMPRADOR Where (ID_COMPRADOR = :pID_COMPRADOR)';
  //
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pID_COMPRADOR').AsInteger := M_IDCLIE;
      Open;
      //
      If Not (IsEmpty) Then
          result := FieldByName('NOME_COMPRADOR').AsString;
    finally
      free;
    end;

  //
  {with dmPesquisa.qryBusca do
   begin
      sql.Clear;
      Close;
      sql.Add(texto);
      Params.ParamByName('pID_COMPRADOR').AsInteger := M_IDCLIE;
      open;
      if not (IsEmpty) Then
          Result := FieldByName('NOME_COMPRADOR').AsString;
   end;  }
End;

function GetOrgaoExpedidor(M_IDORGAO : integer): String ;
var
    texto : string;
    qraux : TSQLquery;
begin
  texto := 'Select * from ORGAO_EXPEDIDOR Where (ID_ORGAO = :pID_ORGAO)';
  //
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pID_ORGAO').AsInteger := M_IDORGAO;
      Open;
      //
      If Not (IsEmpty) Then
          result := FieldByName('SIGLA_ORGAO').AsString;
    finally
      free;
    end;
  //
{  with dmPesquisa.qryBusca do
   begin
      sql.Clear;
      Close;
      sql.Add(texto);
      Params.ParamByName('pID_ORGAO').AsInteger := M_IDORGAO;
      open;
      if not (IsEmpty) Then
          Result := FieldByName('SIGLA_ORGAO').AsString;
   end;}
End;

function GetTipoPerda(M_NMTIPO : String): integer;
var
    texto : string;
    qraux : TSQLquery;
begin
  texto := 'Select * from TIPOMOTIVOPERDA Where (DESCRICAO = :pDESCRICAO)';
  //
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pDESCRICAO').AsString := M_NMTIPO;
      Open;
      //
      If Not (IsEmpty) Then
          result := FieldByName('ID_MOTIVOPERDA').AsInteger;
    finally
      free;
    end;
  //
  {with dmPesquisa.qryBusca do
   begin
      sql.Clear;
      Close;
      sql.Add(texto);
      Params.ParamByName('pDESCRICAO').AsString := M_NMTIPO;
      open;
      if not (IsEmpty) Then
          Result := FieldByName('ID_MOTIVOPERDA').AsInteger;
   end;  }
End;

function ApagarArquivo(NOME : String) : Boolean;
begin
     Result := False;
     try
          DeleteFile(PChar(NOME));
          Result := True;
     Except

     End;
End;

function FormatarData(M_DATA : String) : String;
begin
     //  99/99/9999
     If not Empty(M_DATA) Then
       result := Copy(M_DATA,7,4)+'-'+Copy(M_DATA,4,2)+'-'+Copy(M_DATA,1,2)
     Else
       result := '';
End;

function GetConselhoProfissao(M_IDCONS : integer): String ;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select * from CONSELHOPROFISSIONAL Where (ID_CONSELHO = :pID_CONSELHO)';
  //
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pID_CONSELHO').AsInteger := M_IDCONS;
      Open;
      //
      If Not (IsEmpty) Then
          result := FieldByName('SIGLA').AsString;
    finally
      free;
    end;
  //
  {with dmPesquisa.qryBusca
   begin
      sql.Clear;
      Close;
      sql.Add(texto);
      Params.ParamByName('pID_CONSELHO').AsInteger := M_IDCONS;
      open;
      if not (IsEmpty) Then
          Result := FieldByName('SIGLA').AsString;
   end;}
End;

function GetTipoDocumento(M_IDTIPO : integer): String ;
var
    texto : string;
    qraux : TSQLquery;
begin
  texto := 'Select ID_DOCUMENTO, DESCRICAO from TIPO_DOCUMENTO Where (ID_DOCUMENTO = :pID_DOCUMENTO)';
  //
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Add(texto);
      Params.ParamByName('pID_DOCUMENTO').AsInteger := M_IDTIPO;
      Open;
      //
      If Not (IsEmpty) Then
          result := FieldByName('DESCRICAO').AsString;
    finally
      free;
    end;
  //
  {with dmPesquisa.qryBusca do
   begin
      sql.Clear;
      Close;
      sql.Add(texto);
      Params.ParamByName('pID_DOCUMENTO').AsInteger := M_IDTIPO;
      open;
      if not (IsEmpty) Then
          Result := FieldByName('DESCRICAO').AsString;
   end;    }
End;

function Gerar_XML(M_TPOPER, M_TPPERD : Integer; M_DTINIC, M_DTFINA, M_DTNOTA, M_DTRECE : TDateTime ;
aDataSet :  TDataset; M_TPMOVI ,M_NRNOTA, M_ORCNJP, M_DECNPJ : String): Boolean;
var
  StringList: TStringList;
  i, j: Integer;
  M_PEINIC, M_PEFINA, M_NMPAST, M_NMARQU : String;
begin
  StringList := TStringList.Create;
  {M_PEINIC := uFuncoes.FormatarData(DateTimetoStr(M_DTINIC));
  M_PEFINA := uFuncoes.FormatarData(DateTimetoStr(M_DTFINA));}
  M_PEINIC := uFuncoes.FormatarData(DatetoStr(Date()));
  M_PEFINA := uFuncoes.FormatarData(DatetoStr(Date()));

  M_NMPAST := dmDados.cdsConfigCFG_NOME_PASTA.AsString;
  //
  If (M_TPOPER = 1) Then
    M_NMARQU := 'COMPRA.XML';
  If (M_TPOPER = 2) Then
    M_NMARQU := 'TRANSFERENCIA.XML';
  If (M_TPOPER = 3) Then
    M_NMARQU := 'ENTRADA.XML';
  If (M_TPOPER = 4) Then
    M_NMARQU := 'PERDAS.XML';
  // inicia HTML
  StringList.Add('<?xml version="1.0" encoding="ISO-8859-1"?>');
  StringList.Add('<mensagemSNGPC xmlns="http://www.anvisa.gov.br/sngpc/schema">');
  // cabe�alho
  StringList.Add('<cabecalho>');
  StringList.Add('  <cnpjEmissor>'+dmDados.cdsConfigCFG_CNPJ.AsString+'</cnpjEmissor>');
  StringList.Add('  <cpfTransmissor>'+dmDados.cdsConfigCFG_CPF.AsString+'</cpfTransmissor>');
  StringList.Add('  <dataInicio>'+M_PEINIC+'</dataInicio>');
  StringList.Add('  <dataFim>'+M_PEFINA+'</dataFim>');
  StringList.Add('</cabecalho>');
  StringList.Add('<corpo>');
  //  Entrada de medicamento
  If (M_TPMOVI = 'E') Then
  begin
       StringList.Add('   <entradaMedicamentos>');
       StringList.Add('     <notaFiscalEntradaMedicamento>');
       StringList.Add('       <numeroNotaFiscal>'+M_NRNOTA+'</numeroNotaFiscal>');
       StringList.Add('       <tipoOperacaoNotaFiscal>1</tipoOperacaoNotaFiscal>');
       StringList.Add('       <dataNotaFiscal>'+ uFuncoes.FormatarData(DatetoStr(M_DTNOTA))+'</dataNotaFiscal>');
       StringList.Add('       <cnpjOrigem>'+M_ORCNJP+'</cnpjOrigem>');
       StringList.Add('       <cnpjDestino>'+M_DECNPJ+'</cnpjDestino>');
       StringList.Add('     </notaFiscalEntradaMedicamento>');
       With aDataSet do
       begin
            DisableControls;
            aDataSet.First;
            //
            While not (Eof) do
            begin
              StringList.Add('      <medicamentoEntrada>');
              StringList.Add('      <registroMSMedicamento>'+aDataSet.FieldByname('PRO_CDBARR').AsString+'</registroMSMedicamento>');
              StringList.Add('      <numeroLoteMedicamento>'+aDataSet.FieldByname('PRO_NRLOTE').AsString+'</numeroLoteMedicamento>');
              StringList.Add('      <quantidadeMedicamento>'+aDataSet.FieldByname('PRO_QTPROD').AsString+'</quantidadeMedicamento>');
              StringList.Add('      </medicamentoEntrada>');
              // Proximo
              Next;
            End;
            EnableControls;
       End;
       //
       StringList.Add('       <dataRecebimentoMedicamento>'+uFuncoes.FormatarData(DatetoStr(M_DTRECE))+'</dataRecebimentoMedicamento>');
       StringList.Add('   </entradaMedicamentos>');
  End;  // fim-da-entrada
  // saida perda
  If (M_TPMOVI = 'S') Then
  begin
       StringList.Add('<saidaMedicamentoPerda>');
       StringList.Add('<motivoPerdaMedicamento>'+InttoStr(M_TPPERD)+'</motivoPerdaMedicamento>');
       With aDataSet do
       begin
            DisableControls;
            aDataSet.First;
            //
            While not (Eof) do
            begin
              StringList.Add('<medicamentoPerda>');
              StringList.Add('<registroMSMedicamento>'+aDataSet.FieldByname('PRO_CDBARR').AsString+'</registroMSMedicamento>');
              StringList.Add('<numeroLoteMedicamento>'+aDataSet.FieldByname('PRO_NRLOTE').AsString+'</numeroLoteMedicamento>');
              StringList.Add('<quantidadeMedicamento>'+aDataSet.FieldByname('PRO_QTPROD').AsString+'</quantidadeMedicamento>');
              StringList.Add('</medicamentoPerda>');
              // Proximo
              Next;
            End;
            EnableControls;
       End;
       StringList.Add('<dataPerdaMedicamento>'+uFuncoes.FormatarData(DatetoStr(M_DTRECE))+'</dataPerdaMedicamento>');
       StringList.Add('</saidaMedicamentoPerda>');
  End;
  // Transferencia
  If (M_TPMOVI = 'T') Then
  begin
       StringList.Add('<saidaMedicamentoTransferencia>');
       StringList.Add('<notaFiscalTransferenciaMedicamento>');
       StringList.Add('<numeroNotaFiscal>'+M_NRNOTA+'</numeroNotaFiscal>');
       StringList.Add('<tipoOperacaoNotaFiscal>2</tipoOperacaoNotaFiscal>');
       StringList.Add('<dataNotaFiscal>'+ uFuncoes.FormatarData(DatetoStr(M_DTNOTA))+'</dataNotaFiscal>');
       StringList.Add('<cnpjOrigem>'+M_ORCNJP+'</cnpjOrigem>');
       StringList.Add('<cnpjDestino>'+M_DECNPJ+'</cnpjDestino>');
       StringList.Add('</notaFiscalTransferenciaMedicamento>');
       With aDataSet do
       begin
            DisableControls;
            aDataSet.First;
            //
            While not (Eof) do
            begin
                 StringList.Add('<medicamentoTransferencia>');
                 StringList.Add('<registroMSMedicamento>'+aDataSet.FieldByname('PRO_CDBARR').AsString+'</registroMSMedicamento>');
                 StringList.Add('<numeroLoteMedicamento>'+aDataSet.FieldByname('PRO_NRLOTE').AsString+'</numeroLoteMedicamento>');
                 StringList.Add('<quantidadeMedicamento>'+aDataSet.FieldByname('PRO_QTPROD').AsString+'</quantidadeMedicamento>');
                 StringList.Add('</medicamentoTransferencia>');
                //
                Next;
            End;
            EnableControls; 
       End;  // fim-do-with
       StringList.Add('<dataTransferenciaMedicamento>'+uFuncoes.FormatarData(DatetoStr(M_DTRECE))+'</dataTransferenciaMedicamento>');
       StringList.Add('</saidaMedicamentoTransferencia>');
  End;
  //
  StringList.Add('</corpo>');
  StringList.Add('</mensagemSNGPC>');
  // salva Html
  StringList.SaveToFile( M_NMPAST+'\'+M_NMARQU);
  StringList.Free;
End;

function Gerar_INSUMOS_XML(M_TPOPER : Integer; M_DTINIC, M_DTFINA, M_DTNOTA, M_DTRECE : TDateTime ;
aDataSet :  TDataset; M_TPMOVI, M_NRNOTA, M_ORCNJP, M_DECNPJ : String): Boolean;
var
  StringList: TStringList;
  i, j: Integer;
  M_PEINIC, M_PEFINA, M_NMPAST, M_NMARQU : String;
Begin
  StringList := TStringList.Create;
  {M_PEINIC := uFuncoes.FormatarData(DateTimetoStr(M_DTINIC));
  M_PEFINA := uFuncoes.FormatarData(DateTimetoStr(M_DTFINA));}
  M_PEINIC := uFuncoes.FormatarData(DatetoStr(Date()));
  M_PEFINA := uFuncoes.FormatarData(DatetoStr(Date()));

  M_NMPAST := dmDados.cdsConfigCFG_NOME_PASTA.AsString;
  //
  If (M_TPOPER = 1) Then
    M_NMARQU := 'COMPRA_INSUMO.XML';
  If (M_TPOPER = 2) Then
    M_NMARQU := 'VENDA_INSUMO.XML';
  If (M_TPOPER = 3) Then
    M_NMARQU := 'TRANSFERENCIA_INSUMO.XML';
  If (M_TPOPER = 4) Then
    M_NMARQU := 'PERDA_INSUMO.XML';
  // inicia HTML
  StringList.Add('<?xml version="1.0" encoding="ISO-8859-1"?>');
  StringList.Add('<mensagemSNGPC xmlns="http://www.anvisa.gov.br/sngpc/schema">');
  // cabe�alho
  StringList.Add('<cabecalho>');
  StringList.Add('  <cnpjEmissor>'+dmDados.cdsConfigCFG_CNPJ.AsString+'</cnpjEmissor>');
  StringList.Add('  <cpfTransmissor>'+dmDados.cdsConfigCFG_CPF.AsString+'</cpfTransmissor>');
  StringList.Add('  <dataInicio>'+M_PEINIC+'</dataInicio>');
  StringList.Add('  <dataFim>'+M_PEFINA+'</dataFim>');
  StringList.Add('</cabecalho>');
  StringList.Add('<corpo>');
  // Aquisi��o
  If (M_TPMOVI = 'A') Then
  begin
       StringList.Add('  <entradaInsumos>');
       StringList.Add('  <notaFiscalEntradaInsumo>');
       StringList.Add('  <numeroNotaFiscal>'+M_NRNOTA+'</numeroNotaFiscal>');
       StringList.Add('  <tipoOperacaoNotaFiscal>'+InttoStr(M_TPOPER)+'</tipoOperacaoNotaFiscal>');
       StringList.Add('  <dataNotaFiscal>'+ uFuncoes.FormatarData(DatetoStr(M_DTNOTA))+'</dataNotaFiscal>');
       StringList.Add('  <cnpjOrigem>'+M_ORCNJP+'</cnpjOrigem>');
       StringList.Add('  <cnpjDestino>'+M_DECNPJ+'</cnpjDestino>');
       StringList.Add('  </notaFiscalEntradaInsumo>');
       With aDataSet do
       begin
            DisableControls;
            aDataSet.First;
            //
            While not (Eof) do
            begin
                 StringList.Add('  <substanciaInsumoEntrada>');
                 StringList.Add('  <insumoEntrada>');
                 StringList.Add('  <codigoInsumo>'+aDataSet.FieldByname('PRO_CDBARR').AsString+'</codigoInsumo>');
                 StringList.Add('  <numeroLoteInsumo>'+aDataSet.FieldByname('PRO_NRLOTE').AsString+'</numeroLoteInsumo>');
                 StringList.Add('  </insumoEntrada>');
                 StringList.Add('  <quantidadeInsumoEntrada>'+aDataSet.FieldByname('PRO_QTPROD').AsString+'</quantidadeInsumoEntrada>');
                 StringList.Add('  <tipoUnidadeEntrada>1</tipoUnidadeEntrada>');
                 StringList.Add('  </substanciaInsumoEntrada>');
                //
                Next;
            End;
       End;  // fim-do-with
       //
       StringList.Add('  <dataRecebimentoInsumo>'+uFuncoes.FormatarData(DatetoStr(M_DTRECE))+'</dataRecebimentoInsumo>');
       StringList.Add('  </entradaInsumos>');
  End;
  // Venda
  If (M_TPMOVI = 'V') Then
  begin
       StringList.Add('<saidaInsumoVendaAoConsumidor>');
       StringList.Add('<tipoReceituarioInsumo>2</tipoReceituarioInsumo>');
       StringList.Add('<numeroNotificacaoInsumo>9897651</numeroNotificacaoInsumo>');
       StringList.Add('<dataPrescricaoInsumo>2006-02-09</dataPrescricaoInsumo>');
       StringList.Add('<prescritorInsumo>');
       StringList.Add('<nomePrescritor>Dr. Antenor</nomePrescritor>');
       StringList.Add('<numeroRegistroProfissional>8888</numeroRegistroProfissional>');
       StringList.Add('<conselhoProfissional>CRM</conselhoProfissional>');
       StringList.Add('<UFConselho>DF</UFConselho>');
       StringList.Add('</prescritorInsumo>');
       StringList.Add('<usoInsumo>1</usoInsumo>');
       StringList.Add('<compradorInsumo>');
       StringList.Add('<nomeComprador>Manuela Danta</nomeComprador>');
       StringList.Add('<tipoDocumento>2</tipoDocumento>');
       StringList.Add('<numeroDocumento>89786453 </numeroDocumento>');
       StringList.Add('<orgaoExpedidor>SSP</orgaoExpedidor>');
       StringList.Add('<UFEmissaoDocumento>DF</UFEmissaoDocumento>');
       StringList.Add('</compradorInsumo>');
       StringList.Add('<substanciaInsumoVendaAoConsumidor>');
       StringList.Add('<insumoVendaAoConsumidor>');
       StringList.Add('<codigoInsumo>02904</codigoInsumo>');
       StringList.Add('<numeroLoteInsumo>123dzp </numeroLoteInsumo>');
       StringList.Add('</insumoVendaAoConsumidor>');
       StringList.Add('<quantidadeDeInsumoPorUnidadeFarmacotecnica>5.0</quantidadeDeInsumoPorUnidadeFarmacotecnica>');
       StringList.Add('<unidadeDeMedidaDoInsumo>1</unidadeDeMedidaDoInsumo>');
       StringList.Add('<unidadeFarmacotecnica>2</unidadeFarmacotecnica>');
       StringList.Add('<quantidadeDeUnidadesFarmacotecnicas>60.0</quantidadeDeUnidadesFarmacotecnicas>');
       StringList.Add('</substanciaInsumoVendaAoConsumidor>');
       StringList.Add('<dataVendaInsumo>2006-02-11</dataVendaInsumo>');
       StringList.Add('</saidaInsumoVendaAoConsumidor>');
  End;
  //  Transfer�ncia
  If (M_TPMOVI = 'T') Then
  begin
       StringList.Add('<saidaInsumoTransferencia>');
       StringList.Add('<notaFiscalTransferenciaInsumo>');
       StringList.Add('<numeroNotaFiscal>10001</numeroNotaFiscal>');
       StringList.Add('<tipoOperacaoNotaFiscal>2</tipoOperacaoNotaFiscal>');
       StringList.Add('<dataNotaFiscal>2006-02-11</dataNotaFiscal>');
       StringList.Add('<cnpjOrigem>00000000000000</cnpjOrigem>');
       StringList.Add('<cnpjDestino>00000000000020</cnpjDestino>');
       StringList.Add('</notaFiscalTransferenciaInsumo>');
       StringList.Add('<substanciaInsumoTransferencia>');
       StringList.Add('<insumoTransferencia>');
       StringList.Add('<codigoInsumo>02904</codigoInsumo>');
       StringList.Add('<numeroLoteInsumo>15353</numeroLoteInsumo>');
       StringList.Add('</insumoTransferencia>');
       StringList.Add('<quantidadeInsumoTransferencia>20000.0</quantidadeInsumoTransferencia>');
       StringList.Add('<tipoUnidadeTransferencia>1</tipoUnidadeTransferencia>');
       StringList.Add('</substanciaInsumoTransferencia>');
       StringList.Add('<dataTransferenciaInsumo>2006-02-11</dataTransferenciaInsumo>');
       StringList.Add('</saidaInsumoTransferencia>');
  End;
  //
  StringList.Add('</corpo>');
  StringList.Add('</mensagemSNGPC>');
  // salva Html
  StringList.SaveToFile( M_NMPAST+'\'+M_NMARQU);
  StringList.Free;
End;


function GetCNPJ(M_NMLOJA : String): String;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select EMP_CNPJ from EMPRESAS Where (EMP_FANTASIA = :pFANTASIA)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmDados.sqlSNGPN;
      sql.Clear;
      Close;
      sql.Add(texto);
      Params.ParamByName('pFANTASIA').AsString := M_NMLOJA;
      open;
      if not (IsEmpty) Then
          Result := FieldByName('EMP_CNPJ').AsString;
    finally
      free;
    end;
End;

function COMPRA_INSUMOS_XML(M_TPOPER, M_TPUNID : Integer; M_DTINIC, M_DTFINA, M_DTNOTA, M_DTRECE : TDateTime ;
aDataSet :  TDataset; M_NRNOTA, M_ORCNJP, M_DECNPJ : String): Boolean;
var
  StringList: TStringList;
  i, j: Integer;
  M_PEINIC, M_PEFINA, M_NMPAST, M_NMARQU : String;
Begin
  StringList := TStringList.Create;
  {M_PEINIC := uFuncoes.FormatarData(DateTimetoStr(M_DTINIC));
  M_PEFINA := uFuncoes.FormatarData(DateTimetoStr(M_DTFINA));}
  M_PEINIC := uFuncoes.FormatarData(DatetoStr(Date()));
  M_PEFINA := uFuncoes.FormatarData(DatetoStr(Date()));

  M_NMPAST := dmDados.cdsConfigCFG_NOME_PASTA.AsString;
  //
  M_NMARQU := 'COMPRA_INSUMO.XML';
  // inicia HTML
  StringList.Add('<?xml version="1.0" encoding="ISO-8859-1"?>');
  StringList.Add('<mensagemSNGPC xmlns="http://www.anvisa.gov.br/sngpc/schema">');
  // cabe�alho
  StringList.Add('<cabecalho>');
  StringList.Add('  <cnpjEmissor>'+dmDados.cdsConfigCFG_CNPJ.AsString+'</cnpjEmissor>');
  StringList.Add('  <cpfTransmissor>'+dmDados.cdsConfigCFG_CPF.AsString+'</cpfTransmissor>');
  StringList.Add('  <dataInicio>'+M_PEINIC+'</dataInicio>');
  StringList.Add('  <dataFim>'+M_PEFINA+'</dataFim>');
  StringList.Add('</cabecalho>');
  StringList.Add('<corpo>');
  // Aquisi��o
       StringList.Add('  <entradaInsumos>');
       StringList.Add('  <notaFiscalEntradaInsumo>');
       StringList.Add('  <numeroNotaFiscal>'+M_NRNOTA+'</numeroNotaFiscal>');
       StringList.Add('  <tipoOperacaoNotaFiscal>'+InttoStr(M_TPOPER)+'</tipoOperacaoNotaFiscal>');
       StringList.Add('  <dataNotaFiscal>'+ uFuncoes.FormatarData(DatetoStr(M_DTNOTA))+'</dataNotaFiscal>');
       StringList.Add('  <cnpjOrigem>'+M_ORCNJP+'</cnpjOrigem>');
       StringList.Add('  <cnpjDestino>'+M_DECNPJ+'</cnpjDestino>');
       StringList.Add('  </notaFiscalEntradaInsumo>');
       With aDataSet do
       begin
            DisableControls;
            aDataSet.First;
            //
            While not (Eof) do
            begin
                 StringList.Add('  <substanciaInsumoEntrada>');
                 StringList.Add('  <insumoEntrada>');
                 StringList.Add('  <codigoInsumo>'+aDataSet.FieldByname('PRO_CDBARR').AsString+'</codigoInsumo>');
                 StringList.Add('  <numeroLoteInsumo>'+aDataSet.FieldByname('PRO_NRLOTE').AsString+'</numeroLoteInsumo>');
                 StringList.Add('  </insumoEntrada>');
                 StringList.Add('  <quantidadeInsumoEntrada>'+aDataSet.FieldByname('PRO_QTPROD').AsString+'</quantidadeInsumoEntrada>');
                 StringList.Add('  <tipoUnidadeEntrada>'+InttoStr(M_TPUNID)+'</tipoUnidadeEntrada>');
                 StringList.Add('  </substanciaInsumoEntrada>');
                //
                Next;
            End;
       End;  // fim-do-with
       //
       StringList.Add('  <dataRecebimentoInsumo>'+uFuncoes.FormatarData(DatetoStr(M_DTRECE))+'</dataRecebimentoInsumo>');
       StringList.Add('  </entradaInsumos>');
  //
  StringList.Add('</corpo>');
  StringList.Add('</mensagemSNGPC>');
  // salva Html
  StringList.SaveToFile( M_NMPAST+'\'+M_NMARQU);
  StringList.Free;
End;

function VENDA_INSUMOS_XML(M_TPOPER, M_TPUNID, M_TPUSOI, M_TPRECE : Integer; M_DTINIC, M_DTFINA, M_DTNOTA, M_DTRECE, M_DTPRES : TDateTime ;
aDataSet :  TDataset; M_NRNOTI, M_ORCNJP, M_DECNPJ, M_NMPRES, M_NRPRES, M_CRMPR, M_UFPRES,
M_NMCLIE, M_TPDOCU, M_NRDOCU, M_ORGAO, M_UFCLIE : String): Boolean;
var
  StringList: TStringList;
  i, j: Integer;
  M_PEINIC, M_PEFINA, M_NMPAST, M_NMARQU : String;
Begin
  StringList := TStringList.Create;
  {M_PEINIC := uFuncoes.FormatarData(DateTimetoStr(M_DTINIC));
  M_PEFINA := uFuncoes.FormatarData(DateTimetoStr(M_DTFINA));}
  M_PEINIC := uFuncoes.FormatarData(DatetoStr(Date()));
  M_PEFINA := uFuncoes.FormatarData(DatetoStr(Date()));

  M_NMPAST := dmDados.cdsConfigCFG_NOME_PASTA.AsString;
  //
  M_NMARQU := 'VENDA_INSUMO.XML';
  // inicia HTML
  StringList.Add('<?xml version="1.0" encoding="ISO-8859-1"?>');
  StringList.Add('<mensagemSNGPC xmlns="http://www.anvisa.gov.br/sngpc/schema">');
  // cabe�alho
  StringList.Add('<cabecalho>');
  StringList.Add('  <cnpjEmissor>'+dmDados.cdsConfigCFG_CNPJ.AsString+'</cnpjEmissor>');
  StringList.Add('  <cpfTransmissor>'+dmDados.cdsConfigCFG_CPF.AsString+'</cpfTransmissor>');
  StringList.Add('  <dataInicio>'+M_PEINIC+'</dataInicio>');
  StringList.Add('  <dataFim>'+M_PEFINA+'</dataFim>');
  StringList.Add('</cabecalho>');
  StringList.Add('<corpo>');
  // Venda de insumo
  StringList.Add('  <saidaInsumoVendaAoConsumidor>');
  StringList.Add('  <tipoReceituarioInsumo>'+IntToStr(M_TPRECE)+'</tipoReceituarioInsumo>');
  StringList.Add('<numeroNotificacaoInsumo>'+M_NRNOTI+'</numeroNotificacaoInsumo>');
  StringList.Add('<dataPrescricaoInsumo>'+uFuncoes.FormatarData(DatetoStr(M_DTPRES))+'</dataPrescricaoInsumo>');
  StringList.Add('<prescritorInsumo>');
  StringList.Add('<nomePrescritor>'+M_NMPRES+'</nomePrescritor>');
  StringList.Add('<numeroRegistroProfissional>'+M_CRMPR+'</numeroRegistroProfissional>');
  StringList.Add('<conselhoProfissional>'+M_CRMPR+'</conselhoProfissional>');
  StringList.Add('<UFConselho>'+M_UFPRES+'</UFConselho>');
  StringList.Add('</prescritorInsumo>');
  StringList.Add('<usoInsumo>'+InttoStr(M_TPUSOI)+'</usoInsumo>');
  StringList.Add('<compradorInsumo>');
  StringList.Add('<nomeComprador>'+M_NMCLIE+'</nomeComprador>');
  StringList.Add('<tipoDocumento>'+M_TPDOCU+'</tipoDocumento>');
  StringList.Add('<numeroDocumento>'+M_NRDOCU+'</numeroDocumento>');
  StringList.Add('<orgaoExpedidor>'+M_ORGAO+'</orgaoExpedidor>');
  StringList.Add('<UFEmissaoDocumento>'+M_UFCLIE+'</UFEmissaoDocumento>');
  StringList.Add('</compradorInsumo>');
  //
       With aDataSet do
       begin
            DisableControls;
            aDataSet.First;
            //
            While not (Eof) do
            begin
                 StringList.Add('<substanciaInsumoVendaAoConsumidor>');
                 StringList.Add('  <insumoVendaAoConsumidor>');
                 StringList.Add('    <codigoInsumo>'+aDataSet.FieldByname('PRO_CDBARR').AsString+'</codigoInsumo>');
                 StringList.Add('    <numeroLoteInsumo>'+aDataSet.FieldByname('PRO_NRLOTE').AsString+'</numeroLoteInsumo>');
                 StringList.Add('  </insumoVendaAoConsumidor>');
                 //
                 StringList.Add('  <quantidadeDeInsumoPorUnidadeFarmacotecnica>'+aDataSet.FieldByname('PRO_QTPROD').AsString +'</quantidadeDeInsumoPorUnidadeFarmacotecnica>');
                 StringList.Add('  <unidadeDeMedidaDoInsumo>1</unidadeDeMedidaDoInsumo>');
                 StringList.Add('  <unidadeFarmacotecnica>2</unidadeFarmacotecnica>');
                 StringList.Add('  <quantidadeDeUnidadesFarmacotecnicas>60.0</quantidadeDeUnidadesFarmacotecnicas>');
                 //
                 StringList.Add('</substanciaInsumoVendaAoConsumidor>');
                //
                Next;
            End;
       End;  // fim-do-with
       //
  StringList.Add('<dataVendaInsumo>'+uFuncoes.FormatarData(DatetoStr(M_DTRECE))+'</dataVendaInsumo>');
  StringList.Add('</saidaInsumoVendaAoConsumidor>');
  //
  StringList.Add('</corpo>');
  StringList.Add('</mensagemSNGPC>');
  // salva Html
  StringList.SaveToFile( M_NMPAST+'\'+M_NMARQU);
  StringList.Free;
End;

function TRANSFERENCIA_INSUMOS_XML(M_TPOPER : Integer; M_DTINIC, M_DTFINA, M_DTNOTA, M_DTTRAN, M_DTPRES : TDateTime ;
aDataSet :  TDataset; M_NRNOTA, M_ORCNJP, M_DECNPJ : String): Boolean;
var
  StringList: TStringList;
  i, j: Integer;
  M_PEINIC, M_PEFINA, M_NMPAST, M_NMARQU : String;
Begin
  StringList := TStringList.Create;
  {M_PEINIC := uFuncoes.FormatarData(DateTimetoStr(M_DTINIC));
  M_PEFINA := uFuncoes.FormatarData(DateTimetoStr(M_DTFINA));}
  M_PEINIC := uFuncoes.FormatarData(DatetoStr(Date()));
  M_PEFINA := uFuncoes.FormatarData(DatetoStr(Date()));

  M_NMPAST := dmDados.cdsConfigCFG_NOME_PASTA.AsString;
  //
  M_NMARQU := 'TRANSF_INSUMO.XML';
  // inicia HTML
  StringList.Add('<?xml version="1.0" encoding="ISO-8859-1"?>');
  StringList.Add('<mensagemSNGPC xmlns="http://www.anvisa.gov.br/sngpc/schema">');
  // cabe�alho
  StringList.Add('<cabecalho>');
  StringList.Add('  <cnpjEmissor>'+dmDados.cdsConfigCFG_CNPJ.AsString+'</cnpjEmissor>');
  StringList.Add('  <cpfTransmissor>'+dmDados.cdsConfigCFG_CPF.AsString+'</cpfTransmissor>');
  StringList.Add('  <dataInicio>'+M_PEINIC+'</dataInicio>');
  StringList.Add('  <dataFim>'+M_PEFINA+'</dataFim>');
  StringList.Add('</cabecalho>');
  StringList.Add('<corpo>');
  // Transfer�ncia de insumo
  StringList.Add('<saidaInsumoTransferencia>');
  StringList.Add('<notaFiscalTransferenciaInsumo>');
  StringList.Add('  <numeroNotaFiscal>'+M_NRNOTA+'</numeroNotaFiscal>');
  StringList.Add('  <tipoOperacaoNotaFiscal>'+InttoStr(M_TPOPER)+'</tipoOperacaoNotaFiscal>');
  StringList.Add('  <dataNotaFiscal>'+uFuncoes.FormatarData(DatetoStr(M_DTNOTA))+'</dataNotaFiscal>');
  StringList.Add('  <cnpjOrigem>'+M_ORCNJP+'</cnpjOrigem>');
  StringList.Add('  <cnpjDestino>'+M_DECNPJ+'</cnpjDestino>');
  StringList.Add('</notaFiscalTransferenciaInsumo>');
  //
       With aDataSet do
       begin
            DisableControls;
            aDataSet.First;
            //
            While not (Eof) do
            begin
                  StringList.Add('<substanciaInsumoTransferencia>');
                  StringList.Add('  <insumoTransferencia>');
                  StringList.Add('    <codigoInsumo>'+aDataSet.FieldByname('PRO_CDBARR').AsString+'</codigoInsumo>');
                  StringList.Add('    <numeroLoteInsumo>'+aDataSet.FieldByname('PRO_NRLOTE').AsString+'</numeroLoteInsumo>');
                  StringList.Add('  </insumoTransferencia>');
                  StringList.Add('  <quantidadeInsumoTransferencia>'+aDataSet.FieldByname('PRO_QTPROD').AsString+'</quantidadeInsumoTransferencia>');
                  StringList.Add('  <tipoUnidadeTransferencia>1</tipoUnidadeTransferencia>');
                  StringList.Add('</substanciaInsumoTransferencia>');
                //
                Next;
            End;
       End;  // fim-do-with
       //
  StringList.Add('<dataTransferenciaInsumo>'+uFuncoes.FormatarData(DatetoStr(M_DTTRAN))+'</dataTransferenciaInsumo>');
  StringList.Add('</saidaInsumoTransferencia>');
  //
  StringList.Add('</corpo>');
  StringList.Add('</mensagemSNGPC>');
  // salva Html
  StringList.SaveToFile( M_NMPAST+'\'+M_NMARQU);
  StringList.Free;
End;


function PERDA_INSUMOS_XML(M_TPOPER, M_MOTIVO : Integer; M_DTINIC, M_DTFINA, M_DTPERD, M_DTPRES : TDateTime ;
aDataSet :  TDataset; M_CNJPFO : String): Boolean;
var
  StringList: TStringList;
  M_PEINIC, M_PEFINA, M_NMPAST, M_NMARQU : String;
Begin
  StringList := TStringList.Create;
  {M_PEINIC := uFuncoes.FormatarData(DateTimetoStr(M_DTINIC));
  M_PEFINA := uFuncoes.FormatarData(DateTimetoStr(M_DTFINA));}
  M_PEINIC := uFuncoes.FormatarData(DatetoStr(Date()));
  M_PEFINA := uFuncoes.FormatarData(DatetoStr(Date()));

  M_NMPAST := dmDados.cdsConfigCFG_NOME_PASTA.AsString;
  //
  M_NMARQU := 'PERDA_INSUMO.XML';
  // inicia HTML
  StringList.Add('<?xml version="1.0" encoding="ISO-8859-1"?>');
  StringList.Add('<mensagemSNGPC xmlns="http://www.anvisa.gov.br/sngpc/schema">');
  // cabe�alho
  StringList.Add('<cabecalho>');
  StringList.Add('  <cnpjEmissor>'+dmDados.cdsConfigCFG_CNPJ.AsString+'</cnpjEmissor>');
  StringList.Add('  <cpfTransmissor>'+dmDados.cdsConfigCFG_CPF.AsString+'</cpfTransmissor>');
  StringList.Add('  <dataInicio>'+M_PEINIC+'</dataInicio>');
  StringList.Add('  <dataFim>'+M_PEFINA+'</dataFim>');
  StringList.Add('</cabecalho>');
  StringList.Add('<corpo>');
  // Perda de insumo
  StringList.Add('<saidaInsumoPerda>');
  StringList.Add('<motivoPerdaInsumo>'+InttoStr(M_TPOPER)+'</motivoPerdaInsumo>');
  //
       With aDataSet do
       begin
            DisableControls;
            aDataSet.First;
            //
            While not (Eof) do
            begin
                 StringList.Add('<substanciaInsumoPerda>');
                 StringList.Add('<insumoPerda>');
                 StringList.Add('<codigoInsumo>'+aDataSet.FieldByname('PRO_CDBARR').AsString+'</codigoInsumo>');
                 StringList.Add('<numeroLoteInsumo>'+aDataSet.FieldByname('PRO_NRLOTE').AsString+'</numeroLoteInsumo>');
                 StringList.Add('</insumoPerda>');
                 StringList.Add('<quantidadeInsumoPerda>'+aDataSet.FieldByname('PRO_QTPROD').AsString+'</quantidadeInsumoPerda>');
                 StringList.Add('<tipoUnidadePerda>1</tipoUnidadePerda>');
                 StringList.Add('</substanciaInsumoPerda>');
                 //
                 Next;
            End;
       End;  // fim-do-with
       //
  StringList.Add('<dataPerdaInsumo>'+uFuncoes.FormatarData(DatetoStr(M_DTPERD))+'</dataPerdaInsumo>');
  StringList.Add('<cnpjFornecedorInsumo>'+M_CNJPFO+'</cnpjFornecedorInsumo>');
  StringList.Add('</saidaInsumoPerda>');
  //
  StringList.Add('</corpo>');
  StringList.Add('</mensagemSNGPC>');
  // salva Html
  StringList.SaveToFile( M_NMPAST+'\'+M_NMARQU);
  StringList.Free;
End;

function GetUndInsumo(M_NMTIPO : String): String;
var
    texto : string;
begin
  texto := 'Select ID_UNDINSUMO from TIPOUNIDADEINSUMO Where (DESCRICAO = :pDESCRICAO)';
  //
  with dmPesquisa.qryBusca do
   begin
      sql.Clear;
      Close;
      sql.Add(texto);
      Params.ParamByName('pDESCRICAO').AsString := M_NMTIPO;
      open;
      if not (IsEmpty) Then
          Result := FieldByName('ID_UNDINSUMO').AsString;
   end;
End;

Function Verificar_Status() : Boolean;
Var
   M_NMPAST : String;
begin
    M_NMPAST := dmDados.cdsConfigCFG_NOME_PASTA.AsString;
    //
    M_NMPAST := M_NMPAST + '\s0000000.GPC';
    //
    If FileExists(M_NMPAST) Then
        Result := True
    Else
        Result := False;
End;

Procedure Criar_Status(W_NMARQU : string);
var
  status_saida : textfile;
  M_NMPAST : String;
begin
  M_NMPAST := dmDados.cdsConfigCFG_NOME_PASTA.AsString;
  //
      if FileExists(M_NMPAST + '\'+W_NMARQU) then
      begin
        Try
          AssignFile(status_saida, M_NMPAST + '\S0000000.ret');
          if not FileExists(M_NMPAST + '\S0000000.ret') then
             Rewrite ( status_saida )
          Else
             reset(status_saida);
          DeleteFile(PChar(M_NMPAST + '\S0000000.GPC'));
          //DeleteFile(PChar(M_NMPAST + '\'+W_NMARQU));
        finally
            CloseFile(status_saida);
        end;
      End;
End;

Function Criar_Retorno_Perda(M_STATUS,  M_NRPERD : string) : boolean;
var
  status : textfile;
  M_NMPAST, PERDA : String;
  W_NRPERD : Integer;
begin
  M_NMPAST := dmDados.cdsConfigCFG_NOME_PASTA.AsString;
  W_NRPERD := StrtoInt(M_NRPERD);
  //
  try
          PERDA := 'P'+StrZero(InttoStr(W_NRPERD),7)+'.ret';
          M_NMPAST := M_NMPAST + '\';
          if FileExists(M_NMPAST + PERDA) then
             deletefile(PChar(M_NMPAST + PERDA));
          //
          AssignFile(status, M_NMPAST + PERDA);
          Rewrite(status);
          Append(status);
          //
          if (M_STATUS = 'S')  then
               Writeln(status, M_NRPERD)
          Else
               Writeln(status, M_NRPERD);
          //
          {if (M_STATUS = 'S')  then
               Writeln(status, 'OK')
          Else
               Writeln(status, 'ERRO');}
  finally
        if FileExists(M_NMPAST + PERDA) then
            DeleteFile(PChar(M_NMPAST + PERDA));
        CloseFile(status);
  end;
End;

Function Criar_Retorno_Transf(M_STATUS,  M_NRTRAN : string) : boolean;
var
  status : textfile;
  M_NMPAST, ENTRADA, CANCELA : String;
  W_NRENTR : Integer;
begin
  M_NMPAST := dmDados.cdsConfigCFG_NOME_PASTA.AsString;
  W_NRENTR := StrtoInt(M_NRTRAN);
  //
  try
          //
          if (M_STATUS = 'S')  then
          begin
              ENTRADA := 'T'+StrZero(InttoStr(W_NRENTR),7)+'.ret';
              M_NMPAST := M_NMPAST + '\';
              if FileExists(M_NMPAST + ENTRADA) then
                 deletefile(PChar(M_NMPAST + ENTRADA));
              //
              AssignFile(status, M_NMPAST + ENTRADA);
              Rewrite(status);
              Append(status);
              Writeln(status, M_NRTRAN);
          End
          Else
          Begin
              ENTRADA := 'T'+StrZero(InttoStr(W_NRENTR),7)+'.gpc';
              CANCELA := 'T'+StrZero(InttoStr(W_NRENTR),7)+'.ret';
              M_NMPAST := M_NMPAST + '\';
              if FileExists(M_NMPAST + CANCELA) then
                 deletefile(PChar(M_NMPAST + CANCELA));
              //
              AssignFile(status, M_NMPAST + CANCELA);
              Rewrite(status);
              Append(status);
              //
              Writeln(status, '0000000000');
          End;
          //
          {if (M_STATUS = 'S')  then
               Writeln(status, 'OK')
          Else
               Writeln(status, 'ERRO');}
  finally
        if FileExists(M_NMPAST + ENTRADA) then
            DeleteFile(PChar(M_NMPAST + ENTRADA));
        CloseFile(status);
  end;
End;


Function Criar_Retorno_Entrada(M_STATUS, M_NRENTR : string) : boolean;
var
  status : textfile;
  M_NMPAST, ENTRADA, CANCELA : String;
  W_NRENTR : Integer;
begin
  M_NMPAST := dmDados.cdsConfigCFG_NOME_PASTA.AsString;
  W_NRENTR := StrtoInt(M_NRENTR);
  //
  try
          //
          if (M_STATUS = 'S')  then
          begin
               ENTRADA := 'E'+StrZero(InttoStr(W_NRENTR),7)+'.ret';
               M_NMPAST := M_NMPAST + '\';
               if FileExists(M_NMPAST + ENTRADA) then
                  deletefile(PChar(M_NMPAST + ENTRADA));
               //
               AssignFile(status, M_NMPAST + ENTRADA);
               Rewrite(status);
               Append(status);
               Writeln(status, M_NRENTR);
          End
          Else
          begin
              ENTRADA := 'E'+StrZero(InttoStr(W_NRENTR),7)+'.gpc';
              CANCELA := 'E'+StrZero(InttoStr(W_NRENTR),7)+'.ret';
              M_NMPAST := M_NMPAST + '\';
              if FileExists(M_NMPAST + CANCELA) then
                 deletefile(PChar(M_NMPAST + CANCELA));
              //
              AssignFile(status, M_NMPAST + CANCELA);
              Rewrite(status);
              Append(status);
              //
              Writeln(status, '0000000000');
          End;
  finally
        if FileExists(M_NMPAST + ENTRADA) then
            DeleteFile(PChar(M_NMPAST + ENTRADA));
        CloseFile(status);
  end;
End;

Function Criar_Retorno_Venda(M_STATUS, M_NRVEND : string) : boolean;
var
  status : textfile;
  M_NMPAST, VENDA, CANCELA : String;
  W_NRVEND : Integer;
begin
  M_NMPAST := dmDados.cdsConfigCFG_NOME_PASTA.AsString;
  W_NRVEND := StrtoInt(M_NRVEND);
  //
  try
          //
          if (M_STATUS = 'S')  then
          Begin
              VENDA := 'v'+StrZero(InttoStr(W_NRVEND),7)+'.ret';
              M_NMPAST := M_NMPAST + '\';
              if FileExists(M_NMPAST + VENDA) then
                 deletefile(PChar(M_NMPAST + VENDA));
              //
              AssignFile(status, M_NMPAST + VENDA);
              Rewrite(status);
              Append(status);
              //
              Writeln(status, M_NRVEND);
          End
          Else
          begin
              VENDA := 'v'+StrZero(InttoStr(W_NRVEND),7)+'.gpc';
              CANCELA := 'v'+StrZero(InttoStr(W_NRVEND),7)+'.ret';
              M_NMPAST := M_NMPAST + '\';
              if FileExists(M_NMPAST + CANCELA) then
                 deletefile(PChar(M_NMPAST + CANCELA));
              //
              AssignFile(status, M_NMPAST + CANCELA);
              Rewrite(status);
              Append(status);
              //
              Writeln(status, '0000000');
          End;
  finally
        if FileExists(M_NMPAST + VENDA) then
            DeleteFile(PChar(M_NMPAST + VENDA));
        CloseFile(status);
  end;
End;

function RemoveVirgula(Str:String): String;
Const
    ComVirgula = ',';
    ComPonto = '.';
Var
    x : Integer;
    valor : string;
Begin
    For x := 1 to Length(Str) do
      if (Str[x] = ComVirgula) Then
        valor := valor + ComPonto
      Else
        valor := valor + Str[x];
    Result := valor;
end;

function CriaSubDir(const NomeSubDir: string): boolean;
var
  Caminho: string;
begin
  dmDados.RefreshCDS(dmDados.cdsConfig);
  //
  //Caminho := ExtractFilePath(ParamStr(0)) + NomeSubDir;
  Caminho := dmDados.cdsConfigCFG_NOME_PASTA.AsString+'\'+ NomeSubDir;
  if DirectoryExists(Caminho) then
  Result := true
  else
  Result := CreateDir(Caminho);
end;

procedure CopiaArquivo(scrname,destname:string);
begin
     CopyFile(PChar(scrname), PChar(destname), True);
end;

function FormatarMS(aCodigo : String) : String;
begin
     //  #.####.####.###-#;0;
     Result := Copy(aCodigo,1,1) +'.'+Copy(aCodigo,2,4)+'.'+Copy(aCodigo,6,4)+'.'+Copy(aCodigo,10,3)+'-'+Copy(aCodigo,13,1);
End;

function FormataCNPJ(CNPJ: string): string;
begin
  Result :=Copy(CNPJ,1,2)+'.'+Copy(CNPJ,3,3)+'.'+Copy(CNPJ,6,3)+'/'+
    Copy(CNPJ,9,4)+'-'+Copy(CNPJ,13,2);
end;

function IdadeAtual(Nasc : TDate): Integer;
Var AuxIdade, Meses : String;
  MesesFloat : Real;
  IdadeInc, IdadeReal : Integer;
begin
  AuxIdade := Format('%0.2f', [(Date - Nasc) / 365.6]);
  Meses := FloatToStr(Frac(StrToFloat(AuxIdade)));
  if AuxIdade = '0' then
  begin
  Result := 0;
  Exit;
  end;
  if Meses[1] = '-' then
  begin
  Meses := FloatToStr(StrToFloat(Meses) * -1);
  end;
  Delete(Meses, 1, 2);
  if Length(Meses) = 1 then
  begin
  Meses := Meses + '0';
  end;
  if (Meses <> '0') And (Meses <> '') then
  begin
  MesesFloat := Round(((365.6 * StrToInt(Meses)) / 100) / 30.47)
  end
  else
  begin
  MesesFloat := 0;
  end;
  if MesesFloat <> 12 then
  begin
  IdadeReal := Trunc(StrToFloat(AuxIdade)); // + MesesFloat;
  end
  else
  begin
  IdadeInc := Trunc(StrToFloat(AuxIdade));
  Inc(IdadeInc);
  IdadeReal := IdadeInc;
  end;
  Result := IdadeReal;
end;

function SubData(DataInicio, DataFinal : TDatetime) : Double;
begin
     result := DataFinal - DataInicio;
end;


function PasswordInputBox(const ACaption, APrompt:string): string;
var
  Form: TForm;
  Prompt: TLabel;
  Edit: TEdit;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
  Value: string;
  I: Integer;
  Buffer: array[0..51] of Char;
begin
  Result := '';
  Form := TForm.Create(Application);
  with Form do
  try
    Canvas.Font := Font;
    for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
    for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
    GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(DialogUnits));
    DialogUnits.X := DialogUnits.X div 52;
    BorderStyle := bsDialog;
    Caption := ACaption;
    ClientWidth := MulDiv(180, DialogUnits.X, 4);
    ClientHeight := MulDiv(63, DialogUnits.Y, 8);
    Position := poScreenCenter;
    Prompt := TLabel.Create(Form);
    with Prompt do
    begin
      Parent := Form;
      AutoSize := True;
      Left := MulDiv(8, DialogUnits.X, 4);
      Top := MulDiv(8, DialogUnits.Y, 8);
      Caption := APrompt;
    end;
    Edit := TEdit.Create(Form);
    with Edit do
    begin
      Parent := Form;
      Left := Prompt.Left;
      Top := MulDiv(19, DialogUnits.Y, 8);
      Width := MulDiv(164, DialogUnits.X, 4);
      MaxLength := 255;
      PasswordChar := '*';
      SelectAll;
    end;
    ButtonTop := MulDiv(41, DialogUnits.Y, 8);
    ButtonWidth := MulDiv(50, DialogUnits.X, 4);
    ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
    with TButton.Create(Form) do
    begin
      Parent := Form;
      Caption := 'OK';
      ModalResult := mrOk;
      Default := True;
      SetBounds(MulDiv(38, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
    end;
    with TButton.Create(Form) do
    begin
      Parent := Form;
      Caption := 'Cancel';
      ModalResult := mrCancel;
      Cancel := True;
      SetBounds(MulDiv(92, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
    end;
    if ShowModal = mrOk then
    begin
      Value := Edit.Text;
      Result := Value;
    end;
  finally
    Form.Free;
    Form:=nil;  
  end;
end;


end.

