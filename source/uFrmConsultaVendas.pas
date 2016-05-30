unit uFrmConsultaVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ToolEdit, ExtCtrls, Grids, DBGrids, DB,
  InvokeRegistry, Rio, SOAPHTTPClient, XSBuiltIns, ImgList;

type
  TfrmConsultaVendas = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtDTINIC: TDateEdit;
    Label2: TLabel;
    edtDTFINA: TDateEdit;
    btLocalizar: TBitBtn;
    Panel3: TPanel;
    btFechar: TBitBtn;
    Panel2: TPanel;
    grdConsultar: TDBGrid;
    dsConsulta: TDataSource;
    lbl_registros: TLabel;
    btnGera2Via: TBitBtn;
    Memo1: TMemo;
    btnPesquisa: TBitBtn;
    HTTPRIO1: THTTPRIO;
    Panel4: TPanel;
    sbProximo: TSpeedButton;
    sbUltimo: TSpeedButton;
    sbAnterior: TSpeedButton;
    sbPrimeiro: TSpeedButton;
    bntDigitalizar: TBitBtn;
    ImageList1: TImageList;
    edtNRCPF: TMaskEdit;
    Label3: TLabel;
    spLocCliente: TSpeedButton;
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINAExit(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btLocalizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtDTINICKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTFINAKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure btnGera2ViaClick(Sender: TObject);
    procedure dsConsultaDataChange(Sender: TObject; Field: TField);
    procedure btnPesquisaClick(Sender: TObject);
    procedure grdConsultarDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure sbPrimeiroClick(Sender: TObject);
    procedure sbAnteriorClick(Sender: TObject);
    procedure sbProximoClick(Sender: TObject);
    procedure sbUltimoClick(Sender: TObject);
    procedure bntDigitalizarClick(Sender: TObject);
    procedure edtNRCPFKeyPress(Sender: TObject; var Key: Char);
  private
    Procedure CONSULTA(M_DTINIC, M_DTFINA : TDate ; aCPF : String);
    { Private declarations }
  public
    { Public declarations }
  end;

Const
  ScreenWidth: LongInt = 800; {I designed my form in 800x600 mode.}
  ScreenHeight: LongInt = 600;


var
  frmConsultaVendas: TfrmConsultaVendas;

implementation

uses udmGerenciador, uFrmDetalheVenda, DBClient, uInfoPrincipal, uFuncoes,
  ServicoSolicitacaoWS2, uFrmDigitalizacao;

{$R *.dfm}

procedure TfrmConsultaVendas.edtDTINICExit(Sender: TObject);
begin
    If not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTINIC.Text)) Then
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
               ShowMessage ('Data Inválida!');
               edtDTINIC.SetFocus;
               Exit;
          End;
        end;
    End;

end;

procedure TfrmConsultaVendas.edtDTFINAExit(Sender: TObject);
begin
    If not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTFINA.Text)) Then
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
               ShowMessage ('Data Inválida!');
               edtDTFINA.SetFocus;
               Exit;
          End;
        end;
    End;

end;

procedure TfrmConsultaVendas.btFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmConsultaVendas.CONSULTA(M_DTINIC, M_DTFINA: TDate; aCPF : String);
Var
   aTextoSQL : String;
begin
     aTextoSQL := 'select MOV_CODSOLICITACAO, MOV_CPFPACIENTE, MOV_NRCUPOM, MOV_VALOR, MOV_VLPAGO, ';
     aTextoSQL := aTextoSQL + ' MOV_NRAUTORIZACAO, MOV_NOMEPESSOA, MOV_DTVENDA, MOV_AUTORIZACAO, MOV_FLSITU, MOV_DTCANCELAMENTO, ';
     aTextoSQL := aTextoSQL + ' MOV_TEXTO_CUPOM, MOV_CUPOM_VINCULADO from VENDAS ';
     aTextoSQL := aTextoSQL + ' Where (MOV_DTVENDA >= :pDTINIC) AND (MOV_DTVENDA <= :pDTFINA)';
     if not ufuncoes.Empty(aCPF) Then
          aTextoSQL := aTextoSQL + ' and (MOV_CPFPACIENTE = '+QuotedStr(aCPF) + ') ';
     aTextoSQL := aTextoSQL + ' order by MOV_CODSOLICITACAO';
     //
     With dmGerenciador.cdsConsultaVendas do
      begin
           Active := False;
           CommandText := aTextoSQL;
           Params.ParamByName('pDTINIC').AsDate := M_DTINIC;
           Params.ParamByName('pDTFINA').AsDate := M_DTFINA;
           Active := True;
           //
           If (IsEmpty) Then
            begin
                Application.MessageBox('Não há vendas no período!!! Refaça a consulta.',
                 'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                Active := False;
                //lbl_registros.Caption := 'Registro:';
                edtDTINIC.SetFocus;
                Exit;
            End;
      End;
end;

procedure TfrmConsultaVendas.btLocalizarClick(Sender: TObject);
begin
      If uFuncoes.Empty(uFuncoes.RemoveChar(edtDTINIC.Text)) Then
        begin
             edtDTINIC.SetFocus;
             Exit;
        End;
      //
      If uFuncoes.Empty(uFuncoes.RemoveChar(edtDTFINA.Text)) Then
        begin
             edtDTFINA.SetFocus;
             Exit;
        End;
       //
      If not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTINIC.Text))
        and not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTFINA.Text)) Then
          CONSULTA(edtDTINIC.Date, edtDTFINA.Date, uFuncoes.RemoveChar(edtNRCPF.Text));
end;

procedure TfrmConsultaVendas.FormShow(Sender: TObject);
begin
    edtDTINIC.Date := Date();
    edtDTFINA.Date := Date();
    //
    btnGera2Via.Visible := False;
    //
    btLocalizar.SetFocus;
end;

procedure TfrmConsultaVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     If (dmGerenciador.cdsConsultaVendas.Active) Then
       dmGerenciador.cdsConsultaVendas.Close;
     //
     Action := caFree;
end;

procedure TfrmConsultaVendas.edtDTINICKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTINIC.Text)) Then
      begin
           Key := #0;
           edtDTFINA.SetFocus;
      End;
end;

procedure TfrmConsultaVendas.edtDTFINAKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTFINA.Text)) Then
      begin
           Key := #0;
           btLocalizar.SetFocus;
      End;
end;

procedure TfrmConsultaVendas.FormCreate(Sender: TObject);
begin
   { scaled := true;
    if (screen.width <> ScreenWidth) then
    begin
        height := longint(height) * longint(screen.height) DIV ScreenHeight;
        width := longint(width) * longint(screen.width) DIV ScreenWidth;
        scaleBy(screen.width, ScreenWidth);
    end;}
end;

procedure TfrmConsultaVendas.grdConsultarDblClick(Sender: TObject);
begin
     if not (dmGerenciador.cdsConsultaVendas.IsEmpty)
       and (dmGerenciador.cdsConsultaVendas.RecordCount > 0) Then
      begin
           Application.CreateForm(TfrmDetalheVenda, frmDetalheVenda);
           try
               dmGerenciador.VerificarDescricaoVazia(dmGerenciador.cdsConsultaVendasMOV_CODSOLICITACAO.AsInteger,
                         dmGerenciador.cdsDetalheProduto);
               //
               With dmGerenciador.cdsDetalheProduto do
                begin
                     Close;
                     Params[0].AsInteger := dmGerenciador.cdsConsultaVendasMOV_CODSOLICITACAO.AsInteger;
                     Open;
                End;
               frmDetalheVenda.showModal;
           Finally
               frmDetalheVenda.Free;
           End;
      End;
end;

procedure TfrmConsultaVendas.btnGera2ViaClick(Sender: TObject);
Var
     TextoCupomVinculado, TextoCupomVinculado2 : TStringList;
     ArqCupomVinculado: textfile;
     I, iVenda : integer;
     M_FILERET, M_LINHA, M_SEPARA : String;
begin
   If (dmGerenciador.cdsConsultaVendasMOV_FLSITU.AsString = 'C') Then
   begin
        Application.MessageBox('Venda já cancelada.',
             'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
        Exit;
   End;
   //
   If (Application.MessageBox('Confirma geração de 2ª via de cupom?',
         'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes ) Then
   begin
     uFuncoes.RefreshCDS(dmGerenciador.cdsConfig);
     iVenda := dmGerenciador.cdsConsultaVendasMOV_CODSOLICITACAO.AsInteger;
     //
     if not uFuncoes.Empty(dmGerenciador.cdsConsultaVendasMOV_CUPOM_VINCULADO.AsString) Then
      begin
          //
          TextoCupomVinculado := TStringList.Create;
          TextoCupomVinculado2 := TStringList.Create;
          If FileExists(uInfoPrincipal.M_PASTA_RESP+'popresp.txt') Then
             DeleteFile(uInfoPrincipal.M_PASTA_RESP+'popresp.txt');
          //
          if FileExists(uInfoPrincipal.M_PASTA_RESP+'cupomvin.txt') then
             DeleteFile(uInfoPrincipal.M_PASTA_RESP+'cupomvin.txt');
          //
          M_FILERET := uInfoPrincipal.M_PASTA_RESP+'popresp.txt';
          //
          TextoCupomVinculado.Text := dmGerenciador.cdsConsultaVendasMOV_CUPOM_VINCULADO.AsString;
          TextoCupomVinculado.Text := uFuncoes.ReplaceStr(TextoCupomVinculado.Text, '@', #13+#10);
          //
          try
              AssignFile(ArqCupomVinculado, M_FILERET);
              if not FileExists(M_FILERET) then
                 Rewrite(ArqCupomVinculado, M_FILERET);
              Append(ArqCupomVinculado);
              Writeln( ArqCupomVinculado, '1');
              // VALOR DO MS
              Writeln( ArqCupomVinculado, Format('%-12.2f',[dmGerenciador.cdsConsultaVendas.FieldByName('MOV_VLPAGO').AsFloat]));
              //
              Writeln( ArqCupomVinculado);
              //
              For I := 0 to TextoCupomVinculado.Count - 1 do
              begin
                   if (uFuncoes.Alltrim(TextoCupomVinculado[I]) <> '[INICIO]') Then
                      if (uFuncoes.Alltrim(TextoCupomVinculado[I]) <> '[FIM]') Then
                         If (uFuncoes.Alltrim(TextoCupomVinculado[I]) <> 'Recebimento confirmado com sucesso.') Then
                              TextoCupomVinculado2.add(TextoCupomVinculado[I]);
              End;
              //
              Write(ArqCupomVinculado, uFuncoes.RemoveAcento(TextoCupomVinculado2.Text));
                                 //WriteLn(ArqCupomVinculado);
          finally
             CloseFile(ArqCupomVinculado);
          end;
           FreeAndNil(TextoCupomVinculado);
           FreeAndNil(TextoCupomVinculado2);
      End
      else
          Application.MessageBox('Não há dados para geração de arquivo.',
             'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
  End;
end;

procedure TfrmConsultaVendas.dsConsultaDataChange(Sender: TObject;
  Field: TField);
begin
     sbPrimeiro.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Bof);
     sbAnterior.Enabled := sbPrimeiro.Enabled;
     sbUltimo.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Eof);
     sbProximo.Enabled := sbUltimo.Enabled;

    // btnGera2Via.Enabled := (dsConsulta.DataSet.Active) and not (dsConsulta.DataSet.IsEmpty);
     bntDigitalizar.Enabled := (dsConsulta.DataSet.Active) and not (dsConsulta.DataSet.IsEmpty) and (dsConsulta.DataSet.FieldByName('MOV_FLSITU').AsString = 'F');
     //
     if (dsConsulta.DataSet.Active) Then
         lbl_registros.Caption := 'Registro(s): ' + InttoStr(dsConsulta.DataSet.RecNo) + '/'+
                                 InttoStr(dsConsulta.DataSet.RecordCount)
     Else
         lbl_registros.Caption := 'Registro(s):';
end;

procedure TfrmConsultaVendas.btnPesquisaClick(Sender: TObject);
var
  wDataSUS     : ServicoSolicitacaoWS ;
  Autorizacao  : RetornoPesquisaDTO;
  Usuario      : UsuarioFarmaciaDTO;
  Pesquisa     : PesquisaDTO;
  medicamentos : arrayofitempesquisadto;
  datai,dataf  : TDate;
  i, j            : integer;
  ObjArrayMedicamento       : ArrayOfMedicamentoDTO;
  //arrayofitempesquisadto
begin
   uFuncoes.RefreshCDS(dmGerenciador.cdsConfig);
   datai := edtDTINIC.Date;
   dataf := edtDTFINA.Date;
 //
 btnPesquisa.Enabled := false;
 try
   //
  try
     Memo1.Lines.Clear;
     //
     With dmGerenciador.cdsMedicamentos do
     begin
          Close;
          Params[0].AsDate := edtDTINIC.Date;
          Params[1].AsDate := edtDTFINA.Date;
          Open;
     End;
     //
     if dmGerenciador.cdsConfigCFG_FLPRODUCAO.AsString = 'H' then
     begin
        HTTPRIO1.URL := 'https://200.214.130.41:9443/farmaciahomologa/services/ServicoSolicitacaoWS';
        HTTPRIO1.WSDLLocation := 'https://200.214.130.41:9443/farmaciahomologa/services/ServicoSolicitacaoWS?wsdl';
     end
     else
     begin
        HTTPRIO1.URL := 'https://200.214.130.55:9443/farmaciapopular/services/ServicoSolicitacaoWS';
        HTTPRIO1.WSDLLocation := 'https://200.214.130.55:9443/farmaciapopular/services/ServicoSolicitacaoWS?wsdl';
     end;
     HTTPRIO1.Service := 'ServicoSolicitacaoWSService';
     HTTPRIO1.Port    := 'ServicoSolicitacaoWS';

     wDaTaSUS := HTTPRIO1 AS ServicoSolicitacaoWS ;
     Usuario := UsuarioFarmaciaDTO.Create;
     Usuario.usuarioFarmacia := dmGerenciador.cdsConfigCFG_LOGIN.AsString;
     Usuario.senhaFarmacia   := dmGerenciador.cdsConfigCFG_SENHA.AsString;
     Usuario.usuarioVendedor := '00837953324';
     Usuario.senhaVendedor   := '87654321';
     Pesquisa := PesquisaDTO.Create;
     Pesquisa.nuCnpj := dmGerenciador.cdsConfigCFG_CNPJ_EMPRESA.AsString;
     Pesquisa.dataInicio := TXSDateTime.Create;
     Pesquisa.dataInicio.AsDateTime := datai;
     Pesquisa.dataFim := TXSDateTime.Create;
     Pesquisa.dataFim.AsDateTime := dataf;
     Pesquisa.numeroPagina := 1;
     Pesquisa.statusTransacao := '2F';
     Pesquisa.nuCnpjMatriz := dmGerenciador.cdsConfigCFG_CNPJ_EMPRESA.AsString;

     Memo1.Lines.Add('Aguarde Consulta de dados.');
     Application.ProcessMessages;
     //
     if not (dmGerenciador.cdsMedicamentos.IsEmpty) then
     begin
          dmGerenciador.cdsMedicamentos.First;
          j := 0;
          While not (dmGerenciador.cdsMedicamentos.Eof) do
          begin
                   {SetLength(medicamentos,Length(medicamentos)+1);
                   medicamentos[j].Create;
                   medicamentos[j].arrMedicamentoDTO coCodigoBarra      := dmGerenciador.cdsMedicamentosPRV_CODBARRAS.AsString;    // Código de barras
                   medicamentos[j].qtSolicitada       := dmGerenciador.cdsMedicamentosPRV_QUANTIDADE.AsFloat;    // Quantidade solicitada (em comprimidos)
                   medicamentos[j].qtPrescrita        := dmGerenciador.cdsMedicamentosPRV_QUANTIDADE_PRESCRITA.AsFloat;
                   medicamentos[j].qtAutorizada       := dmGerenciador.cdsMedicamentosPRV_QUANTIDADE_AUTORIZADA.AsFloat;}
                SetLength(ObjArrayMedicamento,Length(ObjArrayMedicamento)+1);
                   ObjArrayMedicamento[j] := MedicamentoDTO.Create;
                   ObjArrayMedicamento[j].coCodigoBarra      := dmGerenciador.cdsMedicamentosPRV_CODBARRAS.AsString;    // Código de barras
                   ObjArrayMedicamento[j].qtSolicitada       := dmGerenciador.cdsMedicamentosPRV_QUANTIDADE.AsFloat;    // Quantidade solicitada (em comprimidos)
                   ObjArrayMedicamento[j].qtPrescrita        := dmGerenciador.cdsMedicamentosPRV_QUANTIDADE_PRESCRITA.AsFloat;
                   ObjArrayMedicamento[j].qtAutorizada       := dmGerenciador.cdsMedicamentosPRV_QUANTIDADE_AUTORIZADA.AsFloat; 
                //
                j := j + 1;
                dmGerenciador.cdsMedicamentos.Next;
           End;
     End;
     //
     Memo1.Lines.Add('Dados carregados para consulta.');
     //
     //medicamentos := arrayofitempesquisadto;
     //
     Autorizacao := RetornoPesquisaDTO.Create;
     Autorizacao.arrItemPesquisaDTO :=  medicamentos;
     Autorizacao := wDataSUS.pesquisarAutorizacoes(Pesquisa,Usuario);
    //
     if ((Autorizacao.codigoRetorno = '00P') or (Autorizacao.codigoRetorno = '01P')) then
     begin
        Memo1.Lines.Clear;
        Memo1.Lines.Add('Relatório de Autorizações - Farmácia Popular');
        Memo1.Lines.Add('Período: '+formatdatetime('dd/mm/yyyy',datai)+' a '+formatdatetime('dd/mm/yyyy',dataf));
        Memo1.Lines.Add('Pesquisa realizada com sucesso.');
        //Memo1.Lines.Add('<table border =1>');
        Memo1.Lines.Add('<tr><td>'+Autorizacao.arrItemPesquisaDTO[1].nuCpf+'</td></tr>');
        Memo1.Lines.Add(Autorizacao.mensagemRetorno);

        for I := 0 to Length(Autorizacao.arrItemPesquisaDTO)-1 do
           if Assigned(Autorizacao.arrItemPesquisaDTO[I]) then begin
              Memo1.Lines.Add(autorizacao.arrItemPesquisaDTO[I].nuCupomFiscal);
              Autorizacao.arrItemPesquisaDTO[I].Free;
           end;

        Memo1.Lines.Add('SALVA');
     end
     else
     begin
        Memo1.Lines.Clear;
        Memo1.Lines.Add('Relatório de Autorizações - Farmácia Popular');
        Memo1.Lines.Add('Período: '+formatdatetime('dd/mm/yyyy',datai)+' a '+formatdatetime('dd/mm/yyyy',dataf));
        Memo1.Lines.Add(Autorizacao.codigoRetorno+'-'+Autorizacao.mensagemRetorno);

     end;
   Except
         on e: exception do
          begin
              ShowMessage('Erro ao tentar realizar consulta de dados!'+#13+'Erro:' + e.message);
          End;
   End;
 Finally
       Pesquisa.Free;
       Autorizacao.Free;
       //
       btnPesquisa.Enabled := true;
 End;
 Application.ProcessMessages;
end;

procedure TfrmConsultaVendas.grdConsultarDrawColumnCell(Sender: TObject;
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
      // Imagens
      if Column.Field = dsConsulta.DataSet.FieldByName('DIGITALIZACAO') then
       begin
            grdConsultar.Canvas.FillRect(Rect);
            ImageList1.Draw(grdConsultar.Canvas,Rect.Left+10,Rect.Top+1,0);
            if (dsConsulta.DataSet.FieldByName('DIGITALIZACAO').AsBoolean) then
                ImageList1.Draw(grdConsultar.Canvas,Rect.Left+10,Rect.Top+1,0)
            else
                ImageList1.Draw(grdConsultar.Canvas,Rect.Left+10,Rect.Top+1,1);
       end;     // if Column.Field = dsConsulta.DataSet.FieldByName('DIGITALIZACAO') then
end;

procedure TfrmConsultaVendas.sbPrimeiroClick(Sender: TObject);
begin
     If (dsConsulta.DataSet.Active ) Then
        dsConsulta.DataSet.First;
end;

procedure TfrmConsultaVendas.sbAnteriorClick(Sender: TObject);
begin
     If (dsConsulta.DataSet.Active ) Then
        dsConsulta.DataSet.Prior;
end;

procedure TfrmConsultaVendas.sbProximoClick(Sender: TObject);
begin
     If (dsConsulta.DataSet.Active ) Then
        dsConsulta.DataSet.Next;
end;

procedure TfrmConsultaVendas.sbUltimoClick(Sender: TObject);
begin
     If (dsConsulta.DataSet.Active ) Then
        dsConsulta.DataSet.Last;
end;

procedure TfrmConsultaVendas.bntDigitalizarClick(Sender: TObject);
Var
    idRegistro : Integer;
begin
     if not (dsConsulta.DataSet.IsEmpty) Then
     begin
          idRegistro := dsConsulta.DataSet.FieldByName('MOV_CODSOLICITACAO').AsInteger;
          Application.CreateForm(TFrmDigitalizacao, FrmDigitalizacao);
          Try
                uFrmDigitalizacao.idVenda := idRegistro;
                uFrmDigitalizacao.aCupom := uFuncoes.StrZero(dsConsulta.DataSet.FieldByName('MOV_NRCUPOM').AsString,6);
                uFrmDigitalizacao.aCPF   := dsConsulta.DataSet.FieldByName('MOV_CPFPACIENTE').AsString;
                uFrmDigitalizacao.aNome  := dsConsulta.DataSet.FieldByName('MOV_NOMEPESSOA').AsString;
                uFrmDigitalizacao.aData  := dsConsulta.DataSet.FieldByName('MOV_DTVENDA').AsString;
                uFrmDigitalizacao.aNumAutorizacao := dsConsulta.DataSet.FieldByName('MOV_AUTORIZACAO').AsString;
                //
                FrmDigitalizacao.ShowModal;
          Finally
                FrmDigitalizacao.Free;
          End;
          //
          btLocalizarClick(Self);
          //
          if not (dsConsulta.DataSet.IsEmpty) Then
             dsConsulta.DataSet.Locate('MOV_CODSOLICITACAO', idRegistro,[]) ;
     End;
end;

procedure TfrmConsultaVendas.edtNRCPFKeyPress(Sender: TObject;
  var Key: Char);
begin
      if (Key = #13) and not (ufuncoes.Empty(ufuncoes.RemoveChar(edtNRCPF.Text))) Then
       begin
            key := #0;
            btLocalizar.SetFocus;
       End;
end;

end.
