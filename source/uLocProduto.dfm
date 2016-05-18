object frmLocProduto: TfrmLocProduto
  Left = 192
  Top = 199
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Localizar'
  ClientHeight = 243
  ClientWidth = 441
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 441
    Height = 41
    Align = alTop
    Color = clWhite
    TabOrder = 0
    object edtConsultar: TEdit
      Left = 16
      Top = 9
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
    Top = 41
    Width = 441
    Height = 202
    Align = alClient
    TabOrder = 1
    object grdConsultar: TDBGrid
      Left = 1
      Top = 1
      Width = 439
      Height = 200
      TabStop = False
      Align = alClient
      Ctl3D = False
      DataSource = dsLocProdutos
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
          FieldName = 'PRO_NMPROD'
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 392
          Visible = True
        end>
    end
  end
  object dsLocProdutos: TDataSource
    DataSet = dmGerenciador.qryLocProduto
    Left = 352
    Top = 73
  end
end
