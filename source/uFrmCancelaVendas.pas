unit uFrmCancelaVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ToolEdit, ExtCtrls, Grids, DBGrids, DBXpress,
  DB, FMTBcd, DBClient, Provider, SqlExpr, DBCtrls, ComCtrls;

type
  TfrmCancelaVendas = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtDTINIC: TDateEdit;
    edtDTFINA: TDateEdit;
    btLocalizar: TBitBtn;
    Panel3: TPanel;
    btFechar: TBitBtn;
    Panel2: TPanel;
    grdConsultar: TDBGrid;
    btEstornar: TBitBtn;
    dsConsulta: TDataSource;
    Panel4: TPanel;
    dsProdutos: TDataSource;
    dstConsultaVendas: TSQLDataSet;
    dstConsultaVendasMOV_CODSOLICITACAO: TIntegerField;
    dstConsultaVendasMOV_CPFPACIENTE: TStringField;
    dstConsultaVendasMOV_NRCUPOM: TIntegerField;
    dstConsultaVendasMOV_VALOR: TFMTBCDField;
    dstConsultaVendasMOV_VLPAGO: TFMTBCDField;
    dstConsultaVendasMOV_NRAUTORIZACAO: TIntegerField;
    dstConsultaVendasMOV_NOMEPESSOA: TStringField;
    dstConsultaVendasMOV_DTVENDA: TDateField;
    dstConsultaVendasMOV_AUTORIZACAO: TStringField;
    dstConsultaVendasMOV_FLSITU: TStringField;
    dstConsultaVendasMOV_DTCANCELAMENTO: TDateField;
    dspConsultaVendas: TDataSetProvider;
    cdsConsultaVendas: TClientDataSet;
    cdsConsultaVendasMOV_CODSOLICITACAO: TIntegerField;
    cdsConsultaVendasMOV_CPFPACIENTE: TStringField;
    cdsConsultaVendasMOV_NRCUPOM: TIntegerField;
    cdsConsultaVendasMOV_VALOR: TFMTBCDField;
    cdsConsultaVendasMOV_VLPAGO: TFMTBCDField;
    cdsConsultaVendasMOV_NRAUTORIZACAO: TIntegerField;
    cdsConsultaVendasMOV_NOMEPESSOA: TStringField;
    cdsConsultaVendasMOV_DTVENDA: TDateField;
    cdsConsultaVendasMOV_AUTORIZACAO: TStringField;
    cdsConsultaVendasMOV_FLSITU: TStringField;
    cdsConsultaVendasMOV_DTCANCELAMENTO: TDateField;
    cdsConsultaVendasMOV_SITUACAO: TStringField;
    dstConsultaVendasMOV_AUTORESTORNO: TStringField;
    cdsConsultaVendasMOV_AUTORESTORNO: TStringField;
    Animate1: TAnimate;
    dstProdutosVendas: TSQLDataSet;
    dspProdutosVendas: TDataSetProvider;
    cdsProdutosVendas: TClientDataSet;
    dstProdutosVendasPRV_CODSOLICITACAO: TIntegerField;
    dstProdutosVendasPRV_CODBARRAS: TStringField;
    dstProdutosVendasPRV_NOMEAPRESENTACAO: TStringField;
    dstProdutosVendasPRV_QUANTIDADE: TFMTBCDField;
    dstProdutosVendasPRV_VLVENDA: TFMTBCDField;
    dstProdutosVendasPRV_QUANTIDADE_PRESCRITA: TFMTBCDField;
    dstProdutosVendasPRV_QUANTIDADE_AUTORIZADA: TFMTBCDField;
    dstProdutosVendasPRV_VLPARCELA: TFMTBCDField;
    dstProdutosVendasPRV_VLTOTALPRECOVENDA: TFMTBCDField;
    dstProdutosVendasPRV_VLTOTALPARCELA: TFMTBCDField;
    dstProdutosVendasPRV_COD_INDICADOR: TIntegerField;
    dstProdutosVendasPRV_QUANT_CANCELADA: TFMTBCDField;
    dstProdutosVendasPRV_AUTORESTORNO: TStringField;
    dstProdutosVendasPRV_AUTORMEDICAMENTO: TStringField;
    dstProdutosVendasPRV_STATUS: TStringField;
    dstProdutosVendasPRV_QTDEVOLVIDA: TFMTBCDField;
    dstProdutosVendasPRV_QTPRESCRITA: TFMTBCDField;
    dstProdutosVendasPRV_VLPRECO_SUBSIDIADO: TFMTBCDField;
    dstProdutosVendasPRV_VLPRECO_SUBPACIENTE: TFMTBCDField;
    dstProdutosVendasPRV_VLPRECO_SUBPAC_POSESTORNO: TFMTBCDField;
    dstProdutosVendasPRV_VLSUBMS_POSESTORNO: TFMTBCDField;
    dstProdutosVendasPRV_VLTOTAL_POSESTORNO: TFMTBCDField;
    dstProdutosVendasPRV_FLCANC: TStringField;
    dstProdutosVendasPRV_QTESTORNADA: TFMTBCDField;
    cdsProdutosVendasPRV_CODSOLICITACAO: TIntegerField;
    cdsProdutosVendasPRV_CODBARRAS: TStringField;
    cdsProdutosVendasPRV_NOMEAPRESENTACAO: TStringField;
    cdsProdutosVendasPRV_QUANTIDADE: TFMTBCDField;
    cdsProdutosVendasPRV_VLVENDA: TFMTBCDField;
    cdsProdutosVendasPRV_QUANTIDADE_PRESCRITA: TFMTBCDField;
    cdsProdutosVendasPRV_QUANTIDADE_AUTORIZADA: TFMTBCDField;
    cdsProdutosVendasPRV_VLPARCELA: TFMTBCDField;
    cdsProdutosVendasPRV_VLTOTALPRECOVENDA: TFMTBCDField;
    cdsProdutosVendasPRV_VLTOTALPARCELA: TFMTBCDField;
    cdsProdutosVendasPRV_COD_INDICADOR: TIntegerField;
    cdsProdutosVendasPRV_QUANT_CANCELADA: TFMTBCDField;
    cdsProdutosVendasPRV_AUTORESTORNO: TStringField;
    cdsProdutosVendasPRV_AUTORMEDICAMENTO: TStringField;
    cdsProdutosVendasPRV_STATUS: TStringField;
    cdsProdutosVendasPRV_QTDEVOLVIDA: TFMTBCDField;
    cdsProdutosVendasPRV_QTPRESCRITA: TFMTBCDField;
    cdsProdutosVendasPRV_VLPRECO_SUBSIDIADO: TFMTBCDField;
    cdsProdutosVendasPRV_VLPRECO_SUBPACIENTE: TFMTBCDField;
    cdsProdutosVendasPRV_VLPRECO_SUBPAC_POSESTORNO: TFMTBCDField;
    cdsProdutosVendasPRV_VLSUBMS_POSESTORNO: TFMTBCDField;
    cdsProdutosVendasPRV_VLTOTAL_POSESTORNO: TFMTBCDField;
    cdsProdutosVendasPRV_FLCANC: TStringField;
    cdsProdutosVendasPRV_QTESTORNADA: TFMTBCDField;
    lbl_registros: TLabel;
    Panel5: TPanel;
    sbProximo: TSpeedButton;
    sbUltimo: TSpeedButton;
    sbAnterior: TSpeedButton;
    sbPrimeiro: TSpeedButton;
    procedure btFecharClick(Sender: TObject);
    procedure btEstornarClick(Sender: TObject);
    procedure btLocalizarClick(Sender: TObject);
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTINICKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTFINAExit(Sender: TObject);
    procedure edtDTFINAKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure dsConsultaDataChange(Sender: TObject; Field: TField);
    procedure grdConsultarDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure sbPrimeiroClick(Sender: TObject);
    procedure sbProximoClick(Sender: TObject);
    procedure sbAnteriorClick(Sender: TObject);
    procedure sbUltimoClick(Sender: TObject);
  private
      Procedure CONSULTA(M_DTINIC, M_DTFINA : TDate );
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCancelaVendas: TfrmCancelaVendas;
  iTentativa : Integer;

implementation

uses udmGerenciador, ServicoSolicitacaoWS2, uFuncoes, uInfoPrincipal,
  uFrmDetalheVenda;

{$R *.dfm}

procedure TfrmCancelaVendas.btFecharClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmCancelaVendas.btEstornarClick(Sender: TObject);
Var
    Service : ServicoSolicitacaoWS;
    ObjEstornar : EstornoDTO;
    ObjArrayMedicamento       : ArrayOfMedicamentoDTO;
    ObjConfirmacaoEstorno     : ConfirmacaoEstornoDTO;
    ObjAutorizacao            : AutorizacaoDTO;
    ObjConfirmaAutorizacao    : ConfirmacaoDTO;
    ObjUsuarioFarmacia        : UsuarioFarmaciaDTO;
    i : integer;
    TD : TTransactionDesc;
    ObjConfirmarRecebimento   : RecebimentoDTO;
    ObjRecebimento            : ConfirmacaoRecebimentoDTO;
    M_NRVEND, M_NRSOLI, M_NRERRO, M_MSERRO : String;
    Comando : String;
    TextoDna : TStringList;
    iCodVendedor : Integer;
    M_LOVEND, M_SEVEND : String;
begin
  If (Application.MessageBox('Cancelar Venda Selecionada?',
    'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes) Then
  begin
    try
        Screen.Cursor := crHourGlass;
       {If FileExists(ExtractFilePath( Application.ExeName )+'transacao.avi') Then
        begin
            Animate1.Active  := True;
            Animate1.Visible := True;
        End
        Else
        begin
            Animate1.Active  := False;
            Animate1.Visible := False;
        End;}
        //
        iCodVendedor := dmGerenciador.GetCodVendedorVenda(cdsConsultaVendas.FieldByName('MOV_CODSOLICITACAO').AsInteger);
        uFuncoes.FilterCDS(dmGerenciador.cdsVendedores, fsInteger , InttoStr(iCodVendedor));
        //
        if not (dmGerenciador.cdsVendedores.IsEmpty) Then
        begin
            With dmGerenciador.cdsVendedores do
            begin
                 M_LOVEND := FieldByName('VEN_CPF').AsString;
                 M_SEVEND := FieldByName('VEN_SENHA').AsString;
            End;
        End
        Else
           raise Exception.Create('Erro ao tentar carregar dados do vendedor.');
        //
        //frmPrincipal.TesteSite();
        //
        btEstornar.Enabled := False;
        //
        try
             dmGerenciador.Parametros;
             //
             M_NRVEND := cdsConsultaVendas.FieldByName('MOV_CODSOLICITACAO').AsString;
             M_NRSOLI := cdsConsultaVendas.FieldByName('MOV_AUTORIZACAO').AsString;
             // Produto da Venda
             //dmGerenciador.cdsProdutosVendas.Close;
             With cdsProdutosVendas do
               begin
                    Close;
                    //CommandText := 'select * from PRODUTOS_VENDAS where (PRV_CODSOLICITACAO = :pSOLICITACAO)';
                    Params.ParamByName('pSOLICITACAO').AsInteger := cdsConsultaVendas.FieldByName('MOV_CODSOLICITACAO').AsInteger;
                    Open;
               End;
              //dmGerenciador.cdsProdutosVendas.Open;
              //
              Service := (dmGerenciador.HTTPRIO1 as ServicoSolicitacaoWS);
              i := 0;
              //
              cdsProdutosVendas.DisableControls;
              cdsProdutosVendas.First;
              While not (cdsProdutosVendas.Eof) do
                begin
                     SetLength(ObjArrayMedicamento,Length(ObjArrayMedicamento)+1);
                     ObjArrayMedicamento[i] := MedicamentoDTO.Create;
                     ObjArrayMedicamento[i].coCodigoBarra      := cdsProdutosVendas.FieldByName('PRV_CODBARRAS').AsString;                // C�digo de barras
                     ObjArrayMedicamento[i].qtDevolvida        := cdsProdutosVendas.FieldByName('PRV_QUANTIDADE_AUTORIZADA').AsFloat;     // Quantidade solicitada (em comprimidos)
                     // ObjArrayMedicamento[i].qtDevolvida        := cdsProdutosVendas.FieldByName('PRV_QUANTIDADE').AsFloat;
                     //
                     i := i + 1;
                     // Proximo
                     cdsProdutosVendas.Next;
                End;
              //
              ObjEstornar := EstornoDTO.Create;
              ObjEstornar.arrMedicamentoDTO := ObjArrayMedicamento;
              // CNPJ
              ObjEstornar.nuCnpj        := dmGerenciador.cdsConfigCFG_CNPJ_EMPRESA.AsString;
              // Solicita��o
              ObjEstornar.nuAutorizacao := M_NRSOLI;
              // Cria o Usu�rio da farmacia
              ObjUsuarioFarmacia := UsuarioFarmaciaDTO.Create;
              ObjUsuarioFarmacia.usuarioFarmacia := dmGerenciador.cdsConfigCFG_LOGIN.AsString;
              ObjUsuarioFarmacia.senhaFarmacia   := dmGerenciador.cdsConfigCFG_SENHA.AsString;
              // Altera��o 29/03/2011
              ObjUsuarioFarmacia.usuarioVendedor := M_LOVEND;
              ObjUsuarioFarmacia.senhaVendedor   := M_SEVEND;
              //
              ObjConfirmacaoEstorno := Service.executarEstorno(ObjEstornar ,ObjUsuarioFarmacia);
              //
              If (ObjConfirmacaoEstorno.inSituacaoEstorno = '00E') Then
              Begin
                 // Inicia um transa��o no BD
                 TD.TransactionID  := StrtoInt(uInfoPrincipal.M_CDUSUA);
                 TD.IsolationLevel := xilREADCOMMITTED;
                 dmGerenciador.sqlConnGerenciador.StartTransaction(TD);
                 Try
                     // Grava
                     With cdsProdutosVendas do
                      begin
                         First;
                         i := 0;
                         While not (Eof) do
                         begin
                             Edit;
                             FieldByName('PRV_QUANT_CANCELADA').AsFloat := ObjEstornar.arrMedicamentoDTO[i].qtDevolvida;
                             FieldByName('PRV_QTESTORNADA').AsFloat     := ObjEstornar.arrMedicamentoDTO[i].qtEstornada;
                             FieldByName('PRV_AUTORESTORNO').AsString   := ObjEstornar.arrMedicamentoDTO[i].inAutorizacaoMedicamento;
                             FieldByName('PRV_FLCANC').AsString         := 'S';
                             Post;
                             ApplyUpdates(0);
                             //
                             i := i + 1;
                             Next;
                         End;
                      End;
                      //
                      With cdsConsultaVendas do
                        begin
                           Edit;
                           FieldByName('MOV_AUTORESTORNO').AsString := ObjConfirmacaoEstorno.nuEstorno;
                           FieldByName('MOV_FLSITU').AsString       := 'C';
                           FieldByName('MOV_DTCANCELAMENTO').AsDateTime := Date();
                           Post;
                           ApplyUpdates(0);
                        End;
                      //
                      dmGerenciador.sqlConnGerenciador.Commit(TD);
                      //
                      Application.MessageBox(PChar('Venda N�. '+uFuncoes.StrZero(M_NRVEND,7)+' cancelada com sucesso!!!'),
                           'CONCLU�DO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                      //
                     cdsProdutosVendas.EnableControls;
                     //
                     CONSULTA(edtDTINIC.Date, edtDTFINA.Date);
                  Except
                     on Exc:Exception do
                       begin
                            Application.MessageBox(PChar('Erro ao tentar gravar dados!!!'
                              + Exc.Message), 'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                            dmGerenciador.sqlConnGerenciador.Rollback(TD);
                        End;
                  End;
              End
              Else
              Begin
                   ShowMessage(ObjConfirmacaoEstorno.inSituacaoEstorno + ' '+ObjConfirmacaoEstorno.descMensagemErro);
                   //
                   //i := 0;
                   {dmGerenciador.cdsProdutosVendas.DisableControls;
                   dmGerenciador.cdsProdutosVendas.First;
                   //  Carregar os produtos
                   While not (dmGerenciador.cdsProdutosVendas.eof) do
                      begin
                            dmGerenciador.cdsProdutosVendas.Edit;
                            dmGerenciador.cdsDados.FieldByName('PRO_MENSAGEM').AsString   := ObjRecebimento.arrMedicamentoDTO[i].inAutorizacaoMedicamento;
                            dmGerenciador.cdsProdutosVendas.FieldByName('PRV_AUTORESTORNO').AsString :=
                                                       ObjEstornar.arrMedicamentoDTO[i].inAutorizacaoEstorno;
                            //
                            ShowMessage(ObjEstornar.arrMedicamentoDTO[i].inAutorizacaoEstorno);
                            dmGerenciador.cdsProdutosVendas.Post;
                            //
                            i := i + 1;
                            dmGerenciador.cdsProdutosVendas.Next;
                      End;
                      dmGerenciador.cdsProdutosVendas.EnableControls;}
              End;
        Except
          on Exc:Exception do
          begin
               if (iTentativa < 2) Then
                begin
                     iTentativa := iTentativa + 1;
                     // Panel1.Caption := 'Aguarde, tentando novamente sua solicita��o!!!';
                     Application.ProcessMessages;
                     Sleep(100);
                     btEstornarClick(self);
                End
                Else
                begin
                     iTentativa := 1;
                     //
                      Application.MessageBox(PChar('Erro ao tentar acessar servi�o farmacia popular.'+#13+'Estornar venda!!!'
                      + Exc.Message),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                      //
                      If Application.MessageBox('Tentar novamente?',
                           'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1+MB_APPLMODAL) = idYes then
                     begin
                            btEstornarClick(self);
                     End
                End;

          End;
        End;
    Finally
          ObjEstornar.Free;
          btEstornar.Enabled := True;
          Animate1.Visible := False;
          Animate1.Active  := False;
          //
          dmGerenciador.cdsProdutosVendas.Close;
          dmGerenciador.cdsVendas.Close;
          //
          Screen.Cursor := crDefault;
    End;
  End;
end;

procedure TfrmCancelaVendas.CONSULTA(M_DTINIC, M_DTFINA: TDate);
Var
   aTexto : String;
begin
     aTexto := 'Select MOV_CODSOLICITACAO, MOV_CPFPACIENTE, MOV_NRCUPOM, MOV_VALOR, MOV_VLPAGO, MOV_NRAUTORIZACAO, MOV_NOMEPESSOA, ';
     aTexto := aTexto + ' MOV_DTVENDA, MOV_AUTORIZACAO, MOV_FLSITU, MOV_DTCANCELAMENTO, MOV_AUTORESTORNO from VENDAS ';
     aTexto := aTexto + ' Where (MOV_DTVENDA >= :pDTINIC) AND (MOV_DTVENDA <= :pDTFINA) and (MOV_FLSITU <> :pFLSITU) order by MOV_CODSOLICITACAO ';
     //
     With cdsConsultaVendas do
      begin
           close;
           CommandText := aTexto;
           Params.ParamByName('pDTINIC').AsDate := M_DTINIC;
           Params.ParamByName('pDTFINA').AsDate := M_DTFINA;
           Params.ParamByName('pFLSITU').AsString := 'C';
           Open;
           //
           If (IsEmpty) Then
            begin
                Application.MessageBox('N�o h� vendas no per�odo!!! Refa�a a consulta.',
                 'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                Active := False;
                btEstornar.Enabled := False;
                edtDTINIC.SetFocus;
                Exit;
            End
            Else
            Begin
                 btEstornar.Enabled := True;
                 grdConsultar.SetFocus;
            End;
      End;
end;

procedure TfrmCancelaVendas.btLocalizarClick(Sender: TObject);
begin
      If (edtDTINIC.Text <> '  /  /    ')
        and (edtDTFINA.Text <> '  /  /    ') Then
          CONSULTA(edtDTINIC.Date, edtDTFINA.Date);
      //
      If (edtDTINIC.Text = '  /  /    ') Then
        begin
             edtDTINIC.SetFocus;
             Exit;
        End;
      //
      If (edtDTFINA.Text = '  /  /    ') Then
        begin
             edtDTFINA.SetFocus;
             Exit;
        End;
end;

procedure TfrmCancelaVendas.edtDTINICExit(Sender: TObject);
begin
    If (edtDTINIC.Text  <> '  /  /    ') Then
    Begin
        try
            StrToDate(edtDTINIC.Text);
            edtDTINIC.Date := StrToDate(edtDTINIC.Text);
            //
            If (edtDTINIC.Date > Date()) Then
              begin
                   edtDTINIC.SetFocus;
                   Exit;
              End;
        except
          on EConvertError do
          Begin
               ShowMessage ('Data Inv�lida!');
               edtDTINIC.SetFocus;
               Exit;
          End;
        end;
    End;
end;

procedure TfrmCancelaVendas.edtDTINICKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and (edtDTINIC.Text <> '  /  /    ') Then
      begin
           Key := #0;
           edtDTFINA.SetFocus;
      End;
end;

procedure TfrmCancelaVendas.edtDTFINAExit(Sender: TObject);
begin
    If (edtDTFINA.Text  <> '  /  /    ') Then
    Begin
        try
            StrToDate(edtDTFINA.Text);
            edtDTFINA.Date := StrToDate(edtDTFINA.Text);
            //
            If (edtDTFINA.Date > Date())
            or (edtDTFINA.Date < edtDTINIC.date) Then
              begin
                   edtDTFINA.SetFocus;
                   Exit;
              End;
        except
          on EConvertError do
          Begin
               ShowMessage ('Data Inv�lida!');
               edtDTFINA.SetFocus;
               Exit;
          End;
        end;
    End;

end;

procedure TfrmCancelaVendas.edtDTFINAKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and (edtDTFINA.Text <> '  /  /    ') Then
      begin
           Key := #0;
           btLocalizar.SetFocus;
      End;
end;

procedure TfrmCancelaVendas.FormShow(Sender: TObject);
begin
    edtDTINIC.Date := Date();
    edtDTFINA.Date := Date();
    //
    btLocalizar.SetFocus;
end;

procedure TfrmCancelaVendas.BitBtn1Click(Sender: TObject);
begin
             // Produto da Venda
             dmGerenciador.cdsProdutosVendas.Close;
             With dmGerenciador.dstProdutosVendas do
               begin
                    Active := False;
                    CommandText := 'select * from PRODUTOS_VENDAS where (PRV_CODSOLICITACAO = :pSOLICITACAO)';
                    Params.ParamByName('pSOLICITACAO').AsInteger := cdsConsultaVendas.FieldByName('MOV_CODSOLICITACAO').AsInteger;
                    Active := True;
               End;
             dmGerenciador.cdsProdutosVendas.Open;                                   
end;

procedure TfrmCancelaVendas.grdConsultarDblClick(Sender: TObject);
begin
 if not (cdsConsultaVendas.IsEmpty)
       and (cdsConsultaVendas.RecordCount > 0) Then
      begin
           Application.CreateForm(TfrmDetalheVenda, frmDetalheVenda);
           try
               dmGerenciador.VerificarDescricaoVazia(cdsConsultaVendasMOV_CODSOLICITACAO.AsInteger,
                         dmGerenciador.cdsDetalheProduto);
               //          
               With dmGerenciador.cdsDetalheProduto do
                begin
                     Close;
                     Params[0].AsInteger := cdsConsultaVendasMOV_CODSOLICITACAO.AsInteger;
                     Open;
                     //
                End;
               frmDetalheVenda.showModal;
           Finally
               frmDetalheVenda.Free;
           End;
      End;
end;

procedure TfrmCancelaVendas.dsConsultaDataChange(Sender: TObject;
  Field: TField);
begin
     sbPrimeiro.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Bof);
     sbAnterior.Enabled := sbPrimeiro.Enabled;
     sbUltimo.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Eof);
     sbProximo.Enabled := sbUltimo.Enabled;

     if (dsConsulta.DataSet.Active) Then
        lbl_registros.Caption := 'Registro(s): ' + InttoStr(dsConsulta.DataSet.RecNo) + '/'+
                                 InttoStr(dsConsulta.DataSet.RecordCount)
     Else
         lbl_registros.Caption := 'Registro(s):';
end;

procedure TfrmCancelaVendas.grdConsultarDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    if not odd(TDBGrid(Sender).DataSource.DataSet.RecNo) then
      if not (gdSelected in State) then
       begin
            grdConsultar.Canvas.Brush.Color := ufuncoes.aCorGridZebrado;
            grdConsultar.Canvas.FillRect(Rect);
            grdConsultar.DefaultDrawDataCell(rect,Column.Field,state);
       end;
end;

procedure TfrmCancelaVendas.sbPrimeiroClick(Sender: TObject);
begin
     If (dsConsulta.DataSet.Active ) Then
        dsConsulta.DataSet.First;
end;

procedure TfrmCancelaVendas.sbProximoClick(Sender: TObject);
begin
     If (dsConsulta.DataSet.Active ) Then
        dsConsulta.DataSet.Next;
end;

procedure TfrmCancelaVendas.sbAnteriorClick(Sender: TObject);
begin
     If (dsConsulta.DataSet.Active ) Then
        dsConsulta.DataSet.Prior;
end;

procedure TfrmCancelaVendas.sbUltimoClick(Sender: TObject);
begin
     If (dsConsulta.DataSet.Active ) Then
        dsConsulta.DataSet.Last;
end;

end.
