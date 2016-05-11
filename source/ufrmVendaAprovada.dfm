object frmVendaAprovada: TfrmVendaAprovada
  Left = 197
  Top = 163
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  BorderWidth = 1
  Caption = 'frmVendaAprovada'
  ClientHeight = 348
  ClientWidth = 563
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 563
    Height = 348
    Align = alClient
    BevelInner = bvRaised
    BevelWidth = 2
    TabOrder = 0
    DesignSize = (
      563
      348)
    object Gradiente1: TGradiente
      Left = 4
      Top = 4
      Width = 555
      Height = 340
      Align = alClient
    end
    object RxLabel1: TRxLabel
      Left = 72
      Top = 29
      Width = 406
      Height = 38
      Alignment = taCenter
      AutoSize = False
      Caption = 'Transa'#231#227'o Aprovada'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -27
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      ShadowColor = clBlack
      ShadowSize = 0
      ShadowPos = spRightBottom
      Transparent = True
    end
    object lbl_valor: TRxLabel
      Left = 7
      Top = 109
      Width = 548
      Height = 38
      Alignment = taCenter
      AutoSize = False
      Caption = 'Valor a Pagar R$ 0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -29
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      Anchors = [akLeft, akRight]
      ParentFont = False
      ShadowColor = clWhite
      ShadowPos = spRightBottom
      Transparent = True
    end
    object lbl_Desconto: TRxLabel
      Left = 7
      Top = 192
      Width = 548
      Height = 38
      Alignment = taCenter
      AutoSize = False
      Caption = 'Voc'#234' economizou R$ 0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -27
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      Anchors = [akLeft, akRight]
      ParentFont = False
      ShadowColor = clRed
      ShadowSize = 0
      ShadowPos = spRightBottom
      Transparent = True
    end
    object btConfirma: TBitBtn
      Left = 224
      Top = 279
      Width = 98
      Height = 25
      Anchors = [akBottom]
      Caption = '&OK'
      TabOrder = 0
      OnClick = btConfirmaClick
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
  end
end
