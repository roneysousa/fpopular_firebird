object frmConsultaVendas: TfrmConsultaVendas
  Left = 194
  Top = 139
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Vendas'
  ClientHeight = 470
  ClientWidth = 1017
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1017
    Height = 65
    Align = alTop
    Color = clWhite
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 11
      Width = 41
      Height = 13
      Caption = '&Per'#237'odo:'
      FocusControl = edtDTINIC
      Transparent = True
    end
    object Label2: TLabel
      Left = 144
      Top = 32
      Width = 6
      Height = 13
      Caption = #224
      Transparent = True
    end
    object Label3: TLabel
      Left = 292
      Top = 11
      Width = 65
      Height = 13
      Caption = 'CPF P&aciente'
      FocusControl = edtNRCPF
      Transparent = True
    end
    object spLocCliente: TSpeedButton
      Left = 389
      Top = 26
      Width = 23
      Height = 22
      Hint = 'Localizar Cliente'
      Enabled = False
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777770077777777777770FF077777777777077FF07777
        7777770777FF077777777770777FFF00777777790777F1111077777790771117
        0B77777770799170B77777777709990B77777777770990B77777777777090B77
        777777777770B777777777777777777777777777777777777777}
      Visible = False
    end
    object edtDTINIC: TDateEdit
      Left = 16
      Top = 27
      Width = 121
      Height = 21
      Hint = 'Per'#237'odo inicial'
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 0
      OnExit = edtDTINICExit
      OnKeyPress = edtDTINICKeyPress
    end
    object edtDTFINA: TDateEdit
      Left = 160
      Top = 27
      Width = 121
      Height = 21
      Hint = 'Per'#237'odo Final'
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 1
      OnExit = edtDTFINAExit
      OnKeyPress = edtDTFINAKeyPress
    end
    object btLocalizar: TBitBtn
      Left = 424
      Top = 23
      Width = 75
      Height = 25
      Hint = 'Clique aqui para consulta'
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
    object edtNRCPF: TMaskEdit
      Left = 292
      Top = 27
      Width = 95
      Height = 19
      Hint = 'CPF do paciente.'
      Ctl3D = False
      EditMask = '999.999.999-99;0;_'
      MaxLength = 14
      ParentCtl3D = False
      TabOrder = 3
      OnKeyPress = edtNRCPFKeyPress
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 429
    Width = 1017
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 1
    DesignSize = (
      1017
      41)
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
      Left = 903
      Top = 8
      Width = 92
      Height = 25
      Hint = 'Fechar a janela'
      Anchors = [akRight, akBottom]
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
    object btnGera2Via: TBitBtn
      Left = 296
      Top = 8
      Width = 105
      Height = 25
      Caption = '2'#170' Via Cupom'
      TabOrder = 1
      Visible = False
      OnClick = btnGera2ViaClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000004000
        000080000000FF000000002000004020000080200000FF200000004000004040
        000080400000FF400000006000004060000080600000FF600000008000004080
        000080800000FF80000000A0000040A0000080A00000FFA0000000C0000040C0
        000080C00000FFC0000000FF000040FF000080FF0000FFFF0000000020004000
        200080002000FF002000002020004020200080202000FF202000004020004040
        200080402000FF402000006020004060200080602000FF602000008020004080
        200080802000FF80200000A0200040A0200080A02000FFA0200000C0200040C0
        200080C02000FFC0200000FF200040FF200080FF2000FFFF2000000040004000
        400080004000FF004000002040004020400080204000FF204000004040004040
        400080404000FF404000006040004060400080604000FF604000008040004080
        400080804000FF80400000A0400040A0400080A04000FFA0400000C0400040C0
        400080C04000FFC0400000FF400040FF400080FF4000FFFF4000000060004000
        600080006000FF006000002060004020600080206000FF206000004060004040
        600080406000FF406000006060004060600080606000FF606000008060004080
        600080806000FF80600000A0600040A0600080A06000FFA0600000C0600040C0
        600080C06000FFC0600000FF600040FF600080FF6000FFFF6000000080004000
        800080008000FF008000002080004020800080208000FF208000004080004040
        800080408000FF408000006080004060800080608000FF608000008080004080
        800080808000FF80800000A0800040A0800080A08000FFA0800000C0800040C0
        800080C08000FFC0800000FF800040FF800080FF8000FFFF80000000A0004000
        A0008000A000FF00A0000020A0004020A0008020A000FF20A0000040A0004040
        A0008040A000FF40A0000060A0004060A0008060A000FF60A0000080A0004080
        A0008080A000FF80A00000A0A00040A0A00080A0A000FFA0A00000C0A00040C0
        A00080C0A000FFC0A00000FFA00040FFA00080FFA000FFFFA0000000C0004000
        C0008000C000FF00C0000020C0004020C0008020C000FF20C0000040C0004040
        C0008040C000FF40C0000060C0004060C0008060C000FF60C0000080C0004080
        C0008080C000FF80C00000A0C00040A0C00080A0C000FFA0C00000C0C00040C0
        C00080C0C000FFC0C00000FFC00040FFC00080FFC000FFFFC0000000FF004000
        FF008000FF00FF00FF000020FF004020FF008020FF00FF20FF000040FF004040
        FF008040FF00FF40FF000060FF004060FF008060FF00FF60FF000080FF004080
        FF008080FF00FF80FF0000A0FF0040A0FF0080A0FF00FFA0FF0000C0FF0040C0
        FF0080C0FF00FFC0FF0000FFFF0040FFFF0080FFFF00FFFFFF00DBDBDBDBDBDB
        DBDBDBDBDBDBDBDBDBDBDBDB0000000000000000000000DBDBDBDB00DBDBDBDB
        DBDBDBDBDB00DB00DBDB00000000000000000000000000DB00DB00DBDBDBDBDB
        DBFCFCFCDBDB000000DB00DBDBDBDBDBDB929292DBDB00DB00DB000000000000
        00000000000000DBDB0000DBDBDBDBDBDBDBDBDBDB00DB00DB00DB0000000000
        0000000000DB00DB0000DBDB00FFFFFFFFFFFFFFFF00DB00DB00DBDBDB00FF00
        00000000FF00000000DBDBDBDB00FFFFFFFFFFFFFFFF00DBDBDBDBDBDBDB00FF
        0000000000FF00DBDBDBDBDBDBDB00FFFFFFFFFFFFFFFF00DBDBDBDBDBDBDB00
        0000000000000000DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB}
    end
    object btnPesquisa: TBitBtn
      Left = 416
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 2
      Visible = False
      OnClick = btnPesquisaClick
    end
    object bntDigitalizar: TBitBtn
      Left = 712
      Top = 8
      Width = 92
      Height = 25
      Hint = 'Digitaliza'#231#227'o de Documentos'
      Caption = '&Digitalizar'
      TabOrder = 3
      OnClick = bntDigitalizarClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF9F9F98A8A8A5050503F403F4141414444444A4A4A4D
        4E4D4F4F4F4C4C4C4748474343434444444C4C4C838382F7F7F7D2D2D2585757
        959494EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDE7E7
        E6878686515151CECECEBABABAE9E8E8CECCCCDFDDDDE0DFDFE0DFE0DDDBDDD8
        D7D7D9D8D8DBDADADBD9DADFDEDEE6E5E5C7C6C6E5E4E4BABABACFCFCFE6E5E5
        A3A3A5898B8E94959BA2A6ABA4A9ADBFC2C2BCBEC0A4A7A89B9C9E9395989395
        989D9C9EE0E0DFCECECEECECECE0E0E0F0F2F4DDDFE0E1E4E7E3E5E6D8D5D0D6
        D5D5D8D6D5D4CFC9D6CCC2D8CCC0D6CBC0EDE7E4DFE0E0ECECECFFFFFFB5B9BC
        E4C4A1B35B19C4751DD38020D4A66BF6F1EDFEF9F3FFFAF2F6E7D4E4C4A4CC98
        6FE7CFB8B6B8BAFFFFFFFFFFFFB1AFAECAA776B35419BC681CBC6E1CCBBBA8DF
        D2C3EDDFD2FBF5EFFFFFFFFFFFFFFFFFFFFFFDFBB2AFAAFFFFFFFFFFFFECE0D2
        A8824EB35819AD5418A9815FBDAE9DC9B39DD6C2ADE2D4C3EFE8DAFFFFFFFFFF
        FFAD8A5CEBDED0FFFFFFFFFFFFFCF8F49E7448AA5018A2481BA78869B59878C3
        A98BD0B89EDEC9B3ECE0CFFDEFE2B66A33996B39FBF7F3FFFFFFFFFFFFFFFFFF
        AF91716D3F1C874718864C1987531F86592F8C6944A38365C9B195A7774C6C32
        0EAF916FFFFFFFFFFFFFFFFFFFFFFEFE9F85681B1008301E0D32200E301D0A2E
        1A052914032411032411021409000D0A03A2896AFFFEFDFFFFFFFFFFFFE5CEB3
        654321000000000000080000110500160A001306000400010000000000000000
        006F4A25E5CFB2FFFFFFF8F1EAC1A47A7D5A32211204271706301E08341F091F
        0F001F1000321F09301D092C1B08241605926C3FCBAE86F8F2EAF9F5F1BAB4AF
        E3E3E2FEF9F3FFFDF6FFFEF8FFFEF8FBF8F5FDFBF7FFFFFEFFFFFFFFFFFFFFFF
        FFF7F9FBCAC6C1F9F5F0FFFFFFF5F5F5EBEBECD9D9DAD7D7D8D5D6D7D5D6D7D7
        D7D8D7D7D8D7D7D8D8D8D9DADADADBDBDCEDEDEDF4F5F6FFFFFF}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 1017
    Height = 364
    Align = alClient
    TabOrder = 2
    object grdConsultar: TDBGrid
      Left = 1
      Top = 1
      Width = 981
      Height = 252
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
          Width = 63
          Visible = True
        end
        item
          Alignment = taCenter
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
          Width = 124
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
          Width = 96
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
          Width = 187
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
          Title.Alignment = taCenter
          Title.Caption = 'SITUA'#199#195'O'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIGITALIZACAO'
          Title.Caption = 'DIGITALIZA'#199#195'O'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
    object Memo1: TMemo
      Left = 1
      Top = 253
      Width = 1015
      Height = 110
      Align = alBottom
      TabOrder = 1
      Visible = False
    end
    object Panel4: TPanel
      Left = 982
      Top = 1
      Width = 34
      Height = 252
      Align = alRight
      Color = clWhite
      TabOrder = 2
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
  object dsConsulta: TDataSource
    DataSet = dmGerenciador.cdsConsultaVendas
    OnDataChange = dsConsultaDataChange
    Left = 704
    Top = 8
  end
  object HTTPRIO1: THTTPRIO
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    HTTPWebNode.UseUTF8InHeader = False
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 664
    Top = 32
  end
  object ImageList1: TImageList
    Left = 400
    Top = 129
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000F7F7F700EEEE
      EE00E4E4E400DCDCDC00D5D5D500D1D1D100D2D2D200D6D6D600DCDCDC00E3E3
      E300EAEAEA00F2F2F200FBFBFB000000000000000000F8F8F800D2D2DF00DCDC
      E100DCDCDC00D3D3D300CBCBCB00C6C6C600C6C6C600CACACA00D1D1D100DADA
      DA00DBDBDF00D0D0DE00F7F7F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCFEFC00000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00D4D4E500323265006E6E
      A100F3F3F800FDFDFD00FDFDFD00FCFCFC00FCFCFC00FCFCFC00FDFDFD00F5F5
      F9007070AB002F2F9100D2D2E700FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DFF7DF0027C62700C1EFC1000000000000000000000000000000
      000000000000000000000000000000000000D4D4E5002D2D6300000056000303
      4D006F6F9C00F4F4F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F5FA007272
      B40003037E00000074002C2C9900D2D2E7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E2F7E20020C1200000B800000CBB0C00C5EFC50000000000000000000000
      000000000000000000000000000000000000C3C3D9001E1E6E0000004B000000
      4100050556007070A600F5F5FA00FFFFFF00FFFFFF00F6F6FB007373AD000505
      750000008C0000008A001D1D8B00C2C2DF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E5F7
      E50024BE240000B3000000B3000000B300000EB70E00CAEFCA00000000000000
      000000000000000000000000000000000000FFFFFF00BEBED8001E1E59000000
      540000005D00030357007171A700F4F4F900F5F5FA007474B20003037F000000
      710000007E001D1DA100BCBCDD00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8F8E80028BC
      280000AF000000AF00001DB81D0000AF000000AF000011B41100CEF0CE000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00BCBCD7001E1E
      73000000500000005700050562007272AB007676B1000505630000007D000606
      8F002D2D9100BABADB00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EBF8EB002CB92C0000AB
      000000AB000043C14300F6FCF6006BCE6B0000AB000000AB000013B11300D2F0
      D20000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00C0C0
      D9001F1F6B00000063000000630002026D0003037600030377002B2B82006060
      B400C4C4E200FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000042BE420000A7000000A7
      00003EBC3E00F5FCF50000000000FEFFFE0066CA660000A7000000A7000016AF
      1600D6F1D600000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BDBDDA001F1F76000000650000006500101071004444A3006C6CB500C4C4
      DF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CCEDCC0010A910003AB8
      3A00F3FBF300000000000000000000000000FEFFFE0060C6600000A3000000A3
      000019AC1900D9F1D9000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F5F5FA006666A4001414730034348800454592005050A8008787C500F4F4
      FA00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CFEDCF00F1FA
      F1000000000000000000000000000000000000000000FDFEFD005BC15B00009F
      0000009F00001CAA1C00DDF2DD0000000000FFFFFF00FFFFFF00FFFFFF00F6F6
      FB009595C6005D5DA7007171AC006B6BAE005252A6005252B0007070BB009494
      CB00F5F5FA00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FCFEFC0056BC
      5600009A0000009A00003EB33E0000000000FFFFFF00FFFFFF00F5F5FA009999
      C8007979AC007C7CBA007C7CBE008585BE007777BB005D5DB4006D6DBF007B7B
      CF009898D500F5F5FA00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FBFD
      FB0051B751001DA21D00DEF1DE0000000000FFFFFF00F6F6FB009C9CCA008383
      CC008686BD008686B7008D8DC700CACAE500CBCBE6007B7BC5006B6BC5008383
      D4008484D5009C9CDA00F6F6FA00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FAFDFA00E2F3E2000000000000000000F5F5FA009F9FD8008B8BBC008F8F
      C2008F8FD5009696CA00CDCDE600FFFFFF00FFFFFF00CECEE8008282CF007C7C
      D4009090DD008D8DE1009F9FDE00F5F5FA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFBFDE009696D5009999DC009999
      C6009E9ECD00CDCDE900FFFFFF00FFFFFF00FFFFFF00FFFFFF00CDCDE9008A8A
      D6008C8CDA009A9AE4009898E600BEBEE5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F6F6FB00B3B3D700A3A3DE00A9A9
      E200D1D1E800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CFCF
      E9009595E0009A9AE500B2B2E200F6F6FB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00F6F6FB00C4C4E100D9D9
      EE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D2D2EC00B8B8E100F6F6FB00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00C001800100000000FDFF000000000000
      F8FF000000000000F07F000000000000E03F000000000000C01F000000000000
      800F00000000000082070000000000008703000000000000CF81000000000000
      FFC1000000000000FFE1000000000000FFF3000000000000FFFF000000000000
      FFFF000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
end
