object frmLocProdutos2: TfrmLocProdutos2
  Left = 230
  Top = 156
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Localizar'
  ClientHeight = 297
  ClientWidth = 439
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
    Width = 439
    Height = 65
    Align = alTop
    Color = clWhite
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 172
      Height = 13
      Caption = 'Digite a Descri'#231#227'o do Medicamento:'
    end
    object edtConsultar: TEdit
      Left = 16
      Top = 33
      Width = 404
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      MaxLength = 40
      ParentCtl3D = False
      TabOrder = 0
      OnChange = edtConsultarChange
      OnKeyDown = edtConsultarKeyDown
      OnKeyPress = edtConsultarKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 439
    Height = 232
    Align = alClient
    TabOrder = 1
    object grdConsultar: TDBGrid
      Left = 1
      Top = 1
      Width = 437
      Height = 230
      TabStop = False
      Align = alClient
      Ctl3D = False
      DataSource = dsProdutos
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
      OnKeyPress = grdConsultarKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'PRO_BARRAS'
          Title.Caption = 'C'#243'digo'
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
          FieldName = 'PRO_MEDICAMENTO'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Verdana'
          Title.Font.Style = [fsBold]
          Width = 315
          Visible = True
        end>
    end
  end
  object dsProdutos: TDataSource
    DataSet = dmGerenciador.cdsProdutos
    Left = 304
    Top = 113
  end
end
