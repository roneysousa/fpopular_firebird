object frmCancelaVendas: TfrmCancelaVendas
  Left = 196
  Top = 124
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cancelamento de Vendas'
  ClientHeight = 448
  ClientWidth = 840
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 840
    Height = 97
    Align = alTop
    Color = clWhite
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 25
      Width = 41
      Height = 13
      Caption = '&Per'#237'odo:'
      FocusControl = edtDTINIC
      Transparent = True
    end
    object Label2: TLabel
      Left = 144
      Top = 46
      Width = 6
      Height = 13
      Caption = #224
      Transparent = True
    end
    object edtDTINIC: TDateEdit
      Left = 16
      Top = 41
      Width = 121
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 0
      OnExit = edtDTINICExit
      OnKeyPress = edtDTINICKeyPress
    end
    object edtDTFINA: TDateEdit
      Left = 160
      Top = 41
      Width = 121
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 1
      OnExit = edtDTFINAExit
      OnKeyPress = edtDTFINAKeyPress
    end
    object btLocalizar: TBitBtn
      Left = 291
      Top = 39
      Width = 75
      Height = 25
      Caption = '&Consulta'
      TabOrder = 2
      OnClick = btLocalizarClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777744444777774444474B444777774B44474B444777774B
        4447444444474444444744B444444B44444744B444744B44444744B444744B44
        44477444444444444477774B44474B4447777744444744444777777444777444
        77777774B47774B4777777744477744477777777777777777777}
    end
    object Animate1: TAnimate
      Left = 563
      Top = 6
      Width = 220
      Height = 80
      Hint = 'Enviando Solicita'#231#227'o'
      FileName = 'C:\EMPRESA\Gereciador\transacao.avi'
      StopFrame = 17
      Visible = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 407
    Width = 840
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 1
    object lbl_registros: TLabel
      Left = 12
      Top = 15
      Width = 70
      Height = 13
      Caption = 'Registro(s) :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btFechar: TBitBtn
      Left = 725
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Fechar a janela'
      Caption = '&Sair'
      TabOrder = 0
      OnClick = btFecharClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E1FFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4BA64B4BA9
        4D4D4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        824B4B824B4BB64F50C24F50C54D4EB24D4E4E1E1F824B4B824B4B824B4B824B
        4B824B4B824B4BFF00FFFF00FFFF00FF824B4BD45859CB5556C95455C95253B7
        4F524E1E1FFE8B8CFB9A9CF8AAABF7B5B6F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BD75C5DD05A5BCF595ACF5758BD53564E1E1F23B54A13C14816BD480CBC
        41F7B5B6824B4BFF00FFFF00FFFF00FF824B4BDD6364D75F60D55E5FD55C5DC2
        575A4E1E1F2AB44D1CBF4C1EBC4C13BC45F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BE36869DD6566DA6364DE6667C6595B4E1E1F26B14916BC481BBB4910BB
        43F7B5B6824B4BFF00FFFF00FFFF00FF824B4BEB6D6EE26768E67E7FFAD3D4CC
        6E704E1E1FA5D89750D16F42C9662DC758F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BF27374E96C6DEB8182FCD1D3CF6E704E1E1FFFF2CCFFFFD7FFFFD4E6FC
        C7F7B5B6824B4BFF00FFFF00FFFF00FF824B4BF87879F07576EE7273F07374D1
        65664E1E1FFCEFC7FFFFD5FFFFD3FFFFD7F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BFE7F80F77A7BF6797AF77779D76B6B4E1E1FFCEFC7FFFFD5FFFFD3FFFF
        D5F7B5B6824B4BFF00FFFF00FFFF00FF824B4BFF8384FC7F80FB7E7FFE7F80DA
        6E6F4E1E1FFCEFC7FFFFD5FFFFD3FFFFD5F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BFF8889FF8283FF8182FF8283E073744E1E1FFCEFC7FFFFD5FFFFD3FFFF
        D5F7B5B6824B4BFF00FFFF00FFFF00FF824B4B824B4BE27576FE8182FF8687E5
        76774E1E1FFAEBC5FCFBD1FCFBCFFCFBD1F7B5B6824B4BFF00FFFF00FFFF00FF
        FF00FFFF00FF824B4B9C5657CB6C6DCF6E6E4E1E1F824B4B824B4B824B4B824B
        4B824B4B824B4BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B82
        4B4B4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object btEstornar: TBitBtn
      Left = 640
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Estornar'
      Enabled = False
      TabOrder = 1
      OnClick = btEstornarClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777877777777777777188777777877777711887777187
        7007771187778177700777118871187777777771188117777007777111117777
        7007777811187777700788811118877770071117771188777007777777711887
        7007777777771177777777777777777777777777777777777777}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 840
    Height = 270
    Align = alClient
    TabOrder = 2
    object grdConsultar: TDBGrid
      Left = 1
      Top = 1
      Width = 804
      Height = 268
      Hint = 'Clique 2 vezes para visualizar os produto da venda'
      TabStop = False
      Align = alClient
      Ctl3D = False
      DataSource = dsConsulta
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = grdConsultarDrawColumnCell
      OnDblClick = grdConsultarDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'MOV_CODSOLICITACAO'
          Title.Alignment = taCenter
          Title.Caption = 'VENDA'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MOV_NRCUPOM'
          Title.Alignment = taCenter
          Title.Caption = 'CUPOM'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MOV_DTVENDA'
          Title.Alignment = taCenter
          Title.Caption = 'DT.VENDA'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 66
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'MOV_AUTORIZACAO'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186'. AUTORIZA'#199#195'O'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 121
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MOV_CPFPACIENTE'
          Title.Alignment = taCenter
          Title.Caption = 'CPF'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MOV_NOMEPESSOA'
          Title.Alignment = taCenter
          Title.Caption = 'CLIENTE'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 199
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MOV_VALOR'
          Title.Alignment = taRightJustify
          Title.Caption = 'VL.CLIENTE'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MOV_VLPAGO'
          Title.Alignment = taRightJustify
          Title.Caption = 'VALOR MS'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MOV_SITUACAO'
          Title.Caption = 'SITUACAO'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Visible = False
        end>
    end
    object Panel5: TPanel
      Left = 805
      Top = 1
      Width = 34
      Height = 268
      Align = alRight
      Color = clWhite
      TabOrder = 1
      object sbProximo: TSpeedButton
        Left = 5
        Top = 83
        Width = 25
        Height = 35
        Hint = 'Pr'#243'ximo registro'
        Enabled = False
        Flat = True
        Glyph.Data = {
          76060000424D7606000000000000360400002800000018000000180000000100
          0800000000004002000000000000000000000001000000000000FFFFFF00FFE6
          E600FEE5E500FCE3E300FBE1E100F9DFE000F7DDDE00F7DDDD00F5DBDB00F4DB
          DB00F2D9D900E6D9D900F0D6D700EED4D400EBD2D200E9D0D000E9CFD000E7CD
          CD00E5CBCB00E3C9C900E0C7C700DEC4C400DCC2C200CCC0C000D9C0BF00D7BE
          BD00D4BBBB00D3B9B900D0B7B700CFB5B500CEB4B400CCB3B300C9B0B000C7AE
          AE00C5ACAC00C3AAAA00C1A8A800C1A7A700BFA5A500BDA3A300BCA3A300BAA0
          A100BAA1A000B89E9E00B59C9C00B39A9A00AF969600AD949400A88F8F00A68D
          8D00A18888009F8686009B8382009A818100998080006633330000000000C0C0
          C000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000393939393939
          3939393939393939393939393939393939393939393939393939393939393939
          3939393939393939393939393939393939393939393939393939393939393939
          3939393939393939393939393939393939393939393939393939393939393939
          3939393939393939393939393939393939393939393939393939393939003939
          3939393939393939393939393939393939393939000037393939393939393939
          39393939393939393939390000370D3839393939393939393939393939393939
          39390000370D260D383939393939393939393939393939393900003706260D2E
          1138393939393939393939393939393900003706260D2C112E15383939393939
          3939393939393900003705210D2B112E15311938393939393939393939390000
          3706210D261038143019331D383939393939393939000037012106260D383938
          18331D331D38393939393939000037012106260D3839393938193321331D3839
          393939393937011D05250C3839393939393821331D170B383939393939393801
          25063839393939393939381D170B383939393939393939380638393939393939
          393939380B383939393939393939393938393939393939393939393938393939
          3939393939393939393939393939393939393939393939393939393939393939
          3939393939393939393939393939393939393939393939393939393939393939
          3939393939393939393939393939393939393939393939393939393939393939
          3939393939393939393939393939393939393939393939393939}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbProximoClick
      end
      object sbUltimo: TSpeedButton
        Left = 5
        Top = 122
        Width = 25
        Height = 35
        Hint = #218'ltimo registro'
        Enabled = False
        Flat = True
        Glyph.Data = {
          96010000424D9601000000000000760000002800000018000000180000000100
          0400000000002001000000000000000000001000000000000000FFFFFF006130
          30006E3D3D00916161009E6E6E00C2919100CF9E9E00C0C0C000000000000000
          0000000000000000000000000000000000000000000000000000777777777777
          7777777777777777777777777777777777777777777777777777777777777777
          7777777777777777777777777777777077777777777777777777770027777777
          7777777777777002327777777777777777770023432777777777777777700234
          3432777777777777770023434343277777777777700234343434327777777777
          0025656565656547777777700256565656565654777777772121212121212121
          2777777777777777777777777777777000000000000000007777777034343434
          3434343617777770456565656565656527777770365656565656565617777770
          4565656565656565277777771212121212121212177777777777777777777777
          7777777777777777777777777777777777777777777777777777}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbUltimoClick
      end
      object sbAnterior: TSpeedButton
        Left = 5
        Top = 44
        Width = 25
        Height = 35
        Hint = 'Registro anterior'
        Enabled = False
        Flat = True
        Glyph.Data = {
          76060000424D7606000000000000360400002800000018000000180000000100
          0800000000004002000000000000000000000001000000000000FFFFFF00FEE5
          E400FDE3E300FBE1E100F9DFE000F7DEDD00F4DBDB00F2D9D900E6D9D900F0D7
          D700EED4D400EBD2D200E9CFCF00E7CECD00E5CBCB00E3C9C900E0C6C700DEC4
          C500DBC2C200D9C0C000CDC0C000CCC0C000D7BDBD00D5BBBB00D3B9B900D1B7
          B700CFB6B500CFB5B500CDB4B400CCB3B300C7AEAE00C6ACAC00C1A8A800BFA6
          A600BAA0A100B89E9E00B39A9A00B1989800AD949400AA919100A68D8D00A38A
          8A009F8686009D8484009C8283009A818100998080006633330000000000C0C0
          C000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000313131313131
          3131313131313131313131313131313131313131313131313131313131313131
          3131313131313131313131313131313131313131313131313131313131313131
          3131313131313131313131313131313131313131313131313131313131313131
          3131313131313131313131313131313131313131313131003131313131313131
          313131003131313131313131313100002F31313131313131313100002F313131
          313131313100002F01303131313131313100002F1A3031313131313100002F01
          1E0530313131313100002F1A2A1A303131313131312F011E05210A3031313100
          002F1E2A1A1408303131313131313004210A230D303100002F1E2A1A14083031
          313131313131313005210D241130002F1A2A1A16083031313131313131313131
          300A240D26162F1A2A1A140830313131313131313131313131300D2611281A2A
          1A1408303131313131313131313131313131301128162A1A1408303131313131
          313131313131313131313130162A1A1408303131313131313131313131313131
          3131313130191408303131313131313131313131313131313131313131300830
          3131313131313131313131313131313131313131313130313131313131313131
          3131313131313131313131313131313131313131313131313131313131313131
          3131313131313131313131313131313131313131313131313131313131313131
          3131313131313131313131313131313131313131313131313131313131313131
          3131313131313131313131313131313131313131313131313131}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbAnteriorClick
      end
      object sbPrimeiro: TSpeedButton
        Left = 5
        Top = 6
        Width = 25
        Height = 35
        Hint = 'Primeiro registro'
        Enabled = False
        Flat = True
        Glyph.Data = {
          96010000424D9601000000000000760000002800000018000000180000000100
          0400000000002001000000000000000000001000000000000000FFFFFF006130
          30006E3D3D00916161009E6E6E00C2919100CF9E9E00C0C0C000000000000000
          0000000000000000000000000000000000000000000000000000777777777777
          7777777777777777777777777777777777777777777777777777777777777770
          0000000000000000777777703434343434343436177777704565656565656565
          2777777036565656565656561777777045656565656565652777777712121212
          1212121217777777777777777777777777777777777777777777777777777770
          0000000000000000777777771212121212121212177777777143434343434341
          7777777777143434343656177777777777714343436561777777777777771434
          3656177777777777777771436561777777777777777777165617777777777777
          7777777161777777777777777777777717777777777777777777777777777777
          7777777777777777777777777777777777777777777777777777}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbPrimeiroClick
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 367
    Width = 840
    Height = 40
    Align = alBottom
    Color = clWhite
    TabOrder = 3
    Visible = False
  end
  object dsConsulta: TDataSource
    DataSet = cdsConsultaVendas
    OnDataChange = dsConsultaDataChange
    Left = 400
    Top = 16
  end
  object dsProdutos: TDataSource
    DataSet = dmGerenciador.cdsProdutosVendas
    Left = 448
    Top = 16
  end
  object dstConsultaVendas: TSQLDataSet
    CommandText = 
      'select MOV_CODSOLICITACAO, MOV_CPFPACIENTE, MOV_NRCUPOM, MOV_VAL' +
      'OR, MOV_VLPAGO, MOV_NRAUTORIZACAO, MOV_NOMEPESSOA, MOV_DTVENDA, ' +
      'MOV_AUTORIZACAO, MOV_FLSITU, MOV_DTCANCELAMENTO, MOV_AUTORESTORN' +
      'O from VENDAS'#13#10'Where (MOV_DTVENDA >= :pDTINIC) AND (MOV_DTVENDA ' +
      '<= :pDTFINA) and (MOV_FLSITU <> :pFLSITU)'#13#10'order by MOV_CODSOLIC' +
      'ITACAO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINIC'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDate
        Name = 'pDTFINA'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftString
        Name = 'pFLSITU'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = dmGerenciador.sqlConnGerenciador
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
    object dstConsultaVendasMOV_AUTORESTORNO: TStringField
      FieldName = 'MOV_AUTORESTORNO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
  end
  object dspConsultaVendas: TDataSetProvider
    DataSet = dstConsultaVendas
    Options = [poAllowCommandText]
    Left = 528
    Top = 24
  end
  object cdsConsultaVendas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'pDTINIC'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDate
        Name = 'pDTFINA'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftString
        Name = 'pFLSITU'
        ParamType = ptInput
        Value = ''
      end>
    ProviderName = 'dspConsultaVendas'
    Left = 584
    Top = 24
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
      FieldKind = fkCalculated
      FieldName = 'MOV_SITUACAO'
      Size = 15
      Calculated = True
    end
    object cdsConsultaVendasMOV_AUTORESTORNO: TStringField
      FieldName = 'MOV_AUTORESTORNO'
      Size = 40
    end
  end
  object dstProdutosVendas: TSQLDataSet
    CommandText = 
      'select * from PRODUTOS_VENDAS where (PRV_CODSOLICITACAO = :pSOLI' +
      'CITACAO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pSOLICITACAO'
        ParamType = ptInput
      end>
    SQLConnection = dmGerenciador.sqlConnGerenciador
    Left = 408
    Top = 193
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
      Precision = 18
      Size = 3
    end
    object dstProdutosVendasPRV_VLVENDA: TFMTBCDField
      FieldName = 'PRV_VLVENDA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstProdutosVendasPRV_QUANTIDADE_PRESCRITA: TFMTBCDField
      FieldName = 'PRV_QUANTIDADE_PRESCRITA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstProdutosVendasPRV_QUANTIDADE_AUTORIZADA: TFMTBCDField
      FieldName = 'PRV_QUANTIDADE_AUTORIZADA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstProdutosVendasPRV_VLPARCELA: TFMTBCDField
      FieldName = 'PRV_VLPARCELA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstProdutosVendasPRV_VLTOTALPRECOVENDA: TFMTBCDField
      FieldName = 'PRV_VLTOTALPRECOVENDA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstProdutosVendasPRV_VLTOTALPARCELA: TFMTBCDField
      FieldName = 'PRV_VLTOTALPARCELA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object dstProdutosVendasPRV_COD_INDICADOR: TIntegerField
      FieldName = 'PRV_COD_INDICADOR'
      ProviderFlags = [pfInUpdate]
    end
    object dstProdutosVendasPRV_QUANT_CANCELADA: TFMTBCDField
      FieldName = 'PRV_QUANT_CANCELADA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
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
      Precision = 18
      Size = 3
    end
    object dstProdutosVendasPRV_QTPRESCRITA: TFMTBCDField
      FieldName = 'PRV_QTPRESCRITA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstProdutosVendasPRV_VLPRECO_SUBSIDIADO: TFMTBCDField
      FieldName = 'PRV_VLPRECO_SUBSIDIADO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstProdutosVendasPRV_VLPRECO_SUBPACIENTE: TFMTBCDField
      FieldName = 'PRV_VLPRECO_SUBPACIENTE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstProdutosVendasPRV_VLPRECO_SUBPAC_POSESTORNO: TFMTBCDField
      FieldName = 'PRV_VLPRECO_SUBPAC_POSESTORNO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstProdutosVendasPRV_VLSUBMS_POSESTORNO: TFMTBCDField
      FieldName = 'PRV_VLSUBMS_POSESTORNO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 3
    end
    object dstProdutosVendasPRV_VLTOTAL_POSESTORNO: TFMTBCDField
      FieldName = 'PRV_VLTOTAL_POSESTORNO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
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
      Precision = 18
      Size = 3
    end
  end
  object dspProdutosVendas: TDataSetProvider
    DataSet = dstProdutosVendas
    Options = [poAllowCommandText]
    Left = 448
    Top = 193
  end
  object cdsProdutosVendas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pSOLICITACAO'
        ParamType = ptInput
      end>
    ProviderName = 'dspProdutosVendas'
    Left = 488
    Top = 193
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
      Precision = 18
      Size = 3
    end
    object cdsProdutosVendasPRV_VLVENDA: TFMTBCDField
      FieldName = 'PRV_VLVENDA'
      Precision = 18
      Size = 2
    end
    object cdsProdutosVendasPRV_QUANTIDADE_PRESCRITA: TFMTBCDField
      FieldName = 'PRV_QUANTIDADE_PRESCRITA'
      Precision = 18
      Size = 3
    end
    object cdsProdutosVendasPRV_QUANTIDADE_AUTORIZADA: TFMTBCDField
      FieldName = 'PRV_QUANTIDADE_AUTORIZADA'
      Precision = 18
      Size = 3
    end
    object cdsProdutosVendasPRV_VLPARCELA: TFMTBCDField
      FieldName = 'PRV_VLPARCELA'
      Precision = 18
      Size = 2
    end
    object cdsProdutosVendasPRV_VLTOTALPRECOVENDA: TFMTBCDField
      FieldName = 'PRV_VLTOTALPRECOVENDA'
      Precision = 18
      Size = 2
    end
    object cdsProdutosVendasPRV_VLTOTALPARCELA: TFMTBCDField
      FieldName = 'PRV_VLTOTALPARCELA'
      Precision = 18
      Size = 2
    end
    object cdsProdutosVendasPRV_COD_INDICADOR: TIntegerField
      FieldName = 'PRV_COD_INDICADOR'
    end
    object cdsProdutosVendasPRV_QUANT_CANCELADA: TFMTBCDField
      FieldName = 'PRV_QUANT_CANCELADA'
      Precision = 18
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
      Precision = 18
      Size = 3
    end
    object cdsProdutosVendasPRV_QTPRESCRITA: TFMTBCDField
      FieldName = 'PRV_QTPRESCRITA'
      Precision = 18
      Size = 3
    end
    object cdsProdutosVendasPRV_VLPRECO_SUBSIDIADO: TFMTBCDField
      FieldName = 'PRV_VLPRECO_SUBSIDIADO'
      Precision = 18
      Size = 3
    end
    object cdsProdutosVendasPRV_VLPRECO_SUBPACIENTE: TFMTBCDField
      FieldName = 'PRV_VLPRECO_SUBPACIENTE'
      Precision = 18
      Size = 3
    end
    object cdsProdutosVendasPRV_VLPRECO_SUBPAC_POSESTORNO: TFMTBCDField
      FieldName = 'PRV_VLPRECO_SUBPAC_POSESTORNO'
      Precision = 18
      Size = 3
    end
    object cdsProdutosVendasPRV_VLSUBMS_POSESTORNO: TFMTBCDField
      FieldName = 'PRV_VLSUBMS_POSESTORNO'
      Precision = 18
      Size = 3
    end
    object cdsProdutosVendasPRV_VLTOTAL_POSESTORNO: TFMTBCDField
      FieldName = 'PRV_VLTOTAL_POSESTORNO'
      Precision = 18
      Size = 3
    end
    object cdsProdutosVendasPRV_FLCANC: TStringField
      FieldName = 'PRV_FLCANC'
      FixedChar = True
      Size = 1
    end
    object cdsProdutosVendasPRV_QTESTORNADA: TFMTBCDField
      FieldName = 'PRV_QTESTORNADA'
      Precision = 18
      Size = 3
    end
  end
end
