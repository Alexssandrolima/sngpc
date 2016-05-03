unit uFrmFecharInvertario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, DB, DBCtrls;

type
  TFrmFecharInvertario = class(TForm)
    Panel4: TPanel;
    Image1: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    edtDtMovi: TDateEdit;
    edtDtFechamento: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    dsCadastro: TDataSource;
    Label14: TLabel;
    cmbLojas: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure edtDtFechamentoExit(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFecharInvertario: TFrmFecharInvertario;

implementation

uses udmDados, uFuncoes;

{$R *.dfm}

procedure TFrmFecharInvertario.FormShow(Sender: TObject);
begin
    dmDados.RefreshCDS(dmDados.cdsConfig);
    //
    if not ufuncoes.Empty(uFuncoes.RemoveChar( dmDados.cdsConfigCFG_DATA_ATUAL.AsString)) then
        edtDtMovi.Date := dmDados.cdsConfigCFG_DATA_ATUAL.AsDateTime
    Else
        edtDtMovi.Date := Date();
    //
    //edtDtFechamento.Date := Date();
    dmDados.CarregarLojas(cmbLojas);
    cmbLojas.ItemIndex := 0;
    cmbLojas.SetFocus;
end;

procedure TFrmFecharInvertario.edtDtFechamentoExit(Sender: TObject);
begin
     if not uFuncoes.Empty(uFuncoes.RemoveChar(edtDtFechamento.Text)) then
      begin
           try
              edtDtFechamento.Date := StrToDate(edtDtFechamento.Text);
              //
              If (edtDtFechamento.Date > Date()) Then
              begin
                  Application.MessageBox('Data de fechamento n�o pode ser maior que a atual.','ATEN��O',
                           MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                  edtDtFechamento.SetFocus;
                  Exit;
               End;
           Except
             on EConvertError do
             begin
                  Application.MessageBox('Data Inv�lida!','ATEN��O',
                           MB_OK+MB_ICONSTOP+MB_APPLMODAL);
                  edtDtFechamento.SetFocus;
             End;
           End;
      End;
end;

procedure TFrmFecharInvertario.btnOKClick(Sender: TObject);
Var
  iLoja : Integer;
begin
    If uFuncoes.Empty(cmbLojas.Text) Then
      begin
           Application.MessageBox('Selecione a loja.','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbLojas.SetFocus;
           Exit;
      End;
      //
      edtDtFechamento.Date := StrToDate(edtDtFechamento.Text);
     if uFuncoes.Empty(uFuncoes.RemoveChar(edtDtFechamento.Text)) then
      begin
           Application.MessageBox('Digite a data de confirma��o do invent�rio na Anvisa.','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDtFechamento.SetFocus;
           Exit;
      End;
      //
      if not uFuncoes.Empty(uFuncoes.RemoveChar(edtDtFechamento.Text)) then
      begin
          If (edtDtFechamento.Date > Date()) Then
             begin
                  Application.MessageBox('Data de confirma��o do invent�rio n�o pode ser maior que a atual.','ATEN��O',
                           MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                  edtDtFechamento.SetFocus;
                  Exit;
              End;
      End;
      //
      If Application.MessageBox(PChar('Confirma fechamento de invent�rio da anvisa na data '+edtDtFechamento.Text+'?'),
         'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
        begin
             iLoja :=  dmDados.GetCodigoLoja(cmbLojas.Text);
             if (dmDados.FecharInvertario(iLoja, edtDtFechamento.Date, edtDtFechamento.Date)) Then
             begin
                   Application.MessageBox('Fechamento de Invent�rio realizado com sucesso.','ATEN��O',
                        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   Close;
             End
             Else
                   Application.MessageBox('Erro ao tentar Fechar de Invent�rio.','ATEN��O',
                        MB_OK+MB_ICONSTOP+MB_APPLMODAL);
        End;
end;

end.
