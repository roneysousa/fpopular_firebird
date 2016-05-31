object dmGerenciador: TdmGerenciador
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 238
  Top = 129
  Height = 565
  Width = 848
  object sqlConnGerenciador: TSQLConnection
    ConnectionName = 'GERENCIADOR'
    DriverName = 'UIB FireBird15'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpUIBfire15.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=UIB FireBird15'
      'BlobSize=-1'
      'CommitRetain=False'
      'Database=D:\Sistemas\Gereciador\Dados\INFOGERENCIADOR.FDB'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet=WIN1252'
      'SQLDialect=3'
      'Interbase TransIsolation=ReadCommited'
      'User_Name=SYSDBA'
      'WaitOnLocks=True')
    VendorLib = 'C:\INFOG2\fbclient.dll'
    BeforeConnect = sqlConnGerenciadorBeforeConnect
    Connected = True
    Left = 40
    Top = 8
  end
  object qryProdutos: TQuery
    DatabaseName = 'GERENCIADOR'
    SQL.Strings = (
      'Select PRO_CDBARR, PRO_NMPROD, PRO_VLVEND, TAB_VLVEND '
      'from "SACPRO.DBF" Where (PRO_CDBARR = :pBARRAS)')
    Left = 304
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'pBARRAS'
        ParamType = ptInput
        Value = ''
      end>
    object qryProdutosPRO_CDBARR: TStringField
      FieldName = 'PRO_CDBARR'
      Origin = 'GERENCIADOR."SACPRO.DBF".PRO_CDBARR'
      Size = 13
    end
    object qryProdutosPRO_NMPROD: TStringField
      FieldName = 'PRO_NMPROD'
      Origin = 'GERENCIADOR."SACPRO.DBF".PRO_NMPROD'
      Size = 40
    end
    object qryProdutosPRO_VLVEND: TFloatField
      FieldName = 'PRO_VLVEND'
      Origin = 'GERENCIADOR."SACPRO.DBF".PRO_VLVEND'
    end
    object qryProdutosTAB_VLVEND: TFloatField
      FieldName = 'TAB_VLVEND'
      Origin = 'GERENCIADOR."SACPRO.DBF".TAB_VLVEND'
    end
  end
  object dstConfig: TSQLDataSet
    CommandText = 'select * from CONFIGURACAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConnGerenciador
    Left = 40
    Top = 64
    object dstConfigCFG_CNPJ_EMPRESA: TStringField
      FieldName = 'CFG_CNPJ_EMPRESA'
      FixedChar = True
      Size = 14
    end
    object dstConfigCFG_SEQUENCIA: TIntegerField
      FieldName = 'CFG_SEQUENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_UF_EMPRESA: TStringField
      FieldName = 'CFG_UF_EMPRESA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstConfigCFG_LOGIN: TStringField
      FieldName = 'CFG_LOGIN'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dstConfigCFG_SENHA: TStringField
      FieldName = 'CFG_SENHA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dstConfigCFG_USUARIO: TIntegerField
      FieldName = 'CFG_USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_DATATUAL: TDateField
      FieldName = 'CFG_DATATUAL'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFC_IMGLOGO: TBlobField
      FieldName = 'CFC_IMGLOGO'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_FANTASIA: TStringField
      FieldName = 'CFG_FANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstConfigCFG_RAZAO: TStringField
      FieldName = 'CFG_RAZAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstConfigCFG_ENDERECO: TStringField
      FieldName = 'CFG_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstConfigCFG_CIDADE: TStringField
      FieldName = 'CFG_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dstConfigCFG_MENSCUPOM: TStringField
      FieldName = 'CFG_MENSCUPOM'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object dstConfigCFG_CEPEMPRESA: TStringField
      Alignment = taRightJustify
      FieldName = 'CFG_CEPEMPRESA'
      ProviderFlags = [pfInUpdate]
      EditMask = '99999-999;0;_'
      FixedChar = True
      Size = 8
    end
    object dstConfigCFG_FONEEMPRESA: TStringField
      Alignment = taRightJustify
      FieldName = 'CFG_FONEEMPRESA'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99)9999-9999;0;_'
      Size = 10
    end
    object dstConfigCFG_VINCULOFARMA: TStringField
      FieldName = 'CFG_VINCULOFARMA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstConfigCFG_SIMULACAO: TStringField
      FieldName = 'CFG_SIMULACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstConfigCFG_FLPRODUCAO: TStringField
      FieldName = 'CFG_FLPRODUCAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstConfigCFG_VENDEDORES: TIntegerField
      FieldName = 'CFG_VENDEDORES'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dstMedicos: TSQLDataSet
    CommandText = 'select * from MEDICOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConnGerenciador
    Left = 40
    Top = 120
    object dstMedicosMED_CRM: TStringField
      FieldName = 'MED_CRM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 10
    end
    object dstMedicosMED_NOME: TStringField
      FieldName = 'MED_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
  end
  object dstPacientes: TSQLDataSet
    CommandText = 'select * from PACIENTES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConnGerenciador
    Left = 40
    Top = 176
    object dstPacientesPAC_CPF: TStringField
      FieldName = 'PAC_CPF'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 11
    end
    object dstPacientesPAC_NOME: TStringField
      FieldName = 'PAC_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
  end
  object dstVendas: TSQLDataSet
    CommandText = 'select * from VENDAS Where (MOV_CODSOLICITACAO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = sqlConnGerenciador
    Left = 40
    Top = 232
    object dstVendasMOV_CODSOLICITACAO: TIntegerField
      FieldName = 'MOV_CODSOLICITACAO'
      Required = True
    end
    object dstVendasMOV_CPFPACIENTE: TStringField
      FieldName = 'MOV_CPFPACIENTE'
      FixedChar = True
      Size = 11
    end
    object dstVendasMOV_CRM_MEDICO: TStringField
      FieldName = 'MOV_CRM_MEDICO'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dstVendasMOV_DTEMISSAO: TDateField
      FieldName = 'MOV_DTEMISSAO'
    end
    object dstVendasMOV_NRADM: TIntegerField
      FieldName = 'MOV_NRADM'
    end
    object dstVendasMOV_NRCUPOM: TIntegerField
      FieldName = 'MOV_NRCUPOM'
    end
    object dstVendasMOV_VALOR: TFMTBCDField
      FieldName = 'MOV_VALOR'
      Precision = 15
      Size = 2
    end
    object dstVendasMOV_VLPAGO: TFMTBCDField
      FieldName = 'MOV_VLPAGO'
      Precision = 15
      Size = 2
    end
    object dstVendasMOV_VLDEBITO: TFMTBCDField
      FieldName = 'MOV_VLDEBITO'
      Precision = 15
      Size = 2
    end
    object dstVendasMOV_NRAUTORIZACAO: TIntegerField
      FieldName = 'MOV_NRAUTORIZACAO'
    end
    object dstVendasMOV_CODINDICADOR: TIntegerField
      FieldName = 'MOV_CODINDICADOR'
    end
    object dstVendasMOV_DTVENDA: TDateField
      FieldName = 'MOV_DTVENDA'
    end
    object dstVendasMOV_AUTORIZACAO: TStringField
      FieldName = 'MOV_AUTORIZACAO'
      Size = 40
    end
    object dstVendasMOV_AUTORESTORNO: TStringField
      FieldName = 'MOV_AUTORESTORNO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstVendasMOV_FLSITU: TStringField
      FieldName = 'MOV_FLSITU'
      FixedChar = True
      Size = 1
    end
    object dstVendasMOV_DTCANCELAMENTO: TDateField
      FieldName = 'MOV_DTCANCELAMENTO'
    end
    object dstVendasMOV_CDUSUARIO: TIntegerField
      FieldName = 'MOV_CDUSUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object dstVendasMOV_HOVENDA: TStringField
      FieldName = 'MOV_HOVENDA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstVendasMOV_CODVENDEDOR: TIntegerField
      FieldName = 'MOV_CODVENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object dstVendasMOV_TEXTO_CUPOM: TMemoField
      FieldName = 'MOV_TEXTO_CUPOM'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object dstVendasMOV_CUPOM_VINCULADO: TMemoField
      FieldName = 'MOV_CUPOM_VINCULADO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object dstVendasMOV_NOMEPESSOA: TStringField
      FieldName = 'MOV_NOMEPESSOA'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
  end
  object dstProdutosVendas: TSQLDataSet
    CommandText = 
      'select * from PRODUTOS_VENDAS '#13#10'Where (PRV_CODSOLICITACAO = :pCO' +
      'DIGO)'#13#10'order by PRV_NRITEM'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = sqlConnGerenciador
    Left = 40
    Top = 280
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
    object dstProdutosVendasPRV_NOMEAPRESENTACAO: TStringField
      FieldName = 'PRV_NOMEAPRESENTACAO'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
  end
  object dstCancelamentos: TSQLDataSet
    CommandText = 'select * from CANCELAMENTOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConnGerenciador
    Left = 40
    Top = 328
    object dstCancelamentosCAN_CODSOLICITACAO: TIntegerField
      FieldName = 'CAN_CODSOLICITACAO'
      Required = True
    end
    object dstCancelamentosCAN_CODBARRAS: TStringField
      FieldName = 'CAN_CODBARRAS'
      Required = True
      Size = 13
    end
    object dstCancelamentosCAN_QUANT_DEVOLVIDA: TFMTBCDField
      FieldName = 'CAN_QUANT_DEVOLVIDA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstCancelamentosCAN_CODAUTORIZACAO: TIntegerField
      FieldName = 'CAN_CODAUTORIZACAO'
      ProviderFlags = [pfInUpdate]
    end
    object dstCancelamentosCAN_COD_INDICADOR: TIntegerField
      FieldName = 'CAN_COD_INDICADOR'
      ProviderFlags = [pfInUpdate]
    end
    object dstCancelamentosCAN_QUANTIDADE_ESTORNADA: TFMTBCDField
      FieldName = 'CAN_QUANTIDADE_ESTORNADA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object dstCancelamentosCAN_ESTORNO_ITEM: TIntegerField
      FieldName = 'CAN_ESTORNO_ITEM'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspConfig: TDataSetProvider
    DataSet = dstConfig
    Options = [poAllowCommandText]
    OnGetTableName = dspConfigGetTableName
    Left = 136
    Top = 64
  end
  object dspMedicos: TDataSetProvider
    DataSet = dstMedicos
    Options = [poAllowCommandText]
    OnGetTableName = dspMedicosGetTableName
    Left = 136
    Top = 120
  end
  object dspPacientes: TDataSetProvider
    DataSet = dstPacientes
    Options = [poAllowCommandText]
    OnGetTableName = dspPacientesGetTableName
    Left = 128
    Top = 176
  end
  object dspVendas: TDataSetProvider
    DataSet = dstVendas
    Options = [poAllowCommandText]
    OnGetTableName = dspVendasGetTableName
    Left = 136
    Top = 232
  end
  object dspProdutosVendas: TDataSetProvider
    DataSet = dstProdutosVendas
    Options = [poAllowCommandText]
    OnGetTableName = dspProdutosVendasGetTableName
    Left = 136
    Top = 280
  end
  object dspCancelamento: TDataSetProvider
    DataSet = dstCancelamentos
    Options = [poAllowCommandText]
    OnGetTableName = dspCancelamentoGetTableName
    Left = 136
    Top = 328
  end
  object cdsConfig: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfig'
    Left = 224
    Top = 64
    object cdsConfigCFG_CNPJ_EMPRESA: TStringField
      Alignment = taRightJustify
      FieldName = 'CFG_CNPJ_EMPRESA'
      EditMask = '99.999.999/9999-99;0;_'
      FixedChar = True
      Size = 14
    end
    object cdsConfigCFG_SEQUENCIA: TIntegerField
      FieldName = 'CFG_SEQUENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsConfigCFG_UF_EMPRESA: TStringField
      FieldName = 'CFG_UF_EMPRESA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object cdsConfigCFG_LOGIN: TStringField
      FieldName = 'CFG_LOGIN'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object cdsConfigCFG_SENHA: TStringField
      FieldName = 'CFG_SENHA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object cdsConfigCFG_USUARIO: TIntegerField
      FieldName = 'CFG_USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsConfigCFG_DATATUAL: TDateField
      FieldName = 'CFG_DATATUAL'
      ProviderFlags = [pfInUpdate]
    end
    object cdsConfigCFC_IMGLOGO: TBlobField
      FieldName = 'CFC_IMGLOGO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsConfigCFG_FANTASIA: TStringField
      FieldName = 'CFG_FANTASIA'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsConfigCFG_RAZAO: TStringField
      FieldName = 'CFG_RAZAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsConfigCFG_ENDERECO: TStringField
      FieldName = 'CFG_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsConfigCFG_CIDADE: TStringField
      FieldName = 'CFG_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsConfigCFG_CEPEMPRESA: TStringField
      Alignment = taRightJustify
      FieldName = 'CFG_CEPEMPRESA'
      ProviderFlags = [pfInUpdate]
      EditMask = '99999-999;0;_'
      FixedChar = True
      Size = 8
    end
    object cdsConfigCFG_FONEEMPRESA: TStringField
      Alignment = taRightJustify
      FieldName = 'CFG_FONEEMPRESA'
      ProviderFlags = [pfInUpdate]
      EditMask = '(99)9999-9999;0;_'
      Size = 10
    end
    object cdsConfigCFG_MENSCUPOM: TStringField
      FieldName = 'CFG_MENSCUPOM'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object cdsConfigCFG_VINCULOFARMA: TStringField
      FieldName = 'CFG_VINCULOFARMA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsConfigCFG_SIMULACAO: TStringField
      FieldName = 'CFG_SIMULACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsConfigCFG_FLPRODUCAO: TStringField
      FieldName = 'CFG_FLPRODUCAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsConfigCFG_VENDEDORES: TIntegerField
      FieldName = 'CFG_VENDEDORES'
    end
  end
  object cdsMedicos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMedicos'
    Left = 232
    Top = 120
    object cdsMedicosMED_CRM: TStringField
      FieldName = 'MED_CRM'
      Size = 10
    end
    object cdsMedicosMED_NOME: TStringField
      FieldName = 'MED_NOME'
      Size = 40
    end
  end
  object cdsPacientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPacientes'
    Left = 232
    Top = 176
    object cdsPacientesPAC_CPF: TStringField
      FieldName = 'PAC_CPF'
      EditMask = '999.999.999-99;0;_'
      Size = 11
    end
    object cdsPacientesPAC_NOME: TStringField
      FieldName = 'PAC_NOME'
      Size = 80
    end
  end
  object cdsVendas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspVendas'
    Left = 240
    Top = 232
    object cdsVendasMOV_CODSOLICITACAO: TIntegerField
      FieldName = 'MOV_CODSOLICITACAO'
      Required = True
    end
    object cdsVendasMOV_CPFPACIENTE: TStringField
      FieldName = 'MOV_CPFPACIENTE'
      FixedChar = True
      Size = 11
    end
    object cdsVendasMOV_CRM_MEDICO: TStringField
      FieldName = 'MOV_CRM_MEDICO'
      Size = 10
    end
    object cdsVendasMOV_DTEMISSAO: TDateField
      FieldName = 'MOV_DTEMISSAO'
    end
    object cdsVendasMOV_NRADM: TIntegerField
      FieldName = 'MOV_NRADM'
    end
    object cdsVendasMOV_NRCUPOM: TIntegerField
      FieldName = 'MOV_NRCUPOM'
    end
    object cdsVendasMOV_VALOR: TFMTBCDField
      FieldName = 'MOV_VALOR'
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsVendasMOV_VLPAGO: TFMTBCDField
      FieldName = 'MOV_VLPAGO'
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsVendasMOV_VLDEBITO: TFMTBCDField
      FieldName = 'MOV_VLDEBITO'
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsVendasMOV_NRAUTORIZACAO: TIntegerField
      FieldName = 'MOV_NRAUTORIZACAO'
    end
    object cdsVendasMOV_CODINDICADOR: TIntegerField
      FieldName = 'MOV_CODINDICADOR'
    end
    object cdsVendasMOV_DTVENDA: TDateField
      FieldName = 'MOV_DTVENDA'
    end
    object cdsVendasMOV_AUTORIZACAO: TStringField
      FieldName = 'MOV_AUTORIZACAO'
      Size = 40
    end
    object cdsVendasMOV_AUTORESTORNO: TStringField
      FieldName = 'MOV_AUTORESTORNO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsVendasMOV_FLSITU: TStringField
      FieldName = 'MOV_FLSITU'
      FixedChar = True
      Size = 1
    end
    object cdsVendasMOV_DTCANCELAMENTO: TDateField
      FieldName = 'MOV_DTCANCELAMENTO'
    end
    object cdsVendasMOV_CDUSUARIO: TIntegerField
      FieldName = 'MOV_CDUSUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendasMOV_HOVENDA: TStringField
      FieldName = 'MOV_HOVENDA'
      FixedChar = True
      Size = 5
    end
    object cdsVendasMOV_CODVENDEDOR: TIntegerField
      FieldName = 'MOV_CODVENDEDOR'
    end
    object cdsVendasMOV_TEXTO_CUPOM: TMemoField
      FieldName = 'MOV_TEXTO_CUPOM'
      BlobType = ftMemo
    end
    object cdsVendasMOV_CUPOM_VINCULADO: TMemoField
      FieldName = 'MOV_CUPOM_VINCULADO'
      BlobType = ftMemo
    end
    object cdsVendasMOV_NOMEPESSOA: TStringField
      FieldName = 'MOV_NOMEPESSOA'
      Size = 80
    end
  end
  object cdsProdutosVendas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspProdutosVendas'
    Left = 240
    Top = 280
    object cdsProdutosVendasPRV_CODSOLICITACAO: TIntegerField
      FieldName = 'PRV_CODSOLICITACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProdutosVendasPRV_CODBARRAS: TStringField
      FieldName = 'PRV_CODBARRAS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsProdutosVendasPRV_QUANTIDADE: TFMTBCDField
      FieldName = 'PRV_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object cdsProdutosVendasPRV_VLVENDA: TFMTBCDField
      FieldName = 'PRV_VLVENDA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsProdutosVendasPRV_QUANTIDADE_PRESCRITA: TFMTBCDField
      FieldName = 'PRV_QUANTIDADE_PRESCRITA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object cdsProdutosVendasPRV_QUANTIDADE_AUTORIZADA: TFMTBCDField
      FieldName = 'PRV_QUANTIDADE_AUTORIZADA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object cdsProdutosVendasPRV_VLPARCELA: TFMTBCDField
      FieldName = 'PRV_VLPARCELA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsProdutosVendasPRV_VLTOTALPRECOVENDA: TFMTBCDField
      FieldName = 'PRV_VLTOTALPRECOVENDA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsProdutosVendasPRV_VLTOTALPARCELA: TFMTBCDField
      FieldName = 'PRV_VLTOTALPARCELA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsProdutosVendasPRV_COD_INDICADOR: TIntegerField
      FieldName = 'PRV_COD_INDICADOR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProdutosVendasPRV_QUANT_CANCELADA: TFMTBCDField
      FieldName = 'PRV_QUANT_CANCELADA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object cdsProdutosVendasPRV_AUTORESTORNO: TStringField
      FieldName = 'PRV_AUTORESTORNO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object cdsProdutosVendasPRV_AUTORMEDICAMENTO: TStringField
      FieldName = 'PRV_AUTORMEDICAMENTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object cdsProdutosVendasPRV_STATUS: TStringField
      FieldName = 'PRV_STATUS'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsProdutosVendasPRV_QTDEVOLVIDA: TFMTBCDField
      FieldName = 'PRV_QTDEVOLVIDA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object cdsProdutosVendasPRV_QTPRESCRITA: TFMTBCDField
      FieldName = 'PRV_QTPRESCRITA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object cdsProdutosVendasPRV_VLPRECO_SUBSIDIADO: TFMTBCDField
      FieldName = 'PRV_VLPRECO_SUBSIDIADO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 3
    end
    object cdsProdutosVendasPRV_VLPRECO_SUBPACIENTE: TFMTBCDField
      FieldName = 'PRV_VLPRECO_SUBPACIENTE'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 3
    end
    object cdsProdutosVendasPRV_VLPRECO_SUBPAC_POSESTORNO: TFMTBCDField
      FieldName = 'PRV_VLPRECO_SUBPAC_POSESTORNO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 3
    end
    object cdsProdutosVendasPRV_VLSUBMS_POSESTORNO: TFMTBCDField
      FieldName = 'PRV_VLSUBMS_POSESTORNO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 3
    end
    object cdsProdutosVendasPRV_VLTOTAL_POSESTORNO: TFMTBCDField
      FieldName = 'PRV_VLTOTAL_POSESTORNO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 3
    end
    object cdsProdutosVendasPRV_FLCANC: TStringField
      FieldName = 'PRV_FLCANC'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsProdutosVendasPRV_QTESTORNADA: TFMTBCDField
      FieldName = 'PRV_QTESTORNADA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
    object cdsProdutosVendasPRV_NOMEAPRESENTACAO: TStringField
      FieldName = 'PRV_NOMEAPRESENTACAO'
      Size = 80
    end
  end
  object cdsCancelamento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCancelamento'
    Left = 240
    Top = 328
    object cdsCancelamentoCAN_CODSOLICITACAO: TIntegerField
      FieldName = 'CAN_CODSOLICITACAO'
      Required = True
    end
    object cdsCancelamentoCAN_CODBARRAS: TStringField
      FieldName = 'CAN_CODBARRAS'
      Required = True
      Size = 13
    end
    object cdsCancelamentoCAN_QUANT_DEVOLVIDA: TFMTBCDField
      FieldName = 'CAN_QUANT_DEVOLVIDA'
      Precision = 15
      Size = 3
    end
    object cdsCancelamentoCAN_CODAUTORIZACAO: TIntegerField
      FieldName = 'CAN_CODAUTORIZACAO'
    end
    object cdsCancelamentoCAN_COD_INDICADOR: TIntegerField
      FieldName = 'CAN_COD_INDICADOR'
    end
    object cdsCancelamentoCAN_QUANTIDADE_ESTORNADA: TFMTBCDField
      FieldName = 'CAN_QUANTIDADE_ESTORNADA'
      Precision = 15
      Size = 3
    end
    object cdsCancelamentoCAN_ESTORNO_ITEM: TIntegerField
      FieldName = 'CAN_ESTORNO_ITEM'
    end
  end
  object cdsDados: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsDadosCalcFields
    Left = 296
    Top = 64
    Data = {
      6D0300009619E0BD01000000180000001D0000000000030000006D030A50524F
      5F4344424152520100490000000100055749445448020002000D000A50524F5F
      4E4D50524F4401004900000001000557494454480200020028000A50524F5F51
      5450524F4408000400000000000A50524F5F564C56454E440800040000000100
      07535542545950450200490006004D6F6E6579000A50524F5F51545052455308
      000400000000000A50524F5F51544155544F08000400000000000C50524F5F54
      4F5456454E4441080004000000010007535542545950450200490006004D6F6E
      6579001350524F5F50415243454C4150414349454E5445080004000000010007
      535542545950450200490006004D6F6E6579000F50524F5F4344494E44494341
      444F5204000100000000000A50524F5F515443414E4308000400000000001150
      524F5F4155544F525F4553544F524E4F01004900000001000557494454480200
      020028001450524F5F4155544F524D45444943414D454E544F01004900000001
      000557494454480200020028001050524F5F51544155544F52495A4144410800
      0400000000000F50524F5F51544445564F4C5649444108000400000000000F50
      524F5F51544553544F524E41444108000400000000000F50524F5F5154505245
      53435249544108000400000000001050524F5F5154534F4C4943495441444108
      000400000000000A50524F5F5354415455530100490000000100055749445448
      020002000A001650524F5F564C505245434F5F5355425349444941444F080004
      00000000001750524F5F564C505245434F5F53554250414349454E5445080004
      00000000001950524F5F564C50414349454E54455F504F534553544F524E4F08
      000400000000001150524F5F564C505245434F5F56454E444108000400000000
      001650524F5F564C5355424D535F504F534553544F524E4F0800040000000000
      1C50524F5F564C544F54414C5F56454E44415F504F534553544F524E4F080004
      00000000000A50524F5F464C4553544F02000300000000000E50524F5F464C53
      4954554143414F0100490000000100055749445448020002000F000C50524F5F
      4D454E534147454D02004900000001000557494454480200020022010A50524F
      5F464C4155544F02000300000000000B50524F5F5245544F524E4F0100490000
      0001000557494454480200020005000000}
    object cdsDadosPRO_CDBARR: TStringField
      Alignment = taRightJustify
      FieldName = 'PRO_CDBARR'
      Size = 13
    end
    object cdsDadosPRO_NMPROD: TStringField
      FieldName = 'PRO_NMPROD'
      Size = 40
    end
    object cdsDadosPRO_QTPROD: TFloatField
      FieldName = 'PRO_QTPROD'
    end
    object cdsDadosPRO_VLVEND: TCurrencyField
      FieldName = 'PRO_VLVEND'
      DisplayFormat = '#,##0.#0'
      EditFormat = '#,##0.#0'
      currency = False
    end
    object cdsDadosPRO_QTPRES: TFloatField
      FieldName = 'PRO_QTPRES'
    end
    object cdsDadosPRO_QTAUTO: TFloatField
      FieldName = 'PRO_QTAUTO'
    end
    object cdsDadosPRO_TOTALPARCELA: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'PRO_TOTALPARCELA'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      Calculated = True
    end
    object cdsDadosPRO_TOTVENDA: TCurrencyField
      FieldName = 'PRO_TOTVENDA'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
    end
    object cdsDadosPRO_PARCELAPACIENTE: TCurrencyField
      FieldName = 'PRO_PARCELAPACIENTE'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
    end
    object cdsDadosPRO_CDINDICADOR: TIntegerField
      FieldName = 'PRO_CDINDICADOR'
    end
    object cdsDadosPRO_QTCANC: TFloatField
      FieldName = 'PRO_QTCANC'
    end
    object cdsDadosPRO_SUBTOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'PRO_SUBTOTAL'
      DisplayFormat = '###,##0.#0'
      EditFormat = '###,##0.#0'
      currency = False
      Calculated = True
    end
    object cdsDadosPRO_AUTOR_ESTORNO: TStringField
      FieldName = 'PRO_AUTOR_ESTORNO'
      Size = 40
    end
    object cdsDadosPRO_AUTORMEDICAMENTO: TStringField
      FieldName = 'PRO_AUTORMEDICAMENTO'
      Size = 40
    end
    object cdsDadosPRO_QTAUTORIZADA: TFloatField
      FieldName = 'PRO_QTAUTORIZADA'
    end
    object cdsDadosPRO_QTDEVOLVIDA: TFloatField
      FieldName = 'PRO_QTDEVOLVIDA'
      DisplayFormat = '##0.#0'
    end
    object cdsDadosPRO_QTESTORNADA: TFloatField
      FieldName = 'PRO_QTESTORNADA'
      DisplayFormat = '##0.#0'
    end
    object cdsDadosPRO_QTPRESCRITA: TFloatField
      FieldName = 'PRO_QTPRESCRITA'
      DisplayFormat = '##0.#0'
    end
    object cdsDadosPRO_QTSOLICITADA: TFloatField
      FieldName = 'PRO_QTSOLICITADA'
      DisplayFormat = '##0.#0'
    end
    object cdsDadosPRO_STATUS: TStringField
      FieldName = 'PRO_STATUS'
      Size = 10
    end
    object cdsDadosPRO_VLPRECO_SUBSIDIADO: TFloatField
      FieldName = 'PRO_VLPRECO_SUBSIDIADO'
      DisplayFormat = '#,##0.#0'
    end
    object cdsDadosPRO_VLPRECO_SUBPACIENTE: TFloatField
      FieldName = 'PRO_VLPRECO_SUBPACIENTE'
      DisplayFormat = '#,##0.#0'
    end
    object cdsDadosPRO_VLPACIENTE_POSESTORNO: TFloatField
      FieldName = 'PRO_VLPACIENTE_POSESTORNO'
      DisplayFormat = '#,##0.#0'
    end
    object cdsDadosPRO_VLPRECO_VENDA: TFloatField
      FieldName = 'PRO_VLPRECO_VENDA'
      DisplayFormat = '#,##0.#0'
    end
    object cdsDadosPRO_VLSUBMS_POSESTORNO: TFloatField
      FieldName = 'PRO_VLSUBMS_POSESTORNO'
      DisplayFormat = '#,##0.#0'
    end
    object cdsDadosPRO_VLTOTAL_VENDA_POSESTORNO: TFloatField
      FieldName = 'PRO_VLTOTAL_VENDA_POSESTORNO'
      DisplayFormat = '#,##0.#0'
    end
    object cdsDadosPRO_FLESTO: TBooleanField
      FieldName = 'PRO_FLESTO'
    end
    object cdsDadosPRO_FLSITUACAO: TStringField
      FieldName = 'PRO_FLSITUACAO'
      Size = 15
    end
    object cdsDadosPRO_MENSAGEM: TStringField
      FieldName = 'PRO_MENSAGEM'
      Size = 290
    end
    object cdsDadosPRO_FLAUTO: TBooleanField
      FieldName = 'PRO_FLAUTO'
    end
    object cdsDadosPRO_RETORNO: TStringField
      FieldName = 'PRO_RETORNO'
      Size = 5
    end
  end
  object qryLocProduto: TQuery
    DatabaseName = 'GERENCIADOR'
    SQL.Strings = (
      'Select PRO_CDBARR, PRO_NMPROD from "SACPRO.DBF"'
      'Where (PRO_NMPROD like :pNOME) and (PRO_CDBARR <> :pCDBARR)'
      'order by PRO_NMPROD')
    Left = 368
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'pNOME'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'pCDBARR'
        ParamType = ptInput
        Value = ''
      end>
  end
  object qryIncMedico: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCRM'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'pNOME'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      'Insert Into MEDICOS (MED_CRM, MED_NOME)'
      'VALUES (:pCRM, :pNOME)')
    SQLConnection = sqlConnGerenciador
    Left = 304
    Top = 120
  end
  object qryIncPaciente: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCPF'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'pNOME'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      'Insert Into PACIENTES (PAC_CPF, PAC_NOME)'
      'VALUES (:pCPF, :pNOME)'
      ''
      '     ')
    SQLConnection = sqlConnGerenciador
    Left = 312
    Top = 176
  end
  object qryProcurar: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from MEDICOS')
    SQLConnection = sqlConnGerenciador
    Left = 384
    Top = 72
  end
  object HTTPRIO1: THTTPRIO
    WSDLLocation = 
      'https://200.214.130.55:9443/farmaciapopular/services/ServicoSoli' +
      'citacaoWS?wsdl'
    Service = 'ServicoSolicitacaoWSService'
    Port = 'ServicoSolicitacaoWS'
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    HTTPWebNode.UseUTF8InHeader = False
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 136
    Top = 8
  end
  object dstUsuarios: TSQLDataSet
    CommandText = 'select * from USUARIOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConnGerenciador
    Left = 312
    Top = 232
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
      FixedChar = True
      Size = 6
    end
    object dstUsuariosSEN_CARGO: TStringField
      FieldName = 'SEN_CARGO'
      ProviderFlags = [pfInUpdate]
    end
    object dstUsuariosSEN_IMPRESSORA: TIntegerField
      FieldName = 'SEN_IMPRESSORA'
      ProviderFlags = [pfInUpdate]
    end
    object dstUsuariosSEN_DTATUAL: TDateField
      FieldName = 'SEN_DTATUAL'
    end
    object dstUsuariosSEN_PASTA: TStringField
      FieldName = 'SEN_PASTA'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object dstUsuariosSEN_SENHA_VENDEDOR: TStringField
      FieldName = 'SEN_SENHA_VENDEDOR'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
  end
  object dspUsuarios: TDataSetProvider
    DataSet = dstUsuarios
    Options = [poAllowCommandText]
    OnGetTableName = dspUsuariosGetTableName
    Left = 376
    Top = 232
  end
  object cdsUsuarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuarios'
    Left = 440
    Top = 232
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
      FixedChar = True
      Size = 6
    end
    object cdsUsuariosSEN_CARGO: TStringField
      FieldName = 'SEN_CARGO'
    end
    object cdsUsuariosSEN_IMPRESSORA: TIntegerField
      FieldName = 'SEN_IMPRESSORA'
      DisplayFormat = '00'
    end
    object cdsUsuariosSEN_NMDESC: TStringField
      FieldKind = fkLookup
      FieldName = 'SEN_NMDESC'
      LookupDataSet = cdsImpressora
      LookupKeyFields = 'IMP_CODIGO'
      LookupResultField = 'IMP_DESCRICAO'
      KeyFields = 'SEN_IMPRESSORA'
      Size = 15
      Lookup = True
    end
    object cdsUsuariosSEN_DTATUAL: TDateField
      FieldName = 'SEN_DTATUAL'
    end
    object cdsUsuariosSEN_PASTA: TStringField
      FieldName = 'SEN_PASTA'
      Size = 80
    end
    object cdsUsuariosSEN_SENHA_VENDEDOR: TStringField
      FieldName = 'SEN_SENHA_VENDEDOR'
      Size = 12
    end
  end
  object dstImpressora: TSQLDataSet
    CommandText = 'select * from IMPRESSORA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConnGerenciador
    Left = 320
    Top = 296
    object dstImpressoraIMP_CODIGO: TIntegerField
      FieldName = 'IMP_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstImpressoraIMP_DESCRICAO: TStringField
      FieldName = 'IMP_DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
  end
  object dspImpressora: TDataSetProvider
    DataSet = dstImpressora
    Options = [poAllowCommandText]
    OnGetTableName = dspImpressoraGetTableName
    Left = 400
    Top = 296
  end
  object cdsImpressora: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspImpressora'
    Left = 480
    Top = 296
    object cdsImpressoraIMP_CODIGO: TIntegerField
      FieldName = 'IMP_CODIGO'
      Required = True
    end
    object cdsImpressoraIMP_DESCRICAO: TStringField
      FieldName = 'IMP_DESCRICAO'
      Size = 15
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
    SQLConnection = sqlConnGerenciador
    Left = 400
    Top = 120
    object qryUsuariosSEN_CODIGO: TIntegerField
      FieldName = 'SEN_CODIGO'
      Required = True
    end
    object qryUsuariosSEN_NOME: TStringField
      FieldName = 'SEN_NOME'
      Size = 40
    end
    object qryUsuariosSEN_SNATUA: TStringField
      FieldName = 'SEN_SNATUA'
      Size = 6
    end
    object qryUsuariosSEN_CARGO: TStringField
      FieldName = 'SEN_CARGO'
    end
    object qryUsuariosSEN_IMPRESSORA: TIntegerField
      FieldName = 'SEN_IMPRESSORA'
    end
  end
  object dstConsultaVendas: TSQLDataSet
    CommandText = 
      'select MOV_CODSOLICITACAO, MOV_CPFPACIENTE, MOV_NRCUPOM, MOV_VAL' +
      'OR, MOV_VLPAGO, MOV_NRAUTORIZACAO, MOV_NOMEPESSOA, MOV_DTVENDA, ' +
      'MOV_AUTORIZACAO, MOV_FLSITU, MOV_DTCANCELAMENTO, MOV_TEXTO_CUPOM' +
      ', MOV_CUPOM_VINCULADO from VENDAS'#13#10'Where (MOV_DTVENDA >= :pDTINI' +
      'C) AND (MOV_DTVENDA <= :pDTFINA)'#13#10'order by MOV_CODSOLICITACAO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINIC'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFINA'
        ParamType = ptInput
      end>
    SQLConnection = sqlConnGerenciador
    Left = 488
    Top = 24
    object dstConsultaVendasMOV_CODSOLICITACAO: TIntegerField
      FieldName = 'MOV_CODSOLICITACAO'
      Required = True
    end
    object dstConsultaVendasMOV_CPFPACIENTE: TStringField
      FieldName = 'MOV_CPFPACIENTE'
      FixedChar = True
      Size = 11
    end
    object dstConsultaVendasMOV_NRCUPOM: TIntegerField
      FieldName = 'MOV_NRCUPOM'
    end
    object dstConsultaVendasMOV_VALOR: TFMTBCDField
      FieldName = 'MOV_VALOR'
      Precision = 15
      Size = 2
    end
    object dstConsultaVendasMOV_VLPAGO: TFMTBCDField
      FieldName = 'MOV_VLPAGO'
      Precision = 15
      Size = 2
    end
    object dstConsultaVendasMOV_NRAUTORIZACAO: TIntegerField
      FieldName = 'MOV_NRAUTORIZACAO'
    end
    object dstConsultaVendasMOV_NOMEPESSOA: TStringField
      FieldName = 'MOV_NOMEPESSOA'
      Size = 40
    end
    object dstConsultaVendasMOV_DTVENDA: TDateField
      FieldName = 'MOV_DTVENDA'
    end
    object dstConsultaVendasMOV_AUTORIZACAO: TStringField
      FieldName = 'MOV_AUTORIZACAO'
      Size = 40
    end
    object dstConsultaVendasMOV_FLSITU: TStringField
      FieldName = 'MOV_FLSITU'
      FixedChar = True
      Size = 1
    end
    object dstConsultaVendasMOV_DTCANCELAMENTO: TDateField
      FieldName = 'MOV_DTCANCELAMENTO'
    end
    object dstConsultaVendasMOV_TEXTO_CUPOM: TMemoField
      FieldName = 'MOV_TEXTO_CUPOM'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object dstConsultaVendasMOV_CUPOM_VINCULADO: TMemoField
      FieldName = 'MOV_CUPOM_VINCULADO'
      BlobType = ftMemo
    end
  end
  object dspConsultaVendas: TDataSetProvider
    DataSet = dstConsultaVendas
    Options = [poAllowCommandText]
    Left = 480
    Top = 80
  end
  object cdsConsultaVendas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINIC'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTFINA'
        ParamType = ptInput
      end>
    ProviderName = 'dspConsultaVendas'
    OnCalcFields = cdsConsultaVendasCalcFields
    Left = 480
    Top = 136
    object cdsConsultaVendasMOV_CODSOLICITACAO: TIntegerField
      FieldName = 'MOV_CODSOLICITACAO'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsConsultaVendasMOV_CPFPACIENTE: TStringField
      Alignment = taCenter
      FieldName = 'MOV_CPFPACIENTE'
      EditMask = '999.999.999-99;0;_'
      FixedChar = True
      Size = 11
    end
    object cdsConsultaVendasMOV_NRCUPOM: TIntegerField
      FieldName = 'MOV_NRCUPOM'
      DisplayFormat = '000000'
    end
    object cdsConsultaVendasMOV_VALOR: TFMTBCDField
      FieldName = 'MOV_VALOR'
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsConsultaVendasMOV_VLPAGO: TFMTBCDField
      FieldName = 'MOV_VLPAGO'
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsConsultaVendasMOV_NRAUTORIZACAO: TIntegerField
      FieldName = 'MOV_NRAUTORIZACAO'
    end
    object cdsConsultaVendasMOV_NOMEPESSOA: TStringField
      FieldName = 'MOV_NOMEPESSOA'
      Size = 40
    end
    object cdsConsultaVendasMOV_DTVENDA: TDateField
      Alignment = taRightJustify
      FieldName = 'MOV_DTVENDA'
    end
    object cdsConsultaVendasMOV_AUTORIZACAO: TStringField
      FieldName = 'MOV_AUTORIZACAO'
      Size = 40
    end
    object cdsConsultaVendasMOV_FLSITU: TStringField
      FieldName = 'MOV_FLSITU'
      FixedChar = True
      Size = 1
    end
    object cdsConsultaVendasMOV_DTCANCELAMENTO: TDateField
      FieldName = 'MOV_DTCANCELAMENTO'
    end
    object cdsConsultaVendasMOV_SITUACAO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'MOV_SITUACAO'
      Size = 15
    end
    object cdsConsultaVendasMOV_TEXTO_CUPOM: TMemoField
      FieldName = 'MOV_TEXTO_CUPOM'
      BlobType = ftMemo
    end
    object cdsConsultaVendasMOV_CUPOM_VINCULADO: TMemoField
      FieldName = 'MOV_CUPOM_VINCULADO'
      BlobType = ftMemo
    end
    object cdsConsultaVendasDIGITALIZACAO: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'DIGITALIZACAO'
    end
  end
  object dstProdutos: TSQLDataSet
    CommandText = 
      'Select PRO_BARRAS, PRO_MEDICAMENTO, PRO_VALORVENDA, PRO_QUANTIDA' +
      'DE from PRODUTOS Where (PRO_MEDICAMENTO like :pNOME) and (PRO_BA' +
      'RRAS <> :pCDBARR) order by PRO_MEDICAMENTO'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pNOME'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'pCDBARR'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = sqlConnGerenciador
    Left = 40
    Top = 376
    object dstProdutosPRO_BARRAS: TStringField
      FieldName = 'PRO_BARRAS'
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
      Required = True
      Precision = 15
      Size = 2
    end
    object dstProdutosPRO_QUANTIDADE: TFMTBCDField
      FieldName = 'PRO_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
  end
  object dspProdutos: TDataSetProvider
    DataSet = dstProdutos
    Options = [poAllowCommandText]
    OnGetTableName = dspProdutosGetTableName
    Left = 120
    Top = 376
  end
  object cdsProdutos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'pNOME'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'pCDBARR'
        ParamType = ptInput
        Value = ''
      end>
    ProviderName = 'dspProdutos'
    Left = 192
    Top = 376
    object cdsProdutosPRO_BARRAS: TStringField
      FieldName = 'PRO_BARRAS'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsProdutosPRO_MEDICAMENTO: TStringField
      FieldName = 'PRO_MEDICAMENTO'
      Required = True
      Size = 50
    end
    object cdsProdutosPRO_VALORVENDA: TFMTBCDField
      FieldName = 'PRO_VALORVENDA'
      Required = True
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsProdutosPRO_QUANTIDADE: TFMTBCDField
      FieldName = 'PRO_QUANTIDADE'
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 3
    end
  end
  object qryLocProdutos: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      'Select * from PRODUTOS Where (PRO_BARRAS = :pCODIGO)')
    SQLConnection = sqlConnGerenciador
    Left = 408
    Top = 176
  end
  object dstCadProdutos: TSQLDataSet
    CommandText = 'select * from PRODUTOS Where (PRO_BARRAS  = :pBARRAS)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pBARRAS'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = sqlConnGerenciador
    Left = 328
    Top = 352
    object dstCadProdutosPRO_BARRAS: TStringField
      FieldName = 'PRO_BARRAS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 13
    end
    object dstCadProdutosPRO_MEDICAMENTO: TStringField
      FieldName = 'PRO_MEDICAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object dstCadProdutosPRO_VALORVENDA: TFMTBCDField
      FieldName = 'PRO_VALORVENDA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 15
      Size = 2
    end
    object dstCadProdutosPRO_QUANTIDADE: TFMTBCDField
      FieldName = 'PRO_QUANTIDADE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 3
    end
  end
  object dspCadProdutos: TDataSetProvider
    DataSet = dstCadProdutos
    Options = [poAllowCommandText]
    OnGetTableName = dspCadProdutosGetTableName
    Left = 408
    Top = 352
  end
  object cdsCadProdutos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'pBARRAS'
        ParamType = ptInput
        Value = ''
      end>
    ProviderName = 'dspCadProdutos'
    Left = 496
    Top = 352
    object cdsCadProdutosPRO_BARRAS: TStringField
      FieldName = 'PRO_BARRAS'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsCadProdutosPRO_MEDICAMENTO: TStringField
      FieldName = 'PRO_MEDICAMENTO'
      Required = True
      Size = 50
    end
    object cdsCadProdutosPRO_VALORVENDA: TFMTBCDField
      FieldName = 'PRO_VALORVENDA'
      Required = True
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsCadProdutosPRO_QUANTIDADE: TFMTBCDField
      FieldName = 'PRO_QUANTIDADE'
      DisplayFormat = '#,##0.#0'
      Precision = 15
      Size = 3
    end
  end
  object dsCadProdutos: TDataSource
    AutoEdit = False
    DataSet = cdsCadProdutos
    Left = 504
    Top = 416
  end
  object qryNomeProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      
        'Select PRO_BARRAS, PRO_MEDICAMENTO, PRO_VALORVENDA from PRODUTOS' +
        ' '
      'Where (PRO_BARRAS = :pCODIGO)')
    SQLConnection = sqlConnGerenciador
    Left = 496
    Top = 192
    object qryNomeProdutoPRO_BARRAS: TStringField
      FieldName = 'PRO_BARRAS'
      Required = True
      FixedChar = True
      Size = 13
    end
    object qryNomeProdutoPRO_MEDICAMENTO: TStringField
      FieldName = 'PRO_MEDICAMENTO'
      Required = True
      Size = 50
    end
    object qryNomeProdutoPRO_VALORVENDA: TFMTBCDField
      FieldName = 'PRO_VALORVENDA'
      Required = True
      Precision = 15
      Size = 2
    end
  end
  object qryImportar: TQuery
    DatabaseName = 'GERENCIADOR'
    SQL.Strings = (
      
        'Select PRO_CDBARR, PRO_NMPROD, PRO_VLVEND, PRO_QTARMA, TAB_VLVEN' +
        'D, PRO_VLPOPU from "SACPRO.DBF" '
      '')
    Left = 200
    Top = 8
    object qryImportarPRO_CDBARR: TStringField
      FieldName = 'PRO_CDBARR'
      Origin = 'GERENCIADOR."SACPRO.DBF".PRO_CDBARR'
      Size = 13
    end
    object qryImportarPRO_NMPROD: TStringField
      FieldName = 'PRO_NMPROD'
      Origin = 'GERENCIADOR."SACPRO.DBF".PRO_NMPROD'
      Size = 40
    end
    object qryImportarPRO_VLVEND: TFloatField
      FieldName = 'PRO_VLVEND'
      Origin = 'GERENCIADOR."SACPRO.DBF".PRO_VLVEND'
    end
    object qryImportarPRO_QTARMA: TFloatField
      FieldName = 'PRO_QTARMA'
      Origin = 'GERENCIADOR."SACPRO.DBF".PRO_QTARMA'
    end
    object qryImportarTAB_VLVEND: TFloatField
      FieldName = 'TAB_VLVEND'
      Origin = 'GERENCIADOR."SACPRO.DBF".TAB_VLVEND'
    end
    object qryImportarPRO_VLPOPU: TFloatField
      FieldName = 'PRO_VLPOPU'
      Origin = 'GERENCIADOR."SACPRO.DBF".PRO_VLPOPU'
    end
  end
  object qryDados: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from PRODUTOS')
    SQLConnection = sqlConnGerenciador
    Left = 256
    Top = 16
  end
  object SQLMonitor1: TSQLMonitor
    AutoSave = True
    FileName = 'C:\EMPRESA\Gereciador\log.txt'
    SQLConnection = sqlConnGerenciador
    Left = 192
    Top = 120
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 432
    Top = 16
  end
  object dstPadrao: TSQLDataSet
    CommandText = 
      'Select * from PRODUTOS_VENDAS PV Where (pv.prv_codsolicitacao = ' +
      ':pVENDA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pVENDA'
        ParamType = ptInput
      end>
    SQLConnection = sqlConnGerenciador
    Left = 48
    Top = 432
  end
  object dspPadrao: TDataSetProvider
    DataSet = dstPadrao
    Options = [poAllowCommandText]
    Left = 112
    Top = 432
  end
  object cdsProdutoSelecionado: TClientDataSet
    Aggregates = <>
    CommandText = 'Select * from PRODUTOS Where (PRO_BARRAS = :pCODIGO)'
    Params = <
      item
        DataType = ftString
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    Left = 216
    Top = 424
    object cdsProdutoSelecionadoPRO_BARRAS: TStringField
      FieldName = 'PRO_BARRAS'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsProdutoSelecionadoPRO_MEDICAMENTO: TStringField
      FieldName = 'PRO_MEDICAMENTO'
      Required = True
      Size = 50
    end
    object cdsProdutoSelecionadoPRO_VALORVENDA: TFMTBCDField
      FieldName = 'PRO_VALORVENDA'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsProdutoSelecionadoPRO_QUANTIDADE: TFMTBCDField
      FieldName = 'PRO_QUANTIDADE'
      Precision = 18
      Size = 3
    end
  end
  object dstDetalheProduto: TSQLDataSet
    CommandText = 
      'select * from PRODUTOS_VENDAS PV where (PV.prv_codsolicitacao = ' +
      ':pVENDA)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pVENDA'
        ParamType = ptInput
      end>
    SQLConnection = sqlConnGerenciador
    Left = 304
    Top = 440
  end
  object dspDetalheProduto: TDataSetProvider
    DataSet = dstDetalheProduto
    Options = [poAllowCommandText]
    Left = 368
    Top = 400
  end
  object cdsDetalheProduto: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pVENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspDetalheProduto'
    Left = 432
    Top = 440
    object cdsDetalheProdutoPRV_CODSOLICITACAO: TIntegerField
      FieldName = 'PRV_CODSOLICITACAO'
      Required = True
    end
    object cdsDetalheProdutoPRV_CODBARRAS: TStringField
      FieldName = 'PRV_CODBARRAS'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsDetalheProdutoPRV_NOMEAPRESENTACAO: TStringField
      FieldName = 'PRV_NOMEAPRESENTACAO'
      Size = 40
    end
    object cdsDetalheProdutoPRV_QUANTIDADE: TFMTBCDField
      FieldName = 'PRV_QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object cdsDetalheProdutoPRV_VLVENDA: TFMTBCDField
      FieldName = 'PRV_VLVENDA'
      Precision = 18
      Size = 2
    end
    object cdsDetalheProdutoPRV_QUANTIDADE_PRESCRITA: TFMTBCDField
      FieldName = 'PRV_QUANTIDADE_PRESCRITA'
      Precision = 18
      Size = 3
    end
    object cdsDetalheProdutoPRV_QUANTIDADE_AUTORIZADA: TFMTBCDField
      FieldName = 'PRV_QUANTIDADE_AUTORIZADA'
      Precision = 18
      Size = 3
    end
    object cdsDetalheProdutoPRV_VLPARCELA: TFMTBCDField
      FieldName = 'PRV_VLPARCELA'
      Precision = 18
      Size = 2
    end
    object cdsDetalheProdutoPRV_VLTOTALPRECOVENDA: TFMTBCDField
      FieldName = 'PRV_VLTOTALPRECOVENDA'
      Precision = 18
      Size = 2
    end
    object cdsDetalheProdutoPRV_VLTOTALPARCELA: TFMTBCDField
      FieldName = 'PRV_VLTOTALPARCELA'
      Precision = 18
      Size = 2
    end
    object cdsDetalheProdutoPRV_COD_INDICADOR: TIntegerField
      FieldName = 'PRV_COD_INDICADOR'
    end
    object cdsDetalheProdutoPRV_QUANT_CANCELADA: TFMTBCDField
      FieldName = 'PRV_QUANT_CANCELADA'
      Precision = 18
      Size = 3
    end
    object cdsDetalheProdutoPRV_AUTORESTORNO: TStringField
      FieldName = 'PRV_AUTORESTORNO'
      FixedChar = True
      Size = 4
    end
    object cdsDetalheProdutoPRV_AUTORMEDICAMENTO: TStringField
      FieldName = 'PRV_AUTORMEDICAMENTO'
      FixedChar = True
      Size = 3
    end
    object cdsDetalheProdutoPRV_STATUS: TStringField
      FieldName = 'PRV_STATUS'
      Size = 10
    end
    object cdsDetalheProdutoPRV_QTDEVOLVIDA: TFMTBCDField
      FieldName = 'PRV_QTDEVOLVIDA'
      Precision = 18
      Size = 3
    end
    object cdsDetalheProdutoPRV_QTPRESCRITA: TFMTBCDField
      FieldName = 'PRV_QTPRESCRITA'
      Precision = 18
      Size = 3
    end
    object cdsDetalheProdutoPRV_VLPRECO_SUBSIDIADO: TFMTBCDField
      FieldName = 'PRV_VLPRECO_SUBSIDIADO'
      Precision = 18
      Size = 3
    end
    object cdsDetalheProdutoPRV_VLPRECO_SUBPACIENTE: TFMTBCDField
      FieldName = 'PRV_VLPRECO_SUBPACIENTE'
      Precision = 18
      Size = 3
    end
    object cdsDetalheProdutoPRV_VLPRECO_SUBPAC_POSESTORNO: TFMTBCDField
      FieldName = 'PRV_VLPRECO_SUBPAC_POSESTORNO'
      Precision = 18
      Size = 3
    end
    object cdsDetalheProdutoPRV_VLSUBMS_POSESTORNO: TFMTBCDField
      FieldName = 'PRV_VLSUBMS_POSESTORNO'
      Precision = 18
      Size = 3
    end
    object cdsDetalheProdutoPRV_VLTOTAL_POSESTORNO: TFMTBCDField
      FieldName = 'PRV_VLTOTAL_POSESTORNO'
      Precision = 18
      Size = 3
    end
    object cdsDetalheProdutoPRV_FLCANC: TStringField
      FieldName = 'PRV_FLCANC'
      FixedChar = True
      Size = 1
    end
    object cdsDetalheProdutoPRV_QTESTORNADA: TFMTBCDField
      FieldName = 'PRV_QTESTORNADA'
      Precision = 18
      Size = 3
    end
  end
  object qryUsuario: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from USUARIOS where (SEN_CODIGO = :pCODIGO)')
    SQLConnection = sqlConnGerenciador
    Left = 512
    Top = 256
    object qryUsuarioSEN_CODIGO: TIntegerField
      FieldName = 'SEN_CODIGO'
      Required = True
    end
    object qryUsuarioSEN_NOME: TStringField
      FieldName = 'SEN_NOME'
      Size = 40
    end
    object qryUsuarioSEN_SNATUA: TStringField
      FieldName = 'SEN_SNATUA'
      FixedChar = True
      Size = 6
    end
    object qryUsuarioSEN_CARGO: TStringField
      FieldName = 'SEN_CARGO'
    end
    object qryUsuarioSEN_IMPRESSORA: TIntegerField
      FieldName = 'SEN_IMPRESSORA'
    end
    object qryUsuarioSEN_DTATUAL: TDateField
      FieldName = 'SEN_DTATUAL'
    end
    object qryUsuarioSEN_PASTA: TStringField
      FieldName = 'SEN_PASTA'
      Size = 80
    end
    object qryUsuarioSEN_SENHA_VENDEDOR: TStringField
      FieldName = 'SEN_SENHA_VENDEDOR'
      Size = 8
    end
  end
  object dstVendedores: TSQLDataSet
    CommandText = 'select * from VENDEDORES Where (VEN_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = sqlConnGerenciador
    Left = 560
    Top = 40
    object dstVendedoresVEN_CODIGO: TIntegerField
      FieldName = 'VEN_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstVendedoresVEN_NOME: TStringField
      FieldName = 'VEN_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstVendedoresVEN_CPF: TStringField
      FieldName = 'VEN_CPF'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object dstVendedoresVEN_LOGIN: TStringField
      FieldName = 'VEN_LOGIN'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object dstVendedoresVEN_SENHA: TStringField
      FieldName = 'VEN_SENHA'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object dspVendedores: TDataSetProvider
    DataSet = dstVendedores
    Options = [poAllowCommandText]
    Left = 568
    Top = 88
  end
  object cdsVendedores: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspVendedores'
    Left = 568
    Top = 144
    object cdsVendedoresVEN_CODIGO: TIntegerField
      FieldName = 'VEN_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsVendedoresVEN_NOME: TStringField
      FieldName = 'VEN_NOME'
      Size = 30
    end
    object cdsVendedoresVEN_CPF: TStringField
      Alignment = taRightJustify
      FieldName = 'VEN_CPF'
      EditMask = '###.###.###-##;0;_'
      Size = 11
    end
    object cdsVendedoresVEN_LOGIN: TStringField
      FieldName = 'VEN_LOGIN'
      Size = 15
    end
    object cdsVendedoresVEN_SENHA: TStringField
      FieldName = 'VEN_SENHA'
      Size = 8
    end
  end
  object dstPadrao2: TSQLDataSet
    CommandText = 
      'Select VEN_CODIGO, VEN_NOME, VEN_CPF from VENDEDORES order by VE' +
      'N_NOME'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConnGerenciador
    Left = 584
    Top = 200
  end
  object dspPadrao2: TDataSetProvider
    DataSet = dstPadrao2
    Options = [poAllowCommandText]
    Left = 584
    Top = 248
  end
  object cdsListaVendedores: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select VEN_CODIGO, VEN_NOME, VEN_CPF from VENDEDORES order by VE' +
      'N_NOME'
    Params = <>
    ProviderName = 'dspPadrao2'
    Left = 576
    Top = 304
    object cdsListaVendedoresVEN_CODIGO: TIntegerField
      FieldName = 'VEN_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsListaVendedoresVEN_NOME: TStringField
      FieldName = 'VEN_NOME'
      Size = 30
    end
    object cdsListaVendedoresVEN_CPF: TStringField
      FieldName = 'VEN_CPF'
      EditMask = '###.###.###-##;0;_'
      Size = 11
    end
  end
  object qryPesProduto: TQuery
    DatabaseName = 'GERENCIADOR'
    SQL.Strings = (
      'Select PRO_CDBARR, PRO_NMPROD, PRO_VLVEND, PRO_QTARMA'
      'from "SACPRO.DBF" Where (PRO_CDBARR = :pBARRAS)')
    Left = 584
    Top = 368
    ParamData = <
      item
        DataType = ftString
        Name = 'pBARRAS'
        ParamType = ptInput
      end>
    object qryPesProdutoPRO_CDBARR: TStringField
      FieldName = 'PRO_CDBARR'
      Origin = 'GERENCIADOR."SACPRO.DBF".PRO_CDBARR'
      Size = 13
    end
    object qryPesProdutoPRO_NMPROD: TStringField
      FieldName = 'PRO_NMPROD'
      Origin = 'GERENCIADOR."SACPRO.DBF".PRO_NMPROD'
      Size = 40
    end
    object qryPesProdutoPRO_VLVEND: TFloatField
      FieldName = 'PRO_VLVEND'
      Origin = 'GERENCIADOR."SACPRO.DBF".PRO_VLVEND'
    end
    object qryPesProdutoPRO_QTARMA: TFloatField
      FieldName = 'PRO_QTARMA'
      Origin = 'GERENCIADOR."SACPRO.DBF".PRO_QTARMA'
    end
  end
  object cdsAtualizaDescProd: TClientDataSet
    Aggregates = <>
    CommandText = 
      'Select * from PRODUTOS_VENDAS PV Where (pv.prv_codsolicitacao = ' +
      ':pVENDA) and (pv.prv_codbarras = :pBARRAS);'
    Params = <
      item
        DataType = ftInteger
        Name = 'pVENDA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pBARRAS'
        ParamType = ptInput
      end>
    ProviderName = 'dspPadrao'
    Left = 568
    Top = 440
    object cdsAtualizaDescProdPRV_CODSOLICITACAO: TIntegerField
      FieldName = 'PRV_CODSOLICITACAO'
      Required = True
    end
    object cdsAtualizaDescProdPRV_CODBARRAS: TStringField
      FieldName = 'PRV_CODBARRAS'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsAtualizaDescProdPRV_NOMEAPRESENTACAO: TStringField
      FieldName = 'PRV_NOMEAPRESENTACAO'
      Size = 40
    end
  end
  object cdsVendaXML: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 648
    Top = 16
    Data = {
      B00300009619E0BD01000000180000001E000000000003000000B00309434453
      5F56454E444104000100000000000F4344535F43504650414349454E54450100
      490000000100055749445448020002000B000E4344535F43524D5F4D45444943
      4F01004900000001000557494454480200020005000D4344535F4454454D4953
      53414F04000600000000000B4344535F4E524355504F4D010049000000010005
      57494454480200020007000F4344535F56414C4F525F544F54414C0800040000
      0000000D4344535F564C5041474F5F4D530800040000000000124344535F564C
      5041474F5F434C49454E544508000400000000000E4344535F4E4F4D45504553
      534F410100490000000100055749445448020002003C000B4344535F44545645
      4E444104000600000000000B4344535F484F56454E4441010049000000010005
      57494454480200020008000F4344535F4155544F52495A4143414F0100490000
      000100055749445448020002002800104344535F4155544F524553544F524E4F
      01004900000001000557494454480200020028000A4344535F464C5349545501
      00490000000100055749445448020002000100124344535F445443414E43454C
      414D454E544F04000600000000000D4344535F43445553554152494F04000100
      000000000F4344535F434F4456454E4445444F5204000100000000000F434453
      5F544558544F5F4355504F4D04004B0000000200075355425459504502004900
      070042696E61727900055749445448020002000004134344535F4355504F4D5F
      56494E43554C41444F04004B0000000200075355425459504502004900070042
      696E617279000557494454480200020000040F4344535F4954454D5F4E524954
      454D0400010000000000124344535F4954454D5F434F44424152524153010049
      0000000100055749445448020002000E00144344535F4954454D5F4E4F4D4550
      524F4455544F0100490000000100055749445448020002003C00104344535F49
      54454D5F564C56454E44410800040000000000154344535F4954454D5F515453
      4F4C494349544144410800040000000000164344535F4954454D5F51545F4155
      544F52495A41444108000400000000000E4344535F4954454D5F544F54414C08
      000400000000000D4344535F4954454D5F50474D530800040000000000124344
      535F4954454D5F5047434C49454E54450800040000000000144344535F495445
      4D5F515443414E43454C4144410800040000000000144344535F4954454D5F51
      5450524553435249544108000400000000000000}
    object cdsVendaXMLCDS_VENDA: TIntegerField
      FieldName = 'CDS_VENDA'
    end
    object cdsVendaXMLCDS_CPFPACIENTE: TStringField
      FieldName = 'CDS_CPFPACIENTE'
      Size = 11
    end
    object cdsVendaXMLCDS_CRM_MEDICO: TStringField
      FieldName = 'CDS_CRM_MEDICO'
      Size = 5
    end
    object cdsVendaXMLCDS_DTEMISSAO: TDateField
      FieldName = 'CDS_DTEMISSAO'
    end
    object cdsVendaXMLCDS_NRCUPOM: TStringField
      FieldName = 'CDS_NRCUPOM'
      Size = 7
    end
    object cdsVendaXMLCDS_VALOR_TOTAL: TFloatField
      FieldName = 'CDS_VALOR_TOTAL'
    end
    object cdsVendaXMLCDS_VLPAGO_MS: TFloatField
      FieldName = 'CDS_VLPAGO_MS'
    end
    object cdsVendaXMLCDS_VLPAGO_CLIENTE: TFloatField
      FieldName = 'CDS_VLPAGO_CLIENTE'
    end
    object cdsVendaXMLCDS_NOMEPESSOA: TStringField
      FieldName = 'CDS_NOMEPESSOA'
      Size = 60
    end
    object cdsVendaXMLCDS_DTVENDA: TDateField
      FieldName = 'CDS_DTVENDA'
    end
    object cdsVendaXMLCDS_HOVENDA: TStringField
      FieldName = 'CDS_HOVENDA'
      Size = 8
    end
    object cdsVendaXMLCDS_AUTORIZACAO: TStringField
      FieldName = 'CDS_AUTORIZACAO'
      Size = 40
    end
    object cdsVendaXMLCDS_AUTORESTORNO: TStringField
      FieldName = 'CDS_AUTORESTORNO'
      Size = 40
    end
    object cdsVendaXMLCDS_FLSITU: TStringField
      FieldName = 'CDS_FLSITU'
      Size = 1
    end
    object cdsVendaXMLCDS_DTCANCELAMENTO: TDateField
      FieldName = 'CDS_DTCANCELAMENTO'
    end
    object cdsVendaXMLCDS_CDUSUARIO: TIntegerField
      FieldName = 'CDS_CDUSUARIO'
    end
    object cdsVendaXMLCDS_CODVENDEDOR: TIntegerField
      FieldName = 'CDS_CODVENDEDOR'
    end
    object cdsVendaXMLCDS_TEXTO_CUPOM: TBlobField
      FieldName = 'CDS_TEXTO_CUPOM'
      Size = 1024
    end
    object cdsVendaXMLCDS_CUPOM_VINCULADO: TBlobField
      FieldName = 'CDS_CUPOM_VINCULADO'
      Size = 1024
    end
    object cdsVendaXMLCDS_ITEM_NRITEM: TIntegerField
      FieldName = 'CDS_ITEM_NRITEM'
    end
    object cdsVendaXMLCDS_ITEM_CODBARRAS: TStringField
      FieldName = 'CDS_ITEM_CODBARRAS'
      Size = 14
    end
    object cdsVendaXMLCDS_ITEM_NOMEPRODUTO: TStringField
      FieldName = 'CDS_ITEM_NOMEPRODUTO'
      Size = 60
    end
    object cdsVendaXMLCDS_ITEM_VLVENDA: TFloatField
      FieldName = 'CDS_ITEM_VLVENDA'
    end
    object cdsVendaXMLCDS_ITEM_QTSOLICITADA: TFloatField
      FieldName = 'CDS_ITEM_QTSOLICITADA'
    end
    object cdsVendaXMLCDS_ITEM_QT_AUTORIZADA: TFloatField
      FieldName = 'CDS_ITEM_QT_AUTORIZADA'
    end
    object cdsVendaXMLCDS_ITEM_TOTAL: TFloatField
      FieldName = 'CDS_ITEM_TOTAL'
    end
    object cdsVendaXMLCDS_ITEM_PGMS: TFloatField
      FieldName = 'CDS_ITEM_PGMS'
    end
    object cdsVendaXMLCDS_ITEM_PGCLIENTE: TFloatField
      FieldName = 'CDS_ITEM_PGCLIENTE'
    end
    object cdsVendaXMLCDS_ITEM_QTCANCELADA: TFloatField
      FieldName = 'CDS_ITEM_QTCANCELADA'
    end
    object cdsVendaXMLCDS_ITEM_QTPRESCRITA: TFloatField
      FieldName = 'CDS_ITEM_QTPRESCRITA'
    end
  end
  object dstMedicamentos: TSQLDataSet
    CommandText = 
      'Select M.MOV_DTVENDA, M.mov_flsitu, VP.prv_codsolicitacao, VP.pr' +
      'v_codbarras, VP.prv_nomeapresentacao,'#13#10'VP.prv_quantidade, VP.prv' +
      '_quantidade_prescrita, VP.prv_quantidade_autorizada from VENDAS ' +
      'M'#13#10'Inner Join PRODUTOS_VENDAS VP on M.MOV_CODSOLICITACAO = VP.pr' +
      'v_codsolicitacao'#13#10'Where (M.MOV_DTVENDA >= :pDTMOVI1) and (M.MOV_' +
      'DTVENDA <= :pDTMOVI2) ORDER BY VP.prv_codsolicitacao'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'pDTMOVI1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTMOVI2'
        ParamType = ptInput
      end>
    SQLConnection = sqlConnGerenciador
    Left = 664
    Top = 72
  end
  object dspMedicamentos: TDataSetProvider
    DataSet = dstMedicamentos
    Options = [poAllowCommandText]
    Left = 664
    Top = 120
  end
  object cdsMedicamentos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'pDTMOVI1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDTMOVI2'
        ParamType = ptInput
      end>
    ProviderName = 'dspMedicamentos'
    Left = 664
    Top = 168
    object cdsMedicamentosMOV_DTVENDA: TDateField
      FieldName = 'MOV_DTVENDA'
    end
    object cdsMedicamentosMOV_FLSITU: TStringField
      FieldName = 'MOV_FLSITU'
      FixedChar = True
      Size = 1
    end
    object cdsMedicamentosPRV_CODSOLICITACAO: TIntegerField
      FieldName = 'PRV_CODSOLICITACAO'
      Required = True
    end
    object cdsMedicamentosPRV_CODBARRAS: TStringField
      FieldName = 'PRV_CODBARRAS'
      Required = True
      FixedChar = True
      Size = 13
    end
    object cdsMedicamentosPRV_NOMEAPRESENTACAO: TStringField
      FieldName = 'PRV_NOMEAPRESENTACAO'
      Size = 40
    end
    object cdsMedicamentosPRV_QUANTIDADE: TFMTBCDField
      FieldName = 'PRV_QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object cdsMedicamentosPRV_QUANTIDADE_PRESCRITA: TFMTBCDField
      FieldName = 'PRV_QUANTIDADE_PRESCRITA'
      Precision = 18
      Size = 3
    end
    object cdsMedicamentosPRV_QUANTIDADE_AUTORIZADA: TFMTBCDField
      FieldName = 'PRV_QUANTIDADE_AUTORIZADA'
      Precision = 18
      Size = 3
    end
  end
  object dstPreSolicitacao: TSQLDataSet
    CommandText = 
      'select * from PRESOLICITACAO where (PRE_CUPOMFISCAL = :pCUPOMFIS' +
      'CAL)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCUPOMFISCAL'
        ParamType = ptInput
      end>
    SQLConnection = sqlConnGerenciador
    Left = 664
    Top = 224
    object dstPreSolicitacaoPRE_CPFPACIENTE: TStringField
      FieldName = 'PRE_CPFPACIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 11
    end
    object dstPreSolicitacaoPRE_AUTORIZACAO: TStringField
      FieldName = 'PRE_AUTORIZACAO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstPreSolicitacaoPRE_CUPOMFISCAL: TStringField
      FieldName = 'PRE_CUPOMFISCAL'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dstPreSolicitacaoPRE_CRM: TStringField
      FieldName = 'PRE_CRM'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dstPreSolicitacaoPRE_CRM_UF: TStringField
      FieldName = 'PRE_CRM_UF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstPreSolicitacaoPRE_DTMOVIMENTO: TDateField
      FieldName = 'PRE_DTMOVIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstPreSolicitacaoPRE_HOMOVIMENTO: TStringField
      FieldName = 'PRE_HOMOVIMENTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dstPreSolicitacaoPRE_CODIGOBARRAS: TStringField
      FieldName = 'PRE_CODIGOBARRAS'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object dstPreSolicitacaoPRE_NOME_MEDICAMENTO: TStringField
      FieldName = 'PRE_NOME_MEDICAMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object dstPreSolicitacaoPRE_QTSOLICITADA: TFMTBCDField
      FieldName = 'PRE_QTSOLICITADA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstPreSolicitacaoPRE_QTPREESCRITA: TFMTBCDField
      FieldName = 'PRE_QTPREESCRITA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstPreSolicitacaoPRE_QTAUTORIZADA: TFMTBCDField
      FieldName = 'PRE_QTAUTORIZADA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstPreSolicitacaoPRE_VALOR_VENDA: TFMTBCDField
      FieldName = 'PRE_VALOR_VENDA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstPreSolicitacaoPRE_PARCELA_MS: TFMTBCDField
      FieldName = 'PRE_PARCELA_MS'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstPreSolicitacaoPRE_PARCELA_CLIENTE: TFMTBCDField
      FieldName = 'PRE_PARCELA_CLIENTE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstPreSolicitacaoPRE_VENDEDOR: TIntegerField
      FieldName = 'PRE_VENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object dstPreSolicitacaoPRE_STATUS: TStringField
      FieldName = 'PRE_STATUS'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstPreSolicitacaoPRE_MOTIVO: TStringField
      FieldName = 'PRE_MOTIVO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object dstPreSolicitacaoPRE_CONFIRMADA: TStringField
      FieldName = 'PRE_CONFIRMADA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object dspPreSolicitacao: TDataSetProvider
    DataSet = dstPreSolicitacao
    Options = [poAllowCommandText]
    Left = 664
    Top = 272
  end
  object cdsPreSolicitiacao: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'pCUPOMFISCAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspPreSolicitacao'
    Left = 664
    Top = 328
    object cdsPreSolicitiacaoPRE_CPFPACIENTE: TStringField
      FieldName = 'PRE_CPFPACIENTE'
      Required = True
      Size = 11
    end
    object cdsPreSolicitiacaoPRE_AUTORIZACAO: TStringField
      FieldName = 'PRE_AUTORIZACAO'
      Size = 30
    end
    object cdsPreSolicitiacaoPRE_CUPOMFISCAL: TStringField
      FieldName = 'PRE_CUPOMFISCAL'
      Size = 8
    end
    object cdsPreSolicitiacaoPRE_CRM: TStringField
      FieldName = 'PRE_CRM'
      Size = 8
    end
    object cdsPreSolicitiacaoPRE_CRM_UF: TStringField
      FieldName = 'PRE_CRM_UF'
      FixedChar = True
      Size = 2
    end
    object cdsPreSolicitiacaoPRE_DTMOVIMENTO: TDateField
      FieldName = 'PRE_DTMOVIMENTO'
    end
    object cdsPreSolicitiacaoPRE_HOMOVIMENTO: TStringField
      FieldName = 'PRE_HOMOVIMENTO'
      FixedChar = True
      Size = 8
    end
    object cdsPreSolicitiacaoPRE_CODIGOBARRAS: TStringField
      FieldName = 'PRE_CODIGOBARRAS'
      Size = 14
    end
    object cdsPreSolicitiacaoPRE_NOME_MEDICAMENTO: TStringField
      FieldName = 'PRE_NOME_MEDICAMENTO'
      Size = 60
    end
    object cdsPreSolicitiacaoPRE_QTSOLICITADA: TFMTBCDField
      FieldName = 'PRE_QTSOLICITADA'
      Precision = 18
      Size = 3
    end
    object cdsPreSolicitiacaoPRE_QTPREESCRITA: TFMTBCDField
      FieldName = 'PRE_QTPREESCRITA'
      Precision = 18
      Size = 3
    end
    object cdsPreSolicitiacaoPRE_QTAUTORIZADA: TFMTBCDField
      FieldName = 'PRE_QTAUTORIZADA'
      Precision = 18
      Size = 3
    end
    object cdsPreSolicitiacaoPRE_VALOR_VENDA: TFMTBCDField
      FieldName = 'PRE_VALOR_VENDA'
      Precision = 18
      Size = 2
    end
    object cdsPreSolicitiacaoPRE_PARCELA_MS: TFMTBCDField
      FieldName = 'PRE_PARCELA_MS'
      Precision = 18
      Size = 2
    end
    object cdsPreSolicitiacaoPRE_PARCELA_CLIENTE: TFMTBCDField
      FieldName = 'PRE_PARCELA_CLIENTE'
      Precision = 18
      Size = 2
    end
    object cdsPreSolicitiacaoPRE_VENDEDOR: TIntegerField
      FieldName = 'PRE_VENDEDOR'
    end
    object cdsPreSolicitiacaoPRE_STATUS: TStringField
      FieldName = 'PRE_STATUS'
      FixedChar = True
      Size = 5
    end
    object cdsPreSolicitiacaoPRE_MOTIVO: TStringField
      FieldName = 'PRE_MOTIVO'
      Size = 200
    end
    object cdsPreSolicitiacaoPRE_CONFIRMADA: TStringField
      FieldName = 'PRE_CONFIRMADA'
      FixedChar = True
      Size = 1
    end
  end
  object dstAtualizarVenda: TSQLDataSet
    CommandText = 'Select * from VENDAS where ( MOV_CODSOLICITACAO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    SQLConnection = sqlConnGerenciador
    Left = 664
    Top = 376
    object dstAtualizarVendaMOV_CODSOLICITACAO: TIntegerField
      FieldName = 'MOV_CODSOLICITACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstAtualizarVendaMOV_CPFPACIENTE: TStringField
      FieldName = 'MOV_CPFPACIENTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 11
    end
    object dstAtualizarVendaMOV_CRM_MEDICO: TStringField
      FieldName = 'MOV_CRM_MEDICO'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object dstAtualizarVendaMOV_DTEMISSAO: TDateField
      FieldName = 'MOV_DTEMISSAO'
      ProviderFlags = [pfInUpdate]
    end
    object dstAtualizarVendaMOV_NRADM: TIntegerField
      FieldName = 'MOV_NRADM'
      ProviderFlags = [pfInUpdate]
    end
    object dstAtualizarVendaMOV_NRCUPOM: TIntegerField
      FieldName = 'MOV_NRCUPOM'
      ProviderFlags = [pfInUpdate]
    end
    object dstAtualizarVendaMOV_VALOR: TFMTBCDField
      FieldName = 'MOV_VALOR'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstAtualizarVendaMOV_VLPAGO: TFMTBCDField
      FieldName = 'MOV_VLPAGO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstAtualizarVendaMOV_VLDEBITO: TFMTBCDField
      FieldName = 'MOV_VLDEBITO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstAtualizarVendaMOV_NRAUTORIZACAO: TIntegerField
      FieldName = 'MOV_NRAUTORIZACAO'
      ProviderFlags = [pfInUpdate]
    end
    object dstAtualizarVendaMOV_NOMEPESSOA: TStringField
      FieldName = 'MOV_NOMEPESSOA'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstAtualizarVendaMOV_CODINDICADOR: TIntegerField
      FieldName = 'MOV_CODINDICADOR'
      ProviderFlags = [pfInUpdate]
    end
    object dstAtualizarVendaMOV_DTVENDA: TDateField
      FieldName = 'MOV_DTVENDA'
      ProviderFlags = [pfInUpdate]
    end
    object dstAtualizarVendaMOV_HOVENDA: TStringField
      FieldName = 'MOV_HOVENDA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstAtualizarVendaMOV_AUTORIZACAO: TStringField
      FieldName = 'MOV_AUTORIZACAO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstAtualizarVendaMOV_AUTORESTORNO: TStringField
      FieldName = 'MOV_AUTORESTORNO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstAtualizarVendaMOV_FLSITU: TStringField
      FieldName = 'MOV_FLSITU'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstAtualizarVendaMOV_DTCANCELAMENTO: TDateField
      FieldName = 'MOV_DTCANCELAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstAtualizarVendaMOV_CDUSUARIO: TIntegerField
      FieldName = 'MOV_CDUSUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object dstAtualizarVendaMOV_CODVENDEDOR: TIntegerField
      FieldName = 'MOV_CODVENDEDOR'
      ProviderFlags = [pfInUpdate]
    end
    object dstAtualizarVendaMOV_TEXTO_CUPOM: TMemoField
      FieldName = 'MOV_TEXTO_CUPOM'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object dstAtualizarVendaMOV_CUPOM_VINCULADO: TMemoField
      FieldName = 'MOV_CUPOM_VINCULADO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
  end
  object dspAtualizarVenda: TDataSetProvider
    DataSet = dstAtualizarVenda
    Options = [poAllowCommandText]
    Left = 664
    Top = 424
  end
  object cdsAtualizarVenda: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspAtualizarVenda'
    Left = 664
    Top = 472
    object cdsAtualizarVendaMOV_CODSOLICITACAO: TIntegerField
      FieldName = 'MOV_CODSOLICITACAO'
      Required = True
    end
    object cdsAtualizarVendaMOV_CPFPACIENTE: TStringField
      FieldName = 'MOV_CPFPACIENTE'
      FixedChar = True
      Size = 11
    end
    object cdsAtualizarVendaMOV_CRM_MEDICO: TStringField
      FieldName = 'MOV_CRM_MEDICO'
      Size = 5
    end
    object cdsAtualizarVendaMOV_DTEMISSAO: TDateField
      FieldName = 'MOV_DTEMISSAO'
    end
    object cdsAtualizarVendaMOV_NRADM: TIntegerField
      FieldName = 'MOV_NRADM'
    end
    object cdsAtualizarVendaMOV_NRCUPOM: TIntegerField
      FieldName = 'MOV_NRCUPOM'
    end
    object cdsAtualizarVendaMOV_VALOR: TFMTBCDField
      FieldName = 'MOV_VALOR'
      Precision = 18
      Size = 2
    end
    object cdsAtualizarVendaMOV_VLPAGO: TFMTBCDField
      FieldName = 'MOV_VLPAGO'
      Precision = 18
      Size = 2
    end
    object cdsAtualizarVendaMOV_VLDEBITO: TFMTBCDField
      FieldName = 'MOV_VLDEBITO'
      Precision = 18
      Size = 2
    end
    object cdsAtualizarVendaMOV_NRAUTORIZACAO: TIntegerField
      FieldName = 'MOV_NRAUTORIZACAO'
    end
    object cdsAtualizarVendaMOV_NOMEPESSOA: TStringField
      FieldName = 'MOV_NOMEPESSOA'
      Size = 40
    end
    object cdsAtualizarVendaMOV_CODINDICADOR: TIntegerField
      FieldName = 'MOV_CODINDICADOR'
    end
    object cdsAtualizarVendaMOV_DTVENDA: TDateField
      FieldName = 'MOV_DTVENDA'
    end
    object cdsAtualizarVendaMOV_HOVENDA: TStringField
      FieldName = 'MOV_HOVENDA'
      FixedChar = True
      Size = 5
    end
    object cdsAtualizarVendaMOV_AUTORIZACAO: TStringField
      FieldName = 'MOV_AUTORIZACAO'
      Size = 40
    end
    object cdsAtualizarVendaMOV_AUTORESTORNO: TStringField
      FieldName = 'MOV_AUTORESTORNO'
      Size = 40
    end
    object cdsAtualizarVendaMOV_FLSITU: TStringField
      FieldName = 'MOV_FLSITU'
      FixedChar = True
      Size = 1
    end
    object cdsAtualizarVendaMOV_DTCANCELAMENTO: TDateField
      FieldName = 'MOV_DTCANCELAMENTO'
    end
    object cdsAtualizarVendaMOV_CDUSUARIO: TIntegerField
      FieldName = 'MOV_CDUSUARIO'
    end
    object cdsAtualizarVendaMOV_CODVENDEDOR: TIntegerField
      FieldName = 'MOV_CODVENDEDOR'
    end
    object cdsAtualizarVendaMOV_TEXTO_CUPOM: TMemoField
      FieldName = 'MOV_TEXTO_CUPOM'
      BlobType = ftMemo
    end
    object cdsAtualizarVendaMOV_CUPOM_VINCULADO: TMemoField
      FieldName = 'MOV_CUPOM_VINCULADO'
      BlobType = ftMemo
    end
  end
  object dstDocumentosVenda: TSQLDataSet
    CommandText = 
      'select MOV_CODSOLICITACAO, MOV_IMG_RECEITA, MOV_IMG_CUPOM_FISCAL' +
      ', MOV_DOC_IDENTIFICACAO, MOV_DOC_PROCURACAO, MOV_DOC_CARTA from ' +
      'VENDAS'#13#10'where (MOV_CODSOLICITACAO = :pvenda)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pvenda'
        ParamType = ptInput
      end>
    SQLConnection = sqlConnGerenciador
    Left = 744
    Top = 16
    object dstDocumentosVendaMOV_CODSOLICITACAO: TIntegerField
      FieldName = 'MOV_CODSOLICITACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstDocumentosVendaMOV_IMG_RECEITA: TGraphicField
      FieldName = 'MOV_IMG_RECEITA'
      ProviderFlags = [pfInUpdate]
      BlobType = ftGraphic
    end
    object dstDocumentosVendaMOV_IMG_CUPOM_FISCAL: TGraphicField
      FieldName = 'MOV_IMG_CUPOM_FISCAL'
      ProviderFlags = [pfInUpdate]
      BlobType = ftGraphic
    end
    object dstDocumentosVendaMOV_DOC_IDENTIFICACAO: TGraphicField
      FieldName = 'MOV_DOC_IDENTIFICACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftGraphic
    end
    object dstDocumentosVendaMOV_DOC_PROCURACAO: TGraphicField
      FieldName = 'MOV_DOC_PROCURACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftGraphic
    end
    object dstDocumentosVendaMOV_DOC_CARTA: TGraphicField
      FieldName = 'MOV_DOC_CARTA'
      ProviderFlags = [pfInUpdate]
      BlobType = ftGraphic
    end
  end
  object dspDocumentosVenda: TDataSetProvider
    DataSet = dstDocumentosVenda
    Options = [poAllowCommandText]
    Left = 744
    Top = 64
  end
  object cdsDocumentosVenda: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pvenda'
        ParamType = ptInput
      end>
    ProviderName = 'dspDocumentosVenda'
    Left = 744
    Top = 112
    object cdsDocumentosVendaMOV_CODSOLICITACAO: TIntegerField
      FieldName = 'MOV_CODSOLICITACAO'
      Required = True
    end
    object cdsDocumentosVendaMOV_IMG_RECEITA: TGraphicField
      FieldName = 'MOV_IMG_RECEITA'
      BlobType = ftGraphic
    end
    object cdsDocumentosVendaMOV_IMG_CUPOM_FISCAL: TGraphicField
      FieldName = 'MOV_IMG_CUPOM_FISCAL'
      BlobType = ftGraphic
    end
    object cdsDocumentosVendaMOV_DOC_IDENTIFICACAO: TGraphicField
      FieldName = 'MOV_DOC_IDENTIFICACAO'
      BlobType = ftGraphic
    end
    object cdsDocumentosVendaMOV_DOC_PROCURACAO: TGraphicField
      FieldName = 'MOV_DOC_PROCURACAO'
      BlobType = ftGraphic
    end
    object cdsDocumentosVendaMOV_DOC_CARTA: TGraphicField
      FieldName = 'MOV_DOC_CARTA'
      BlobType = ftGraphic
    end
  end
  object dstDocumentosVendas: TSQLDataSet
    CommandText = 
      'SELECT V.MOV_CODSOLICITACAO, V.MOV_CPFPACIENTE, V.MOV_DTVENDA, V' +
      '.MOV_FLSITU,'#13#10'V.MOV_IMG_RECEITA, V.MOV_IMG_CUPOM_FISCAL, V.MOV_D' +
      'OC_IDENTIFICACAO, V.MOV_DOC_PROCURACAO,'#13#10'V.MOV_DOC_CARTA, V.MOV_' +
      'NRCUPOM'#13#10'FROM VENDAS V WHERE (V.mov_cpfpaciente = :pCPF) AND (V.' +
      'MOV_FLSITU = '#39'F'#39')'#13#10'and (V.MOV_DTVENDA >= :pDTINIC) and (V.MOV_DT' +
      'VENDA <= :pDTFINAL) ORDER BY V.MOV_CODSOLICITACAO DESC'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCPF'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDTINIC'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDTFINAL'
        ParamType = ptInput
      end>
    SQLConnection = sqlConnGerenciador
    Left = 736
    Top = 184
    object dstDocumentosVendasMOV_CODSOLICITACAO: TIntegerField
      FieldName = 'MOV_CODSOLICITACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstDocumentosVendasMOV_NRCUPOM: TIntegerField
      FieldName = 'MOV_NRCUPOM'
    end
    object dstDocumentosVendasMOV_CPFPACIENTE: TStringField
      FieldName = 'MOV_CPFPACIENTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 11
    end
    object dstDocumentosVendasMOV_DTVENDA: TDateField
      FieldName = 'MOV_DTVENDA'
      ProviderFlags = [pfInUpdate]
    end
    object dstDocumentosVendasMOV_FLSITU: TStringField
      FieldName = 'MOV_FLSITU'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstDocumentosVendasMOV_IMG_RECEITA: TGraphicField
      FieldName = 'MOV_IMG_RECEITA'
      ProviderFlags = [pfInUpdate]
      BlobType = ftGraphic
    end
    object dstDocumentosVendasMOV_IMG_CUPOM_FISCAL: TGraphicField
      FieldName = 'MOV_IMG_CUPOM_FISCAL'
      ProviderFlags = [pfInUpdate]
      BlobType = ftGraphic
    end
    object dstDocumentosVendasMOV_DOC_IDENTIFICACAO: TGraphicField
      FieldName = 'MOV_DOC_IDENTIFICACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftGraphic
    end
    object dstDocumentosVendasMOV_DOC_PROCURACAO: TGraphicField
      FieldName = 'MOV_DOC_PROCURACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftGraphic
    end
    object dstDocumentosVendasMOV_DOC_CARTA: TGraphicField
      FieldName = 'MOV_DOC_CARTA'
      ProviderFlags = [pfInUpdate]
      BlobType = ftGraphic
    end
  end
  object dspDocumentosVendas: TDataSetProvider
    DataSet = dstDocumentosVendas
    Options = [poAllowCommandText]
    Left = 744
    Top = 240
  end
  object cdsDocumentosVendas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'pCPF'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDTINIC'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'pDTFINAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspDocumentosVendas'
    Left = 736
    Top = 288
    object cdsDocumentosVendasMOV_CODSOLICITACAO: TIntegerField
      FieldName = 'MOV_CODSOLICITACAO'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsDocumentosVendasMOV_NRCUPOM: TIntegerField
      FieldName = 'MOV_NRCUPOM'
    end
    object cdsDocumentosVendasMOV_CPFPACIENTE: TStringField
      FieldName = 'MOV_CPFPACIENTE'
      EditMask = '###.###.###-##;0;_'
      FixedChar = True
      Size = 11
    end
    object cdsDocumentosVendasMOV_DTVENDA: TDateField
      Alignment = taRightJustify
      FieldName = 'MOV_DTVENDA'
    end
    object cdsDocumentosVendasMOV_FLSITU: TStringField
      FieldName = 'MOV_FLSITU'
      FixedChar = True
      Size = 1
    end
    object cdsDocumentosVendasMOV_IMG_RECEITA: TGraphicField
      FieldName = 'MOV_IMG_RECEITA'
      BlobType = ftGraphic
    end
    object cdsDocumentosVendasMOV_IMG_CUPOM_FISCAL: TGraphicField
      FieldName = 'MOV_IMG_CUPOM_FISCAL'
      BlobType = ftGraphic
    end
    object cdsDocumentosVendasMOV_DOC_IDENTIFICACAO: TGraphicField
      FieldName = 'MOV_DOC_IDENTIFICACAO'
      BlobType = ftGraphic
    end
    object cdsDocumentosVendasMOV_DOC_PROCURACAO: TGraphicField
      FieldName = 'MOV_DOC_PROCURACAO'
      BlobType = ftGraphic
    end
    object cdsDocumentosVendasMOV_DOC_CARTA: TGraphicField
      FieldName = 'MOV_DOC_CARTA'
      BlobType = ftGraphic
    end
  end
  object dstCliente: TSQLDataSet
    CommandText = 'select * from PACIENTES where (PAC_CPF = :pCPF)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pCPF'
        ParamType = ptInput
      end>
    SQLConnection = sqlConnGerenciador
    Left = 744
    Top = 344
    object dstClientePAC_CPF: TStringField
      FieldName = 'PAC_CPF'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 11
    end
    object dstClientePAC_NOME: TStringField
      FieldName = 'PAC_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstClientePAC_IMG_IDENTIDADE: TGraphicField
      FieldName = 'PAC_IMG_IDENTIDADE'
      ProviderFlags = [pfInUpdate]
      BlobType = ftGraphic
    end
  end
  object dspCliente: TDataSetProvider
    DataSet = dstCliente
    Options = [poAllowCommandText]
    Left = 744
    Top = 392
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'pCPF'
        ParamType = ptInput
      end>
    ProviderName = 'dspCliente'
    Left = 752
    Top = 440
    object cdsClientePAC_CPF: TStringField
      Alignment = taRightJustify
      FieldName = 'PAC_CPF'
      EditMask = '999.999.999-99;0;_'
      Size = 11
    end
    object cdsClientePAC_NOME: TStringField
      FieldName = 'PAC_NOME'
      Size = 40
    end
    object cdsClientePAC_IMG_IDENTIDADE: TGraphicField
      FieldName = 'PAC_IMG_IDENTIDADE'
      BlobType = ftGraphic
    end
  end
end
