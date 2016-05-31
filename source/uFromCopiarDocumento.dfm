object FromCopiarDocumento: TFromCopiarDocumento
  Left = 279
  Top = 130
  Width = 805
  Height = 551
  Caption = 'Copiar Documento'
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
    Width = 789
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 4
      Width = 70
      Height = 13
      Caption = 'CPF de Cliente'
      FocusControl = DBEdit1
      Transparent = True
    end
    object Label2: TLabel
      Left = 192
      Top = 4
      Width = 41
      Height = 13
      Caption = '&Per'#237'odo:'
      FocusControl = edtDTINIC
      Transparent = True
    end
    object Label3: TLabel
      Left = 321
      Top = 24
      Width = 6
      Height = 13
      Caption = #224
      Transparent = True
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 20
      Width = 147
      Height = 19
      TabStop = False
      Color = clSilver
      Ctl3D = False
      DataField = 'MOV_CPFPACIENTE'
      DataSource = dsCadastro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtDTINIC: TDateEdit
      Left = 192
      Top = 20
      Width = 121
      Height = 21
      Hint = 'Per'#237'odo inicial'
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 1
      OnExit = edtDTINICExit
      OnKeyPress = edtDTINICKeyPress
    end
    object edtDTFINA: TDateEdit
      Left = 336
      Top = 20
      Width = 121
      Height = 21
      Hint = 'Per'#237'odo Final'
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 2
      OnExit = edtDTFINAExit
      OnKeyPress = edtDTFINAKeyPress
    end
    object btLocalizar: TBitBtn
      Left = 474
      Top = 16
      Width = 75
      Height = 25
      Hint = 'Clique aqui para consulta'
      Caption = '&Consulta'
      TabOrder = 3
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 789
    Height = 422
    Align = alClient
    TabOrder = 1
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 444
      Height = 420
      Align = alClient
      TabOrder = 0
      object grdConsultar: TDBGrid
        Left = 1
        Top = 1
        Width = 442
        Height = 418
        Align = alClient
        Ctl3D = False
        DataSource = dsCadastro
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
        Columns = <
          item
            Expanded = False
            FieldName = 'MOV_CODSOLICITACAO'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186'. Venda'
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MOV_DTVENDA'
            Title.Alignment = taCenter
            Title.Caption = 'Data Venda'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MOV_NRCUPOM'
            Title.Caption = 'N'#186'. Cupom'
            Visible = True
          end>
      end
    end
    object Panel5: TPanel
      Left = 445
      Top = 1
      Width = 343
      Height = 420
      Align = alRight
      TabOrder = 1
      object dbiDocumento: TDBImage
        Left = 15
        Top = 1
        Width = 308
        Height = 415
        DataSource = dsCadastro
        Stretch = True
        TabOrder = 0
        TabStop = False
        OnClick = dbiDocumentoClick
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 471
    Width = 789
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 2
    object btnOK: TBitBtn
      Left = 592
      Top = 8
      Width = 75
      Height = 25
      Caption = '&OK'
      Default = True
      Enabled = False
      TabOrder = 0
      OnClick = btnOKClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 688
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object dsCadastro: TDataSource
    DataSet = dmGerenciador.cdsDocumentosVendas
    OnDataChange = dsCadastroDataChange
    Left = 448
    Top = 264
  end
end
