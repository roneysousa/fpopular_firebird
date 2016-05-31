inherited frmCadClientes: TfrmCadClientes
  Caption = 'Cadastro de Pacientes'
  ClientHeight = 443
  ClientWidth = 781
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 781
    Height = 414
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 13
        Top = 16
        Width = 38
        Height = 13
        Caption = 'N'#186'. CPF'
        FocusControl = dbeCPF
        Transparent = True
      end
      object Label2: TLabel [1]
        Left = 145
        Top = 16
        Width = 88
        Height = 13
        Caption = 'Nome do Paciente'
        FocusControl = dbeNome
        Transparent = True
      end
      object Label3: TLabel [2]
        Left = 13
        Top = 56
        Width = 113
        Height = 13
        Caption = 'Identidade (Digitalizada)'
        FocusControl = dbiDocumento
        Transparent = True
      end
      object Shape1: TShape [3]
        Left = 12
        Top = 72
        Width = 224
        Height = 295
        Brush.Color = 13750737
      end
      object imgDocumento: TImage [4]
        Left = 13
        Top = 73
        Width = 222
        Height = 293
        Stretch = True
      end
      inherited Panel1: TPanel
        Top = 345
        Width = 773
        inherited BtExcluir: TBitBtn
          Visible = False
        end
        inherited BtPesquisar: TBitBtn
          Left = 266
        end
        inherited BtCancelar: TBitBtn
          Left = 520
        end
        inherited BtGravar: TBitBtn
          Left = 600
        end
        inherited BtSair: TBitBtn
          Left = 688
        end
        object btnDigitalizar: TBitBtn
          Left = 376
          Top = 8
          Width = 75
          Height = 25
          Hint = 'Digitaliza Documento'
          Caption = '&Digitalizar'
          Enabled = False
          TabOrder = 7
          OnClick = btnDigitalizarClick
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
      object dbeCPF: TDBEdit
        Left = 13
        Top = 32
        Width = 124
        Height = 19
        Ctl3D = False
        DataField = 'PAC_CPF'
        DataSource = dsCadastro
        ParentCtl3D = False
        TabOrder = 1
        OnExit = dbeCPFExit
      end
      object dbeNome: TDBEdit
        Left = 145
        Top = 32
        Width = 524
        Height = 19
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'PAC_NOME'
        DataSource = dsCadastro
        ParentCtl3D = False
        TabOrder = 2
      end
      object dbiDocumento: TDBImage
        Left = 560
        Top = 64
        Width = 193
        Height = 257
        DataField = 'PAC_IMG_IDENTIDADE'
        DataSource = dsCadastro
        Stretch = True
        TabOrder = 3
        Visible = False
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        Width = 773
        inherited edtConsultar: TEdit
          Width = 394
        end
        inherited btnConsultar: TBitBtn
          Visible = False
        end
        inherited btnAlterar: TBitBtn
          Left = 536
        end
      end
      inherited grdConsultar: TDBGrid
        Width = 739
        Height = 327
        DataSource = dsConsultar
        OnDblClick = btnAlterarClick
        Columns = <
          item
            Expanded = False
            FieldName = 'PAC_CPF'
            Title.Alignment = taCenter
            Width = 118
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PAC_NOME'
            Width = 506
            Visible = True
          end>
      end
      inherited Panel3: TPanel
        Left = 739
        Height = 327
      end
    end
  end
  inherited Panel4: TPanel
    Width = 781
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select PAC_CPF, PAC_NOME from PACIENTES order by PAC_NOME'
    MaxBlobSize = -1
    SQLConnection = dmGerenciador.sqlConnGerenciador
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarPAC_CPF: TStringField
      Alignment = taCenter
      DisplayLabel = 'CPF'
      FieldName = 'PAC_CPF'
      EditMask = '999.999.999-99;0;_'
      Size = 11
    end
    object cdsConsultarPAC_NOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'PAC_NOME'
      Size = 40
    end
  end
  object dsCadastro: TDataSource
    AutoEdit = False
    DataSet = dmGerenciador.cdsCliente
    OnDataChange = dsCadastroDataChange
    Left = 328
    Top = 136
  end
  object aiScanearImagem: TAcquireImage
    AppVersionMajorNum = 0
    AppInfo = 'Demonstra'#231#227'o'
    AppManufacturer = 'ClubeDelphi'
    AppProductFamily = 'none'
    AppProductName = 'none'
    Language = 0
    Country = 0
    Left = 408
    Top = 296
  end
end
