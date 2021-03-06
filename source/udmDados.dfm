object dmDados: TdmDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 203
  Top = 124
  Height = 654
  Width = 1111
  object sqlSNGPN: TSQLConnection
    ConnectionName = 'SNGPC'
    DriverName = 'UIB FireBird15'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpUIBfire15.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=UIB FireBird15'
      'BlobSize=-1'
      'CommitRetain=False'
      'Database=D:\Sistemas\SNGPC\Dados\SNGPC.FDB'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet=WIN1252'
      'SQLDialect=3'
      'Interbase TransIsolation=ReadCommited'
      'User_Name=SYSDBA'
      'WaitOnLocks=True')
    VendorLib = 'c:\Infog2\fbclient.dll'
    BeforeConnect = sqlSNGPNBeforeConnect
    Left = 32
    Top = 16
  end
  object dstMedico: TSQLDataSet
    CommandText = 'select * from MEDICO where (ID_MEDICO = :pID_MEDICO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pID_MEDICO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = sqlSNGPN
    Left = 32
    Top = 72
    object dstMedicoID_MEDICO: TIntegerField
      FieldName = 'ID_MEDICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstMedicoNOME_MEDICO: TStringField
      FieldName = 'NOME_MEDICO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object dstMedicoNR_RG_PROFISSIONAL: TIntegerField
      FieldName = 'NR_RG_PROFISSIONAL'
      ProviderFlags = [pfInUpdate]
    end
    object dstMedicoCONSELHO_PROFISSIONAL: TIntegerField
      FieldName = 'CONSELHO_PROFISSIONAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstMedicoUF_CONSELHO: TStringField
      FieldName = 'UF_CONSELHO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstMedicoSIGLA_CONSELHO: TStringField
      FieldName = 'SIGLA_CONSELHO'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
  end
  object dstComprador: TSQLDataSet
    CommandText = 'select * from COMPRADOR Where (ID_COMPRADOR= :pID_COMPRADOR)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pID_COMPRADOR'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = sqlSNGPN
    Left = 32
    Top = 128
    object dstCompradorID_COMPRADOR: TIntegerField
      FieldName = 'ID_COMPRADOR'
      Required = True
    end
    object dstCompradorNOME_COMPRADOR: TStringField
      FieldName = 'NOME_COMPRADOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object dstCompradorTIPO_DOCUMENTO: TIntegerField
      FieldName = 'TIPO_DOCUMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstCompradorNR_DOCUMETO: TStringField
      FieldName = 'NR_DOCUMETO'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dstCompradorORGAO_EXPEDIDOR: TIntegerField
      FieldName = 'ORGAO_EXPEDIDOR'
      ProviderFlags = [pfInUpdate]
    end
    object dstCompradorUF_EMISSOA_DOC: TStringField
      FieldName = 'UF_EMISSOA_DOC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
  end
  object dstReceituario: TSQLDataSet
    CommandText = 
      'select * from TIPOUSORECEITUARIO Where (ID_TIPORECEITUARIO = :pI' +
      'D_TIPORECEITUARIO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pID_TIPORECEITUARIO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = sqlSNGPN
    Left = 32
    Top = 184
    object dstReceituarioID_TIPORECEITUARIO: TIntegerField
      FieldName = 'ID_TIPORECEITUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstReceituarioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
  end
  object dstUsoMedicamento: TSQLDataSet
    CommandText = 
      'select * from TIPOUSOMEDICAMENTO Where (ID_TIPOMEDICAMENTO  = :p' +
      'ID_TIPOMEDICAMENTO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pID_TIPOMEDICAMENTO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = sqlSNGPN
    Left = 40
    Top = 232
    object dstUsoMedicamentoID_TIPOMEDICAMENTO: TIntegerField
      FieldName = 'ID_TIPOMEDICAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstUsoMedicamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
  end
  object dstOpeNotaFiscal: TSQLDataSet
    CommandText = 
      'select * from TIPOOPERACAONOTAFISCAL where (ID_OPERACAO = :pID_O' +
      'PERACAO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pID_OPERACAO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = sqlSNGPN
    Left = 32
    Top = 280
    object dstOpeNotaFiscalID_OPERACAO: TIntegerField
      FieldName = 'ID_OPERACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstOpeNotaFiscalDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
  end
  object dstConsProfissional: TSQLDataSet
    CommandText = 
      'select * from CONSELHOPROFISSIONAL Where (ID_CONSELHO = :pID_CON' +
      'SELHO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pID_CONSELHO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = sqlSNGPN
    Left = 40
    Top = 344
    object dstConsProfissionalID_CONSELHO: TIntegerField
      FieldName = 'ID_CONSELHO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstConsProfissionalSIGLA: TStringField
      FieldName = 'SIGLA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 5
    end
    object dstConsProfissionalDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
  end
  object dspMedico: TDataSetProvider
    DataSet = dstMedico
    Options = [poAllowCommandText]
    OnGetTableName = dspMedicoGetTableName
    Left = 120
    Top = 72
  end
  object dspComprador: TDataSetProvider
    DataSet = dstComprador
    Options = [poAllowCommandText]
    Left = 120
    Top = 128
  end
  object dspReceituario: TDataSetProvider
    DataSet = dstReceituario
    Options = [poAllowCommandText]
    OnGetTableName = dspReceituarioGetTableName
    Left = 120
    Top = 184
  end
  object dspUsoMedicamento: TDataSetProvider
    DataSet = dstUsoMedicamento
    Options = [poAllowCommandText]
    Left = 144
    Top = 232
  end
  object dspOpeNotaFiscal: TDataSetProvider
    DataSet = dstOpeNotaFiscal
    Options = [poAllowCommandText]
    OnGetTableName = dspOpeNotaFiscalGetTableName
    Left = 128
    Top = 280
  end
  object dspConsProfissional: TDataSetProvider
    DataSet = dstConsProfissional
    Options = [poAllowCommandText]
    OnGetTableName = dspConsProfissionalGetTableName
    Left = 136
    Top = 344
  end
  object cdsMedico: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pID_MEDICO'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspMedico'
    Left = 192
    Top = 72
    object cdsMedicoID_MEDICO: TIntegerField
      FieldName = 'ID_MEDICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00000'
    end
    object cdsMedicoNOME_MEDICO: TStringField
      FieldName = 'NOME_MEDICO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object cdsMedicoNR_RG_PROFISSIONAL: TIntegerField
      FieldName = 'NR_RG_PROFISSIONAL'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '00000'
    end
    object cdsMedicoCONSELHO_PROFISSIONAL: TIntegerField
      FieldName = 'CONSELHO_PROFISSIONAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsMedicoUF_CONSELHO: TStringField
      FieldName = 'UF_CONSELHO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object cdsMedicoNOME_CONSELHO: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_CONSELHO'
      LookupDataSet = cdsListaConselho
      LookupKeyFields = 'ID_CONSELHO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CONSELHO_PROFISSIONAL'
      Size = 60
      Lookup = True
    end
    object cdsMedicoSIGLA_CONSELHO: TStringField
      FieldName = 'SIGLA_CONSELHO'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
  end
  object cdsComprador: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pID_COMPRADOR'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspComprador'
    Left = 200
    Top = 128
    object cdsCompradorID_COMPRADOR: TIntegerField
      FieldName = 'ID_COMPRADOR'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsCompradorNOME_COMPRADOR: TStringField
      FieldName = 'NOME_COMPRADOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object cdsCompradorTIPO_DOCUMENTO: TIntegerField
      FieldName = 'TIPO_DOCUMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCompradorNR_DOCUMETO: TStringField
      FieldName = 'NR_DOCUMETO'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object cdsCompradorORGAO_EXPEDIDOR: TIntegerField
      FieldName = 'ORGAO_EXPEDIDOR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCompradorUF_EMISSOA_DOC: TStringField
      FieldName = 'UF_EMISSOA_DOC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object cdsCompradorDESC_TPDOC: TStringField
      FieldKind = fkLookup
      FieldName = 'DESC_TPDOC'
      LookupDataSet = cdsListaTipoDocumentos
      LookupKeyFields = 'ID_DOCUMENTO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TIPO_DOCUMENTO'
      Size = 60
      Lookup = True
    end
    object cdsCompradorDESC_EXPEDIDOR: TStringField
      FieldKind = fkLookup
      FieldName = 'DESC_EXPEDIDOR'
      LookupDataSet = cdsListaOrgaos
      LookupKeyFields = 'ID_ORGAO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'ORGAO_EXPEDIDOR'
      Size = 60
      Lookup = True
    end
  end
  object dstConfig: TSQLDataSet
    CommandText = 'select * from CONFIG'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlSNGPN
    Left = 160
    Top = 16
  end
  object dspConfig: TDataSetProvider
    DataSet = dstConfig
    Options = [poAllowCommandText]
    OnGetTableName = dspConfigGetTableName
    Left = 224
    Top = 16
  end
  object cdsConfig: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfig'
    Left = 288
    Top = 16
    object cdsConfigCFG_TIPORECEITUARIO: TIntegerField
      FieldName = 'CFG_TIPORECEITUARIO'
    end
    object cdsConfigCFG_TIPO_USO_MEDICAMENTO: TIntegerField
      FieldName = 'CFG_TIPO_USO_MEDICAMENTO'
    end
    object cdsConfigCFG_OPERACAO_NF: TIntegerField
      FieldName = 'CFG_OPERACAO_NF'
    end
    object cdsConfigCFG_CONSELHO_PROFISSIONAL: TIntegerField
      FieldName = 'CFG_CONSELHO_PROFISSIONAL'
    end
    object cdsConfigCFG_UND_INSUMO: TIntegerField
      FieldName = 'CFG_UND_INSUMO'
    end
    object cdsConfigCFG_UND_FARMACOTECNICA: TIntegerField
      FieldName = 'CFG_UND_FARMACOTECNICA'
    end
    object cdsConfigCFG_TIPO_DOCUMENTO: TIntegerField
      FieldName = 'CFG_TIPO_DOCUMENTO'
    end
    object cdsConfigCFG_ORGAO_EXPEDIDOR: TIntegerField
      FieldName = 'CFG_ORGAO_EXPEDIDOR'
    end
    object cdsConfigCFG_MEDICO: TIntegerField
      FieldName = 'CFG_MEDICO'
    end
    object cdsConfigCFG_COMPRADOR: TIntegerField
      FieldName = 'CFG_COMPRADOR'
    end
    object cdsConfigCFG_PERDAS: TIntegerField
      FieldName = 'CFG_PERDAS'
    end
    object cdsConfigCFG_VENDAS: TIntegerField
      FieldName = 'CFG_VENDAS'
    end
    object cdsConfigCFG_ENTRADAS_MEDICAMENTOS: TIntegerField
      FieldName = 'CFG_ENTRADAS_MEDICAMENTOS'
    end
    object cdsConfigCFG_TRANSFERENCIA: TIntegerField
      FieldName = 'CFG_TRANSFERENCIA'
    end
    object cdsConfigCFG_DATA_ATUAL: TDateField
      FieldName = 'CFG_DATA_ATUAL'
    end
    object cdsConfigCGF_NOME_EMPRESA: TStringField
      FieldName = 'CGF_NOME_EMPRESA'
      Size = 50
    end
    object cdsConfigCFG_CNPJ: TStringField
      Alignment = taRightJustify
      FieldName = 'CFG_CNPJ'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object cdsConfigCFG_MOTIVO_PERDA: TIntegerField
      FieldName = 'CFG_MOTIVO_PERDA'
    end
    object cdsConfigCFG_NOME_PASTA: TStringField
      FieldName = 'CFG_NOME_PASTA'
      Size = 80
    end
    object cdsConfigCFG_USUARIO: TIntegerField
      FieldName = 'CFG_USUARIO'
    end
    object cdsConfigCFG_EMAIL: TStringField
      FieldName = 'CFG_EMAIL'
      Size = 60
    end
    object cdsConfigCFG_LOGIN: TStringField
      FieldName = 'CFG_LOGIN'
      Size = 10
    end
    object cdsConfigCFG_CPF: TStringField
      Alignment = taRightJustify
      FieldName = 'CFG_CPF'
      EditMask = '999.999.999-99;0;_'
      FixedChar = True
      Size = 11
    end
    object cdsConfigCFG_EMPRESAS: TIntegerField
      FieldName = 'CFG_EMPRESAS'
    end
    object cdsConfigCFG_ENTRADA: TIntegerField
      FieldName = 'CFG_ENTRADA'
    end
    object cdsConfigCFG_VENDA_INSUMO: TIntegerField
      FieldName = 'CFG_VENDA_INSUMO'
    end
    object cdsConfigCFG_ARQUIVO: TIntegerField
      FieldName = 'CFG_ARQUIVO'
    end
    object cdsConfigCFG_UF_PADRAO: TStringField
      FieldName = 'CFG_UF_PADRAO'
      FixedChar = True
      Size = 2
    end
    object cdsConfigCFG_FLARQUIVO: TStringField
      FieldName = 'CFG_FLARQUIVO'
      FixedChar = True
      Size = 1
    end
    object cdsConfigCFG_LIMITE_LOJAS: TIntegerField
      FieldName = 'CFG_LIMITE_LOJAS'
      Required = True
    end
    object cdsConfigCFG_FLJURO: TIntegerField
      FieldName = 'CFG_FLJURO'
    end
    object cdsConfigCFG_SEQTAREFA: TIntegerField
      FieldName = 'CFG_SEQTAREFA'
    end
    object cdsConfigCFG_SCREEN_WIDTH: TIntegerField
      FieldName = 'CFG_SCREEN_WIDTH'
    end
    object cdsConfigCFG_SCREEN_HEIGTH: TIntegerField
      FieldName = 'CFG_SCREEN_HEIGTH'
    end
    object cdsConfigCFG_FLZEROS: TStringField
      FieldName = 'CFG_FLZEROS'
      FixedChar = True
      Size = 1
    end
    object cdsConfigCFG_FLINVENTARIO: TStringField
      FieldName = 'CFG_FLINVENTARIO'
      FixedChar = True
      Size = 1
    end
    object cdsConfigCFG_DTINVENTARIO: TDateField
      FieldName = 'CFG_DTINVENTARIO'
    end
    object cdsConfigCFG_DTULTIMO_ARQUIVO_VALIDADO: TDateField
      FieldName = 'CFG_DTULTIMO_ARQUIVO_VALIDADO'
    end
    object cdsConfigCFG_DT_FECHAMENTO_INV_SISTEMA: TDateField
      FieldName = 'CFG_DT_FECHAMENTO_INV_SISTEMA'
    end
    object cdsConfigCFG_FARMACEUTICO: TIntegerField
      FieldName = 'CFG_FARMACEUTICO'
    end
    object cdsConfigCFG_INVERTARIO_ABERTO_SISTEMA: TStringField
      FieldName = 'CFG_INVERTARIO_ABERTO_SISTEMA'
      FixedChar = True
      Size = 1
    end
    object cdsConfigCFG_DT_INVERTARIO_ABERTO_SIS: TDateField
      FieldName = 'CFG_DT_INVERTARIO_ABERTO_SIS'
    end
    object cdsConfigCFG_SEQUENCIA_MOVIMENTO: TIntegerField
      FieldName = 'CFG_SEQUENCIA_MOVIMENTO'
    end
    object cdsConfigCFG_LOJA_PADRAO: TIntegerField
      FieldName = 'CFG_LOJA_PADRAO'
    end
    object cdsConfigCFG_CONTROLE_RECEITA_BRANCA: TIntegerField
      FieldName = 'CFG_CONTROLE_RECEITA_BRANCA'
    end
    object cdsConfigCFG_FLPRODUCAO: TStringField
      FieldName = 'CFG_FLPRODUCAO'
      FixedChar = True
      Size = 1
    end
  end
  object cdsReceituario: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pID_TIPORECEITUARIO'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspReceituario'
    Left = 208
    Top = 184
    object cdsReceituarioID_TIPORECEITUARIO: TIntegerField
      FieldName = 'ID_TIPORECEITUARIO'
      Required = True
      DisplayFormat = '0000'
    end
    object cdsReceituarioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object cdsOpNotaFiscal: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pID_OPERACAO'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspOpeNotaFiscal'
    Left = 224
    Top = 280
    object cdsOpNotaFiscalID_OPERACAO: TIntegerField
      FieldName = 'ID_OPERACAO'
      Required = True
      DisplayFormat = '0000'
    end
    object cdsOpNotaFiscalDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object cdsUsoMedicamento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pID_TIPOMEDICAMENTO'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspUsoMedicamento'
    Left = 264
    Top = 232
    object cdsUsoMedicamentoID_TIPOMEDICAMENTO: TIntegerField
      FieldName = 'ID_TIPOMEDICAMENTO'
      Required = True
      DisplayFormat = '0000'
    end
    object cdsUsoMedicamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object cdsConselhoProfissional: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pID_CONSELHO'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspConsProfissional'
    Left = 248
    Top = 336
    object cdsConselhoProfissionalID_CONSELHO: TIntegerField
      FieldName = 'ID_CONSELHO'
      Required = True
      DisplayFormat = '0000'
    end
    object cdsConselhoProfissionalSIGLA: TStringField
      FieldName = 'SIGLA'
      Required = True
      Size = 5
    end
    object cdsConselhoProfissionalDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object dstMotivoPerda: TSQLDataSet
    CommandText = 
      'select * from TIPOMOTIVOPERDA Where (ID_MOTIVOPERDA = :pID_MOTIV' +
      'OPERDA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pID_MOTIVOPERDA'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = sqlSNGPN
    Left = 280
    Top = 80
    object dstMotivoPerdaID_MOTIVOPERDA: TIntegerField
      FieldName = 'ID_MOTIVOPERDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstMotivoPerdaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
  end
  object dspMotivoPerda: TDataSetProvider
    DataSet = dstMotivoPerda
    Options = [poAllowCommandText]
    OnGetTableName = dspMotivoPerdaGetTableName
    Left = 368
    Top = 80
  end
  object cdsMotivoPerda: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pID_MOTIVOPERDA'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspMotivoPerda'
    Left = 448
    Top = 80
    object cdsMotivoPerdaID_MOTIVOPERDA: TIntegerField
      FieldName = 'ID_MOTIVOPERDA'
      Required = True
      DisplayFormat = '0000'
    end
    object cdsMotivoPerdaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object dstUnidadeInsumo: TSQLDataSet
    CommandText = 
      'select * from TIPOUNIDADEINSUMO Where (ID_UNDINSUMO = :pID_UNDIN' +
      'SUMO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pID_UNDINSUMO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = sqlSNGPN
    Left = 280
    Top = 136
    object dstUnidadeInsumoID_UNDINSUMO: TIntegerField
      FieldName = 'ID_UNDINSUMO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstUnidadeInsumoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
  end
  object dspUnidadeInsumo: TDataSetProvider
    DataSet = dstUnidadeInsumo
    Options = [poAllowCommandText]
    OnGetTableName = dspUnidadeInsumoGetTableName
    Left = 352
    Top = 152
  end
  object cdsUnidadeInsumo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pID_UNDINSUMO'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspUnidadeInsumo'
    Left = 416
    Top = 136
    object cdsUnidadeInsumoID_UNDINSUMO: TIntegerField
      FieldName = 'ID_UNDINSUMO'
      Required = True
      DisplayFormat = '0000'
    end
    object cdsUnidadeInsumoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object dstUndFarma: TSQLDataSet
    CommandText = 
      'select * from TIPO_UNIDADE_FARMACOTECNICA Where (ID_UND_FARMACOT' +
      'ECNICA = :pID_UND_FARMACOTECNICA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pID_UND_FARMACOTECNICA'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = sqlSNGPN
    Left = 320
    Top = 208
    object dstUndFarmaID_UND_FARMACOTECNICA: TIntegerField
      FieldName = 'ID_UND_FARMACOTECNICA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstUndFarmaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
  end
  object dspUndFarma: TDataSetProvider
    DataSet = dstUndFarma
    Options = [poAllowCommandText]
    OnGetTableName = dspUndFarmaGetTableName
    Left = 392
    Top = 208
  end
  object cdsUndFarmaco: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pID_UND_FARMACOTECNICA'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspUndFarma'
    Left = 480
    Top = 208
    object cdsUndFarmacoID_UND_FARMACOTECNICA: TIntegerField
      FieldName = 'ID_UND_FARMACOTECNICA'
      Required = True
      DisplayFormat = '0000'
    end
    object cdsUndFarmacoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object dstTipoDocumento: TSQLDataSet
    CommandText = 
      'select * from TIPO_DOCUMENTO Where (ID_DOCUMENTO = :pID_DOCUMENT' +
      'O)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pID_DOCUMENTO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = sqlSNGPN
    Left = 320
    Top = 280
    object dstTipoDocumentoID_DOCUMENTO: TIntegerField
      FieldName = 'ID_DOCUMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstTipoDocumentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
  end
  object dspTipoDocumento: TDataSetProvider
    DataSet = dstTipoDocumento
    Options = [poAllowCommandText]
    OnGetTableName = dspTipoDocumentoGetTableName
    Left = 384
    Top = 264
  end
  object cdsTipoDocumento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pID_DOCUMENTO'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspTipoDocumento'
    Left = 456
    Top = 288
    object cdsTipoDocumentoID_DOCUMENTO: TIntegerField
      FieldName = 'ID_DOCUMENTO'
      Required = True
      DisplayFormat = '0000'
    end
    object cdsTipoDocumentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object dstOrgaoExpedidor: TSQLDataSet
    CommandText = 'select * from ORGAO_EXPEDIDOR where (ID_ORGAO = :pID_ORGAO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pID_ORGAO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = sqlSNGPN
    Left = 336
    Top = 352
    object dstOrgaoExpedidorID_ORGAO: TIntegerField
      FieldName = 'ID_ORGAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstOrgaoExpedidorSIGLA_ORGAO: TStringField
      FieldName = 'SIGLA_ORGAO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstOrgaoExpedidorDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
  end
  object dspOrgaoExpedidor: TDataSetProvider
    DataSet = dstOrgaoExpedidor
    Options = [poAllowCommandText]
    OnGetTableName = dspOrgaoExpedidorGetTableName
    Left = 408
    Top = 344
  end
  object cdsOrgaoExpedidor: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pID_ORGAO'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspOrgaoExpedidor'
    Left = 488
    Top = 360
    object cdsOrgaoExpedidorID_ORGAO: TIntegerField
      FieldName = 'ID_ORGAO'
      Required = True
      DisplayFormat = '0000'
    end
    object cdsOrgaoExpedidorSIGLA_ORGAO: TStringField
      FieldName = 'SIGLA_ORGAO'
      Size = 10
    end
    object cdsOrgaoExpedidorDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object qryUsuarios: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'Select * from USUARIOS '
      'Where (SEN_CODIGO = :pCODIGO)')
    SQLConnection = sqlSNGPN
    Left = 408
    Top = 16
  end
  object dstUsuarios: TSQLDataSet
    CommandText = 'select * from USUARIOS Where (SEN_CODIGO = :pCODIGO) '
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = sqlSNGPN
    Left = 32
    Top = 400
    object dstUsuariosSEN_CODIGO: TIntegerField
      FieldName = 'SEN_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstUsuariosSEN_NOME: TStringField
      FieldName = 'SEN_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstUsuariosSEN_SNATUA: TStringField
      FieldName = 'SEN_SNATUA'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
    object dstUsuariosSEN_CARGO: TStringField
      FieldName = 'SEN_CARGO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstUsuariosSEN_TERMINAL: TStringField
      FieldName = 'SEN_TERMINAL'
      ProviderFlags = [pfInUpdate]
    end
    object dstUsuariosSEN_LOJA: TIntegerField
      FieldName = 'SEN_LOJA'
      ProviderFlags = [pfInUpdate]
    end
    object dstUsuariosSEN_DTATUAL: TDateField
      FieldName = 'SEN_DTATUAL'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspUsuarios: TDataSetProvider
    DataSet = dstUsuarios
    Options = [poAllowCommandText]
    Left = 96
    Top = 400
  end
  object cdsUsuarios: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspUsuarios'
    Left = 160
    Top = 400
    object cdsUsuariosSEN_CODIGO: TIntegerField
      FieldName = 'SEN_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsUsuariosSEN_NOME: TStringField
      FieldName = 'SEN_NOME'
      Size = 40
    end
    object cdsUsuariosSEN_SNATUA: TStringField
      FieldName = 'SEN_SNATUA'
      Size = 6
    end
    object cdsUsuariosSEN_CARGO: TStringField
      FieldName = 'SEN_CARGO'
      Size = 30
    end
    object cdsUsuariosSEN_TERMINAL: TStringField
      FieldName = 'SEN_TERMINAL'
    end
    object cdsUsuariosSEN_LOJA: TIntegerField
      FieldName = 'SEN_LOJA'
    end
    object cdsUsuariosSEN_DTATUAL: TDateField
      FieldName = 'SEN_DTATUAL'
    end
  end
  object cdsDados: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsDadosCalcFields
    Left = 488
    Top = 16
    Data = {
      7F0100009619E0BD01000000180000000C0000000000030000007F010A50524F
      5F434F4449474F0100490000000100055749445448020002000D000A50524F5F
      4344424152520100490000000100055749445448020002000E000A50524F5F4E
      4D50524F4401004900000001000557494454480200020028000A50524F5F5154
      50524F4408000400000000000A50524F5F564C56454E44080004000000010007
      535542545950450200490006004D6F6E6579000A50524F5F4E524C4F54450100
      490000000100055749445448020002000A000A50524F5F4E5256454E44010049
      00000001000557494454480200020007001050524F5F554E445F494E535F4641
      524D04000100000000000D50524F5F554E445F4641524D410400010000000000
      1050524F5F51545F554E445F4641524D4108000400000000000D50524F5F434E
      504A5F464F524E0100490000000100055749445448020002000E001150524F5F
      55534F5F50524F4C4F4741444F01004900000001000557494454480200020001
      000000}
    object cdsDadosPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      EditMask = '9.9999.9999.999-9;0;_'
      Size = 13
    end
    object cdsDadosPRO_CDBARR: TStringField
      Alignment = taRightJustify
      FieldName = 'PRO_CDBARR'
      Size = 14
    end
    object cdsDadosPRO_NMPROD: TStringField
      FieldName = 'PRO_NMPROD'
      Size = 40
    end
    object cdsDadosPRO_QTPROD: TFloatField
      FieldName = 'PRO_QTPROD'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object cdsDadosPRO_VLVEND: TCurrencyField
      FieldName = 'PRO_VLVEND'
      DisplayFormat = '#,##0.#0'
      EditFormat = '#,##0.#0'
      currency = False
    end
    object cdsDadosPRO_NRLOTE: TStringField
      FieldName = 'PRO_NRLOTE'
      Size = 10
    end
    object cdsDadosPRO_NRVEND: TStringField
      FieldName = 'PRO_NRVEND'
      Size = 7
    end
    object cdsDadosPRO_UND_INS_FARM: TIntegerField
      FieldName = 'PRO_UND_INS_FARM'
    end
    object cdsDadosPRO_UND_FARMA: TIntegerField
      FieldName = 'PRO_UND_FARMA'
    end
    object cdsDadosPRO_QT_UND_FARMA: TFloatField
      FieldName = 'PRO_QT_UND_FARMA'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object cdsDadosPRO_CNPJ_FORN: TStringField
      FieldName = 'PRO_CNPJ_FORN'
      Size = 14
    end
    object cdsDadosPRO_SUBTOTAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PRO_SUBTOTAL'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Calculated = True
    end
    object cdsDadosPRO_USO_PROLOGADO: TStringField
      FieldName = 'PRO_USO_PROLOGADO'
      Size = 1
    end
  end
  object qryProcurar: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from MEDICO')
    SQLConnection = sqlSNGPN
    Left = 496
    Top = 136
  end
  object dstVendas: TSQLDataSet
    CommandText = 
      'Select * from VENDAS M Where (M.ID_VENDA = :pVENDA) and (M.ID_LO' +
      'JA = :pLOJA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pVENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end>
    SQLConnection = sqlSNGPN
    Left = 240
    Top = 408
    object dstVendasID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstVendasID_LOJA: TIntegerField
      FieldName = 'ID_LOJA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstVendasDATA_VENDA: TDateField
      FieldName = 'DATA_VENDA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstVendasDATA_RECEITA: TDateField
      FieldName = 'DATA_RECEITA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstVendasTIPO_RECEITUARIO: TIntegerField
      FieldName = 'TIPO_RECEITUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstVendasNR_NOT_MEDICAMENTO: TStringField
      FieldName = 'NR_NOT_MEDICAMENTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object dstVendasID_PRESCRITOR: TIntegerField
      FieldName = 'ID_PRESCRITOR'
      ProviderFlags = [pfInUpdate]
    end
    object dstVendasUSO_MEDICAMENTO: TIntegerField
      FieldName = 'USO_MEDICAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstVendasID_COMPRADOR: TIntegerField
      FieldName = 'ID_COMPRADOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstVendasFLUXO_INSUMO: TStringField
      FieldName = 'FLUXO_INSUMO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstVendasSITUACAO: TStringField
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstVendasARQUIVO: TStringField
      FieldName = 'ARQUIVO'
      ProviderFlags = [pfInUpdate]
    end
    object dstVendasDATA_ARQUIVO: TDateField
      FieldName = 'DATA_ARQUIVO'
      ProviderFlags = [pfInUpdate]
    end
    object dstVendasPAC_CODIGO: TIntegerField
      FieldName = 'PAC_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
    object dstVendasPAC_NOME: TStringField
      FieldName = 'PAC_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object dstVendasPAC_DATA_NASC: TDateField
      FieldName = 'PAC_DATA_NASC'
      ProviderFlags = [pfInUpdate]
    end
    object dstVendasPAC_IDADE: TIntegerField
      FieldName = 'PAC_IDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dstVendasPAC_UND_IDADE: TIntegerField
      FieldName = 'PAC_UND_IDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dstVendasPAC_SEXO: TStringField
      FieldName = 'PAC_SEXO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstVendasPAC_CID: TIntegerField
      FieldName = 'PAC_CID'
      ProviderFlags = [pfInUpdate]
    end
    object dstVendasDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object dstVendasHORA_VENDA: TStringField
      FieldName = 'HORA_VENDA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dstVendasUSUARIO: TIntegerField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspVendas: TDataSetProvider
    DataSet = dstVendas
    Options = [poAllowCommandText]
    Left = 304
    Top = 408
  end
  object cdsVendas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pVENDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end>
    ProviderName = 'dspVendas'
    Left = 368
    Top = 408
    object cdsVendasID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsVendasID_LOJA: TIntegerField
      FieldName = 'ID_LOJA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsVendasNOME_LOJA: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_LOJA'
      LookupDataSet = cdsListaEmpresa
      LookupKeyFields = 'EMP_CODIGO'
      LookupResultField = 'EMP_FANTASIA'
      KeyFields = 'ID_LOJA'
      Size = 50
      Lookup = True
    end
    object cdsVendasDATA_VENDA: TDateField
      FieldName = 'DATA_VENDA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsVendasDATA_RECEITA: TDateField
      FieldName = 'DATA_RECEITA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsVendasTIPO_RECEITUARIO: TIntegerField
      FieldName = 'TIPO_RECEITUARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsVendasNR_NOT_MEDICAMENTO: TStringField
      FieldName = 'NR_NOT_MEDICAMENTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object cdsVendasID_PRESCRITOR: TIntegerField
      FieldName = 'ID_PRESCRITOR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendasUSO_MEDICAMENTO: TIntegerField
      FieldName = 'USO_MEDICAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendasDESCRICAO_USO_MED: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO_USO_MED'
      LookupDataSet = cdsListaUsoMedicamento
      LookupKeyFields = 'ID_TIPOMEDICAMENTO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'USO_MEDICAMENTO'
      Size = 60
      Lookup = True
    end
    object cdsVendasID_COMPRADOR: TIntegerField
      FieldName = 'ID_COMPRADOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsVendasFLUXO_INSUMO: TStringField
      FieldName = 'FLUXO_INSUMO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsVendasSITUACAO: TStringField
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsVendasARQUIVO: TStringField
      FieldName = 'ARQUIVO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendasDATA_ARQUIVO: TDateField
      FieldName = 'DATA_ARQUIVO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendasPAC_CODIGO: TIntegerField
      FieldName = 'PAC_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendasPAC_NOME: TStringField
      FieldName = 'PAC_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object cdsVendasPAC_DATA_NASC: TDateField
      FieldName = 'PAC_DATA_NASC'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendasPAC_IDADE: TIntegerField
      FieldName = 'PAC_IDADE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendasPAC_UND_IDADE: TIntegerField
      FieldName = 'PAC_UND_IDADE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendasPAC_SEXO: TStringField
      FieldName = 'PAC_SEXO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsVendasPAC_CID: TIntegerField
      FieldName = 'PAC_CID'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendasDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendasUSUARIO: TIntegerField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendasHORA_VENDA: TStringField
      FieldName = 'HORA_VENDA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object cdsVendasDESCRICAO_USO_REC: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO_USO_REC'
      LookupDataSet = cdsListaUsoReceituario
      LookupKeyFields = 'ID_TIPORECEITUARIO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TIPO_RECEITUARIO'
      Size = 60
      Lookup = True
    end
  end
  object dstProdutosVendas: TSQLDataSet
    CommandText = 'select * from PRODUTOS_VENDAS'
    MaxBlobSize = -1
    Params = <>
    Left = 448
    Top = 408
    object dstProdutosVendasPRV_CODSOLICITACAO: TIntegerField
      FieldName = 'PRV_CODSOLICITACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstProdutosVendasPRV_CODBARRAS: TStringField
      FieldName = 'PRV_CODBARRAS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 13
    end
    object dstProdutosVendasPRV_NOMEAPRESENTACAO: TStringField
      FieldName = 'PRV_NOMEAPRESENTACAO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstProdutosVendasPRV_QUANTIDADE: TFMTBCDField
      FieldName = 'PRV_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstProdutosVendasPRV_VLVENDA: TFMTBCDField
      FieldName = 'PRV_VLVENDA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstProdutosVendasPRV_QUANTIDADE_PRESCRITA: TFMTBCDField
      FieldName = 'PRV_QUANTIDADE_PRESCRITA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstProdutosVendasPRV_QUANTIDADE_AUTORIZADA: TFMTBCDField
      FieldName = 'PRV_QUANTIDADE_AUTORIZADA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstProdutosVendasPRV_VLPARCELA: TFMTBCDField
      FieldName = 'PRV_VLPARCELA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstProdutosVendasPRV_VLTOTALPRECOVENDA: TFMTBCDField
      FieldName = 'PRV_VLTOTALPRECOVENDA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstProdutosVendasPRV_VLTOTALPARCELA: TFMTBCDField
      FieldName = 'PRV_VLTOTALPARCELA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstProdutosVendasPRV_COD_INDICADOR: TIntegerField
      FieldName = 'PRV_COD_INDICADOR'
      ProviderFlags = [pfInUpdate]
    end
    object dstProdutosVendasPRV_QUANT_CANCELADA: TFMTBCDField
      FieldName = 'PRV_QUANT_CANCELADA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstProdutosVendasPRV_AUTORESTORNO: TStringField
      FieldName = 'PRV_AUTORESTORNO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object dstProdutosVendasPRV_AUTORMEDICAMENTO: TStringField
      FieldName = 'PRV_AUTORMEDICAMENTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object dstProdutosVendasPRV_STATUS: TStringField
      FieldName = 'PRV_STATUS'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstProdutosVendasPRV_QTDEVOLVIDA: TFMTBCDField
      FieldName = 'PRV_QTDEVOLVIDA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstProdutosVendasPRV_QTPRESCRITA: TFMTBCDField
      FieldName = 'PRV_QTPRESCRITA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstProdutosVendasPRV_VLPRECO_SUBSIDIADO: TFMTBCDField
      FieldName = 'PRV_VLPRECO_SUBSIDIADO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstProdutosVendasPRV_VLPRECO_SUBPACIENTE: TFMTBCDField
      FieldName = 'PRV_VLPRECO_SUBPACIENTE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstProdutosVendasPRV_VLPRECO_SUBPAC_POSESTORNO: TFMTBCDField
      FieldName = 'PRV_VLPRECO_SUBPAC_POSESTORNO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstProdutosVendasPRV_VLSUBMS_POSESTORNO: TFMTBCDField
      FieldName = 'PRV_VLSUBMS_POSESTORNO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstProdutosVendasPRV_VLTOTAL_POSESTORNO: TFMTBCDField
      FieldName = 'PRV_VLTOTAL_POSESTORNO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstProdutosVendasPRV_FLCANC: TStringField
      FieldName = 'PRV_FLCANC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstProdutosVendasPRV_QTESTORNADA: TFMTBCDField
      FieldName = 'PRV_QTESTORNADA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
  end
  object dspProdutosVendas: TDataSetProvider
    DataSet = dstProdutosVendas
    Options = [poAllowCommandText]
    Left = 496
    Top = 456
  end
  object cdsProdutosVendas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutosVendas'
    Left = 544
    Top = 408
    object cdsProdutosVendasPRV_CODSOLICITACAO: TIntegerField
      FieldName = 'PRV_CODSOLICITACAO'
      Required = True
    end
    object cdsProdutosVendasPRV_CODBARRAS: TStringField
      FieldName = 'PRV_CODBARRAS'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsProdutosVendasPRV_NOMEAPRESENTACAO: TStringField
      FieldName = 'PRV_NOMEAPRESENTACAO'
      Size = 40
    end
    object cdsProdutosVendasPRV_QUANTIDADE: TFMTBCDField
      FieldName = 'PRV_QUANTIDADE'
      Precision = 15
      Size = 3
    end
    object cdsProdutosVendasPRV_VLVENDA: TFMTBCDField
      FieldName = 'PRV_VLVENDA'
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsProdutosVendasPRV_QUANTIDADE_PRESCRITA: TFMTBCDField
      FieldName = 'PRV_QUANTIDADE_PRESCRITA'
      Precision = 15
      Size = 3
    end
    object cdsProdutosVendasPRV_QUANTIDADE_AUTORIZADA: TFMTBCDField
      FieldName = 'PRV_QUANTIDADE_AUTORIZADA'
      Precision = 15
      Size = 3
    end
    object cdsProdutosVendasPRV_VLPARCELA: TFMTBCDField
      FieldName = 'PRV_VLPARCELA'
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsProdutosVendasPRV_VLTOTALPRECOVENDA: TFMTBCDField
      FieldName = 'PRV_VLTOTALPRECOVENDA'
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsProdutosVendasPRV_VLTOTALPARCELA: TFMTBCDField
      FieldName = 'PRV_VLTOTALPARCELA'
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsProdutosVendasPRV_COD_INDICADOR: TIntegerField
      FieldName = 'PRV_COD_INDICADOR'
    end
    object cdsProdutosVendasPRV_QUANT_CANCELADA: TFMTBCDField
      FieldName = 'PRV_QUANT_CANCELADA'
      Precision = 15
      Size = 3
    end
    object cdsProdutosVendasPRV_AUTORESTORNO: TStringField
      FieldName = 'PRV_AUTORESTORNO'
      FixedChar = True
      Size = 4
    end
    object cdsProdutosVendasPRV_AUTORMEDICAMENTO: TStringField
      FieldName = 'PRV_AUTORMEDICAMENTO'
      FixedChar = True
      Size = 3
    end
    object cdsProdutosVendasPRV_STATUS: TStringField
      FieldName = 'PRV_STATUS'
      Size = 10
    end
    object cdsProdutosVendasPRV_QTDEVOLVIDA: TFMTBCDField
      FieldName = 'PRV_QTDEVOLVIDA'
      Precision = 15
      Size = 3
    end
    object cdsProdutosVendasPRV_QTPRESCRITA: TFMTBCDField
      FieldName = 'PRV_QTPRESCRITA'
      Precision = 15
      Size = 3
    end
    object cdsProdutosVendasPRV_VLPRECO_SUBSIDIADO: TFMTBCDField
      FieldName = 'PRV_VLPRECO_SUBSIDIADO'
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 3
    end
    object cdsProdutosVendasPRV_VLPRECO_SUBPACIENTE: TFMTBCDField
      FieldName = 'PRV_VLPRECO_SUBPACIENTE'
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 3
    end
    object cdsProdutosVendasPRV_VLPRECO_SUBPAC_POSESTORNO: TFMTBCDField
      FieldName = 'PRV_VLPRECO_SUBPAC_POSESTORNO'
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 3
    end
    object cdsProdutosVendasPRV_VLSUBMS_POSESTORNO: TFMTBCDField
      FieldName = 'PRV_VLSUBMS_POSESTORNO'
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 3
    end
    object cdsProdutosVendasPRV_VLTOTAL_POSESTORNO: TFMTBCDField
      FieldName = 'PRV_VLTOTAL_POSESTORNO'
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 3
    end
    object cdsProdutosVendasPRV_FLCANC: TStringField
      FieldName = 'PRV_FLCANC'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosVendasPRV_QTESTORNADA: TFMTBCDField
      FieldName = 'PRV_QTESTORNADA'
      Precision = 15
      Size = 3
    end
  end
  object dstLojas: TSQLDataSet
    CommandText = 'select * from EMPRESAS Where (EMP_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = sqlSNGPN
    Left = 32
    Top = 448
    object dstLojasEMP_CODIGO: TIntegerField
      FieldName = 'EMP_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstLojasEMP_CNPJ: TStringField
      FieldName = 'EMP_CNPJ'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 14
    end
    object dstLojasEMP_INSCRICAOESTADUAL: TStringField
      FieldName = 'EMP_INSCRICAOESTADUAL'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 11
    end
    object dstLojasEMP_FANTASIA: TStringField
      FieldName = 'EMP_FANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstLojasEMP_RAZAO: TStringField
      FieldName = 'EMP_RAZAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstLojasEMP_ENDERECO: TStringField
      FieldName = 'EMP_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstLojasEMP_NUMERO: TIntegerField
      FieldName = 'EMP_NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object dstLojasEMP_BAIRRO: TStringField
      FieldName = 'EMP_BAIRRO'
      ProviderFlags = [pfInUpdate]
    end
    object dstLojasEMP_CIDADE: TStringField
      FieldName = 'EMP_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dstLojasEMP_UFEMPR: TStringField
      FieldName = 'EMP_UFEMPR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstLojasEMP_ULTIMO_PERIODO: TDateField
      FieldName = 'EMP_ULTIMO_PERIODO'
      ProviderFlags = [pfInUpdate]
    end
    object dstLojasEMP_CHAVE: TStringField
      FieldName = 'EMP_CHAVE'
      ProviderFlags = [pfInUpdate]
      Size = 32
    end
  end
  object dspLojas: TDataSetProvider
    DataSet = dstLojas
    Options = [poAllowCommandText]
    OnGetTableName = dspLojasGetTableName
    Left = 88
    Top = 448
  end
  object cdsLojas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspLojas'
    Left = 136
    Top = 448
    object cdsLojasEMP_CODIGO: TIntegerField
      FieldName = 'EMP_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsLojasEMP_CNPJ: TStringField
      FieldName = 'EMP_CNPJ'
      Required = True
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object cdsLojasEMP_INSCRICAOESTADUAL: TStringField
      FieldName = 'EMP_INSCRICAOESTADUAL'
      FixedChar = True
      Size = 11
    end
    object cdsLojasEMP_FANTASIA: TStringField
      FieldName = 'EMP_FANTASIA'
      Size = 50
    end
    object cdsLojasEMP_RAZAO: TStringField
      FieldName = 'EMP_RAZAO'
      Size = 50
    end
    object cdsLojasEMP_ENDERECO: TStringField
      FieldName = 'EMP_ENDERECO'
      Size = 50
    end
    object cdsLojasEMP_NUMERO: TIntegerField
      FieldName = 'EMP_NUMERO'
    end
    object cdsLojasEMP_BAIRRO: TStringField
      FieldName = 'EMP_BAIRRO'
    end
    object cdsLojasEMP_CIDADE: TStringField
      FieldName = 'EMP_CIDADE'
    end
    object cdsLojasEMP_UFEMPR: TStringField
      FieldName = 'EMP_UFEMPR'
      FixedChar = True
      Size = 2
    end
    object cdsLojasEMP_ULTIMO_PERIODO: TDateField
      FieldName = 'EMP_ULTIMO_PERIODO'
    end
    object cdsLojasEMP_CHAVE: TStringField
      FieldName = 'EMP_CHAVE'
      Size = 32
    end
  end
  object cdsProdutos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'pMEDICAMENTO'
        ParamType = ptInput
      end>
    ProviderName = 'dspProdutos'
    Left = 560
    Top = 336
    object cdsProdutosPRO_RG_MS_MEDICAMENTO: TStringField
      Alignment = taRightJustify
      FieldName = 'PRO_RG_MS_MEDICAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      EditMask = '9.9999.9999.999-9;0;_'
      FixedChar = True
      Size = 13
    end
    object cdsProdutosPRO_BARRAS: TStringField
      FieldName = 'PRO_BARRAS'
      Size = 14
    end
    object cdsProdutosPRO_MEDICAMENTO: TStringField
      FieldName = 'PRO_MEDICAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object cdsProdutosPRO_VALORVENDA: TFMTBCDField
      FieldName = 'PRO_VALORVENDA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
      Precision = 15
      Size = 2
    end
    object cdsProdutosPRO_QUANTIDADE: TFMTBCDField
      FieldName = 'PRO_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
      Precision = 15
      Size = 3
    end
    object cdsProdutosPRO_ANTIMICROBIANOS: TStringField
      FieldName = 'PRO_ANTIMICROBIANOS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsProdutosPRO_UNIDADE_MEDIDA: TStringField
      FieldName = 'PRO_UNIDADE_MEDIDA'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosPRO_IDFABRICANTE: TIntegerField
      FieldName = 'PRO_IDFABRICANTE'
    end
  end
  object dspProdutos: TDataSetProvider
    DataSet = dstProdutos
    Options = [poAllowCommandText]
    OnGetTableName = dspProdutosGetTableName
    Left = 560
    Top = 288
  end
  object dstProdutos: TSQLDataSet
    CommandText = 
      'select * from PRODUTOS Where (PRO_RG_MS_MEDICAMENTO = :pMEDICAME' +
      'NTO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pMEDICAMENTO'
        ParamType = ptInput
      end>
    SQLConnection = sqlSNGPN
    Left = 560
    Top = 240
    object dstProdutosPRO_RG_MS_MEDICAMENTO: TStringField
      FieldName = 'PRO_RG_MS_MEDICAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 13
    end
    object dstProdutosPRO_MEDICAMENTO: TStringField
      FieldName = 'PRO_MEDICAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object dstProdutosPRO_VALORVENDA: TFMTBCDField
      FieldName = 'PRO_VALORVENDA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstProdutosPRO_QUANTIDADE: TFMTBCDField
      FieldName = 'PRO_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstProdutosPRO_ANTIMICROBIANOS: TStringField
      FieldName = 'PRO_ANTIMICROBIANOS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstProdutosPRO_UNIDADE_MEDIDA: TStringField
      FieldName = 'PRO_UNIDADE_MEDIDA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstProdutosPRO_BARRAS: TStringField
      FieldName = 'PRO_BARRAS'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dstProdutosPRO_IDFABRICANTE: TIntegerField
      FieldName = 'PRO_IDFABRICANTE'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qryIncProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pMEDICAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pDESCRICAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'pVALOR'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'Insert Into PRODUTOS (PRO_RG_MS_MEDICAMENTO, PRO_MEDICAMENTO, PR' +
        'O_VALORVENDA)'
      'Values (:pMEDICAMENTO, :pDESCRICAO, :pVALOR)     ')
    SQLConnection = sqlSNGPN
    Left = 560
    Top = 8
  end
  object dstEstoque: TSQLDataSet
    CommandText = 
      'select * from ESTOQUE Where (EST_CDLOJA = :pCDLOJA) and (EST_CDP' +
      'ROD = :pPROD) AND (EST_NRLOTE = :pNRLOTE)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCDLOJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pPROD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pNRLOTE'
        ParamType = ptInput
      end>
    SQLConnection = sqlSNGPN
    Left = 32
    Top = 504
    object dstEstoqueEST_CDLOJA: TIntegerField
      FieldName = 'EST_CDLOJA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstEstoqueEST_CDPROD: TStringField
      FieldName = 'EST_CDPROD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 13
    end
    object dstEstoqueEST_NRLOTE: TStringField
      FieldName = 'EST_NRLOTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object dstEstoqueEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstEstoqueEST_DTVENCIMENTO: TDateField
      FieldName = 'EST_DTVENCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspEstoque: TDataSetProvider
    DataSet = dstEstoque
    Options = [poAllowCommandText]
    OnGetTableName = dspEstoqueGetTableName
    Left = 88
    Top = 496
  end
  object cdsEstoque: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCDLOJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pPROD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pNRLOTE'
        ParamType = ptInput
      end>
    ProviderName = 'dspEstoque'
    Left = 144
    Top = 512
    object cdsEstoqueEST_CDLOJA: TIntegerField
      FieldName = 'EST_CDLOJA'
      Required = True
    end
    object cdsEstoqueEST_CDPROD: TStringField
      FieldName = 'EST_CDPROD'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsEstoqueEST_NRLOTE: TStringField
      FieldName = 'EST_NRLOTE'
      Required = True
      Size = 10
    end
    object cdsEstoqueEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object cdsEstoqueEST_DTVENCIMENTO: TDateField
      FieldName = 'EST_DTVENCIMENTO'
    end
  end
  object cdsPeriodos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 592
    Top = 456
    Data = {
      B30000009619E0BD010000001800000007000000000003000000B30002494404
      00010000000000075553554152494F0400010000000000044441544104000600
      00000000044143414F0100490000000100055749445448020002007800074152
      515549564F01004900000001000557494454480200020014000C4E4F4D455F55
      53554152494F0100490000000100055749445448020002001400065354415455
      5301004900000001000557494454480200020001000000}
    object cdsPeriodosID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsPeriodosUSUARIO: TIntegerField
      FieldName = 'USUARIO'
    end
    object cdsPeriodosDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsPeriodosACAO: TStringField
      FieldName = 'ACAO'
      Size = 120
    end
    object cdsPeriodosARQUIVO: TStringField
      FieldName = 'ARQUIVO'
    end
    object cdsPeriodosNOME_USUARIO: TStringField
      FieldName = 'NOME_USUARIO'
    end
    object cdsPeriodosSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object cdsTarefas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTarefas'
    Left = 376
    Top = 512
    object cdsTarefasTAR_SEQUENCIA: TIntegerField
      FieldName = 'TAR_SEQUENCIA'
      Required = True
    end
    object cdsTarefasTAR_USUARIO: TIntegerField
      FieldName = 'TAR_USUARIO'
    end
    object cdsTarefasTAR_DTMOVI: TDateField
      FieldName = 'TAR_DTMOVI'
    end
    object cdsTarefasTAR_ACAO: TStringField
      FieldName = 'TAR_ACAO'
      Size = 120
    end
    object cdsTarefasTAR_ARQUIVO: TStringField
      FieldName = 'TAR_ARQUIVO'
    end
    object cdsTarefasTAR_STATUS: TStringField
      FieldName = 'TAR_STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object dstTarefas: TSQLDataSet
    CommandText = 
      'select * from TAREFAS_USUARIOS where (TAR_STATUS <> '#39'U'#39') ORDER  ' +
      'by TAR_SEQUENCIA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlSNGPN
    Left = 240
    Top = 512
    object dstTarefasTAR_SEQUENCIA: TIntegerField
      FieldName = 'TAR_SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstTarefasTAR_USUARIO: TIntegerField
      FieldName = 'TAR_USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object dstTarefasTAR_DTMOVI: TDateField
      FieldName = 'TAR_DTMOVI'
      ProviderFlags = [pfInUpdate]
    end
    object dstTarefasTAR_ACAO: TStringField
      FieldName = 'TAR_ACAO'
      ProviderFlags = [pfInUpdate]
      Size = 120
    end
    object dstTarefasTAR_ARQUIVO: TStringField
      FieldName = 'TAR_ARQUIVO'
      ProviderFlags = [pfInUpdate]
    end
    object dstTarefasTAR_STATUS: TStringField
      FieldName = 'TAR_STATUS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object dspTarefas: TDataSetProvider
    DataSet = dstTarefas
    Options = [poAllowCommandText]
    Left = 312
    Top = 504
  end
  object cdsListaItensEntrada: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pENTRADA'
        ParamType = ptInput
      end>
    ProviderName = 'dspListaItensEntrada'
    Left = 648
    Top = 496
    object cdsListaItensEntradaID_ENTRADA: TIntegerField
      FieldName = 'ID_ENTRADA'
      Required = True
    end
    object cdsListaItensEntradaREGISTRO_MS: TStringField
      FieldName = 'REGISTRO_MS'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsListaItensEntradaNUMERO_LOTE: TStringField
      FieldName = 'NUMERO_LOTE'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsListaItensEntradaQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Precision = 9
      Size = 3
    end
    object cdsListaItensEntradaFLUXO_INSUMO: TStringField
      FieldName = 'FLUXO_INSUMO'
      FixedChar = True
      Size = 1
    end
    object cdsListaItensEntradaUND_ENTRADA: TStringField
      FieldName = 'UND_ENTRADA'
      FixedChar = True
      Size = 1
    end
    object cdsListaItensEntradaCNPJ_FORNECEDOR: TStringField
      FieldName = 'CNPJ_FORNECEDOR'
      FixedChar = True
      Size = 14
    end
    object cdsListaItensEntradaDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
    end
  end
  object dspListaItensEntrada: TDataSetProvider
    DataSet = dstListaItensEntrada
    Options = [poAllowCommandText]
    Left = 560
    Top = 512
  end
  object dstListaItensEntrada: TSQLDataSet
    CommandText = 'select * from MEDICAMENTO_ENTRADA Where (ID_ENTRADA = :pENTRADA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pENTRADA'
        ParamType = ptInput
      end>
    SQLConnection = sqlSNGPN
    Left = 464
    Top = 512
    object dstListaItensEntradaID_ENTRADA: TIntegerField
      FieldName = 'ID_ENTRADA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstListaItensEntradaREGISTRO_MS: TStringField
      FieldName = 'REGISTRO_MS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 13
    end
    object dstListaItensEntradaNUMERO_LOTE: TStringField
      FieldName = 'NUMERO_LOTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 10
    end
    object dstListaItensEntradaQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 3
    end
    object dstListaItensEntradaFLUXO_INSUMO: TStringField
      FieldName = 'FLUXO_INSUMO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstListaItensEntradaUND_ENTRADA: TStringField
      FieldName = 'UND_ENTRADA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstListaItensEntradaCNPJ_FORNECEDOR: TStringField
      FieldName = 'CNPJ_FORNECEDOR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 14
    end
    object dstListaItensEntradaDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dstHistorico: TSQLDataSet
    CommandText = 
      'select * from HISTORICO where (HIS_SEQUENCIA = :pSEQUENCIA) '#13#10'an' +
      'd (HIS_LOJA = :pLOJA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pSEQUENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end>
    SQLConnection = sqlSNGPN
    Left = 728
    Top = 16
    object dstHistoricoHIS_SEQUENCIA: TIntegerField
      FieldName = 'HIS_SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dstHistoricoHIS_LOJA: TIntegerField
      FieldName = 'HIS_LOJA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstHistoricoHIS_PRODUTO: TStringField
      FieldName = 'HIS_PRODUTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 13
    end
    object dstHistoricoHIS_NRLOTE: TStringField
      FieldName = 'HIS_NRLOTE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 10
    end
    object dstHistoricoHIS_UNIDADE: TStringField
      FieldName = 'HIS_UNIDADE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstHistoricoHIS_DATA: TDateField
      FieldName = 'HIS_DATA'
      ProviderFlags = [pfInUpdate]
    end
    object dstHistoricoHIS_HORA: TStringField
      FieldName = 'HIS_HORA'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dstHistoricoHIS_TIPO_MOVIMENTO: TStringField
      FieldName = 'HIS_TIPO_MOVIMENTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstHistoricoHIS_TIPO: TStringField
      FieldName = 'HIS_TIPO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstHistoricoHIS_DOCUMENTO: TIntegerField
      FieldName = 'HIS_DOCUMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstHistoricoHIS_ANTERIOR: TFMTBCDField
      FieldName = 'HIS_ANTERIOR'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstHistoricoHIS_MOVIMENTO: TFMTBCDField
      FieldName = 'HIS_MOVIMENTO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstHistoricoHIS_ATUAL: TFMTBCDField
      FieldName = 'HIS_ATUAL'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstHistoricoHIS_MOTIVO: TIntegerField
      FieldName = 'HIS_MOTIVO'
      ProviderFlags = [pfInUpdate]
    end
    object dstHistoricoHIS_USUARIO: TIntegerField
      FieldName = 'HIS_USUARIO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspHistorico: TDataSetProvider
    DataSet = dstHistorico
    Options = [poAllowCommandText]
    Left = 728
    Top = 64
  end
  object cdsHistorico2: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pSEQUENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end>
    ProviderName = 'dspHistorico'
    Left = 728
    Top = 120
    object cdsHistorico2HIS_SEQUENCIA: TIntegerField
      FieldName = 'HIS_SEQUENCIA'
    end
    object cdsHistorico2HIS_LOJA: TIntegerField
      FieldName = 'HIS_LOJA'
      Required = True
    end
    object cdsHistorico2HIS_PRODUTO: TStringField
      FieldName = 'HIS_PRODUTO'
      Required = True
      Size = 13
    end
    object cdsHistorico2HIS_NRLOTE: TStringField
      FieldName = 'HIS_NRLOTE'
      Required = True
      Size = 10
    end
    object cdsHistorico2HIS_UNIDADE: TStringField
      FieldName = 'HIS_UNIDADE'
      FixedChar = True
      Size = 2
    end
    object cdsHistorico2HIS_DATA: TDateField
      FieldName = 'HIS_DATA'
    end
    object cdsHistorico2HIS_HORA: TStringField
      FieldName = 'HIS_HORA'
      Size = 8
    end
    object cdsHistorico2HIS_TIPO_MOVIMENTO: TStringField
      FieldName = 'HIS_TIPO_MOVIMENTO'
      FixedChar = True
      Size = 1
    end
    object cdsHistorico2HIS_TIPO: TStringField
      FieldName = 'HIS_TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsHistorico2HIS_DOCUMENTO: TIntegerField
      FieldName = 'HIS_DOCUMENTO'
    end
    object cdsHistorico2HIS_ANTERIOR: TFMTBCDField
      FieldName = 'HIS_ANTERIOR'
      Precision = 18
      Size = 3
    end
    object cdsHistorico2HIS_MOVIMENTO: TFMTBCDField
      FieldName = 'HIS_MOVIMENTO'
      Precision = 18
      Size = 3
    end
    object cdsHistorico2HIS_ATUAL: TFMTBCDField
      FieldName = 'HIS_ATUAL'
      Precision = 18
      Size = 3
    end
    object cdsHistorico2HIS_MOTIVO: TIntegerField
      FieldName = 'HIS_MOTIVO'
    end
    object cdsHistorico2HIS_USUARIO: TIntegerField
      FieldName = 'HIS_USUARIO'
    end
  end
  object dstInvertario: TSQLDataSet
    CommandText = 
      'select E.EST_CDLOJA, E.EST_CDPROD, E.EST_NRLOTE, P.PRO_MEDICAMEN' +
      'TO, E.EST_QUANTIDADE, P.pro_unidade_medida, P.pro_antimicrobiano' +
      's from ESTOQUE E'#13#10'left join PRODUTOS P ON E.EST_CDPROD = P.PRO_R' +
      'G_MS_MEDICAMENTO'#13#10'Where (E.EST_CDLOJA = :pLOJA) '#13#10'and (E.EST_QUA' +
      'NTIDADE > 0)'#13#10'ORDER BY P.PRO_MEDICAMENTO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'pLOJA'
        ParamType = ptInput
      end>
    SQLConnection = sqlSNGPN
    Left = 720
    Top = 200
  end
  object dspInvertario: TDataSetProvider
    DataSet = dstInvertario
    Options = [poAllowCommandText]
    Left = 720
    Top = 256
  end
  object cdsInvertario: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'pLOJA'
        ParamType = ptInput
      end>
    ProviderName = 'dspInvertario'
    Left = 720
    Top = 304
    object cdsInvertarioEST_CDLOJA: TIntegerField
      FieldName = 'EST_CDLOJA'
      Required = True
    end
    object cdsInvertarioEST_CDPROD: TStringField
      FieldName = 'EST_CDPROD'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsInvertarioEST_NRLOTE: TStringField
      FieldName = 'EST_NRLOTE'
      Required = True
      Size = 10
    end
    object cdsInvertarioPRO_MEDICAMENTO: TStringField
      FieldName = 'PRO_MEDICAMENTO'
      Size = 50
    end
    object cdsInvertarioEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object cdsInvertarioPRO_UNIDADE_MEDIDA: TStringField
      FieldName = 'PRO_UNIDADE_MEDIDA'
      FixedChar = True
      Size = 1
    end
    object cdsInvertarioPRO_ANTIMICROBIANOS: TStringField
      FieldName = 'PRO_ANTIMICROBIANOS'
      FixedChar = True
      Size = 1
    end
  end
  object dstListas: TSQLDataSet
    CommandText = 
      'Select TR.id_tiporeceituario, TR.descricao from tipousoreceituar' +
      'io TR'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlSNGPN
    Left = 752
    Top = 360
  end
  object dspListas: TDataSetProvider
    DataSet = dstListas
    Options = [poAllowCommandText]
    Left = 752
    Top = 416
  end
  object cdsListaTipoDocumentos: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select TD.id_documento, TD.descricao from TIPO_DOCUMENTO TD ORDE' +
      'R BY TD.descricao;'
    Params = <>
    ProviderName = 'dspListas'
    Left = 680
    Top = 440
    object cdsListaTipoDocumentosID_DOCUMENTO: TIntegerField
      FieldName = 'ID_DOCUMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsListaTipoDocumentosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object cdsListaOrgaos: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select O.id_orgao, O.descricao from orgao_expedidor O ORDER BY O' +
      '.descricao;'
    Params = <>
    ProviderName = 'dspListas'
    Left = 760
    Top = 472
    object cdsListaOrgaosID_ORGAO: TIntegerField
      FieldName = 'ID_ORGAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsListaOrgaosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object cdsListaConselho: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select C.id_conselho, C.descricao From conselhoprofissional C OR' +
      'DER BY C.descricao'
    Params = <>
    ProviderName = 'dspListas'
    Left = 736
    Top = 520
    object cdsListaConselhoID_CONSELHO: TIntegerField
      FieldName = 'ID_CONSELHO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsListaConselhoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object dstEstoqueHistorico: TSQLDataSet
    CommandText = 
      'Select  EH.* From ESTOQUE EH'#13#10'Where (EH.EST_CDLOJA = :pCDLOJA) a' +
      'nd (EH.EST_CDPROD = :pCDPROD) and (EH.EST_NRLOTE = :pNRLOTE)'#13#10'OR' +
      'DER BY EH.est_dtvencimento, EH.EST_NRLOTE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCDLOJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pCDPROD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pNRLOTE'
        ParamType = ptInput
      end>
    SQLConnection = sqlSNGPN
    Left = 560
    Top = 64
    object dstEstoqueHistoricoEST_CDLOJA: TIntegerField
      FieldName = 'EST_CDLOJA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstEstoqueHistoricoEST_CDPROD: TStringField
      FieldName = 'EST_CDPROD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 13
    end
    object dstEstoqueHistoricoEST_NRLOTE: TStringField
      FieldName = 'EST_NRLOTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object dstEstoqueHistoricoEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstEstoqueHistoricoEST_DTVENCIMENTO: TDateField
      FieldName = 'EST_DTVENCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspEstoqueHistorico: TDataSetProvider
    DataSet = dstEstoqueHistorico
    Options = [poAllowCommandText]
    Left = 568
    Top = 120
  end
  object cdsEstoqueHistorico: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCDLOJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pCDPROD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pNRLOTE'
        ParamType = ptInput
      end>
    ProviderName = 'dspEstoqueHistorico'
    Left = 568
    Top = 168
    object cdsEstoqueHistoricoEST_CDLOJA: TIntegerField
      FieldName = 'EST_CDLOJA'
      Required = True
    end
    object cdsEstoqueHistoricoEST_CDPROD: TStringField
      FieldName = 'EST_CDPROD'
      Required = True
      EditMask = '9.9999.9999.999-9;0;_'
      Size = 13
    end
    object cdsEstoqueHistoricoEST_NRLOTE: TStringField
      FieldName = 'EST_NRLOTE'
      Required = True
      Size = 10
    end
    object cdsEstoqueHistoricoEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object cdsEstoqueHistoricoEST_DTVENCIMENTO: TDateField
      FieldName = 'EST_DTVENCIMENTO'
      EditMask = '99/99/9999;1;_'
    end
  end
  object cdsListaEstoque: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select EH.est_cdloja, EH.EST_CDPROD, P.PRO_MEDICAMENTO, P.PRO_UN' +
      'IDADE_MEDIDA, P.PRO_ANTIMICROBIANOS, EH.EST_NRLOTE, EH.EST_QUANT' +
      'IDADE, EH.EST_DTVENCIMENTO From ESTOQUE EH Left join produtos p ' +
      'on eh.est_cdprod = p.pro_rg_ms_medicamento where (EH.est_cdloja ' +
      '= :pCDLOJA) ORDER BY P.PRO_MEDICAMENTO, EH.EST_NRLOTE'
    Params = <
      item
        DataType = ftInteger
        Name = 'pCDLOJA'
        ParamType = ptInput
      end>
    ProviderName = 'dspListas'
    OnCalcFields = cdsListaEstoqueCalcFields
    Left = 640
    Top = 240
    object cdsListaEstoqueEST_CDLOJA: TIntegerField
      FieldName = 'EST_CDLOJA'
      Required = True
    end
    object cdsListaEstoqueEST_CDPROD: TStringField
      FieldName = 'EST_CDPROD'
      Required = True
      EditMask = '9.9999.9999.999-9;0;_'
      Size = 13
    end
    object cdsListaEstoquePRO_MEDICAMENTO: TStringField
      FieldName = 'PRO_MEDICAMENTO'
      Size = 50
    end
    object cdsListaEstoqueEST_NRLOTE: TStringField
      FieldName = 'EST_NRLOTE'
      Required = True
      Size = 10
    end
    object cdsListaEstoqueEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object cdsListaEstoquePRO_DESCRICAO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'PRO_DESCRICAO'
      Size = 50
    end
    object cdsListaEstoqueEST_DTVENCIMENTO: TDateField
      FieldName = 'EST_DTVENCIMENTO'
    end
  end
  object dstEntradaProdutos: TSQLDataSet
    CommandText = 
      'select * FROM ENTRADA_MEDICAMENTOS EM Where (EM.id_entrada = :pI' +
      'D)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pID'
        ParamType = ptInput
      end>
    SQLConnection = sqlSNGPN
    Left = 216
    Top = 456
    object dstEntradaProdutosID_ENTRADA: TIntegerField
      FieldName = 'ID_ENTRADA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstEntradaProdutosID_LOJA: TIntegerField
      FieldName = 'ID_LOJA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstEntradaProdutosNR_NOTAFISCAL: TIntegerField
      FieldName = 'NR_NOTAFISCAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstEntradaProdutosTIPO_OPERACAO_NF: TIntegerField
      FieldName = 'TIPO_OPERACAO_NF'
      ProviderFlags = [pfInUpdate]
    end
    object dstEntradaProdutosCNPJ_ORIGEM: TStringField
      FieldName = 'CNPJ_ORIGEM'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 14
    end
    object dstEntradaProdutosCNPJ_DESTINO: TStringField
      FieldName = 'CNPJ_DESTINO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 14
    end
    object dstEntradaProdutosDATA_RECEBIMENTO: TDateField
      FieldName = 'DATA_RECEBIMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstEntradaProdutosHORA_RECEBIMENTO: TStringField
      FieldName = 'HORA_RECEBIMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dstEntradaProdutosDATA_NOTA: TDateField
      FieldName = 'DATA_NOTA'
      ProviderFlags = [pfInUpdate]
    end
    object dstEntradaProdutosFLINSUMO: TStringField
      FieldName = 'FLINSUMO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstEntradaProdutosSITUACAO: TStringField
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstEntradaProdutosARQUIVO: TStringField
      FieldName = 'ARQUIVO'
      ProviderFlags = [pfInUpdate]
    end
    object dstEntradaProdutosDATA_ARQUIVO: TDateField
      FieldName = 'DATA_ARQUIVO'
      ProviderFlags = [pfInUpdate]
    end
    object dstEntradaProdutosDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object dstEntradaProdutosUSUARIO: TIntegerField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspEntradaProdutos: TDataSetProvider
    DataSet = dstEntradaProdutos
    Options = [poAllowCommandText]
    Left = 312
    Top = 448
  end
  object cdsEntradaProdutos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pID'
        ParamType = ptInput
      end>
    ProviderName = 'dspEntradaProdutos'
    Left = 392
    Top = 464
    object cdsEntradaProdutosID_ENTRADA: TIntegerField
      FieldName = 'ID_ENTRADA'
      Required = True
      DisplayFormat = '0000000000'
    end
    object cdsEntradaProdutosID_LOJA: TIntegerField
      FieldName = 'ID_LOJA'
      Required = True
    end
    object cdsEntradaProdutosNR_NOTAFISCAL: TIntegerField
      FieldName = 'NR_NOTAFISCAL'
      Required = True
    end
    object cdsEntradaProdutosTIPO_OPERACAO_NF: TIntegerField
      FieldName = 'TIPO_OPERACAO_NF'
    end
    object cdsEntradaProdutosCNPJ_ORIGEM: TStringField
      Alignment = taRightJustify
      FieldName = 'CNPJ_ORIGEM'
      Required = True
      EditMask = '99.999.999/9999-99;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsEntradaProdutosCNPJ_DESTINO: TStringField
      Alignment = taRightJustify
      FieldName = 'CNPJ_DESTINO'
      Required = True
      EditMask = '99.999.999/9999-99;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsEntradaProdutosDATA_RECEBIMENTO: TDateField
      Alignment = taRightJustify
      FieldName = 'DATA_RECEBIMENTO'
      Required = True
      EditMask = '99/99/9999;1;_'
    end
    object cdsEntradaProdutosHORA_RECEBIMENTO: TStringField
      FieldName = 'HORA_RECEBIMENTO'
      Size = 8
    end
    object cdsEntradaProdutosDATA_NOTA: TDateField
      Alignment = taRightJustify
      FieldName = 'DATA_NOTA'
      EditMask = '99/99/9999;1;_'
    end
    object cdsEntradaProdutosFLINSUMO: TStringField
      FieldName = 'FLINSUMO'
      FixedChar = True
      Size = 1
    end
    object cdsEntradaProdutosSITUACAO: TStringField
      FieldName = 'SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsEntradaProdutosARQUIVO: TStringField
      FieldName = 'ARQUIVO'
    end
    object cdsEntradaProdutosDATA_ARQUIVO: TDateField
      FieldName = 'DATA_ARQUIVO'
    end
    object cdsEntradaProdutosNOME_LOJA: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_LOJA'
      LookupDataSet = cdsListaEmpresa
      LookupKeyFields = 'EMP_CODIGO'
      LookupResultField = 'EMP_FANTASIA'
      KeyFields = 'ID_LOJA'
      Size = 50
      Lookup = True
    end
    object cdsEntradaProdutosDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
    end
    object cdsEntradaProdutosUSUARIO: TIntegerField
      FieldName = 'USUARIO'
    end
  end
  object cdsListaEmpresa: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select EM.emp_codigo, EM.emp_razao, EM.emp_fantasia FROM empresa' +
      's EM ORDER BY EM.emp_fantasia'
    Params = <>
    ProviderName = 'dspListas'
    Left = 640
    Top = 296
    object cdsListaEmpresaEMP_CODIGO: TIntegerField
      FieldName = 'EMP_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsListaEmpresaEMP_RAZAO: TStringField
      FieldName = 'EMP_RAZAO'
      Size = 50
    end
    object cdsListaEmpresaEMP_FANTASIA: TStringField
      FieldName = 'EMP_FANTASIA'
      Size = 50
    end
  end
  object dstFarmaceutico: TSQLDataSet
    CommandText = 'select * from FARMACEUTICOS where (FAR_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = sqlSNGPN
    Left = 656
    Top = 16
    object dstFarmaceuticoFAR_CODIGO: TIntegerField
      FieldName = 'FAR_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstFarmaceuticoFAR_NOME: TStringField
      FieldName = 'FAR_NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object dstFarmaceuticoFAR_CPF: TStringField
      FieldName = 'FAR_CPF'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 11
    end
    object dstFarmaceuticoFAR_ENDERECO: TStringField
      FieldName = 'FAR_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstFarmaceuticoFAR_NUMERO: TIntegerField
      FieldName = 'FAR_NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object dstFarmaceuticoFAR_CIDADE: TStringField
      FieldName = 'FAR_CIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstFarmaceuticoFAR_UF: TStringField
      FieldName = 'FAR_UF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstFarmaceuticoFAR_BAIRRO: TStringField
      FieldName = 'FAR_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstFarmaceuticoFAR_NOME_MAE: TStringField
      FieldName = 'FAR_NOME_MAE'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object dstFarmaceuticoFAR_CRF: TIntegerField
      FieldName = 'FAR_CRF'
      ProviderFlags = [pfInUpdate]
    end
    object dstFarmaceuticoFAR_DATACADASTRO: TDateField
      FieldName = 'FAR_DATACADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object dstFarmaceuticoFAR_HORACADASTRO: TStringField
      FieldName = 'FAR_HORACADASTRO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstFarmaceuticoFAR_USUARIO: TIntegerField
      FieldName = 'FAR_USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object dstFarmaceuticoFAR_EMPRESA: TIntegerField
      FieldName = 'FAR_EMPRESA'
      ProviderFlags = [pfInUpdate]
    end
    object dstFarmaceuticoEMAIL: TStringField
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object dstFarmaceuticoSENHA: TStringField
      FieldName = 'SENHA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
  end
  object dspFarmaceutico: TDataSetProvider
    DataSet = dstFarmaceutico
    Options = [poAllowCommandText]
    Left = 656
    Top = 64
  end
  object cdsFarmaceutico: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspFarmaceutico'
    Left = 656
    Top = 120
    object cdsFarmaceuticoFAR_CODIGO: TIntegerField
      FieldName = 'FAR_CODIGO'
      Required = True
    end
    object cdsFarmaceuticoFAR_NOME: TStringField
      FieldName = 'FAR_NOME'
      Required = True
      Size = 60
    end
    object cdsFarmaceuticoFAR_CPF: TStringField
      FieldName = 'FAR_CPF'
      Required = True
      EditMask = '999.999.999-99;0;_'
      Size = 11
    end
    object cdsFarmaceuticoFAR_ENDERECO: TStringField
      FieldName = 'FAR_ENDERECO'
      Size = 50
    end
    object cdsFarmaceuticoFAR_NUMERO: TIntegerField
      FieldName = 'FAR_NUMERO'
    end
    object cdsFarmaceuticoFAR_CIDADE: TStringField
      FieldName = 'FAR_CIDADE'
      Size = 40
    end
    object cdsFarmaceuticoFAR_UF: TStringField
      FieldName = 'FAR_UF'
      FixedChar = True
      Size = 2
    end
    object cdsFarmaceuticoFAR_BAIRRO: TStringField
      FieldName = 'FAR_BAIRRO'
      Size = 30
    end
    object cdsFarmaceuticoFAR_NOME_MAE: TStringField
      FieldName = 'FAR_NOME_MAE'
      Size = 60
    end
    object cdsFarmaceuticoFAR_CRF: TIntegerField
      FieldName = 'FAR_CRF'
    end
    object cdsFarmaceuticoFAR_DATACADASTRO: TDateField
      FieldName = 'FAR_DATACADASTRO'
    end
    object cdsFarmaceuticoFAR_HORACADASTRO: TStringField
      FieldName = 'FAR_HORACADASTRO'
      FixedChar = True
      Size = 5
    end
    object cdsFarmaceuticoFAR_USUARIO: TIntegerField
      FieldName = 'FAR_USUARIO'
    end
    object cdsFarmaceuticoFAR_EMPRESA: TIntegerField
      FieldName = 'FAR_EMPRESA'
    end
    object cdsFarmaceuticoFAR_NOME_EMPRESA: TStringField
      FieldKind = fkLookup
      FieldName = 'FAR_NOME_EMPRESA'
      LookupDataSet = cdsListaEmpresa
      LookupKeyFields = 'EMP_CODIGO'
      LookupResultField = 'EMP_FANTASIA'
      KeyFields = 'FAR_EMPRESA'
      Size = 50
      Lookup = True
    end
    object cdsFarmaceuticoEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 80
    end
    object cdsFarmaceuticoSENHA: TStringField
      FieldName = 'SENHA'
      FixedChar = True
      Size = 10
    end
  end
  object cdsListaEstoqueAtual: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end>
    ProviderName = 'dspListaEstoqueAtual'
    Left = 816
    Top = 296
    object cdsListaEstoqueAtualEST_CDLOJA: TIntegerField
      FieldName = 'EST_CDLOJA'
      Required = True
    end
    object cdsListaEstoqueAtualEST_CDPROD: TStringField
      FieldName = 'EST_CDPROD'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsListaEstoqueAtualEST_NRLOTE: TStringField
      FieldName = 'EST_NRLOTE'
      Required = True
      Size = 10
    end
    object cdsListaEstoqueAtualEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object cdsListaEstoqueAtualEST_DTVENCIMENTO: TDateField
      FieldName = 'EST_DTVENCIMENTO'
    end
  end
  object dspListaEstoqueAtual: TDataSetProvider
    DataSet = dstListaEstoqueAtual
    Options = [poAllowCommandText]
    OnGetTableName = dspListaEstoqueAtualGetTableName
    Left = 808
    Top = 248
  end
  object dstListaEstoqueAtual: TSQLDataSet
    CommandText = 
      'select E.EST_CDLOJA, E.EST_CDPROD, E.EST_NRLOTE, E.EST_QUANTIDAD' +
      'E, E.est_dtvencimento from ESTOQUE E Where (E.EST_CDLOJA = :pLOJ' +
      'A) ORDER BY E.EST_CDPROD, E.EST_NRLOTE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end>
    SQLConnection = sqlSNGPN
    Left = 808
    Top = 200
    object dstListaEstoqueAtualEST_CDLOJA: TIntegerField
      FieldName = 'EST_CDLOJA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstListaEstoqueAtualEST_CDPROD: TStringField
      FieldName = 'EST_CDPROD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 13
    end
    object dstListaEstoqueAtualEST_NRLOTE: TStringField
      FieldName = 'EST_NRLOTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object dstListaEstoqueAtualEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstListaEstoqueAtualEST_DTVENCIMENTO: TDateField
      FieldName = 'EST_DTVENCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object cdsFecharInvertario: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select E.EST_CDLOJA, E.EST_CDPROD, E.EST_NRLOTE, E.EST_QUANTIDAD' +
      'E, E.est_dtvencimento from ESTOQUE E Where (E.EST_CDLOJA = :pLOJ' +
      'A)  ORDER BY E.EST_CDPROD, E.EST_NRLOTE'
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end>
    ProviderName = 'dspListas'
    Left = 640
    Top = 368
    object cdsFecharInvertarioEST_CDLOJA: TIntegerField
      FieldName = 'EST_CDLOJA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFecharInvertarioEST_CDPROD: TStringField
      FieldName = 'EST_CDPROD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 13
    end
    object cdsFecharInvertarioEST_NRLOTE: TStringField
      FieldName = 'EST_NRLOTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object cdsFecharInvertarioEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object cdsFecharInvertarioEST_DTVENCIMENTO: TDateField
      FieldName = 'EST_DTVENCIMENTO'
    end
  end
  object dstMovimento: TSQLDataSet
    CommandText = 'select * from MOVIMENTOS Where (MOV_NUMERO = :pNUMERO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pNUMERO'
        ParamType = ptInput
      end>
    SQLConnection = sqlSNGPN
    Left = 816
    Top = 352
    object dstMovimentoMOV_NUMERO: TIntegerField
      FieldName = 'MOV_NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstMovimentoMOV_LOJA: TIntegerField
      FieldName = 'MOV_LOJA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstMovimentoMOV_DATA: TDateField
      FieldName = 'MOV_DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstMovimentoMOV_DTABERTURA: TDateField
      FieldName = 'MOV_DTABERTURA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstMovimentoMOV_DTFECHAMENTO: TDateField
      FieldName = 'MOV_DTFECHAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoMOV_HOABERTURA: TStringField
      FieldName = 'MOV_HOABERTURA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstMovimentoMOV_HOFECHAMENTO: TStringField
      FieldName = 'MOV_HOFECHAMENTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstMovimentoMOV_RGINICIAL: TIntegerField
      FieldName = 'MOV_RGINICIAL'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoMOV_RGFINAL: TIntegerField
      FieldName = 'MOV_RGFINAL'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoMOV_USUARIO: TIntegerField
      FieldName = 'MOV_USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object dstMovimentoMOV_SITUACAO: TStringField
      FieldName = 'MOV_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstMovimentoMOV_USUARIO_FECHOU: TIntegerField
      FieldName = 'MOV_USUARIO_FECHOU'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspMovimento: TDataSetProvider
    DataSet = dstMovimento
    Options = [poAllowCommandText]
    OnGetTableName = dspMovimentoGetTableName
    Left = 824
    Top = 400
  end
  object cdsMovimento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pNUMERO'
        ParamType = ptInput
      end>
    ProviderName = 'dspMovimento'
    Left = 824
    Top = 448
    object cdsMovimentoMOV_NUMERO: TIntegerField
      FieldName = 'MOV_NUMERO'
      Required = True
    end
    object cdsMovimentoMOV_LOJA: TIntegerField
      FieldName = 'MOV_LOJA'
      Required = True
    end
    object cdsMovimentoMOV_DATA: TDateField
      FieldName = 'MOV_DATA'
      Required = True
    end
    object cdsMovimentoMOV_DTABERTURA: TDateField
      FieldName = 'MOV_DTABERTURA'
      Required = True
    end
    object cdsMovimentoMOV_DTFECHAMENTO: TDateField
      FieldName = 'MOV_DTFECHAMENTO'
    end
    object cdsMovimentoMOV_HOABERTURA: TStringField
      FieldName = 'MOV_HOABERTURA'
      FixedChar = True
      Size = 5
    end
    object cdsMovimentoMOV_HOFECHAMENTO: TStringField
      FieldName = 'MOV_HOFECHAMENTO'
      FixedChar = True
      Size = 5
    end
    object cdsMovimentoMOV_RGINICIAL: TIntegerField
      FieldName = 'MOV_RGINICIAL'
    end
    object cdsMovimentoMOV_RGFINAL: TIntegerField
      FieldName = 'MOV_RGFINAL'
    end
    object cdsMovimentoMOV_USUARIO: TIntegerField
      FieldName = 'MOV_USUARIO'
    end
    object cdsMovimentoMOV_USUARIO_FECHOU: TIntegerField
      FieldName = 'MOV_USUARIO_FECHOU'
    end
    object cdsMovimentoMOV_SITUACAO: TStringField
      FieldName = 'MOV_SITUACAO'
      FixedChar = True
      Size = 1
    end
  end
  object dstHisEstoque: TSQLDataSet
    CommandText = 
      'select E.* from estoque_historico E Where (E.EST_CDLOJA = :pLOJA' +
      ') AND (E.est_dtmovimento = :pDATA);'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDATA'
        ParamType = ptInput
      end>
    SQLConnection = sqlSNGPN
    Left = 808
    Top = 24
    object dstHisEstoqueEST_SEQUENCIA: TIntegerField
      FieldName = 'EST_SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dstHisEstoqueEST_CDLOJA: TIntegerField
      FieldName = 'EST_CDLOJA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstHisEstoqueEST_CDPROD: TStringField
      FieldName = 'EST_CDPROD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 13
    end
    object dstHisEstoqueEST_NRLOTE: TStringField
      FieldName = 'EST_NRLOTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object dstHisEstoqueEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstHisEstoqueEST_DTVENCIMENTO: TDateField
      FieldName = 'EST_DTVENCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstHisEstoqueEST_DTMOVIMENTO: TDateField
      FieldName = 'EST_DTMOVIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstHisEstoqueEST_HOMOVIMENTO: TStringField
      FieldName = 'EST_HOMOVIMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dstHisEstoqueEST_USUARIO: TIntegerField
      FieldName = 'EST_USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object dstHisEstoqueEST_SITUACAO: TStringField
      FieldName = 'EST_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstHisEstoqueEST_QTENTRADA: TFMTBCDField
      FieldName = 'EST_QTENTRADA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstHisEstoqueEST_QTSAIDA: TFMTBCDField
      FieldName = 'EST_QTSAIDA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstHisEstoqueEST_PERDA: TFMTBCDField
      FieldName = 'EST_PERDA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstHisEstoqueEST_QTTRANSFERENCIA: TFMTBCDField
      FieldName = 'EST_QTTRANSFERENCIA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
  end
  object dspHisEstoque: TDataSetProvider
    DataSet = dstHisEstoque
    Options = [poAllowCommandText]
    OnGetTableName = dspHisEstoqueGetTableName
    Left = 808
    Top = 80
  end
  object cdsHisEstoque: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pLOJA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDATA'
        ParamType = ptInput
      end>
    ProviderName = 'dspHisEstoque'
    Left = 808
    Top = 136
    object cdsHisEstoqueEST_SEQUENCIA: TIntegerField
      FieldName = 'EST_SEQUENCIA'
    end
    object cdsHisEstoqueEST_CDLOJA: TIntegerField
      FieldName = 'EST_CDLOJA'
      Required = True
    end
    object cdsHisEstoqueEST_CDPROD: TStringField
      FieldName = 'EST_CDPROD'
      Required = True
      EditMask = '9.9999.9999.999-9;0;_'
      Size = 13
    end
    object cdsHisEstoqueEST_NRLOTE: TStringField
      FieldName = 'EST_NRLOTE'
      Required = True
      Size = 10
    end
    object cdsHisEstoqueEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object cdsHisEstoqueEST_DTVENCIMENTO: TDateField
      FieldName = 'EST_DTVENCIMENTO'
    end
    object cdsHisEstoqueEST_DTMOVIMENTO: TDateField
      FieldName = 'EST_DTMOVIMENTO'
    end
    object cdsHisEstoqueEST_HOMOVIMENTO: TStringField
      FieldName = 'EST_HOMOVIMENTO'
      Size = 8
    end
    object cdsHisEstoqueEST_QTENTRADA: TFMTBCDField
      FieldName = 'EST_QTENTRADA'
      Precision = 18
      Size = 3
    end
    object cdsHisEstoqueEST_QTTRANSFERENCIA: TFMTBCDField
      FieldName = 'EST_QTTRANSFERENCIA'
      Precision = 18
      Size = 3
    end
    object cdsHisEstoqueEST_QTSAIDA: TFMTBCDField
      FieldName = 'EST_QTSAIDA'
      Precision = 18
      Size = 3
    end
    object cdsHisEstoqueEST_PERDA: TFMTBCDField
      FieldName = 'EST_PERDA'
      Precision = 18
      Size = 3
    end
    object cdsHisEstoqueEST_SITUACAO: TStringField
      FieldName = 'EST_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsHisEstoqueEST_USUARIO: TIntegerField
      FieldName = 'EST_USUARIO'
    end
  end
  object dstItensEntrada: TSQLDataSet
    CommandText = 'select * from MEDICAMENTO_ENTRADA where (ID_ENTRADA = :pID)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pID'
        ParamType = ptInput
      end>
    SQLConnection = sqlSNGPN
    Left = 888
    Top = 32
    object dstItensEntradaID_ENTRADA: TIntegerField
      FieldName = 'ID_ENTRADA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstItensEntradaREGISTRO_MS: TStringField
      FieldName = 'REGISTRO_MS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 13
    end
    object dstItensEntradaNUMERO_LOTE: TStringField
      FieldName = 'NUMERO_LOTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 10
    end
    object dstItensEntradaQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 3
    end
    object dstItensEntradaFLUXO_INSUMO: TStringField
      FieldName = 'FLUXO_INSUMO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstItensEntradaUND_ENTRADA: TStringField
      FieldName = 'UND_ENTRADA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstItensEntradaCNPJ_FORNECEDOR: TStringField
      FieldName = 'CNPJ_FORNECEDOR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 14
    end
    object dstItensEntradaDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspItensEntrada: TDataSetProvider
    DataSet = dstItensEntrada
    Options = [poAllowCommandText]
    OnGetTableName = dspItensEntradaGetTableName
    Left = 896
    Top = 80
  end
  object cdsItensEntrada: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pID'
        ParamType = ptInput
      end>
    ProviderName = 'dspItensEntrada'
    Left = 896
    Top = 136
    object cdsItensEntradaID_ENTRADA: TIntegerField
      FieldName = 'ID_ENTRADA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItensEntradaREGISTRO_MS: TStringField
      FieldName = 'REGISTRO_MS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsItensEntradaNUMERO_LOTE: TStringField
      FieldName = 'NUMERO_LOTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsItensEntradaQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 3
    end
    object cdsItensEntradaFLUXO_INSUMO: TStringField
      FieldName = 'FLUXO_INSUMO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsItensEntradaUND_ENTRADA: TStringField
      FieldName = 'UND_ENTRADA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsItensEntradaCNPJ_FORNECEDOR: TStringField
      FieldName = 'CNPJ_FORNECEDOR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 14
    end
    object cdsItensEntradaDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object cdsListaUsoMedicamento: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select TM.id_tipomedicamento, TM.descricao from TIPOUSOMEDICAMEN' +
      'TO TM'
    Params = <>
    ProviderName = 'dspListas'
    Left = 912
    Top = 184
    object cdsListaUsoMedicamentoID_TIPOMEDICAMENTO: TIntegerField
      FieldName = 'ID_TIPOMEDICAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsListaUsoMedicamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object cdsListaUsoReceituario: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select TR.id_tiporeceituario, TR.descricao from tipousoreceituar' +
      'io TR'
    Params = <>
    ProviderName = 'dspListas'
    Left = 896
    Top = 232
    object cdsListaUsoReceituarioID_TIPORECEITUARIO: TIntegerField
      FieldName = 'ID_TIPORECEITUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsListaUsoReceituarioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object cdsListaTipoDocumento: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select TD.id_documento, TD.descricao from TIPO_DOCUMENTO TD ORDE' +
      'R BY TD.id_documento'
    Params = <>
    ProviderName = 'dspListas'
    Left = 904
    Top = 320
    object cdsListaTipoDocumentoID_DOCUMENTO: TIntegerField
      FieldName = 'ID_DOCUMENTO'
      Required = True
    end
    object cdsListaTipoDocumentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object dstItensVendas: TSQLDataSet
    CommandText = 'select * from VENDAS_MEDICAMENTOS Where (ID_VENDA = :pVENDA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pVENDA'
        ParamType = ptInput
      end>
    SQLConnection = sqlSNGPN
    Left = 904
    Top = 368
    object dstItensVendasID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstItensVendasREGISTRO_MS: TStringField
      FieldName = 'REGISTRO_MS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 13
    end
    object dstItensVendasNUMERO_LOTE: TStringField
      FieldName = 'NUMERO_LOTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 10
    end
    object dstItensVendasQUANT_MEDICAMENTO: TBCDField
      FieldName = 'QUANT_MEDICAMENTO'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 3
    end
    object dstItensVendasFLUXO_INSUMO: TStringField
      FieldName = 'FLUXO_INSUMO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstItensVendasUND_MEDIDA_INSUMO: TIntegerField
      FieldName = 'UND_MEDIDA_INSUMO'
      ProviderFlags = [pfInUpdate]
    end
    object dstItensVendasUND_FARMACO_TECNICA: TIntegerField
      FieldName = 'UND_FARMACO_TECNICA'
      ProviderFlags = [pfInUpdate]
    end
    object dstItensVendasUSO_PROLONGADO: TStringField
      FieldName = 'USO_PROLONGADO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object dspItensVendas: TDataSetProvider
    DataSet = dstItensVendas
    Options = [poAllowCommandText]
    OnGetTableName = dspItensVendasGetTableName
    Left = 904
    Top = 416
  end
  object cdsItensVendas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pVENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspItensVendas'
    Left = 904
    Top = 464
    object cdsItensVendasID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      Required = True
    end
    object cdsItensVendasREGISTRO_MS: TStringField
      FieldName = 'REGISTRO_MS'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsItensVendasNUMERO_LOTE: TStringField
      FieldName = 'NUMERO_LOTE'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsItensVendasQUANT_MEDICAMENTO: TBCDField
      FieldName = 'QUANT_MEDICAMENTO'
      Precision = 9
      Size = 3
    end
    object cdsItensVendasFLUXO_INSUMO: TStringField
      FieldName = 'FLUXO_INSUMO'
      FixedChar = True
      Size = 1
    end
    object cdsItensVendasUND_MEDIDA_INSUMO: TIntegerField
      FieldName = 'UND_MEDIDA_INSUMO'
    end
    object cdsItensVendasUND_FARMACO_TECNICA: TIntegerField
      FieldName = 'UND_FARMACO_TECNICA'
    end
    object cdsItensVendasUSO_PROLONGADO: TStringField
      FieldName = 'USO_PROLONGADO'
      FixedChar = True
      Size = 1
    end
  end
  object dstPerda: TSQLDataSet
    CommandText = 'select * from PERDAS Where (ID_PERDA = :ID_PERDA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PERDA'
        ParamType = ptInput
      end>
    SQLConnection = sqlSNGPN
    Left = 824
    Top = 496
    object dstPerdaID_PERDA: TIntegerField
      FieldName = 'ID_PERDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstPerdaID_LOJA: TIntegerField
      FieldName = 'ID_LOJA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstPerdaMOTIVO_PERDA: TIntegerField
      FieldName = 'MOTIVO_PERDA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstPerdaDATA_PERDA: TDateField
      FieldName = 'DATA_PERDA'
      ProviderFlags = [pfInUpdate]
    end
    object dstPerdaFLUXO_INSUMO: TStringField
      FieldName = 'FLUXO_INSUMO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstPerdaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstPerdaARQUIVO: TStringField
      FieldName = 'ARQUIVO'
      ProviderFlags = [pfInUpdate]
    end
    object dstPerdaDATA_ARQUIVO: TDateField
      FieldName = 'DATA_ARQUIVO'
      ProviderFlags = [pfInUpdate]
    end
    object dstPerdaDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object dstPerdaUSUARIO: TIntegerField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspPerda: TDataSetProvider
    DataSet = dstPerda
    Options = [poAllowCommandText]
    OnGetTableName = dspPerdaGetTableName
    Left = 864
    Top = 536
  end
  object cdsPerda: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PERDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspPerda'
    Left = 920
    Top = 512
    object cdsPerdaID_PERDA: TIntegerField
      FieldName = 'ID_PERDA'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsPerdaID_LOJA: TIntegerField
      FieldName = 'ID_LOJA'
      Required = True
    end
    object cdsPerdaMOTIVO_PERDA: TIntegerField
      FieldName = 'MOTIVO_PERDA'
      Required = True
    end
    object cdsPerdaDATA_PERDA: TDateField
      FieldName = 'DATA_PERDA'
    end
    object cdsPerdaFLUXO_INSUMO: TStringField
      FieldName = 'FLUXO_INSUMO'
      FixedChar = True
      Size = 1
    end
    object cdsPerdaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsPerdaARQUIVO: TStringField
      FieldName = 'ARQUIVO'
    end
    object cdsPerdaDATA_ARQUIVO: TDateField
      FieldName = 'DATA_ARQUIVO'
    end
    object cdsPerdaDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
    end
    object cdsPerdaUSUARIO: TIntegerField
      FieldName = 'USUARIO'
    end
    object cdsPerdaNOME_LOJA: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_LOJA'
      LookupDataSet = cdsListaEmpresa
      LookupKeyFields = 'EMP_CODIGO'
      LookupResultField = 'EMP_FANTASIA'
      KeyFields = 'ID_LOJA'
      Size = 50
      Lookup = True
    end
    object cdsPerdaDESCRICAO_MOTIVO_PERDA: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO_MOTIVO_PERDA'
      LookupDataSet = cdsListaMotivoPerda
      LookupKeyFields = 'ID_MOTIVOPERDA'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'MOTIVO_PERDA'
      Size = 60
      Lookup = True
    end
  end
  object cdsListaMotivoPerda: TClientDataSet
    Aggregates = <>
    CommandText = 'Select ID_MOTIVOPERDA, DESCRICAO from TIPOMOTIVOPERDA'
    Params = <>
    ProviderName = 'dspListas'
    Left = 648
    Top = 184
    object cdsListaMotivoPerdaID_MOTIVOPERDA: TIntegerField
      FieldName = 'ID_MOTIVOPERDA'
      Required = True
    end
    object cdsListaMotivoPerdaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 60
    end
  end
  object dstPerdaItens: TSQLDataSet
    CommandText = 'Select * from PERDAS_MEDICAMENTOS Where (ID_PERDA = :pID)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pID'
        ParamType = ptInput
      end>
    SQLConnection = sqlSNGPN
    Left = 976
    Top = 400
    object dstPerdaItensID_PERDA: TIntegerField
      FieldName = 'ID_PERDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstPerdaItensREGISTRO_MS: TStringField
      FieldName = 'REGISTRO_MS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 13
    end
    object dstPerdaItensNUMERO_LOTE: TStringField
      FieldName = 'NUMERO_LOTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 10
    end
    object dstPerdaItensQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 8
    end
    object dstPerdaItensFLUXO_INSUMO: TStringField
      FieldName = 'FLUXO_INSUMO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstPerdaItensUND_PERDA: TStringField
      FieldName = 'UND_PERDA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstPerdaItensCNPJ_FORNECEDOR: TStringField
      FieldName = 'CNPJ_FORNECEDOR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 14
    end
  end
  object dspPerdaItens: TDataSetProvider
    DataSet = dstPerdaItens
    Options = [poAllowCommandText]
    Left = 968
    Top = 448
  end
  object cdsPerdaItens: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pID'
        ParamType = ptInput
      end>
    ProviderName = 'dspPerdaItens'
    Left = 976
    Top = 496
    object cdsPerdaItensID_PERDA: TIntegerField
      FieldName = 'ID_PERDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPerdaItensREGISTRO_MS: TStringField
      FieldName = 'REGISTRO_MS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsPerdaItensNUMERO_LOTE: TStringField
      FieldName = 'NUMERO_LOTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsPerdaItensQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 8
    end
    object cdsPerdaItensFLUXO_INSUMO: TStringField
      FieldName = 'FLUXO_INSUMO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsPerdaItensUND_PERDA: TStringField
      FieldName = 'UND_PERDA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsPerdaItensCNPJ_FORNECEDOR: TStringField
      FieldName = 'CNPJ_FORNECEDOR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 14
    end
  end
  object dstArquivoHast: TSQLDataSet
    CommandText = 'select * from ARQUIVO_GERADO Where (ARQ_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = sqlSNGPN
    Left = 960
    Top = 16
    object dstArquivoHastARQ_CODIGO: TIntegerField
      FieldName = 'ARQ_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstArquivoHastDATA_GERACAO: TDateField
      FieldName = 'DATA_GERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstArquivoHastHORA_GERACAO: TStringField
      FieldName = 'HORA_GERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 8
    end
    object dstArquivoHastUSUARIO: TIntegerField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object dstArquivoHastDATA_INICIAL: TDateField
      FieldName = 'DATA_INICIAL'
      ProviderFlags = [pfInUpdate]
    end
    object dstArquivoHastDATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
      ProviderFlags = [pfInUpdate]
    end
    object dstArquivoHastHASH_MD5: TStringField
      FieldName = 'HASH_MD5'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstArquivoHastNOME_ARQUIVO: TStringField
      FieldName = 'NOME_ARQUIVO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
  end
  object dspArquivoHast: TDataSetProvider
    DataSet = dstArquivoHast
    Options = [poAllowCommandText]
    Left = 968
    Top = 72
  end
  object cdsArquivoHast: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspArquivoHast'
    Left = 968
    Top = 120
    object cdsArquivoHastARQ_CODIGO: TIntegerField
      FieldName = 'ARQ_CODIGO'
      Required = True
    end
    object cdsArquivoHastDATA_GERACAO: TDateField
      FieldName = 'DATA_GERACAO'
      Required = True
    end
    object cdsArquivoHastHORA_GERACAO: TStringField
      FieldName = 'HORA_GERACAO'
      Required = True
      FixedChar = True
      Size = 8
    end
    object cdsArquivoHastUSUARIO: TIntegerField
      FieldName = 'USUARIO'
    end
    object cdsArquivoHastDATA_INICIAL: TDateField
      FieldName = 'DATA_INICIAL'
    end
    object cdsArquivoHastDATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
    end
    object cdsArquivoHastHASH_MD5: TStringField
      FieldName = 'HASH_MD5'
      Size = 40
    end
    object cdsArquivoHastNOME_ARQUIVO: TStringField
      FieldName = 'NOME_ARQUIVO'
      Size = 50
    end
  end
  object dstRetornaEstoque: TSQLDataSet
    CommandText = 
      'select EST_CDLOJA, EST_CDPROD, EST_NRLOTE, EST_QUANTIDADE, EST_D' +
      'TVENCIMENTO from ESTOQUE'#13#10'Where (EST_CDLOJA = :pCDLOJA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCDLOJA'
        ParamType = ptInput
      end>
    SQLConnection = sqlSNGPN
    Left = 1000
    Top = 240
    object dstRetornaEstoqueEST_CDLOJA: TIntegerField
      FieldName = 'EST_CDLOJA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstRetornaEstoqueEST_CDPROD: TStringField
      FieldName = 'EST_CDPROD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 13
    end
    object dstRetornaEstoqueEST_NRLOTE: TStringField
      FieldName = 'EST_NRLOTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object dstRetornaEstoqueEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstRetornaEstoqueEST_DTVENCIMENTO: TDateField
      FieldName = 'EST_DTVENCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspRetornaEstoque: TDataSetProvider
    DataSet = dstRetornaEstoque
    Options = [poAllowCommandText]
    OnGetTableName = dspRetornaEstoqueGetTableName
    Left = 1000
    Top = 288
  end
  object cdsRetornaEstoque: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCDLOJA'
        ParamType = ptInput
      end>
    ProviderName = 'dspRetornaEstoque'
    Left = 1000
    Top = 344
    object cdsRetornaEstoqueEST_CDLOJA: TIntegerField
      FieldName = 'EST_CDLOJA'
      Required = True
    end
    object cdsRetornaEstoqueEST_CDPROD: TStringField
      FieldName = 'EST_CDPROD'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsRetornaEstoqueEST_NRLOTE: TStringField
      FieldName = 'EST_NRLOTE'
      Required = True
      Size = 10
    end
    object cdsRetornaEstoqueEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object cdsRetornaEstoqueEST_DTVENCIMENTO: TDateField
      FieldName = 'EST_DTVENCIMENTO'
    end
  end
  object dstTransferencia: TSQLDataSet
    CommandText = 
      'select * from TRANSFERENCIA Where (ID_TRANSFERENCIA = :pTRANSFER' +
      'ENCIA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pTRANSFERENCIA'
        ParamType = ptInput
      end>
    SQLConnection = sqlSNGPN
    Left = 40
    Top = 560
    object dstTransferenciaID_TRANSFERENCIA: TIntegerField
      FieldName = 'ID_TRANSFERENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstTransferenciaID_LOJA: TIntegerField
      FieldName = 'ID_LOJA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstTransferenciaNR_NOTAFISCAL: TIntegerField
      FieldName = 'NR_NOTAFISCAL'
      ProviderFlags = [pfInUpdate]
    end
    object dstTransferenciaTIPO_OPERACAO: TIntegerField
      FieldName = 'TIPO_OPERACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstTransferenciaDATA_NOTA: TDateField
      FieldName = 'DATA_NOTA'
      ProviderFlags = [pfInUpdate]
    end
    object dstTransferenciaCNPJ_ORIGEM: TStringField
      FieldName = 'CNPJ_ORIGEM'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dstTransferenciaCNPJ_DESTINO: TStringField
      FieldName = 'CNPJ_DESTINO'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dstTransferenciaDATA_TRANSFERENCIA: TDateField
      FieldName = 'DATA_TRANSFERENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object dstTransferenciaFLUXO_INSUMO: TStringField
      FieldName = 'FLUXO_INSUMO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstTransferenciaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstTransferenciaARQUIVO: TStringField
      FieldName = 'ARQUIVO'
      ProviderFlags = [pfInUpdate]
    end
    object dstTransferenciaDATA_ARQUIVO: TDateField
      FieldName = 'DATA_ARQUIVO'
      ProviderFlags = [pfInUpdate]
    end
    object dstTransferenciaDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object dstTransferenciaUSUARIO: TIntegerField
      FieldName = 'USUARIO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspTransferencia: TDataSetProvider
    DataSet = dstTransferencia
    Options = [poAllowCommandText]
    OnGetTableName = dspTransferenciaGetTableName
    Left = 120
    Top = 552
  end
  object cdsTransferencia: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pTRANSFERENCIA'
        ParamType = ptInput
      end>
    ProviderName = 'dspTransferencia'
    Left = 184
    Top = 568
    object cdsTransferenciaID_TRANSFERENCIA: TIntegerField
      FieldName = 'ID_TRANSFERENCIA'
      Required = True
      DisplayFormat = '000000000'
    end
    object cdsTransferenciaID_LOJA: TIntegerField
      FieldName = 'ID_LOJA'
      Required = True
    end
    object cdsTransferenciaNR_NOTAFISCAL: TIntegerField
      FieldName = 'NR_NOTAFISCAL'
    end
    object cdsTransferenciaTIPO_OPERACAO: TIntegerField
      FieldName = 'TIPO_OPERACAO'
      Required = True
    end
    object cdsTransferenciaDATA_NOTA: TDateField
      FieldName = 'DATA_NOTA'
    end
    object cdsTransferenciaCNPJ_ORIGEM: TStringField
      FieldName = 'CNPJ_ORIGEM'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object cdsTransferenciaCNPJ_DESTINO: TStringField
      FieldName = 'CNPJ_DESTINO'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object cdsTransferenciaDATA_TRANSFERENCIA: TDateField
      FieldName = 'DATA_TRANSFERENCIA'
    end
    object cdsTransferenciaFLUXO_INSUMO: TStringField
      FieldName = 'FLUXO_INSUMO'
      FixedChar = True
      Size = 1
    end
    object cdsTransferenciaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsTransferenciaARQUIVO: TStringField
      FieldName = 'ARQUIVO'
    end
    object cdsTransferenciaDATA_ARQUIVO: TDateField
      FieldName = 'DATA_ARQUIVO'
    end
    object cdsTransferenciaDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
    end
    object cdsTransferenciaUSUARIO: TIntegerField
      FieldName = 'USUARIO'
    end
  end
  object dstItensTransf: TSQLDataSet
    CommandText = 
      'select ID_TRANSFERENCIA, REGISTRO_MS, NUMERO_LOTE, QUANT_MEDICAM' +
      'ENTO, FLUXO_INSUMO, UND_TRANSF, CNPJ_FORNECEDOR from TRANSFERENC' +
      'IA_MEDICAMENTOS'#13#10'Where (ID_TRANSFERENCIA = :pID)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pID'
        ParamType = ptInput
      end>
    SQLConnection = sqlSNGPN
    Left = 288
    Top = 560
    object dstItensTransfID_TRANSFERENCIA: TIntegerField
      FieldName = 'ID_TRANSFERENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstItensTransfREGISTRO_MS: TStringField
      FieldName = 'REGISTRO_MS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 13
    end
    object dstItensTransfNUMERO_LOTE: TStringField
      FieldName = 'NUMERO_LOTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object dstItensTransfQUANT_MEDICAMENTO: TBCDField
      FieldName = 'QUANT_MEDICAMENTO'
      ProviderFlags = [pfInUpdate]
      Precision = 9
      Size = 3
    end
    object dstItensTransfFLUXO_INSUMO: TStringField
      FieldName = 'FLUXO_INSUMO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstItensTransfUND_TRANSF: TStringField
      FieldName = 'UND_TRANSF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstItensTransfCNPJ_FORNECEDOR: TStringField
      FieldName = 'CNPJ_FORNECEDOR'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 14
    end
  end
  object dspItensTransf: TDataSetProvider
    DataSet = dstItensTransf
    Options = [poAllowCommandText]
    OnGetTableName = dspItensTransfGetTableName
    Left = 368
    Top = 560
  end
  object cdsItensTransf: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pID'
        ParamType = ptInput
      end>
    ProviderName = 'dspItensTransf'
    Left = 448
    Top = 560
    object cdsItensTransfID_TRANSFERENCIA: TIntegerField
      FieldName = 'ID_TRANSFERENCIA'
      Required = True
    end
    object cdsItensTransfREGISTRO_MS: TStringField
      FieldName = 'REGISTRO_MS'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsItensTransfNUMERO_LOTE: TStringField
      FieldName = 'NUMERO_LOTE'
      FixedChar = True
      Size = 10
    end
    object cdsItensTransfQUANT_MEDICAMENTO: TBCDField
      FieldName = 'QUANT_MEDICAMENTO'
      Precision = 9
      Size = 3
    end
    object cdsItensTransfFLUXO_INSUMO: TStringField
      FieldName = 'FLUXO_INSUMO'
      FixedChar = True
      Size = 1
    end
    object cdsItensTransfUND_TRANSF: TStringField
      FieldName = 'UND_TRANSF'
      FixedChar = True
      Size = 1
    end
    object cdsItensTransfCNPJ_FORNECEDOR: TStringField
      FieldName = 'CNPJ_FORNECEDOR'
      FixedChar = True
      Size = 14
    end
  end
  object dstImpEstoque: TSQLDataSet
    CommandText = 'select * from ESTOQUE Where (EST_CDLOJA = :pCDLOJA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCDLOJA'
        ParamType = ptInput
      end>
    SQLConnection = sqlSNGPN
    Left = 584
    Top = 560
    object dstImpEstoqueEST_CDLOJA: TIntegerField
      FieldName = 'EST_CDLOJA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstImpEstoqueEST_CDPROD: TStringField
      FieldName = 'EST_CDPROD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 13
    end
    object dstImpEstoqueEST_NRLOTE: TStringField
      FieldName = 'EST_NRLOTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object dstImpEstoqueEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstImpEstoqueEST_DTVENCIMENTO: TDateField
      FieldName = 'EST_DTVENCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspImpEstoque: TDataSetProvider
    DataSet = dstImpEstoque
    Options = [poAllowCommandText]
    Left = 656
    Top = 544
  end
  object cdsImpEstoque: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCDLOJA'
        ParamType = ptInput
      end>
    ProviderName = 'dspImpEstoque'
    Left = 728
    Top = 568
    object cdsImpEstoqueEST_CDLOJA: TIntegerField
      FieldName = 'EST_CDLOJA'
      Required = True
    end
    object cdsImpEstoqueEST_CDPROD: TStringField
      FieldName = 'EST_CDPROD'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsImpEstoqueEST_NRLOTE: TStringField
      FieldName = 'EST_NRLOTE'
      Required = True
      Size = 10
    end
    object cdsImpEstoqueEST_QUANTIDADE: TFMTBCDField
      FieldName = 'EST_QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object cdsImpEstoqueEST_DTVENCIMENTO: TDateField
      FieldName = 'EST_DTVENCIMENTO'
    end
  end
end
