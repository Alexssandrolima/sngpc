inherited frmCadReceituario: TfrmCadReceituario
  Left = 240
  Top = 160
  Caption = 'Cadastro Tipo de Receitu'#225'rio'
  ClientHeight = 261
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 240
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 13
        Top = 8
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        Transparent = True
      end
      object DBText1: TDBText [1]
        Left = 13
        Top = 32
        Width = 79
        Height = 22
        AutoSize = True
        DataField = 'ID_TIPORECEITUARIO'
        DataSource = dsCadastro
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label2: TLabel [2]
        Left = 13
        Top = 64
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbeDescricao
      end
      inherited Panel1: TPanel
        Top = 171
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
        Height = 153
        DataSource = dsConsultar
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_TIPORECEITUARIO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#211'DIGO'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'DESCRI'#199#195'O'
            Visible = True
          end>
      end
      inherited Panel3: TPanel
        Height = 153
      end
    end
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select ID_TIPORECEITUARIO, DESCRICAO from TIPOUSORECEITUARIO'
    MaxBlobSize = -1
    SQLConnection = dmDados.sqlSNGPN
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarID_TIPORECEITUARIO: TIntegerField
      FieldName = 'ID_TIPORECEITUARIO'
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
    DataSet = dmDados.cdsReceituario
  end
end
