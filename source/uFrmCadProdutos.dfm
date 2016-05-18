inherited frmCadProdutos: TfrmCadProdutos
  Left = 222
  Top = 132
  Caption = 'Tabela de Produtos'
  ClientWidth = 661
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 661
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 16
        Top = 12
        Width = 84
        Height = 13
        Caption = 'C'#243'digo de Barras:'
        Transparent = True
      end
      object Label2: TLabel [1]
        Left = 16
        Top = 56
        Width = 51
        Height = 13
        Caption = 'Descri'#231#227'o:'
        FocusControl = dbeDescricao
        Transparent = True
      end
      object Label3: TLabel [2]
        Left = 16
        Top = 96
        Width = 76
        Height = 13
        Caption = 'Valor de Venda:'
        FocusControl = dbeVLVENDA
        Transparent = True
      end
      object Label4: TLabel [3]
        Left = 16
        Top = 136
        Width = 142
        Height = 13
        Caption = 'Quantidade de Apresenta'#231#227'o:'
        FocusControl = dbeQTAPRES
        Transparent = True
      end
      inherited Panel1: TPanel
        Width = 653
        inherited BtSair: TBitBtn
          Left = 568
        end
        object btImportar: TBitBtn
          Left = 489
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Importar'
          TabOrder = 7
          OnClick = btImportarClick
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6696BA6696BA6696BA669
            6BA6696BA6696BA6696BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFA6696BF3D3A4F0CB97EFC68AEDC180EBBB76A6696BFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7756BF6DDBA707BCE0F2E
            F36E75BFEEC484A6696BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFBC8268F8E7CE0F30F7001EFF0F2FF3F0CC96A6696BFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD1926DFBF2E27486E70F30
            F8727FD7F3D7ABA6696BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFDA9D75FEFAF3FBF4E7FAEEDCF8E7CFF6E1C0A6696BFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE7AB79FFFFFFFEFBF8FCF7
            EEA6696AA6696AAC6C5AA46769A46769A46769A46769A46769A46769A46769A4
            6769FF00FFE7AB79FFFFFFFFFFFFFEFCFBA6696AC67F4EFF00FFA46769E9C49D
            D8A57BD8A373D59D66D1965AEAB66CA46769FF00FFE7AB79D1926DD1926DD192
            6DA6696AFF00FF005901A46769BB76507D1800821F00811F00811E00DCA162A4
            6769FF00FFFF00FF2D6718FF00FFFF00FFFF00FFFF00FF016405A7756BF6E9DD
            8A2A087F1A007B1600AB5B30FCDD9FA46769FF00FF005D03067F14FF00FFFF00
            FFFF00FF017707036506BC8268FFFFFFC99379791400892907E6BD99FFEAB5A4
            6769015A0630BD571A922F01550303600704780A05840C015804D1926DFFFFFF
            FBF4F299411EBF7D59FAEDD4D4BCA02A70272CC55841E07527BB4515A5280996
            13058C0D026606FF00FFDA9D75FFFFFFFFFFFFE7D0C4F7EEE3A46769A46769A4
            6A5A1C963122B63E149A2605700B036C07026005FF00FFFF00FFE7AB79FFFFFF
            FFFFFFFFFFFFFCFFFFA46769D18649FF00FFFF00FF0875110C8816FF00FFFF00
            FFFF00FFFF00FFFF00FFE7AB79D1926DD1926DD1926DD1926DA46769FF00FFFF
            00FFFF00FFFF00FF036307FF00FFFF00FFFF00FFFF00FFFF00FF}
        end
      end
      object dbeDescricao: TDBEdit
        Left = 16
        Top = 72
        Width = 521
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'PRO_MEDICAMENTO'
        DataSource = dmGerenciador.dsCadProdutos
        ParentCtl3D = False
        TabOrder = 1
      end
      object dbeVLVENDA: TDBEdit
        Left = 16
        Top = 112
        Width = 120
        Height = 19
        Ctl3D = False
        DataField = 'PRO_VALORVENDA'
        DataSource = dmGerenciador.dsCadProdutos
        ParentCtl3D = False
        TabOrder = 2
      end
      object dbeQTAPRES: TDBEdit
        Left = 16
        Top = 152
        Width = 120
        Height = 19
        Ctl3D = False
        DataField = 'PRO_QUANTIDADE'
        DataSource = dmGerenciador.dsCadProdutos
        ParentCtl3D = False
        TabOrder = 3
      end
      object dbeCDBARRAS: TDBEdit
        Left = 16
        Top = 30
        Width = 120
        Height = 19
        Ctl3D = False
        DataField = 'PRO_BARRAS'
        DataSource = dmGerenciador.dsCadProdutos
        ParentCtl3D = False
        TabOrder = 4
        OnExit = dbeCDBARRASExit
        OnKeyPress = dbeCDBARRASKeyPress
      end
      object pnlProgressao: TPanel
        Left = 0
        Top = 206
        Width = 653
        Height = 37
        Align = alBottom
        TabOrder = 5
        Visible = False
        object lblPercentual: TLabel
          Left = 614
          Top = 11
          Width = 17
          Height = 13
          Caption = '0%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_QTREGI: TLabel
          Left = 8
          Top = 11
          Width = 21
          Height = 13
          Caption = '0/0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object BmsXPProgressBar1: TBmsXPProgressBar
          Left = 90
          Top = 10
          Width = 491
          Height = 16
          BackColors.StartColor = 14671839
          BackColors.EndColor = clWhite
          BarColors.StartColor = 11530400
          BarColors.EndColor = 5290064
          TabOrder = 0
        end
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        Width = 653
        inherited edtConsultar: TEdit
          Width = 346
        end
        inherited btnConsultar: TBitBtn
          Left = 500
          Top = 43
          Visible = False
          OnClick = btnConsultarClick
        end
        inherited btnAlterar: TBitBtn
          Left = 537
          Top = 18
        end
      end
      inherited grdConsultar: TDBGrid
        Width = 619
        DataSource = dsConsultar
        Columns = <
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'PRO_BARRAS'
            Title.Caption = 'BARRAS'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRO_MEDICAMENTO'
            Title.Caption = 'DESCRI'#199#195'O'
            Width = 419
            Visible = True
          end>
      end
      inherited Panel3: TPanel
        Left = 619
      end
    end
  end
  inherited Panel4: TPanel
    Width = 661
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select PRO_BARRAS, PRO_MEDICAMENTO from PRODUTOS'
    MaxBlobSize = -1
    SQLConnection = dmGerenciador.sqlConnGerenciador
    object datasetConsultarPRO_BARRAS: TStringField
      FieldName = 'PRO_BARRAS'
      Required = True
      FixedChar = True
      Size = 13
    end
    object datasetConsultarPRO_MEDICAMENTO: TStringField
      FieldName = 'PRO_MEDICAMENTO'
      Required = True
      Size = 50
    end
  end
  object qryLocalizar: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pBARRAS'
        ParamType = ptInput
        Value = ''
      end>
    SQL.Strings = (
      'Select PRO_BARRAS from PRODUTOS Where (PRO_BARRAS = :pBARRAS)')
    SQLConnection = dmGerenciador.sqlConnGerenciador
    Left = 452
    Top = 69
  end
end
