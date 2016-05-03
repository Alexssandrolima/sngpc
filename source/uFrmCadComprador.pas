unit uFrmCadComprador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, DBClient, Provider, DB, SqlExpr, Buttons,
  Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, jpeg,
  ToolEdit, RXDBCtrl;

type
  TfrmCadComprador = class(TfrmCadastro)
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    Label3: TLabel;
    cmbTpDocumento: TDBLookupComboBox;
    Label4: TLabel;
    dbeNRDoc: TDBEdit;
    Label5: TLabel;
    cmbExpedidor: TDBLookupComboBox;
    cmbUF: TDBComboBox;
    Label6: TLabel;
    cdsConsultarID_COMPRADOR: TIntegerField;
    cdsConsultarNOME_COMPRADOR: TStringField;
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure dbeNRDocKeyPress(Sender: TObject; var Key: Char);
    procedure BtGravarClick(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure dbeNRDocExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbeDtNascExit(Sender: TObject);
  private
    { Private declarations }
    procedure REGISTRO;
    Procedure BUSCAR;
  public
    { Public declarations }
  end;

var
  frmCadComprador: TfrmCadComprador;

implementation

uses udmDados, uFuncoes;

{$R *.dfm}

procedure TfrmCadComprador.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  dmDados.RefreshCDS(dmDados.cdsConfig);
  //
  With dmDados.cdsComprador do
  begin
       Append;
       FieldByName('ID_COMPRADOR').AsInteger :=
           dmDados.cdsConfigCFG_COMPRADOR.AsInteger+ 1;
       FieldByName('UF_EMISSOA_DOC').AsString :=
          dmDados.cdsConfigCFG_UF_PADRAO.AsString;
  End;
  dbeDescricao.SetFocus;
end;

procedure TfrmCadComprador.BtCancelarClick(Sender: TObject);
begin
  inherited;
     dmDados.cdsComprador.Cancel;
     //
     If (dmDados.cdsComprador.IsEmpty) Then
       Close;
end;

procedure TfrmCadComprador.REGISTRO;
begin
     dmDados.RefreshCDS( dmDados.cdsListaTipoDocumentos);
     dmDados.RefreshCDS( dmDados.cdsListaOrgaos);

     dmDados.parametros;
     With dmDados.cdsComprador  do
         begin
              close;
              Params.ParamByName('pID_COMPRADOR').AsInteger :=
                 uFuncoes.mvcodigo('ID_COMPRADOR','COMPRADOR');
              Open;
         End;
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadComprador.FormShow(Sender: TObject);
begin
  inherited;
     REGISTRO;
     If ( dmDados.cdsConfigCFG_COMPRADOR.AsInteger = 0) Then
          BtAdicionarClick(Sender);
     //
     PageControl1.ActivePageIndex := 0;            
end;

procedure TfrmCadComprador.BtEditarClick(Sender: TObject);
begin
  inherited;
  if  not (dmDados.cdsComprador.IsEmpty)
    and (dmDados.cdsComprador.RecordCount > 0) then
  Begin
       if (dmDados.cdsCompradorID_COMPRADOR.AsInteger = 9999999) Then
       begin
            Application.MessageBox('Registro n�o pode ser alterado!!!','ATEN��O',
                MB_OK+MB_ICONSTOP+MB_APPLMODAL);
            Exit;
       End;
       dmDados.cdsComprador.Edit;
       dbeDescricao.SetFocus;
  End;
end;

procedure TfrmCadComprador.BtExcluirClick(Sender: TObject);
Var
  iCod : Integer;
begin
  inherited;
  if not (dmDados.cdsComprador.IsEmpty) and
     (dmDados.cdsComprador.RecordCount > 0) then
   begin
       iCod := dmDados.cdsCompradorID_COMPRADOR.AsInteger;
       //
       if (iCod = 9999999) Then
       begin
            Application.MessageBox('Registro n�o pode ser excluido!!!','ATEN��O',
                MB_OK+MB_ICONSTOP+MB_APPLMODAL);
            Exit;
       End;

       //
       If (dmDados.GetVerificaVendaCliente(iCod)) Then
       begin
            Application.MessageBox('Registro n�o pode ser excluido!!!'+#13'H� venda(s) para este cliente.','ATEN��O',
              MB_OK+MB_ICONSTOP+MB_APPLMODAL);
            Exit;
       End;
       //
       If Application.MessageBox('Deseja excluir este registro?' , 'Exclus�o de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            dmDados.cdsComprador.Delete;
            dmDados.cdsComprador.ApplyUpdates(0);
            //
            REGISTRO;
       end
       else
            Application.MessageBox('N�o ha registro a ser excluido','ATEN��O',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;
end;

procedure TfrmCadComprador.btnConsultarClick(Sender: TObject);
begin
  inherited;
       buscar;
       PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadComprador.BUSCAR;
begin
     With dmDados.cdsComprador do
     begin
         Close;
         Params.ParamByName('pID_COMPRADOR').AsInteger  :=
           cdsConsultar.FieldByName('ID_COMPRADOR').AsInteger;
         Open;
     End;
end;

procedure TfrmCadComprador.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := 'select ID_COMPRADOR, NOME_COMPRADOR from COMPRADOR';
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (ID_COMPRADOR = :pID_COMPRADOR)';
                1: CommandText := CommandText + ' Where (UPPER(NOME_COMPRADOR) like :pNOME_COMPRADOR)';
            end;
            CommandText := CommandText + ' order by NOME_COMPRADOR';
            case rgConsultar.ItemIndex of
                0: datasetConsultar.Params.ParamByName('pID_COMPRADOR').AsInteger := StrtoInt(edtConsultar.Text);
                1: datasetConsultar.Params.ParamByName('pNOME_COMPRADOR').AsString   := edtConsultar.Text + '%';
            end;
            Active := True;
        end;
        cdsConsultar.FetchParams;
        cdsConsultar.Open;
   End;
end;

procedure TfrmCadComprador.dbeNRDocKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
     If not( key in['0'..'9',#8,#13] ) then
        key:=#0;
end;

procedure TfrmCadComprador.BtGravarClick(Sender: TObject);
begin
     If uFuncoes.Empty(dbeDescricao.Text) Then
       Begin
           Application.MessageBox('Digite o nome da comprador.','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeDescricao.SetFocus;
           Exit;
       End;
     //
     If uFuncoes.Empty(cmbTpDocumento.Text) Then
       Begin
           Application.MessageBox('Selecione o tipo de documento.','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbTpDocumento.SetFocus;
           Exit;
       End;
     //
     If uFuncoes.Empty(dbeNRDoc.Text) Then
       Begin
             Application.MessageBox('Digite o n�mero do documento.','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeNRDoc.SetFocus;
           Exit;
       End;
     //
     If uFuncoes.Empty(cmbExpedidor.Text) Then
       Begin
           Application.MessageBox('Selecione o �rg�o expedidor.','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbExpedidor.SetFocus;
           Exit;
       End;
     //
     If uFuncoes.Empty(cmbUF.Text) Then
       Begin
           Application.MessageBox('Selecione a UF emiss�o do documento.','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbUF.SetFocus;
           Exit;
       End;
     //
     if (dmDados.cdsComprador.State in [dsinsert]) then
       if dmDados.Validar_Cliente(dbeDescricao.Text, dbeNRDoc.Text, cmbUF.Text) Then
        begin
             Application.MessageBox('Cliente j� cadastrado.','ATEN��O',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              dbeDescricao.SetFocus;
              dbeDescricao.Clear;
              Exit;
        End;
     //
      try
          //
          if (dmDados.cdsComprador.State in [dsinsert]) then
            begin
                 dmDados.parametros;
                 dmDados.CdsConfig.Edit;
                 dmDados.cdsConfig.FieldByName('CFG_COMPRADOR').AsInteger :=  dmDados.cdsConfig.FieldByName('CFG_COMPRADOR').AsInteger + 1;
                 if (dmDados.cdsConfig.FieldByName('CFG_COMPRADOR').AsInteger = 9999999) Then
                       dmDados.cdsConfig.FieldByName('CFG_COMPRADOR').AsInteger := dmDados.cdsConfig.FieldByName('CFG_COMPRADOR').AsInteger + 1;
                 //
                 dmDados.cdsComprador.FieldByName('ID_COMPRADOR').AsInteger := dmDados.cdsConfig.FieldByName('CFG_COMPRADOR').AsInteger;
                 dmDados.CdsConfig.ApplyUpdates(0);
             end;
          //
          dmDados.cdsComprador.ApplyUpdates(0);
          //
     Except
          on Exc:Exception do
            begin
               Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               BtCancelarClick(Sender);
            End;
     End;
     //
  inherited;
end;

procedure TfrmCadComprador.grdConsultarDblClick(Sender: TObject);
begin
  inherited;
     If not (cdsConsultar.IsEmpty) Then
         btnConsultarClick(Sender);
end;

procedure TfrmCadComprador.dbeNRDocExit(Sender: TObject);
begin
  inherited;
    if (dmDados.cdsComprador.State in [dsinsert]) then
    begin
      if dmDados.Validar_Cliente(dbeDescricao.Text, dbeNRDoc.Text, cmbUF.Text) Then
      begin
           Application.MessageBox('Cliente j� cadastrado.','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            dbeDescricao.SetFocus;
            dbeDescricao.Clear;
            Exit;
      End;
    End;  
     //   
end;

procedure TfrmCadComprador.FormCreate(Sender: TObject);
begin
  inherited;
     dsCadastro.DataSet := dmDados.cdsComprador;
end;

procedure TfrmCadComprador.dbeDtNascExit(Sender: TObject);
begin
  inherited;
 {if  (dsCadastro.DataSet.State in [dsInsert, dsEdit]) then
      begin
           if not uFuncoes.Empty(Ufuncoes.RemoveChar(dsCadastro.DataSet.FieldByName('DATA_NASCIMENTO').AsString)) Then
           begin
            try
               dbeDtNasc.Date := StrToDate(dbeDtNasc.Text);
               //
               If (dbeDtNasc.Date > dmDados.cdsConfigCFG_DATA_ATUAL.AsDateTime) Then
               begin
                   Application.MessageBox('Data de nascimento n�o pode ser superior a '+#13+
                                          'data do movimento!!!','ATEN��O',
                     MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                    dbeDtNasc.SetFocus;
                   Exit;
               End;

            except
              on EConvertError do
              begin
                   Application.MessageBox('Data Inv�lida!','ATEN��O',
                     MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                     dbeDtNasc.SetFocus;
              End;
            end;
           End;
      End;  }
end;

End.
