object frmDetalheVenda: TfrmDetalheVenda
  Left = 275
  Top = 239
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Produtos da Venda'
  ClientHeight = 326
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 645
    Height = 285
    Align = alClient
    TabOrder = 0
    object grdConsultar: TDBGrid
      Left = 1
      Top = 1
      Width = 643
      Height = 283
      Align = alClient
      Ctl3D = False
      DataSource = dsDados
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = grdConsultarDrawColumnCell
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PRV_CODBARRAS'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo Barras'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 98
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRV_NOMEAPRESENTACAO'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 295
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRV_QUANTIDADE'
          Title.Alignment = taCenter
          Title.Caption = 'Qtda.Solicitada'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRV_QUANTIDADE_AUTORIZADA'
          Title.Alignment = taCenter
          Title.Caption = 'Qtda.Autorizada'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 101
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 285
    Width = 645
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 552
      Top = 8
      Width = 75
      Height = 25
      Caption = '&OK'
      TabOrder = 0
      Kind = bkOK
    end
  end
  object dsDados: TDataSource
    AutoEdit = False
    DataSet = dmGerenciador.cdsDetalheProduto
    Left = 368
    Top = 48
  end
end
