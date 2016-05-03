unit uFrmImportaDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, DB, DBTables, Grids,
  DBGrids;

type
  TFrmImportaDados = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qryProdutos: TQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ProgressBar1: TProgressBar;
    lblPercentual: TLabel;
    DBGrid1: TDBGrid;
    dsProdutos: TDataSource;
    qryProdutosPRO_CDPROD: TStringField;
    qryProdutosPRO_CDBARR: TStringField;
    qryProdutosPRO_CDFABR: TStringField;
    qryProdutosPRO_CDFORN: TStringField;
    qryProdutosPRO_NMPROD: TStringField;
    qryProdutosPRO_NMORIG: TStringField;
    qryProdutosPRO_REGIMS: TStringField;
    qryProdutosPRO_VLVEND: TFloatField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Procedure CarregarDados();
  public
    { Public declarations }
  end;

var
  FrmImportaDados: TFrmImportaDados;

implementation

uses Math, uFuncoes, udmDados;

{$R *.dfm}

procedure TFrmImportaDados.BitBtn1Click(Sender: TObject);
Var
   aCodigoMS : String;
   Total, Cont : Integer;
begin
     If Application.MessageBox('Confirma importa��o de dados?',
         'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idNo then
            Exit;
     //
     BitBtn1.Enabled := False;
     BitBtn2.Enabled := False;
     TabSheet2.TabVisible := False;
     try
           Total := qryProdutos.RecordCount;
           ProgressBar1.Position := 0;
           Cont  := 0;
           //
           With qryProdutos do
           begin
              First;
              dmDados.Start;
              try
                While not (Eof) do
                begin
                     aCodigoMS := uFuncoes.Alltrim(uFuncoes.RemoveChar(FieldByname('PRO_REGIMS').AsString));
                     //
                     If not uFuncoes.Empty(aCodigoMS) Then
                     begin
                          With dmDados.cdsProdutos do
                          begin
                               close;
                               Params[0].AsString := aCodigoMS;
                               Open;
                               //
                               If (IsEmpty) Then
                               begin
                                    Append;
                                    FieldByName('PRO_RG_MS_MEDICAMENTO').AsString := aCodigoMS;
                                    FieldByName('PRO_MEDICAMENTO').AsString       := qryProdutos.FieldByName('PRO_NMPROD').AsString;
                                    FieldByName('PRO_VALORVENDA').AsFloat         := qryProdutosPRO_VLVEND.AsFloat;
                                    if not uFuncoes.Empty(qryProdutos.FieldByName('PRO_CDBARR').AsString) Then
                                       FieldByName('PRO_BARRAS').AsString  := qryProdutos.FieldByName('PRO_CDBARR').AsString;
                                    //
                                    if not uFuncoes.Empty(qryProdutos.FieldByName('PRO_CDFABR').AsString) Then
                                       FieldByName('PRO_IDFABRICANTE').AsString  := qryProdutos.FieldByName('PRO_CDFABR').AsString;
                                    //
                                    ApplyUpdates(0);
                               End
                               Else
                               begin
                                    Edit;
                                    FieldByName('PRO_MEDICAMENTO').AsString       := qryProdutos.FieldByName('PRO_NMPROD').AsString;
                                    FieldByName('PRO_VALORVENDA').AsFloat         := qryProdutosPRO_VLVEND.AsFloat;
                                    if not uFuncoes.Empty(qryProdutos.FieldByName('PRO_CDBARR').AsString) Then
                                       FieldByName('PRO_BARRAS').AsString  := qryProdutos.FieldByName('PRO_CDBARR').AsString;
                                    //
                                    if not uFuncoes.Empty(qryProdutos.FieldByName('PRO_CDFABR').AsString) Then
                                       FieldByName('PRO_IDFABRICANTE').AsString  := qryProdutos.FieldByName('PRO_CDFABR').AsString;
                                    //
                                    ApplyUpdates(0);
                               End;
                          End;
                      End;
                      //
                      Cont := Cont + 1;
                      ProgressBar1.Position := (Cont * 100) div Total;
                      lblPercentual.Caption := InttoStr(ProgressBar1.Position)+'%';
                      Application.ProcessMessages;
                     //
                     Next;
                End;
                //
                dmDados.Comit(dmDados.Transc);
                //
                Application.MessageBox('Importa��o realizada com sucesso.','ATEN��O',
                       MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                //
                Close;
              Except
                  dmDados.Rollback;
              End;
           End;
     Finally
           BitBtn1.Enabled := true;
           BitBtn2.Enabled := True;
           //
           TabSheet2.TabVisible := true;
     End;
end;

procedure TFrmImportaDados.CarregarDados;
begin
     With qryProdutos do
     begin
          Close;
          Open;
          //
          If not (IsEmpty) then
              First;
     End;
end;

procedure TFrmImportaDados.FormShow(Sender: TObject);
begin
     { se o alias n�o existir... }
     if not Session.IsAlias('SNGPC') then
     begin
          { Adiciona o alias }
           Session.AddStandardAlias('SNGPC', 'C:\INFOG2\FARMA', 'PARADOX');
           { Salva o arquivo de configura��o do BDE }
            Session.SaveConfigFile;
     end;
     //
     CarregarDados;
     //
     PageControl1.ActivePageIndex := 0;
end;

end.
