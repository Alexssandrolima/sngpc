inherited frmCadMotivoPerda: TfrmCadMotivoPerda
  Left = 193
  Top = 141
  Caption = 'Cadastro Motivo da Perda'
  ClientHeight = 242
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 221
    inherited TabSheet1: TTabSheet
      object DBText1: TDBText [0]
        Left = 13
        Top = 32
        Width = 79
        Height = 22
        AutoSize = True
        DataField = 'ID_MOTIVOPERDA'
        DataSource = dsCadastro
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label3: TLabel [1]
        Left = 13
        Top = 15
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        Transparent = True
      end
      object Label1: TLabel [2]
        Left = 13
        Top = 64
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeDescricao
      end
      inherited Panel1: TPanel
        Top = 152
      end
      object dbeDescricao: TDBEdit
        Left = 13
        Top = 80
        Width = 500
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DESCRICAO'
        DataSource = dsCadastro
        TabOrder = 1
      end
    end
    inherited TabSheet2: TTabSheet
      inherited grdConsultar: TDBGrid
        Height = 134
        DataSource = dsConsultar
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_MOTIVOPERDA'
            Title.Alignment = taCenter
            Title.Caption = 'C'#211'DIGO'
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'DESCRI'#199#195'O'
            Width = 450
            Visible = True
          end>
      end
      inherited Panel3: TPanel
        Height = 134
      end
    end
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select ID_MOTIVOPERDA, DESCRICAO from TIPOMOTIVOPERDA'
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarID_MOTIVOPERDA: TIntegerField
      FieldName = 'ID_MOTIVOPERDA'
      Required = True
      DisplayFormat = '0000'
    end
    object cdsConsultarDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
  end
  inherited dsCadastro: TDataSource
    DataSet = dmDados.cdsMotivoPerda
    Left = 244
    Top = 85
  end
end
