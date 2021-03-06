object frmLocCliente: TfrmLocCliente
  Left = 240
  Top = 144
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Localizar Cliente'
  ClientHeight = 438
  ClientWidth = 443
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 443
    Height = 73
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 8
      Width = 88
      Height = 13
      Caption = '&Nome do Paciente'
    end
    object edtNome: TEdit
      Left = 13
      Top = 27
      Width = 404
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 40
      ParentCtl3D = False
      TabOrder = 0
      OnChange = edtNomeChange
      OnKeyDown = edtNomeKeyDown
      OnKeyPress = edtNomeKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 443
    Height = 365
    Align = alClient
    TabOrder = 1
    object grdConsultar: TDBGrid
      Left = 1
      Top = 1
      Width = 441
      Height = 363
      TabStop = False
      Align = alClient
      Ctl3D = False
      DataSource = dsConsulta
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Verdana'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = grdConsultarDrawColumnCell
      OnDblClick = grdConsultarDblClick
      OnKeyPress = grdConsultarKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'PAC_CPF'
          Title.Alignment = taCenter
          Title.Caption = 'CPF'
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAC_NOME'
          Title.Caption = 'NOME'
          Width = 324
          Visible = True
        end>
    end
  end
  object dstConsulta: TSQLDataSet
    CommandText = 
      'select * from PACIENTES Where (PAC_NOME like :pNOME)'#13#10'order by P' +
      'AC_NOME'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pNOME'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = dmGerenciador.sqlConnGerenciador
    Left = 64
    Top = 209
  end
  object dspConsulta: TDataSetProvider
    DataSet = dstConsulta
    Options = [poAllowCommandText]
    Left = 96
    Top = 209
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'pNOME'
        ParamType = ptInput
        Value = ''
      end>
    ProviderName = 'dspConsulta'
    Left = 128
    Top = 209
    object cdsConsultaPAC_CPF: TStringField
      FieldName = 'PAC_CPF'
      EditMask = '999.999.999-99;0;_'
      Size = 11
    end
    object cdsConsultaPAC_NOME: TStringField
      FieldName = 'PAC_NOME'
      Size = 40
    end
  end
  object dsConsulta: TDataSource
    DataSet = cdsConsulta
    Left = 168
    Top = 209
  end
end
