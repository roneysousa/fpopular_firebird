inherited frmCadVendedores: TfrmCadVendedores
  Caption = 'Cadastro de Vendedores'
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    ActivePage = TabSheet1
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 16
        Top = 8
        Width = 36
        Height = 13
        Caption = 'C'#243'digo:'
        Transparent = True
      end
      object DBText1: TDBText [1]
        Left = 16
        Top = 24
        Width = 79
        Height = 22
        AutoSize = True
        DataField = 'VEN_CODIGO'
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
        Left = 16
        Top = 56
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = dbeNome
      end
      object Label3: TLabel [3]
        Left = 16
        Top = 96
        Width = 20
        Height = 13
        Caption = 'CPF'
        FocusControl = dbeCPF
      end
      object Label4: TLabel [4]
        Left = 16
        Top = 136
        Width = 62
        Height = 13
        Caption = 'Login do Site'
        FocusControl = dbeLogin
      end
      object Label5: TLabel [5]
        Left = 16
        Top = 176
        Width = 67
        Height = 13
        Caption = 'Senha do Site'
        FocusControl = dbeSenha
      end
      object dbeNome: TDBEdit
        Left = 16
        Top = 72
        Width = 394
        Height = 21
        CharCase = ecUpperCase
        DataField = 'VEN_NOME'
        DataSource = dsCadastro
        TabOrder = 1
        OnExit = dbeNomeExit
      end
      object dbeCPF: TDBEdit
        Left = 16
        Top = 112
        Width = 147
        Height = 21
        DataField = 'VEN_CPF'
        DataSource = dsCadastro
        TabOrder = 2
        OnExit = dbeCPFExit
      end
      object dbeLogin: TDBEdit
        Left = 16
        Top = 152
        Width = 147
        Height = 21
        DataField = 'VEN_LOGIN'
        DataSource = dsCadastro
        TabOrder = 3
      end
      object dbeSenha: TDBEdit
        Left = 16
        Top = 192
        Width = 147
        Height = 21
        CharCase = ecUpperCase
        DataField = 'VEN_SENHA'
        DataSource = dsCadastro
        PasswordChar = '*'
        TabOrder = 4
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        inherited btnConsultar: TBitBtn
          Left = 369
          Top = 44
          Visible = False
        end
        inherited btnAlterar: TBitBtn
          Top = 16
          Caption = '&Ver Registro'
        end
      end
      inherited grdConsultar: TDBGrid
        DataSource = dsConsultar
        OnDblClick = btnAlterarClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VEN_CODIGO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#211'DIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VEN_NOME'
            Title.Caption = 'NOME'
            Width = 445
            Visible = True
          end>
      end
    end
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 
      'Select VEN_CODIGO, VEN_NOME, VEN_CPF from VENDEDORES order by VE' +
      'N_NOME'
    MaxBlobSize = -1
    SQLConnection = dmGerenciador.sqlConnGerenciador
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarVEN_CODIGO: TIntegerField
      FieldName = 'VEN_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsConsultarVEN_NOME: TStringField
      FieldName = 'VEN_NOME'
      Size = 30
    end
    object cdsConsultarVEN_CPF: TStringField
      FieldName = 'VEN_CPF'
      EditMask = '###.###.###-##;0;_'
      Size = 11
    end
  end
  object dsCadastro: TDataSource
    AutoEdit = False
    DataSet = dmGerenciador.cdsVendedores
    Left = 288
    Top = 176
  end
end
