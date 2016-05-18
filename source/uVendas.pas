unit uVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, Grids, DBGrids, DB, CurrEdit,
  Buttons, DBXpress, ServicoSolicitacaoWS3,  Types, XSBuiltIns, InvokeRegistry, Rio, SOAPHTTPClient,
  DBCtrls, IdBaseComponent, IdComponent, IdTCPServer, IdTCPConnection,
  IdTCPClient, ComCtrls, Animate, GIFCtrl, FMTBcd, SqlExpr, DBClient,
  OleCtrls, SHDocVw, jpeg;

type
  TfrmVendas = class(TForm)
    pnlSuperior: TPanel;
    pnlGrid: TPanel;
    Label1: TLabel;
    edtNRCPF: TMaskEdit;
    Label2: TLabel;
    edtNRCRM: TEdit;
    Label3: TLabel;
    edtDTEMISSAO: TDateEdit;
    grdConsultar: TDBGrid;
    dsProdutosVendas: TDataSource;
    cmbUF: TComboBox;
    edtNMCLIE: TEdit;
    Label8: TLabel;
    edtNRCUPO: TEdit;
    Label9: TLabel;
    spLocCliente: TSpeedButton;
    Image3: TImage;
    Image2: TImage;
    Animate1: TAnimate;
    SQLQuery1: TSQLQuery;
    StatusBar1: TStatusBar;
    pnlDados: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    spLocalizar: TSpeedButton;
    lbl_TOTAL: TLabel;
    Label7: TLabel;
    edtCDPROD: TEdit;
    edtQuantidade: TCurrencyEdit;
    edtValor: TCurrencyEdit;
    edtNMDESC: TEdit;
    edtQTPRESC: TCurrencyEdit;
    pnlInferior: TPanel;
    btFechar: TBitBtn;
    btAdicionar: TBitBtn;
    btCancelar: TBitBtn;
    btGravar: TBitBtn;
    btExcluir: TBitBtn;
    btReceber: TBitBtn;
    btImportar: TBitBtn;
    cmbVendedores: TComboBox;
    Label10: TLabel;
    ClientDataSet1: TClientDataSet;
    Panel1: TPanel;
    procedure edtCDPRODExit(Sender: TObject);
    procedure edtCDPRODKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDPRODEnter(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btAdicionarClick(Sender: TObject);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTEMISSAOExit(Sender: TObject);
    procedure edtNRCPFExit(Sender: TObject);
    procedure spLocalizarClick(Sender: TObject);
    procedure edtNRCRMKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTEMISSAOKeyPress(Sender: TObject; var Key: Char);
    procedure btExcluirClick(Sender: TObject);
    procedure edtQTPRESCExit(Sender: TObject);
    procedure edtQTPRESCKeyPress(Sender: TObject; var Key: Char);
    procedure edtNRCRMExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btReceberClick(Sender: TObject);
    procedure edtNRCUPOKeyPress(Sender: TObject; var Key: Char);
    procedure edtNRCUPOExit(Sender: TObject);
    procedure spLocClienteClick(Sender: TObject);
    procedure edtNRCPFKeyPress(Sender: TObject; var Key: Char);
    procedure edtNMCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure cmbUFKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeEnter(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtQTPRESCEnter(Sender: TObject);
    procedure btImportarClick(Sender: TObject);
    procedure dsProdutosVendasDataChange(Sender: TObject; Field: TField);
    procedure edtCDPRODChange(Sender: TObject);
    procedure edtNRCPFChange(Sender: TObject);
    procedure grdConsultarDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    procedure INCLUIR_ITEM;
    procedure MOSTRA(aProduto : String);
    procedure LIMPAR;
    procedure BOTOES;
    procedure NOVO;
    function VALOR_VENDA() : Real;
    function VALOR_VENDA_Novo(aCDSItens : TClientDataSet) : Double;
    function VALOR_DESCONTO() : Real;
    function VALOR_PAGAR_MS(M_FLSITU : String) : Real;
    function VALOR_PG_CLIENTE() : Real;
    //function VALOR_PAGO_MS() : Double;
    procedure CANCELA_VENDA;
    function IMPRESSORA(W_CDCAIX : integer) : Integer;
    Function LOCALIZAR_CLIENTE(M_NUMCPF : String) : Boolean;
    Procedure GRAVAR_VENDA(aCupom, aTextoCupom : String);
    procedure GERAR_ARQUIVO;
    procedure GERAR_ARQUIVO_NOVO(iVenda : Integer);
    procedure HABILITAR_CONTROLES;
    procedure SIMULACAO;
    procedure NAO_APROVADO;
    procedure APAGAR_ARQUIVO;
    function GetDosOutput(const CommandLine:string): string;
    procedure CarregarVendedores();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendas: TfrmVendas;
  W_CDPROD, M_NMPESS, M_NMMEDI : String;
  M_VLMOVI, M_VLPAGO, M_VLDEBI, M_VLPARC, M_QTPROD, M_VLVEND : Double;
  M_CDINDI, M_NUMADM : Integer;
  M_NRSOLI, M_NRCUPO : String;
  M_NRAUTO, M_NMCLIE : String;
  M_FLFARM, M_FLVEND : Boolean;
  M_CUPOM_FARMA, M_NMPAST , M_MENSAGEM, M_FLSITU : String;
  //
  M_IMPRES,  iRetorno, i, iTentativa : integer;
  StrArqCupomVinculado : String;
  //
  M_DTVEND : TDatetime;
  M_HOVEND : String;

implementation

uses udmGerenciador, uFuncoes, uLocProduto, uInfoPrincipal,
  ufrmLocCliente, uLocProdutos2, ufrmVendaAprovada, Math,
  uFrmConfirmacaoVenda;

const
    ScreenWidth: LongInt = 800; {I designed my form in 800x600 mode.}
    ScreenHeight: LongInt = 600;

{$R *.dfm}

{ TfrmVendas }

procedure TfrmVendas.INCLUIR_ITEM;
begin
     If (pnlGrid.Enabled = False) Then
         pnlGrid.Enabled := True;
     //
     With dmGerenciador.cdsDados do
     Begin
          Append;
          FieldByName('PRO_CDBARR').AsString   := uFuncoes.StrZero(edtCDPROD.Text,13);
          FieldByName('PRO_NMPROD').AsString   := edtNMDESC.Text;
          FieldByName('PRO_QTPROD').AsFloat    := edtQuantidade.Value;
          FieldByName('PRO_VLVEND').AsCurrency := edtValor.Value;
          FieldByName('PRO_QTPRES').AsFloat    := edtQTPRESC.Value;
          Post;
     End;
     //
     M_VLMOVI := VALOR_VENDA_Novo(dmGerenciador.cdsDados);
     //VALOR_VENDA();
     lbl_TOTAL.Caption := FormatFloat('###,##0.#0',M_VLMOVI);
     //
     If not (btReceber.Enabled) Then
       btReceber.Enabled := True;
end;

procedure TfrmVendas.edtCDPRODExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDPROD.Text) Then
       //If (dmGerenciador.PROCURAR_PRODUTO2(uFuncoes.StrZero(edtCDPROD.Text,13))= False)  Then
       If not (dmGerenciador.GetCodigoProduto(uFuncoes.StrZero(edtCDPROD.Text,13)))  Then
       begin
            Application.MessageBox('Código de produto não cadatrado!!!',
               'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
            edtCDPROD.Clear;
            If (edtCDPROD.Enabled) Then
               edtCDPROD.SetFocus;
            Exit;
       End
       Else
       Begin
            MOSTRA(uFuncoes.StrZero(edtCDPROD.Text,13));
            If (edtQuantidade.Enabled) Then
               edtQuantidade.SetFocus;
       End;
end;

procedure TfrmVendas.MOSTRA(aProduto : String);
begin
     {edtNMDESC.Text := dmGerenciador.qryProdutos.FieldByName('PRO_NMPROD').AsString;
     edtValor.Value := dmGerenciador.qryProdutos.FieldByName('PRO_VLVEND').AsCurrency;}
     //
     uFuncoes.FilterCDS(dmGerenciador.cdsProdutoSelecionado, fsString, aProduto);
     //
     If not (dmGerenciador.cdsProdutoSelecionado.IsEmpty) Then
     begin
         edtNMDESC.Text := dmGerenciador.cdsProdutoSelecionadoPRO_MEDICAMENTO.AsString;
         //dmGerenciador.qryLocProdutos.FieldByName('PRO_MEDICAMENTO').AsString;
         edtValor.Value := dmGerenciador.cdsProdutoSelecionadoPRO_VALORVENDA.AsFloat;
         //dmGerenciador.qryLocProdutos.FieldByName('PRO_VALORVENDA').AsFloat;
     End;
end;

procedure TfrmVendas.edtCDPRODKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
     //
     If (key = #13) and uFuncoes.Empty(edtCDPROD.Text)  Then
     Begin
          Key := #0;
          spLocalizarClick(Sender);
     End;
     //
     If (key = #13) and not uFuncoes.Empty(edtCDPROD.Text)  Then
     Begin
          Key := #0;
          If (edtQuantidade.Enabled) Then
            edtQuantidade.SetFocus;
     End;
end;

procedure TfrmVendas.LIMPAR;
begin
    edtQuantidade.Clear;
    edtQTPRESC.Clear;
    edtValor.Clear;
    edtNMDESC.Clear;
    //
end;

procedure TfrmVendas.edtCDPRODEnter(Sender: TObject);
begin
     edtCDPROD.Clear;
end;

procedure TfrmVendas.btFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmVendas.BOTOES;
begin
     btAdicionar.Enabled := NOT btAdicionar.Enabled;
     btExcluir.Enabled   := not btExcluir.Enabled;
     btCancelar.Enabled  := not btCancelar.Enabled;
     //btGravar.Enabled    := not btGravar.Enabled;
     //
     pnlSuperior.Enabled  := not pnlSuperior.Enabled;
     pnlDados.Enabled     := not pnlDados.Enabled;
end;

procedure TfrmVendas.FormShow(Sender: TObject);
begin
     CarregarVendedores;
     //
     
     btCancelar.Enabled  := False;
     btGravar.Visible    := False;
     btExcluir.Enabled   := False;
     //
     pnlSuperior.Enabled  := False;
     pnlDados.Enabled     := False;
     //
     M_IMPRES := IMPRESSORA(StrtoInt(uInfoPrincipal.M_CDUSUA));
     //
     If NOT  uFuncoes.Empty(uFuncoes.NOME_PASTA(uInfoPrincipal.M_CDUSUA)) Then
         M_NMPAST := uFuncoes.NOME_PASTA(uInfoPrincipal.M_CDUSUA)
     Else
         M_NMPAST := 'C:\';
     //
      If (uInfoPrincipal.M_FLVINC = 'S') and not (M_FLVEND) Then
      begin
           // Novo registro
           btAdicionarClick(Sender);
           // Importar
           btImportarClick(Sender);
      End;
      //
      Panel1.Left := (grdConsultar.Width - Panel1.Width) div 2;
      Panel1.Top  := (grdConsultar.Height - Panel1.Height) div 2;
      //
      Panel1.Visible := false;

end;

procedure TfrmVendas.btGravarClick(Sender: TObject);
Var
    TD : TTransactionDesc;
    W_NRSOLI, iRetorno, M_NRITEM : Integer;
    M_CTEXTO, M_NMMODA, M_TXMEDI, M_QDLINH, M_TXCABE, M_TXRODA : String;
begin
     If uFuncoes.Empty(uFuncoes.RemoveChar(edtNRCPF.Text)) Then
     begin
          Application.MessageBox(PChar('Digite o CPF do Paciente!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          If (edtNRCPF.Enabled) Then
             edtNRCPF.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(edtNMCLIE.Text) Then
     begin
          Application.MessageBox(PChar('Digite o nome do cliente!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          If (edtNMCLIE.Enabled) Then
             edtNMCLIE.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(edtNRCRM.Text) Then
     begin
          Application.MessageBox(PChar('Digite o CRM do médico!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          If (edtNRCRM.Enabled) Then
            edtNRCRM.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(uFuncoes.RemoveChar(edtDTEMISSAO.Text)) Then
     begin
          Application.MessageBox(PChar('Digite a data de emissão da prescrição!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          If (edtDTEMISSAO.Enabled) Then
            edtDTEMISSAO.SetFocus;
          Exit;
     End;
     //
     If (dmGerenciador.cdsDados.RecordCount = 0) Then
     begin
          Application.MessageBox(PChar('Não há item na venda!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          If (edtCDPROD.Enabled) Then
             edtCDPROD.SetFocus;
          Exit;
     End;
     //
     If (dmGerenciador.cdsDados.IsEmpty) Then
      begin
          Application.MessageBox('Não há lista de produtos para solicitação!!!',
                                 'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          btReceber.Enabled := False;
          If (edtCDPROD.Enabled) Then
             edtCDPROD.SetFocus;
          Exit;
      End;
     //
     btGravar.Enabled := false;
     //
     try
          Screen.Cursor := crHourGlass;
          Application.MessageBox('Modulo não concluido!!!',
                                 'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);

     finally
          //
          Screen.Cursor := crDefault;
          StatusBar1.Panels[1].Text := '';
          //
          btGravar.Enabled := True;
     end;
     Application.ProcessMessages;
     iTentativa := 1;
end;

procedure TfrmVendas.btCancelarClick(Sender: TObject);
begin
     try
           M_FLVEND := False;
           If (Application.MessageBox('Confirma cancelamento de venda?',
               'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes) Then
            begin
                 dmGerenciador.Parametros;
                 //  
                 If (dmGerenciador.cdsConfigCFG_VINCULOFARMA.AsString = 'S') Then
                     NAO_APROVADO;
                 //
                 CANCELA_VENDA;
                 //
                 iTentativa := 1;
                 Close;
            End;
     Except

     End;
end;

procedure TfrmVendas.btAdicionarClick(Sender: TObject);
begin
     try
         //
         If (pnlInferior.Enabled = False) Then
           pnlInferior.Enabled := True;
         //
         BOTOES;
         LIMPAR;
         //
         NOVO;
         btGravar.Enabled  := False;
         btReceber.Enabled := False;
         M_FLVEND := True;
         //
         dmGerenciador.Parametros;
         dmGerenciador.cdsConfig.Edit;
         //
         M_NRSOLI := uFuncoes.StrZero(inttoStr(dmGerenciador.cdsConfig.FieldByName('CFG_SEQUENCIA').AsInteger + 1),10);
         //
         If (pnlSuperior.Enabled = False) Then
            pnlSuperior.Enabled := True;
         If (pnlGrid.Enabled = False) Then
            pnlSuperior.Enabled := True;
         If (pnlDados.Enabled = False) Then
            pnlDados.Enabled := True;
         //
         iTentativa := 1;
         If (edtNRCPF.Enabled) Then
            edtNRCPF.SetFocus;
     Except
          on Exc:Exception do
          begin
                Application.MessageBox(PChar('Erro ao tentar iniciar nova venda!!!'
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          End;
     End;
end;

procedure TfrmVendas.edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
     If (key = #27) and uFuncoes.Empty(edtQuantidade.Text) Then
     begin
          Key := #0;
          edtCDPROD.Clear;
          edtNMDESC.Clear;
          If (btCancelar.Enabled) Then
             btCancelar.SetFocus;
          Exit;
     End;
     //
     If (Key = #13) and
        not uFuncoes.Empty(edtQuantidade.Text) Then
     Begin
          Key := #0;
          If (edtQTPRESC.Enabled) Then
             edtQTPRESC.SetFocus;
     End;
end;

procedure TfrmVendas.edtDTEMISSAOExit(Sender: TObject);
begin
    If not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTEMISSAO.Text)) Then
    Begin
        try
            StrToDate(edtDTEMISSAO.Text);
            edtDTEMISSAO.Date := StrToDate(edtDTEMISSAO.Text);
            //
            If (edtDTEMISSAO.Date > Date()) Then
              begin
                   edtDTEMISSAO.SetFocus;
                   Exit; 
              End;
            If not(dmGerenciador.cdsDados.IsEmpty) Then
                btReceber.Enabled := True
            Else
                btReceber.Enabled := False;
        except
          on EConvertError do
          Begin
               ShowMessage ('Data Inválida!');
               edtDTEMISSAO.SetFocus;
               Exit;
          End;
        end;
    End;
end;

procedure TfrmVendas.edtNRCPFExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtNRCPF.Text) Then
     begin
        If uFuncoes.CPF(edtNRCPF.Text) = False Then
        Begin
            Application.MessageBox('CPF inválido!!!',
               'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
            edtNRCPF.SetFocus;
            Exit;
        End;
        //
        //If (LOCALIZAR_CLIENTE(edtNRCPF.Text) = True) Then
        If (dmGerenciador.GetCPFCliente(edtNRCPF.Text)) Then
        begin
           edtNMCLIE.Text := dmGerenciador.GetNomeCliente(edtNRCPF.Text);
           //dmGerenciador.qryProcurar.FieldByName('PAC_NOME').AsString;
           
        End
        Else
           edtNMCLIE.Clear;  
        //
            If not(dmGerenciador.cdsDados.IsEmpty) Then
                btReceber.Enabled := True
            Else
                btReceber.Enabled := False;
     End;

end;

procedure TfrmVendas.NOVO;
begin
     If not (dmGerenciador.cdsDados.Active) Then
        dmGerenciador.cdsDados.Open;
     //
     dmGerenciador.cdsDados.EmptyDataSet;
     //
     edtNRCPF.Clear;
     edtNRCRM.Clear;
     edtDTEMISSAO.Clear;
     edtQTPRESC.Clear;
     edtNMCLIE.Clear;
     edtNRCUPO.Clear;
     //
     spLocCliente.Enabled := True;
     lbl_TOTAL.Caption := '0,00';
     M_FLFARM := False;
end;

procedure TfrmVendas.spLocalizarClick(Sender: TObject);
begin
{  with TfrmLocProduto.create(self) do
    try
      uLocProduto.M_NRFROM := 1;
      showmodal
    finally
      free;
      If not uFuncoes.Empty(W_CDPROD) Then
      begin
           edtCDPROD.Text := W_CDPROD;
           edtQuantidade.SetFocus;
      End
      Else
         edtCDPROD.SetFocus;
    end;}
   with TfrmLocProdutos2.create(self) do
    try
      uLocProdutos2.M_NRFROM := 1;
      showmodal;
    finally
      free;
      If not uFuncoes.Empty(W_CDPROD) Then
      begin
           edtCDPROD.Text := W_CDPROD;
           If (edtQuantidade.Enabled) Then
              edtQuantidade.SetFocus;
      End
      Else
      begin
          If (edtCDPROD.Enabled) then
            edtCDPROD.SetFocus;
      End;
    end;
end;

procedure TfrmVendas.edtNRCRMKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
     //
     If (key = #13)
        and not uFuncoes.Empty(edtNRCRM.Text) Then
      begin
           Key := #0;
           cmbUF.SetFocus;
      End;
end;

procedure TfrmVendas.edtDTEMISSAOKeyPress(Sender: TObject; var Key: Char);
begin
     If (key = #13) and not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTEMISSAO.Text)) Then
     Begin
          KEY := #0;
          edtNRCUPO.SetFocus;
     End;
     //
end;

procedure TfrmVendas.btExcluirClick(Sender: TObject);
begin
     If (dmGerenciador.cdsDados.RecordCount > 0) Then
         dmGerenciador.cdsDados.Delete;
     //
     If (btReceber.Enabled = False) Then
         btReceber.Enabled := True;
          M_VLMOVI := VALOR_VENDA();
     lbl_TOTAL.Caption := FormatFloat('###,##0.#0',M_VLMOVI);
     //
     btGravar.Enabled := False;
     If (dmGerenciador.cdsDados.IsEmpty) Then
        btReceber.Enabled := False;
end;

function TfrmVendas.VALOR_VENDA: Real;
Var
    M_TOTAL : Real;
    fQuantApresentacao, fValorUnitario, fQuant: double;
begin
      M_TOTAL := 0; 
      With dmGerenciador.cdsDados do
          begin
               DisableControls;
               First;
               While not (Eof) do
               Begin
                   //M_TOTAL := M_TOTAL + FieldByname('PRO_SUBTOTAL').AsCurrency;
                   {W_QTPROD := fQuantApresentacao := dmGerenciador.GetQuantidadeApresentacaoNew(FieldBYName('PRO_CDBARR').AsString);
                   M_TOTAL := M_TOTAL + FieldByname('PRO_VLVEND').AsCurrency;}
                    fQuantApresentacao := dmGerenciador.GetQuantidadeApresentacaoNew(FieldBYName('PRO_CDBARR').AsString);
                    fValorUnitario     := FieldBYName('PRO_VLVEND').AsFloat;
                    fQuant             := uFuncoes.Arredondar(FieldBYName('PRO_QTPROD').AsFloat / fQuantApresentacao,2);
                    //
                    M_TOTAL := M_TOTAL + (fValorUnitario  * fQuant);
                   //
                   Next;
               End;
               EnableControls;
          End;
      //
      result := M_TOTAL;
end;

procedure TfrmVendas.edtQTPRESCExit(Sender: TObject);
begin
    If not uFuncoes.Empty(edtCDPROD.Text) and
      not uFuncoes.Empty(edtQuantidade.Text)
      and (edtQuantidade.Value > 0)
      AND (edtQTPRESC.Value > 0)  Then
      begin
           INCLUIR_ITEM;
           LIMPAR;
           edtCDPROD.SetFocus;
           Exit;
      End;
    //
    If (edtQTPRESC.Value = 0) Then
      begin
           edtQTPRESC.SetFocus;
           Exit;
      End;
end;

procedure TfrmVendas.edtQTPRESCKeyPress(Sender: TObject; var Key: Char);
begin
     If (key = #27) and uFuncoes.Empty(edtQTPRESC.Text) Then
     begin
          Key := #0;
          edtCDPROD.Clear;
          edtNMDESC.Clear;
          edtCDPROD.SetFocus;
          Exit;
     End;
     //
     If (Key = #13) and
        not uFuncoes.Empty(edtQTPRESC.Text) Then
     Begin
          Key := #0;
          edtCDPROD.SetFocus;
     End;
end;

procedure TfrmVendas.edtNRCRMExit(Sender: TObject);
begin
     If not uFuncoes.Empty (edtNRCRM.Text) Then
        edtNRCRM.Text := uFuncoes.StrZero(edtNRCRM.Text,4);
     //
     If not(dmGerenciador.cdsDados.IsEmpty) Then
         btReceber.Enabled := True
     Else
         btReceber.Enabled := False;
end;

procedure TfrmVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     If (M_FLVEND = True) Then
       btCancelarClick(Sender);
     //
     If (dmGerenciador.cdsDados.Active = True) Then
         dmGerenciador.cdsDados.Close;
     //
     Action := caFree;
end;

procedure TfrmVendas.FormCreate(Sender: TObject);
begin
    {scaled := true;
    if (screen.width <> ScreenWidth) then
    begin
        height := longint(height) * longint(screen.height) DIV ScreenHeight;
        width := longint(width) * longint(screen.width) DIV ScreenWidth;
        scaleBy(screen.width, ScreenWidth);
    end;  }
    //
    ShortDateFormat := 'dd/mm/yyyy';
    M_FLFARM := False;
    dmGerenciador.Parametros;
    dmGerenciador.Hambiente; 
end;


procedure TfrmVendas.btReceberClick(Sender: TObject);
Var
    Service : ServicoSolicitacaoWS;
    ObjSolicitacao            : SolicitacaoDTO;
    ObjUsuarioFarmacia        : UsuarioFarmaciaDTO;
    ObjArrayMedicamento       : ArrayOfMedicamentoDTO;
    ObjAutorizacao            : AutorizacaoDTO;
    ObjConfirmaAutorizacao    : ConfirmacaoDTO;
    ObjConfirmaAutoriz        : ConfirmacaoAutorizacaoDTO;
    ObjConfirmarRecebimento   : RecebimentoDTO;
    ObjRecebimento            : ConfirmacaoRecebimentoDTO;
    RetornoSolicitacao, RetornoConfirmacao, RetornoRecebimento  : String;
    J, I : integer;
    M_ARQRESP : TextFile;
    M_NMARQU : String;
    M_NMVEND, M_SEVEND : String;
    Comando : String;
    TextoDna, TextoCupomVinculado, TextoCupomVinculado2 : TStringList;
    aTexto01, aTexto02 : String;
    ArqCupomVinculado: textfile;
    iCodVendedor : Integer;
    bConfirmaVenda : Boolean;
begin
     // se CPF em branco
     If uFuncoes.Empty(uFuncoes.RemoveChar(edtNRCPF.Text))  Then
     begin
          Application.MessageBox('Digite o CPF do Cliente.',
                                 'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtNRCPF.SetFocus;
          Exit;
     End;
     // Nome do Cliente
     If uFuncoes.Empty (edtNMCLIE.Text) Then
     begin
          Application.MessageBox('Digite o nome do cliente.',
                                 'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtNMCLIE.SetFocus;
          Exit;
     End;
     // CRM do medico
     If uFuncoes.Empty (edtNRCRM.Text) Then
     begin
          Application.MessageBox('Digite o CRM do médico.',
                                 'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtNRCRM.SetFocus;
          Exit;
     End;
     // UF CRM do medico
     If uFuncoes.Empty (cmbUF.Text) Then
     begin
          Application.MessageBox('Digite o UF do CRM do médico.',
                                 'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbUF.SetFocus;
          Exit;
     End;
     // data da emissão
     If uFuncoes.Empty(uFuncoes.RemoveChar(edtDTEMISSAO.Text)) Then
     begin
          Application.MessageBox('Digite a data de emissão da receita.',
                                 'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtDTEMISSAO.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(edtNRCUPO.Text) Then
     begin
          Application.MessageBox('Digite o número do cupom fiscal?',
                                 'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtNRCUPO.SetFocus;
          Exit;
     End;
     //
     if uFuncoes.Empty(cmbVendedores.Text) Then
       begin
           Application.MessageBox('Selecione o vendedor?',
                                 'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbVendedores.SetFocus;
           Exit;
       End;
     //
     If (dmGerenciador.cdsDados.IsEmpty) Then
      begin
          Application.MessageBox('Não há lista de produtos para solicitação!!!',
                                 'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          btReceber.Enabled := False;
          edtCDPROD.SetFocus;
          Exit;
      End;
     //
 If (dmGerenciador.cdsConfig.FieldByName('CFG_SIMULACAO').AsString = 'N') Then
  begin
     StatusBar1.Panels[1].Text := 'Aguarde solicitação...';
     With dmGerenciador.qryUsuario do
      begin
           Close;
           Params[0].AsInteger := StrtoInt(uInfoPrincipal.M_CDUSUA);
           OPEN;
      End;
      //
     {if not (dmGerenciador.qryUsuario.IsEmpty) Then
     begin
         M_NMVEND := dmGerenciador.qryUsuarioSEN_NOME.AsString;
         M_SEVEND := dmGerenciador.qryUsuarioSEN_SENHA_VENDEDOR.AsString;
     End
     Else
         raise Exception.Create('Erro ao tentar carregar dados do vendedor.');}
         //
     if not uFuncoes.Empty(cmbVendedores.Text) Then
     begin
         iCodVendedor := dmGerenciador.GetCodigoVendedorporNome(cmbVendedores.Text);
         uFuncoes.FilterCDS(dmGerenciador.cdsVendedores, fsInteger, InttoStr(iCodVendedor));
         if not (dmGerenciador.cdsVendedores.IsEmpty) Then
         begin
              M_NMVEND := uFuncoes.Alltrim(dmGerenciador.cdsVendedoresVEN_CPF.AsString);
              M_SEVEND := uFuncoes.Alltrim(dmGerenciador.cdsVendedoresVEN_SENHA.AsString);
         End
         Else
         begin
            StatusBar1.Panels[1].Text := '';
            raise Exception.Create('Erro ao tentar seleciona vendedor.');
         End;
     End
     Else
     begin
         StatusBar1.Panels[1].Text := '';
         raise Exception.Create('Erro ao tentar seleciona vendedor.');
     End;
     //
     try
            StrToDate(edtDTEMISSAO.Text);
            edtDTEMISSAO.Date := StrToDate(edtDTEMISSAO.Text);
            //
            If (edtDTEMISSAO.Date > Date()) Then
              begin
                   edtDTEMISSAO.SetFocus;
                   Exit; 
              End;
        except
          on EConvertError do
          Begin
               ShowMessage ('Data Inválida!');
               edtDTEMISSAO.SetFocus;
               Exit;
          End;
        end;
     //
     If FileExists(ExtractFilePath( Application.ExeName )+'transacao.avi') Then
        begin
            //ExtractFilePath( Application.ExeName )
            Animate1.Active  := True;
            Animate1.Visible := True;
        End
        Else
        begin
            Animate1.Active  := False;
            Animate1.Visible := False;
        End;
     //
     // frmPrincipal.TesteSite();
     //
     bConfirmaVenda := false;
     //
    Try
       Screen.Cursor := crHourGlass;
       //
       pnlSuperior.Enabled := False;
       pnlGrid.Enabled     := False;
       pnlDados.Enabled    := False;
       pnlInferior.Enabled := False;
       StrArqCupomVinculado := '';
       
       //
       Try
          // Solicitação
             Service := (dmGerenciador.HTTPRIO1 as ServicoSolicitacaoWS);

             dmGerenciador.cdsDados.First;
             i := 0;
             //  Carregar os produtos
             While not (dmGerenciador.cdsDados.Eof) do
              begin
                   SetLength(ObjArrayMedicamento,Length(ObjArrayMedicamento)+1);
                   ObjArrayMedicamento[i] := MedicamentoDTO.Create;
                   ObjArrayMedicamento[i].coCodigoBarra      := dmGerenciador.cdsDados.FieldByName('PRO_CDBARR').AsString;    // Código de barras
                   ObjArrayMedicamento[i].qtSolicitada       := dmGerenciador.cdsDados.FieldByName('PRO_QTPROD').AsFloat;     // Quantidade solicitada (em comprimidos)
                   ObjArrayMedicamento[i].qtPrescrita        := dmGerenciador.cdsDados.FieldByName('PRO_QTPRES').AsFloat;   // Quantidade (diária) prescrita (Posologia)
                   ObjArrayMedicamento[i].vlPrecoVenda       := dmGerenciador.cdsDados.FieldByName('PRO_VLVEND').AsCurrency;  // Valor de venda
                   //
                   i := i + 1;
                   //
                   dmGerenciador.cdsDados.Next;
              End;
              //
              J := Length(ObjArrayMedicamento);
              //  Cria o objeto de Solicitação
              ObjSolicitacao := SolicitacaoDTO.Create;
              //  Carrega medicamento solicitado
              ObjSolicitacao.arrMedicamentoDTO := ObjArrayMedicamento;
              // Código da solicitação gerado pelo estabelecimento.
              ObjSolicitacao.coSolicitacaoFarmacia := M_NRSOLI;
              // Data de emissão da prescrição.
              {ObjSolicitacao.dtEmissaoReceita := TXSDateTime.Create;
              ObjSolicitacao.dtEmissaoReceita.AsDateTime := Strtodate(edtDTEMISSAO.Text) + time;}
              ObjSolicitacao.dtEmissaoReceita  := DateTimeToXSDateTime(edtDTEMISSAO.Date + time);
              // CNPJ do estabelecimento.
              ObjSolicitacao.nuCnpj  := dmGerenciador.cdsConfigCFG_CNPJ_EMPRESA.AsString;  //    '03376317000115';
              // CPF do participante.
              ObjSolicitacao.nuCpf   := edtNRCPF.Text;
              // CRM do prescritor número
              ObjSolicitacao.nuCrm   := edtNRCRM.Text;
              // Unidade da Federação do prescritor.
              ObjSolicitacao.sgUfCrm := cmbUF.Text;
              //
              If FileExists('c:\infog2\dnaEstacao.txt') Then
                 DeleteFile('c:\infog2\dnaEstacao.txt');
              //
              Comando:='cmd.exe /c "c:\infog2\gbasmsb.exe --solicitacao ' +
               uFuncoes.RemoveChar(edtNRCPF.Text)+ ' ' + uFuncoes.RemoveChar(ufuncoes.Alltrim(dmGerenciador.cdsConfigCFG_CNPJ_EMPRESA.AsString)) + ' ' + edtNRCRM.Text + ' ' +
               cmbUF.Text + ' ' + edtDTEMISSAO.Text +
                        ' > c:\infog2\dnaEstacao.txt"';
              {Comando:='--solicitacao ' +
               uFuncoes.RemoveChar(edtNRCPF.Text)+ ' ' + dmGerenciador.cdsConfigCFG_CNPJ_EMPRESA.AsString + ' ' + edtNRCRM.Text + ' ' +
               cmbUF.Text + ' ' + edtDTEMISSAO.Text + TimetoStr(time);
              //
              ObjSolicitacao.dnaEstacao := Trim(GetDosOutput('c:\gbasmsb.exe ' + Comando));}
              dmGerenciador.ExecutaDna(pChar(Comando),SW_Hide);
              TextoDna:=TStringList.Create;
              TextoDna.Text:='';
              If FileExists('c:\infog2\dnaEstacao.txt') Then
              Begin
                 TextoDna.LoadFromFile('c:\infog2\dnaEstacao.txt');
                 DeleteFile('c:\infog2\dnaEstacao.txt');
              End;
              ObjSolicitacao.dnaEstacao := Trim(TextoDna.Text);
              FreeAndNil(TextoDna);
              {ObjSolicitacao.dnaEstacao := uFuncoes.PegaSolicitacao(Pchar(dmGerenciador.cdsConfigCFG_CNPJ_EMPRESA.AsString),
                PChar(uFuncoes.RemoveChar(edtNRCPF.Text)),PChar(edtNRCRM.Text),PChar(cmbUF.Text),PChar(edtDTEMISSAO.Text));}
              //Showmessage(ObjSolicitacao.dnaEstacao);
              {if (dmGerenciador.GerardnaEstacao(uFuncoes.RemoveChar(edtNRCPF.Text), dmGerenciador.cdsConfigCFG_CNPJ_EMPRESA.AsString,
                    edtNRCRM.Text, cmbUF.Text, edtDTEMISSAO.Text)) Then
                begin
                     if (FileExists('DNA.TXT')) Then
                      Begin
                           mmoDnaEstacao.Lines.Clear;
                           mmoDnaEstacao.Lines.LoadFromFile('DNA.TXT');
                           ObjSolicitacao.dnaEstacao := mmoDnaEstacao.Lines.Text;
                      End
                      Else
                          raise Exception.Create('Arquivo de identificação do computador não encontrado.');
                End;  }
              // Cria o Usuário da farmacia
              ObjUsuarioFarmacia := UsuarioFarmaciaDTO.Create;
              {ObjUsuarioFarmacia.usuario := dmGerenciador.cdsConfigCFG_LOGIN.AsString;      // '40619809'        Login da Farmácia
              ObjUsuarioFarmacia.senha   := dmGerenciador.cdsConfigCFG_SENHA.AsString;      // '11866996';        Senha da Farmácia}
              // nova alterãção 28/03/2011
              StatusBar1.Panels[1].Text := '1ª Fase Pré-Solicitação...';
              Panel1.Caption := StatusBar1.Panels[1].Text+' :: '+' Tentativa ('+InttoStr(iTentativa) +')';
              if not (Panel1.Visible) Then
                 Panel1.Visible := True;
              Application.ProcessMessages;
              //
              ObjUsuarioFarmacia.usuarioFarmacia := uFuncoes.Alltrim(dmGerenciador.cdsConfigCFG_LOGIN.AsString);      //        Login da Farmácia
              ObjUsuarioFarmacia.senhaFarmacia   := uFuncoes.Alltrim(dmGerenciador.cdsConfigCFG_SENHA.AsString);      //       Senha da Farmácia
              ObjUsuarioFarmacia.usuarioVendedor := M_NMVEND;
              ObjUsuarioFarmacia.senhaVendedor   := M_SEVEND;
              //    Executa serviço
              ObjAutorizacao := AutorizacaoDTO.Create;
              Application.ProcessMessages;
              Sleep(1);
              ObjAutorizacao := Service.executarSolicitacao(ObjSolicitacao, ObjUsuarioFarmacia);
              //
              //ShowMessage(ObjAutorizacao.inAutorizacaoSolicitacao+' '+ ObjAutorizacao.descMensagemErro);
              //
              If (ObjAutorizacao.inAutorizacaoSolicitacao = '00S')
                   or (ObjAutorizacao.inAutorizacaoSolicitacao = '01S') Then
              Begin
                    StatusBar1.Panels[1].Text := ObjAutorizacao.descMensagemErro;
                    // 03/01/2012
                    dmGerenciador.cdsDados.First;
                    dmGerenciador.cdsDados.DisableControls;
                    i := 0;
                    //  Carregar os produtos
                    While not (dmGerenciador.cdsDados.Eof) do
                    begin
                         dmGerenciador.cdsDados.edit;
                         With ObjAutorizacao do
                         begin
                              dmGerenciador.cdsDados.FieldByName('PRO_QTAUTORIZADA').AsFloat        := arrMedicamentoDTO[i].qtAutorizada;                   // Quantidade autorizada (em comprimidos)
                              dmGerenciador.cdsDados.FieldByName('PRO_VLPRECO_SUBSIDIADO').AsFloat  := arrMedicamentoDTO[i].vlPrecoSubsidiadoMS;             // Valor Pago MS
                              dmGerenciador.cdsDados.FieldByName('PRO_VLPRECO_SUBPACIENTE').AsFloat :=
                                          dmGerenciador.cdsDados.FieldByName('PRO_SUBTOTAL').AsFloat - arrMedicamentoDTO[i].vlPrecoSubsidiadoMS;
                              dmGerenciador.cdsDados.FieldByName('PRO_PARCELAPACIENTE').AsFloat     := arrMedicamentoDTO[i].vlPrecoSubsidiadoPaciente;
                              //arrMedicamentoDTO[i].vlPrecoSubsidiadoPaciente;       // Valor Pago Cliente
                              dmGerenciador.cdsDados.FieldByName('PRO_VLPRECO_VENDA').AsFloat       := arrMedicamentoDTO[i].vlPrecoVenda;
                              dmGerenciador.cdsDados.FieldByName('PRO_MENSAGEM').AsString           := arrMedicamentoDTO[i].inAutorizacaoMedicamento;
                              dmGerenciador.cdsDados.FieldByName('PRO_AUTORMEDICAMENTO').AsString   := ObjAutorizacao.nuAutorizacao;
                              dmGerenciador.cdsDados.FieldByName('PRO_RETORNO').AsString            := arrMedicamentoDTO[i].statusTransacao;

                              If (arrMedicamentoDTO[i].qtAutorizada > 0) Then
                                  dmGerenciador.cdsDados.FieldByName('PRO_FLAUTO').AsBoolean    := true
                              Else
                                  dmGerenciador.cdsDados.FieldByName('PRO_FLAUTO').AsBoolean    := false;
                         End;
                         dmGerenciador.cdsDados.post;
                         //
                         i := i + 1;
                         //
                         dmGerenciador.cdsDados.Next;
                    End;
                    //
                    dmGerenciador.cdsDados.First;
                    dmGerenciador.cdsDados.EnableControls;
                    //
                    M_DTVEND := Date();
                    M_HOVEND := TimetoStr(time);
                    //
                    Application.CreateForm(TFrmConfirmacaoVenda, FrmConfirmacaoVenda);
                    try
                        if (FrmConfirmacaoVenda.ShowModal = mrOk) Then
                            bConfirmaVenda := true;
                    Finally
                        FrmConfirmacaoVenda.free;
                    End;
                    //
                 If (bConfirmaVenda) Then
                  begin
                    Panel1.Visible := true;
                    M_NRCUPO := uFuncoes.StrZero(edtNRCUPO.Text,6);
                    // Confirmação
                    ObjConfirmaAutorizacao := ConfirmacaoDTO.Create();
                    ObjConfirmaAutorizacao.coSolicitacaoFarmacia := M_NRSOLI;
                    ObjConfirmaAutorizacao.nuAutorizacao  := ObjAutorizacao.nuAutorizacao;
                    ObjConfirmaAutorizacao.nuCupomFiscal  := M_NRCUPO;
                    //
                    ObjConfirmaAutoriz := ConfirmacaoAutorizacaoDTO.Create;
                    //
                    Panel1.Caption := 'Enviando Confirmação de Venda MS...';
                    Application.ProcessMessages;
                    Sleep(50);
                    ObjConfirmaAutoriz := Service.confirmarAutorizacao(ObjConfirmaAutorizacao,  ObjUsuarioFarmacia); // Envia confirmação
                    //
                    StatusBar1.Panels[1].Text := '2ª Fase Confirmação :: concluída...';
                    //
                    If (ObjConfirmaAutoriz.inAutorizacaoSolicitacao = '00A')
                      or (ObjConfirmaAutoriz.inAutorizacaoSolicitacao = '01A') Then
                    // Recebimento
                    Begin
                         StatusBar1.Panels[1].Text := ObjConfirmaAutoriz.descMensagemErro;
                         //
                         ObjConfirmarRecebimento := RecebimentoDTO.Create;
                         ObjConfirmarRecebimento.arrMedicamentoDTO := ObjConfirmaAutoriz.arrMedicamentoDTO;
                         ObjConfirmarRecebimento.nuAutorizacao     := ObjConfirmaAutoriz.nuAutorizacao;
                         ObjConfirmarRecebimento.nuCupomFiscal     := ObjConfirmaAutoriz.nuCupomFiscal;
                         // Cria o Usuário da farmacia
                         ObjUsuarioFarmacia := UsuarioFarmaciaDTO.Create;
                         ObjUsuarioFarmacia.usuarioFarmacia := dmGerenciador.cdsConfigCFG_LOGIN.AsString;      // '40619809'        Login da Farmácia
                         ObjUsuarioFarmacia.senhaFarmacia   := dmGerenciador.cdsConfigCFG_SENHA.AsString;      // '11866996';        Senha da Farmácia
                         ObjUsuarioFarmacia.usuarioVendedor := M_NMVEND;
                         ObjUsuarioFarmacia.senhaVendedor   := M_SEVEND;
                         //
                         Panel1.Caption := 'Recebendo Confirmação de Venda MS...';
                         Application.ProcessMessages;
                         Sleep(50);
                         ObjRecebimento := Service.confirmarRecebimento(ObjConfirmarRecebimento , ObjUsuarioFarmacia);
                         //  Se solicitação e autização e recebimento Confirmados
                         If (ObjRecebimento.codigoRetorno = '00R') OR (ObjRecebimento.codigoRetorno = '00RV')
                            OR (ObjRecebimento.codigoRetorno = '01R') Then
                         begin
                             StatusBar1.Panels[1].Text := ObjRecebimento.mensagemRetorno;
                             //
                             i := 0;
                             dmGerenciador.cdsDados.DisableControls;
                             dmGerenciador.cdsDados.First;
                             //  Carregar os produtos
                               While not (dmGerenciador.cdsDados.eof) do
                                begin
                                     dmGerenciador.cdsDados.Edit;
                                     dmGerenciador.cdsDados.FieldByName('PRO_AUTOR_ESTORNO').AsString :=
                                                   ObjRecebimento.arrMedicamentoDTO[i].inAutorizacaoEstorno;
                                     dmGerenciador.cdsDados.FieldByName('PRO_AUTORMEDICAMENTO').AsString :=
                                                   ObjRecebimento.arrMedicamentoDTO[i].inAutorizacaoMedicamento;
                                     dmGerenciador.cdsDados.FieldByName('PRO_QTAUTORIZADA').AsFloat :=
                                                   ObjRecebimento.arrMedicamentoDTO[i].qtAutorizada;
                                     dmGerenciador.cdsDados.FieldByName('PRO_QTDEVOLVIDA').AsFloat  :=
                                                   ObjRecebimento.arrMedicamentoDTO[i].qtDevolvida;
                                     dmGerenciador.cdsDados.FieldByName('PRO_QTESTORNADA').AsFloat  :=
                                                   ObjRecebimento.arrMedicamentoDTO[i].qtEstornada;
                                     dmGerenciador.cdsDados.FieldByName('PRO_QTPRESCRITA').AsFloat  :=
                                                   ObjRecebimento.arrMedicamentoDTO[i].qtPrescrita;
                                     dmGerenciador.cdsDados.FieldByName('PRO_QTSOLICITADA').AsFloat :=
                                                   ObjRecebimento.arrMedicamentoDTO[i].qtSolicitada;
                                     dmGerenciador.cdsDados.FieldByName('PRO_STATUS').AsString :=
                                                   ObjRecebimento.arrMedicamentoDTO[i].statusTransacao;
                                     dmGerenciador.cdsDados.FieldByName('PRO_VLPRECO_SUBSIDIADO').AsFloat :=
                                                   ObjRecebimento.arrMedicamentoDTO[i].vlPrecoSubsidiadoMS;
                                     dmGerenciador.cdsDados.FieldByName('PRO_VLPRECO_SUBPACIENTE').AsFloat :=
                                                   ObjRecebimento.arrMedicamentoDTO[i].vlPrecoSubsidiadoPaciente;
                                     dmGerenciador.cdsDados.FieldByName('PRO_VLPACIENTE_POSESTORNO').AsFloat :=
                                                   ObjRecebimento.arrMedicamentoDTO[i].vlPrecoSubsidiadoPacientePosEstorno;
                                     dmGerenciador.cdsDados.FieldByName('PRO_VLPRECO_VENDA').AsFloat :=
                                                   ObjRecebimento.arrMedicamentoDTO[i].vlPrecoVenda;
                                     dmGerenciador.cdsDados.FieldByName('PRO_VLSUBMS_POSESTORNO').AsFloat :=
                                                   ObjRecebimento.arrMedicamentoDTO[i].vlrSubsidiadoMSPosEstorno;
                                     dmGerenciador.cdsDados.FieldByName('PRO_VLTOTAL_VENDA_POSESTORNO').AsFloat :=
                                                   ObjRecebimento.arrMedicamentoDTO[i].vlrTotalVendaPosEstorno;
                                     dmGerenciador.cdsDados.FieldByName('PRO_RETORNO').AsString := ObjRecebimento.codigoRetorno;
                                     //
                                     If (ObjRecebimento.codigoRetorno = '00R') Then
                                          dmGerenciador.cdsDados.FieldByName('PRO_FLSITUACAO').AsString := 'AUTORIZADO';
                                     If (ObjRecebimento.codigoRetorno = '01R') Then
                                          dmGerenciador.cdsDados.FieldByName('PRO_FLSITUACAO').AsString := 'PARCIALMENTE';
                                     //
                                     dmGerenciador.cdsDados.FieldByName('PRO_MENSAGEM').AsString   := ObjRecebimento.arrMedicamentoDTO[i].inAutorizacaoMedicamento;
                                     dmGerenciador.cdsDados.Post;
                                     //
                                     i := i + 1;
                                     dmGerenciador.cdsDados.Next;
                                 End;
                             dmGerenciador.cdsDados.EnableControls;
                             //  Alteração 29/03/2011 Cupom vinculado
                             TextoCupomVinculado := TStringList.Create;
                             TextoCupomVinculado2 := TStringList.Create;
                             If FileExists(uInfoPrincipal.M_PASTA_RESP+'cupom.txt') Then
                                 DeleteFile(uInfoPrincipal.M_PASTA_RESP+'cupom.txt');
                             //
                             if FileExists(uInfoPrincipal.M_PASTA_RESP+'cupomvin.txt') then
                                DeleteFile(uInfoPrincipal.M_PASTA_RESP+'cupomvin.txt');
                             //
                             TextoCupomVinculado.Text := ObjRecebimento.cupomVinculado;
                             TextoCupomVinculado.Text := TextoCupomVinculado.Text + ObjRecebimento.mensagemRetorno;
                             TextoCupomVinculado.Text := uFuncoes.ReplaceStr(TextoCupomVinculado.Text, '@', #13+#10);
                             //TextoCupomVinculado.Text := uFuncoes.ReplaceStr(TextoCupomVinculado.Text, '@', chr(13) + chr(10));
                             //
                             try
                                 AssignFile(ArqCupomVinculado, uInfoPrincipal.M_PASTA_RESP+'cupomvin.txt');
                                 if not FileExists(uInfoPrincipal.M_PASTA_RESP+'cupomvin.txt') then
                                      Rewrite(ArqCupomVinculado,uInfoPrincipal.M_PASTA_RESP+'cupomvin.txt');
                                 Append(ArqCupomVinculado);
                                 //
                                 For I := 0 to TextoCupomVinculado.Count - 1 do
                                 begin
                                      if (uFuncoes.Alltrim(TextoCupomVinculado[I]) <> '[INICIO]') Then
                                         if (uFuncoes.Alltrim(TextoCupomVinculado[I]) <> '[FIM]') Then
                                             If (uFuncoes.Alltrim(TextoCupomVinculado[I]) <> 'Recebimento confirmado com sucesso.') Then
                                                 TextoCupomVinculado2.add(TextoCupomVinculado[I]);
                                                 //WriteLn(ArqCupomVinculado, uFuncoes.RemoveAcento(TextoCupomVinculado[I]));
                                 End;
                                 //
                                 Write(ArqCupomVinculado, uFuncoes.RemoveAcento(TextoCupomVinculado2.Text));
                                 //WriteLn(ArqCupomVinculado);
                             finally
                                 StrArqCupomVinculado := ObjRecebimento.cupomVinculado;
                                 CloseFile(ArqCupomVinculado);
                             end;
                             aTexto01 := TextoCupomVinculado.Text;
                             aTexto02 := TextoCupomVinculado2.Text;
                             //
                             FreeAndNil(TextoCupomVinculado);
                             FreeAndNil(TextoCupomVinculado2);
                             //    pré-solicitação confirmada
                             dmGerenciador.AtualizarPreSolicitacao(M_NRCUPO, M_HOVEND, M_DTVEND);
                             //
                             Panel1.Caption := 'Venda Autorizada';
                             Application.ProcessMessages;
                             //
                             M_NRAUTO := ObjAutorizacao.nuAutorizacao;
                             M_NMCLIE := ObjConfirmaAutoriz.noPessoa;
                             lbl_TOTAL.caption := FormatFloat('#,##0.#0', VALOR_PG_CLIENTE());
                             //
                             M_FLSITU   := '1';
                             M_MENSAGEM := ObjRecebimento.mensagemRetorno;
                             // Grava venda
                             GRAVAR_VENDA(aTexto01, aTexto02);
                             //
                             Panel1.Visible := false;
                             StatusBar1.Panels[1].Text := 'Solicitação concluída com sucesso!!!';
                             iTentativa := 1;
                         End
                         Else
                         Begin
                               i := 0;
                               dmGerenciador.cdsDados.DisableControls;
                               dmGerenciador.cdsDados.First;
                               //  Carregar os produtos
                               While not (dmGerenciador.cdsDados.eof) do
                                  begin
                                        dmGerenciador.cdsDados.Edit;
                                        dmGerenciador.cdsDados.FieldByName('PRO_AUTOR_ESTORNO').AsString :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].inAutorizacaoEstorno;
                                        dmGerenciador.cdsDados.FieldByName('PRO_AUTORMEDICAMENTO').AsString :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].inAutorizacaoMedicamento;
                                        dmGerenciador.cdsDados.FieldByName('PRO_QTAUTORIZADA').AsFloat :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].qtAutorizada;
                                        dmGerenciador.cdsDados.FieldByName('PRO_QTDEVOLVIDA').AsFloat  :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].qtDevolvida;
                                        dmGerenciador.cdsDados.FieldByName('PRO_QTESTORNADA').AsFloat  :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].qtEstornada;
                                        dmGerenciador.cdsDados.FieldByName('PRO_QTPRESCRITA').AsFloat  :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].qtPrescrita;
                                        dmGerenciador.cdsDados.FieldByName('PRO_QTSOLICITADA').AsFloat :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].qtSolicitada;
                                        dmGerenciador.cdsDados.FieldByName('PRO_STATUS').AsString :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].statusTransacao;
                                        dmGerenciador.cdsDados.FieldByName('PRO_VLPRECO_SUBSIDIADO').AsFloat :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].vlPrecoSubsidiadoMS;
                                        dmGerenciador.cdsDados.FieldByName('PRO_VLPRECO_SUBPACIENTE').AsFloat :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].vlPrecoSubsidiadoPaciente;
                                        dmGerenciador.cdsDados.FieldByName('PRO_VLPACIENTE_POSESTORNO').AsFloat :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].vlPrecoSubsidiadoPacientePosEstorno;
                                        dmGerenciador.cdsDados.FieldByName('PRO_VLPRECO_VENDA').AsFloat :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].vlPrecoVenda;
                                        dmGerenciador.cdsDados.FieldByName('PRO_VLSUBMS_POSESTORNO').AsFloat :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].vlrSubsidiadoMSPosEstorno;
                                        dmGerenciador.cdsDados.FieldByName('PRO_VLTOTAL_VENDA_POSESTORNO').AsFloat :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].vlrTotalVendaPosEstorno;
                                        If (ObjAutorizacao.arrMedicamentoDTO[i].inAutorizacaoMedicamento = '00SM') Then
                                        begin
                                            dmGerenciador.cdsDados.FieldByName('PRO_FLSITUACAO').AsString := 'AUTORIZADO';
                                            dmGerenciador.cdsDados.FieldByName('PRO_FLAUTO').AsBoolean    := true;
                                        End
                                        Else
                                        begin
                                            dmGerenciador.cdsDados.FieldByName('PRO_FLSITUACAO').AsString := 'NÃO AUTORIZADO';
                                            dmGerenciador.cdsDados.FieldByName('PRO_FLAUTO').AsBoolean    := false;
                                        End;
                                        //
                                        dmGerenciador.cdsDados.FieldByName('PRO_MENSAGEM').AsString   := ObjAutorizacao.arrMedicamentoDTO[i].inAutorizacaoMedicamento;
                                        dmGerenciador.cdsDados.Post;
                                        //
                                        i := i + 1;
                                        dmGerenciador.cdsDados.Next;
                                  End;
                                  //
                                  dmGerenciador.cdsDados.EnableControls;
                                  ShowMessage(ObjRecebimento.codigoRetorno+ ' '+ObjRecebimento.mensagemRetorno);
                                  Panel1.Visible := false;
                                  Exit;
                               //btCancelarClick(Sender);
                         End;   // Fim-se Recebimento
                    End
                    Else
                    Begin
                         //
                         ShowMessage(''+ObjConfirmaAutoriz.inAutorizacaoSolicitacao+' '+
                               ObjConfirmaAutoriz.descMensagemErro);
                         //
                         i := 0;
                         dmGerenciador.cdsDados.DisableControls;
                         dmGerenciador.cdsDados.First;
                         //  Carregar os produtos
                         While not (dmGerenciador.cdsDados.eof) do
                         begin
                            dmGerenciador.cdsDados.Edit;
                            dmGerenciador.cdsDados.FieldByName('PRO_AUTOR_ESTORNO').AsString :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].inAutorizacaoEstorno;
                            dmGerenciador.cdsDados.FieldByName('PRO_AUTORMEDICAMENTO').AsString :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].inAutorizacaoMedicamento;
                            dmGerenciador.cdsDados.FieldByName('PRO_QTAUTORIZADA').AsFloat :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].qtAutorizada;
                            dmGerenciador.cdsDados.FieldByName('PRO_QTDEVOLVIDA').AsFloat  :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].qtDevolvida;
                            dmGerenciador.cdsDados.FieldByName('PRO_QTESTORNADA').AsFloat  :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].qtEstornada;
                            dmGerenciador.cdsDados.FieldByName('PRO_QTPRESCRITA').AsFloat  :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].qtPrescrita;
                            dmGerenciador.cdsDados.FieldByName('PRO_QTSOLICITADA').AsFloat :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].qtSolicitada;
                            dmGerenciador.cdsDados.FieldByName('PRO_STATUS').AsString :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].statusTransacao;
                            dmGerenciador.cdsDados.FieldByName('PRO_VLPRECO_SUBSIDIADO').AsFloat :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].vlPrecoSubsidiadoMS;
                            dmGerenciador.cdsDados.FieldByName('PRO_VLPRECO_SUBPACIENTE').AsFloat :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].vlPrecoSubsidiadoPaciente;
                            dmGerenciador.cdsDados.FieldByName('PRO_VLPACIENTE_POSESTORNO').AsFloat :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].vlPrecoSubsidiadoPacientePosEstorno;
                            dmGerenciador.cdsDados.FieldByName('PRO_VLPRECO_VENDA').AsFloat :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].vlPrecoVenda;
                            dmGerenciador.cdsDados.FieldByName('PRO_VLSUBMS_POSESTORNO').AsFloat :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].vlrSubsidiadoMSPosEstorno;
                            dmGerenciador.cdsDados.FieldByName('PRO_VLTOTAL_VENDA_POSESTORNO').AsFloat :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].vlrTotalVendaPosEstorno;
                            If (ObjAutorizacao.arrMedicamentoDTO[i].inAutorizacaoMedicamento = '00SM') Then
                             begin
                                dmGerenciador.cdsDados.FieldByName('PRO_FLSITUACAO').AsString := 'AUTORIZADO';
                                dmGerenciador.cdsDados.FieldByName('PRO_FLAUTO').AsBoolean    := true;
                             End
                            Else
                             begin
                                dmGerenciador.cdsDados.FieldByName('PRO_FLSITUACAO').AsString := 'NÃO AUTORIZADO';
                                dmGerenciador.cdsDados.FieldByName('PRO_FLAUTO').AsBoolean    := false;
                             End;
                            //
                            dmGerenciador.cdsDados.FieldByName('PRO_MENSAGEM').AsString   := ObjAutorizacao.arrMedicamentoDTO[i].inAutorizacaoMedicamento;
                            dmGerenciador.cdsDados.Post;
                            //
                            i := i + 1;
                            dmGerenciador.cdsDados.Next;
                         End;
                         dmGerenciador.cdsDados.EnableControls;
                         //
                         M_FLSITU   := '0';
                         M_MENSAGEM := ObjAutorizacao.inAutorizacaoSolicitacao +' - ' + ObjAutorizacao.descMensagemErro;
                         Panel1.Visible := false;
                         //
                         GERAR_ARQUIVO;
                    End;  // Fim-se Confirmação
                  End    // fim-se bConfirmaVenda
                  Else
                       btCancelarClick(Self);
              //
              End  // Fim-se Solitacao
              Else  // Se não autorizar
              Begin
                   ShowMessage(ObjAutorizacao.inAutorizacaoSolicitacao+' '+ ObjAutorizacao.descMensagemErro);
                   //
                   i := 0;
                   dmGerenciador.cdsDados.DisableControls;
                   dmGerenciador.cdsDados.First;
                   //  Carregar os produtos
                   While not (dmGerenciador.cdsDados.eof) do
                      begin
                            dmGerenciador.cdsDados.Edit;
                            dmGerenciador.cdsDados.FieldByName('PRO_AUTOR_ESTORNO').AsString :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].inAutorizacaoEstorno;
                            dmGerenciador.cdsDados.FieldByName('PRO_AUTORMEDICAMENTO').AsString :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].inAutorizacaoMedicamento;
                            //dmGerenciador.cdsDados.FieldByName('PRO_MENSAGEM').AsString :=
                            dmGerenciador.cdsDados.FieldByName('PRO_QTAUTORIZADA').AsFloat :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].qtAutorizada;
                            dmGerenciador.cdsDados.FieldByName('PRO_QTDEVOLVIDA').AsFloat  :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].qtDevolvida;
                            dmGerenciador.cdsDados.FieldByName('PRO_QTESTORNADA').AsFloat  :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].qtEstornada;
                            dmGerenciador.cdsDados.FieldByName('PRO_QTPRESCRITA').AsFloat  :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].qtPrescrita;
                            dmGerenciador.cdsDados.FieldByName('PRO_QTSOLICITADA').AsFloat :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].qtSolicitada;
                            dmGerenciador.cdsDados.FieldByName('PRO_STATUS').AsString :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].statusTransacao;
                            dmGerenciador.cdsDados.FieldByName('PRO_VLPRECO_SUBSIDIADO').AsFloat :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].vlPrecoSubsidiadoMS;
                            dmGerenciador.cdsDados.FieldByName('PRO_VLPRECO_SUBPACIENTE').AsFloat :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].vlPrecoSubsidiadoPaciente;
                            dmGerenciador.cdsDados.FieldByName('PRO_VLPACIENTE_POSESTORNO').AsFloat :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].vlPrecoSubsidiadoPacientePosEstorno;
                            dmGerenciador.cdsDados.FieldByName('PRO_VLPRECO_VENDA').AsFloat :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].vlPrecoVenda;
                            dmGerenciador.cdsDados.FieldByName('PRO_VLSUBMS_POSESTORNO').AsFloat :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].vlrSubsidiadoMSPosEstorno;
                            dmGerenciador.cdsDados.FieldByName('PRO_VLTOTAL_VENDA_POSESTORNO').AsFloat :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].vlrTotalVendaPosEstorno;
                            dmGerenciador.cdsDados.FieldByName('PRO_FLSITUACAO').AsString := 'NÃO AUTORIZADO';
                            dmGerenciador.cdsDados.FieldByName('PRO_MENSAGEM').AsString   := ObjAutorizacao.arrMedicamentoDTO[i].inAutorizacaoMedicamento;
                            dmGerenciador.cdsDados.FieldByName('PRO_FLAUTO').AsBoolean    := false;
                            //
                            dmGerenciador.cdsDados.Post;
                            //
                            i := i + 1;
                            dmGerenciador.cdsDados.Next;
                      End;
                      dmGerenciador.cdsDados.EnableControls;
                      //
                      M_FLSITU   := '0';
                      M_MENSAGEM :=  ObjAutorizacao.inAutorizacaoSolicitacao +' - ' + ObjAutorizacao.descMensagemErro;
                      //
                      Panel1.Visible := false;
                      GERAR_ARQUIVO;
              End;
       Except
          on Exc:Exception do
          begin
                Panel1.Caption := 'Erro ao tentar realizar solicitação!!!' + ' Tentativa ('+IntToStr(iTentativa) +')';
                // if (Exc.Message = 'A conexão com o servidor foi reconfigurada') Then   

                if (iTentativa < 2) Then
                begin
                     iTentativa := iTentativa + 1;
                     Panel1.Caption := 'Aguarde, tentando novamente sua solicitação!!!';
                     Application.ProcessMessages;
                     Sleep(100);
                     Panel1.Visible := False;
                     btReceberClick(self);
                End
                Else
                begin
                     Application.MessageBox(PChar('Erro ao tentar realizar solicitação!!!'
                        + Exc.Message), 'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     //
                     Panel1.Visible := False;
                     iTentativa := 1;
                     {If Application.MessageBox('Tentar novamente?',
                      'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1+MB_APPLMODAL) = idYes then
                     begin
                            btReceberClick(self);
                     End
                     Else
                     begin
                          HABILITAR_CONTROLES;
                          btCancelarClick(Sender);
                     End; }
                End;
          End;
       End;
    Finally
          ObjRecebimento.Free;
          ObjUsuarioFarmacia.Free;
          ObjAutorizacao.Free;
          ObjConfirmaAutoriz.Free;
          ObjSolicitacao.Free;
          //
          Panel1.Visible := false;
          //
          HABILITAR_CONTROLES;
          {pnlSuperior.Enabled := True;
          pnlGrid.Enabled     := True;
          pnlDados.Enabled    := True;
          pnlInferior.Enabled := True;}
          //
          btReceber.Enabled := False;
          StatusBar1.Panels[1].Text := '';
          //
          Animate1.Active  := False;
          Animate1.Visible := False;
          //
          Screen.Cursor := crDefault;
    End;
    Application.ProcessMessages;
  End
  Else
      SIMULACAO;
  //
  M_FLVEND := False;    
end;

function TfrmVendas.VALOR_PG_CLIENTE: Real;
Var
    W_TOTAL : Real;
begin
      W_TOTAL := 0;
      With dmGerenciador.cdsDados do
          begin
               DisableControls;
               First;
               While not (Eof) do
               Begin
                   W_TOTAL := W_TOTAL + FieldByname('PRO_VLPRECO_SUBPACIENTE').AsCurrency;
                   //
                   Next;
               End;
               EnableControls;
          End;
      //
      result := W_TOTAL;
end;

procedure TfrmVendas.CANCELA_VENDA;
begin
     LIMPAR;
     //
     edtNRCPF.Clear;
     edtNRCRM.Clear;
     edtDTEMISSAO.Clear;
     edtQTPRESC.Clear;
     edtNMCLIE.Clear;
     edtNRCUPO.Clear;
     lbl_TOTAL.Caption := '0,00';
     spLocCliente.Enabled := False;
     //
     BOTOES;
     //
     Panel1.Visible := false;
     //
     dmGerenciador.cdsDados.Close;
     //
     StatusBar1.Panels[1].Text := '';
     btGravar.Enabled := False;
     btReceber.Enabled := False;
     //
     pnlSuperior.Enabled := False;
     pnlGrid.Enabled     := False;
     pnlDados.Enabled    := False;
     //
     Close;
     {If (pnlInferior.Enabled) Then
      If (btAdicionar.Enabled) Then
           btAdicionar.SetFocus;    }
end;

procedure TfrmVendas.edtNRCUPOKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
     //
     If (key = #13)
        and not uFuncoes.Empty(edtNRCUPO.Text) Then
     Begin
          KEY := #0;
          cmbVendedores.SetFocus;
          //edtCDPROD.SetFocus;
     End;

end;

procedure TfrmVendas.edtNRCUPOExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtNRCUPO.Text) Then
       edtNRCUPO.Text := uFuncoes.StrZero(edtNRCUPO.Text,6);
end;

function TfrmVendas.IMPRESSORA(W_CDCAIX: integer): Integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select * from USUARIOS Where (SEN_CODIGO = :pCODIGO) ';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmGerenciador.sqlConnGerenciador;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsInteger := W_CDCAIX;
      Open;
      //
      If Not (IsEmpty) Then
        result := FieldByName('SEN_IMPRESSORA').AsInteger;
    finally
      free;
    end;
     {With dmGerenciador.qryUsuarios do
     Begin
          Close;
          Params.ParamByName('pCODIGO').AsInteger := W_CDCAIX;
          Open;
     End;}
     //
     //result := dmGerenciador.qryUsuarios.FieldByName('SEN_IMPRESSORA').AsInteger;
end;

function TfrmVendas.LOCALIZAR_CLIENTE(M_NUMCPF: String): Boolean;
begin
     With dmGerenciador.qryProcurar do
       begin
            SQL.Clear;
            Close;
            SQL.Add('Select PAC_CPF, PAC_NOME from PACIENTES Where (PAC_CPF = :pCPF)');
            Params.ParamByName('pCPF').AsString := M_NUMCPF;
            Open;
            //
            If not (IsEmpty) Then
                result := True
            Else
                result := False;
       End;
       //
end;

procedure TfrmVendas.spLocClienteClick(Sender: TObject);
begin
    frmLocCliente := TfrmLocCliente.create(application);
    try
        edtNMCLIE.Clear ;
        edtNRCPF.SetFocus;
        ufrmLocCliente.iOpcao := 1;
        frmLocCliente.showmodal;
    finally
        frmLocCliente.Release;
        frmLocCliente := nil;
        //
        If not uFuncoes.Empty(edtNRCPF.Text) Then
            edtNMCLIE.SetFocus;
    end;
end;

procedure TfrmVendas.edtNRCPFKeyPress(Sender: TObject; var Key: Char);
begin
     If (key = #13)
            and uFuncoes.Empty(edtNRCPF.Text) Then
      begin
           Key := #0;
           spLocClienteClick(Sender);
      End;
      //
     If (key = #13)
        and not uFuncoes.Empty(edtNRCPF.Text) Then
      begin
           Key := #0;
           edtNMCLIE.SetFocus;
      End;
end;

procedure TfrmVendas.edtNMCLIEKeyPress(Sender: TObject; var Key: Char);
begin
     If (key = #13)
        and not uFuncoes.Empty(edtNMCLIE.Text) Then
      begin
           Key := #0;
           edtNRCRM.SetFocus;
      End;
end;

procedure TfrmVendas.cmbUFKeyPress(Sender: TObject; var Key: Char);
begin
     If (key = #13)
        and not uFuncoes.Empty(cmbUF.Text) Then
      begin
           Key := #0;
           edtDTEMISSAO.SetFocus;
      End;
end;

procedure TfrmVendas.edtQuantidadeEnter(Sender: TObject);
begin
       //If (dmGerenciador.PROCURAR_PRODUTO2(uFuncoes.StrZero(edtCDPROD.Text,13))= False)  Then
       If not (dmGerenciador.GetCodigoProduto(uFuncoes.StrZero(edtCDPROD.Text,13))) Then
       begin
            Application.MessageBox('Código de produto não cadatrado!!!',
               'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
            edtCDPROD.Clear;
            edtCDPROD.SetFocus;
            Exit;
       End
       Else
       Begin
            MOSTRA(uFuncoes.StrZero(edtCDPROD.Text,13));
            edtQuantidade.SetFocus;
       End;
end;

procedure TfrmVendas.edtQuantidadeExit(Sender: TObject);
begin
      If (edtQuantidade.Value = 0) Then
        begin
             edtQuantidade.SetFocus;
             Exit;
        End;
end;

procedure TfrmVendas.edtQTPRESCEnter(Sender: TObject);
begin
      If (edtQuantidade.Value = 0) Then
        begin
             edtQuantidade.SetFocus;
             Exit;
        End;
end;

procedure TfrmVendas.GRAVAR_VENDA(aCupom, aTextoCupom : String);
Var
    TD : TTransactionDesc;
    W_NRSOLI, iRetorno, M_NRITEM : Integer;
    M_CTEXTO, M_NMMODA, M_TXMEDI, M_QDLINH, M_TXCABE, M_TXRODA : String;
    arqCupom: TextFile;
    linha, aHora : String;
    M_VLPGMS, M_VLPG_CLIENTE : Double;
begin

 try
   Screen.Cursor := crHourGlass;
   //
   try
      M_NMCLIE := edtNMCLIE.Text;
      //
      iRetorno  := 1;
      If (iRetorno = 1) Then
      begin
               //
               uFuncoes.RefreshCDS(dmGerenciador.cdsConfig);
               // Inicia um transação no BD
               TD.TransactionID  := StrtoInt(uInfoPrincipal.M_CDUSUA);
               TD.IsolationLevel := xilREADCOMMITTED;
               dmGerenciador.sqlConnGerenciador.StartTransaction(TD);
               //
               dmGerenciador.cdsConfig.Edit;
               dmGerenciador.cdsConfig.FieldByName('CFG_SEQUENCIA').AsInteger :=
                  dmGerenciador.cdsConfig.FieldByName('CFG_SEQUENCIA').AsInteger + 1;
               dmGerenciador.cdsConfig.Post;
               dmGerenciador.cdsConfig.ApplyUpdates(0);
               //
               M_VLPG_CLIENTE := 0;
               W_NRSOLI := dmGerenciador.cdsConfig.FieldByName('CFG_SEQUENCIA').AsInteger;
               M_VLMOVI := VALOR_VENDA();
               //
               {dmGerenciador.cdsVendas.Close;
               With dmGerenciador.dstVendas do
                 Begin
                      Active := False;
                      CommandText := 'Select * from VENDAS Where (MOV_CODSOLICITACAO = :pSOLICITACAO)';
                      Params.ParamByName('pSOLICITACAO').AsInteger := W_NRSOLI;
                      Active := True;
                 End;
               dmGerenciador.cdsVendas.Open;}
               //
               uFuncoes.FilterCDS(dmGerenciador.cdsVendas, fsInteger, InttoStr(W_NRSOLI));
               //
               If (dmGerenciador.cdsVendas.IsEmpty) Then
                  begin
                       //M_VLMOVI := VALOR_PG_CLIENTE();
                       M_VLPGMS := VALOR_PAGAR_MS(dmGerenciador.cdsConfigCFG_SIMULACAO.AsString);
                       M_VLPG_CLIENTE := M_VLMOVI - M_VLPGMS;
                       M_VLMOVI := VALOR_VENDA_Novo(dmGerenciador.cdsDados) - M_VLPGMS;
                       // Grava arquivo XML
                       aHora := Copy(TimetoStr(Time),1,5);
                       //
                       dmGerenciador.GravarVendaXML(W_NRSOLI, dmGerenciador.cdsDados,
                            uFuncoes.RemoveChar(edtNRCPF.Text), M_NMCLIE, edtNRCRM.Text, M_NRCUPO, M_NRAUTO, aHora, 'F',
                            Date(), M_VLMOVI +  M_VLPGMS , M_VLPGMS, M_VLPG_CLIENTE,
                            dmGerenciador.GetCodigoVendedorporNome(cmbVendedores.Text),
                            StrtoInt(uInfoPrincipal.M_CDUSUA), aCupom, aTextoCupom);
                       // Inclui venda
                       With dmGerenciador.cdsVendas do
                         begin
                              Append;
                              FieldByName('MOV_CODSOLICITACAO').AsInteger := W_NRSOLI;
                              FieldByName('MOV_CPFPACIENTE').AsString     := edtNRCPF.Text;
                              FieldByName('MOV_NOMEPESSOA').AsString      := M_NMCLIE;
                              FieldByName('MOV_CRM_MEDICO').AsString      := edtNRCRM.Text;
                              FieldByName('MOV_DTEMISSAO').AsDateTime     := edtDTEMISSAO.Date;
                              FieldByName('MOV_NRCUPOM').AsInteger        := StrtoInt(M_NRCUPO); //W_NRSOLI
                              FieldByName('MOV_VALOR').AsFloat            := M_VLMOVI;
                              FieldByName('MOV_VLPAGO').AsFloat           := M_VLPGMS;   //M_VLMOVI;
                              FieldByName('MOV_VLDEBITO').AsFloat         := M_VLMOVI;
                              FieldByName('MOV_AUTORIZACAO').Value        := M_NRAUTO;
                              FieldByName('MOV_CODINDICADOR').AsInteger   := M_CDINDI;
                              FieldByName('MOV_DTVENDA').AsDateTime       := Date();
                              FieldByName('MOV_FLSITU').AsString          := 'F';
                              FieldByName('MOV_CDUSUARIO').AsInteger      := StrtoInt(uInfoPrincipal.M_CDUSUA);
                              FieldByName('MOV_CODVENDEDOR').AsInteger    := dmGerenciador.GetCodigoVendedorporNome(cmbVendedores.Text);
                              FieldByName('MOV_CUPOM_VINCULADO').AsString := StrArqCupomVinculado;
                              Post;
                              ApplyUpdates(0);
                         End;
                           //
                           uFuncoes.FilterCDS(dmGerenciador.cdsProdutosVendas, fsInteger, InttoStr(W_NRSOLI));
                           //
                           dmGerenciador.cdsDados.DisableControls;
                           dmGerenciador.cdsDados.First;
                           While not (dmGerenciador.cdsDados.Eof) do
                           Begin
                                With dmGerenciador.cdsProdutosVendas do
                                  begin
                                       Append;
                                       FieldByName('PRV_CODSOLICITACAO').AsInteger      := W_NRSOLI;
                                       FieldByName('PRV_CODBARRAS').AsString            := dmGerenciador.cdsDados.FieldByName('PRO_CDBARR').AsString;
                                       FieldByName('PRV_NOMEAPRESENTACAO').AsString     := UfUNCOES.RemoveAcento(dmGerenciador.cdsDados.FieldByName('PRO_NMPROD').AsString);
                                       FieldByName('PRV_QUANTIDADE').AsFloat            := dmGerenciador.cdsDados.FieldByName('PRO_QTPROD').AsFloat;
                                       FieldByName('PRV_VLVENDA').AsCurrency            := dmGerenciador.cdsDados.FieldByName('PRO_VLVEND').AsCurrency;
                                       FieldByName('PRV_QUANTIDADE_PRESCRITA').AsFloat  := dmGerenciador.cdsDados.FieldByName('PRO_QTPRES').AsFloat;
                                       FieldByName('PRV_QUANTIDADE_AUTORIZADA').AsFloat := dmGerenciador.cdsDados.FieldByName('PRO_QTAUTORIZADA').AsFloat;
                                       FieldByName('PRV_VLPARCELA').AsCurrency          := dmGerenciador.cdsDados.FieldByName('PRO_VLPRECO_SUBPACIENTE').AsFloat;
                                       //
                                       FieldByName('PRV_VLTOTALPRECOVENDA').AsCurrency  := dmGerenciador.cdsDados.FieldByName('PRO_SUBTOTAL').AsCurrency;
                                       FieldByName('PRV_VLTOTALPARCELA').AsCurrency     := dmGerenciador.cdsDados.FieldByName('PRO_VLPRECO_SUBSIDIADO').AsFloat - dmGerenciador.cdsDados.FieldByName('PRO_VLPRECO_SUBPACIENTE').AsFloat;   // PRO_VLPACIENTE_POSESTORNO
                                       FieldByName('PRV_QUANT_CANCELADA').AsFloat       := dmGerenciador.cdsDados.FieldByName('PRO_QTESTORNADA').AsFloat;
                                       //
                                       FieldByName('PRV_AUTORESTORNO').AsString         := dmGerenciador.cdsDados.FieldByName('PRO_AUTOR_ESTORNO').AsString;
                                       FieldByName('PRV_AUTORMEDICAMENTO').AsString     := dmGerenciador.cdsDados.FieldByName('PRO_AUTORMEDICAMENTO').AsString;
                                       FieldByName('PRV_QTDEVOLVIDA').AsFloat           := dmGerenciador.cdsDados.FieldByName('PRO_QTDEVOLVIDA').AsFloat;
                                       FieldByName('PRV_QTPRESCRITA').AsFloat           := dmGerenciador.cdsDados.FieldByName('PRO_QTPRESCRITA').AsFloat;
                                       FieldByName('PRV_STATUS').AsString               := dmGerenciador.cdsDados.FieldByName('PRO_STATUS').AsString;
                                       FieldByName('PRV_VLPRECO_SUBSIDIADO').AsFloat    := dmGerenciador.cdsDados.FieldByName('PRO_VLPRECO_SUBSIDIADO').AsFloat;
                                       FieldByName('PRV_VLPRECO_SUBPACIENTE').AsFloat   := dmGerenciador.cdsDados.FieldByName('PRO_VLPRECO_SUBPACIENTE').AsFloat;
                                       FieldByName('PRV_VLPRECO_SUBPAC_POSESTORNO').AsFloat := dmGerenciador.cdsDados.FieldByName('PRO_VLPACIENTE_POSESTORNO').AsFloat;
                                       FieldByName('PRV_VLSUBMS_POSESTORNO').AsFloat    := dmGerenciador.cdsDados.FieldByName('PRO_VLSUBMS_POSESTORNO').AsFloat;
                                       FieldByName('PRV_VLTOTAL_POSESTORNO').AsFloat    := dmGerenciador.cdsDados.FieldByName('PRO_VLTOTAL_VENDA_POSESTORNO').AsFloat;
                                       //
                                       Post;
                                       ApplyUpdates(0);
                                  End;
                               //
                               dmGerenciador.cdsDados.Next;
                           End;
                          dmGerenciador.cdsDados.EnableControls;
                          // Incluir medico
                            //If (dmGerenciador.qryProcurar.IsEmpty) Then
                            If not (dmGerenciador.GetCRMMedico(edtNRCRM.Text)) Then
                               begin
                                    dmGerenciador.AddMedico(edtNRCRM.Text, M_NMMEDI);
                               End;
                          // Incluir Paciente
                            //If (dmGerenciador.qryProcurar.IsEmpty) Then
                            If not (dmGerenciador.GetCPFCliente(edtNRCPF.Text)) Then
                               begin
                                    M_NMPESS := edtNMCLIE.Text;
                                    {With dmGerenciador.qryIncPaciente do
                                      begin
                                           Close;
                                           Params.ParamByName('pCPF').AsString  := edtNRCPF.Text;
                                           Params.ParamByName('pNOME').AsString := M_NMPESS;
                                           ExecSQL;
                                      End;}
                                     dmGerenciador.AddPaciente(edtNRCPF.Text, M_NMPESS);
                               End;
                  End;
         // Grava
         dmGerenciador.sqlConnGerenciador.Commit(TD);
         //
         APAGAR_ARQUIVO;
         //
          frmVendaAprovada := TfrmVendaAprovada.create(application);
          try
              ufrmVendaAprovada.M_VLPAGA := M_VLMOVI;
              // VALOR_PG_CLIENTE();
              ufrmVendaAprovada.M_VLDESC := M_VLPGMS;
              // VALOR_DESCONTO();
              //
              ufrmVendaAprovada.M_NRVEND := uFuncoes.StrZero(InttoStr(W_NRSOLI),7);
              ufrmVendaAprovada.M_NRAUTO := M_NRAUTO;
              //
              frmVendaAprovada.showmodal;
          finally
              frmVendaAprovada.Free;
          end;
          //
          GERAR_ARQUIVO_NOVO(W_NRSOLI);   // Gera arquivo p/ farma
          //
          pnlSuperior.Enabled := True;
          pnlGrid.Enabled     := True;
          pnlDados.Enabled    := True;
          pnlInferior.Enabled := True;
          //
          Close;
      End;    
   Except
        on Exc:Exception do
        begin
                Application.MessageBox(PChar('Erro ao tentar realizar gravar venda!!!'
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                dmGerenciador.sqlConnGerenciador.Rollback(TD);
                //
                CANCELA_VENDA;
        End;
   End;
 finally
  //
  Screen.Cursor := crDefault;
  StatusBar1.Panels[1].Text := '';
  //
  btGravar.Enabled := False;
 end;
 Application.ProcessMessages;
end;

function TfrmVendas.VALOR_DESCONTO: Real;
Var
    M_VALOR, M_DESCONTO : Real;
begin
      M_DESCONTO := 0;
      With dmGerenciador.cdsDados do
          begin
               DisableControls;
               First;
               While not (Eof) do
               Begin
                   M_DESCONTO := M_DESCONTO + FieldByname('PRO_VLPRECO_SUBSIDIADO').AsCurrency;
                   //
                   Next;
               End;
               EnableControls;
          End;
      //
      result := M_DESCONTO;
end;

procedure TfrmVendas.btImportarClick(Sender: TObject);
Var
    M_ARQUIVO : TextFile;
    M_LINHA, M_CDBARR, M_QTPRES, M_NMAQUI : String;
    M_QTPROD : Integer;
    M_VLINTE , M_VLFRAC : String;
    M_VLPROD : String;
    W_VLPROD : double;
begin
     M_NMAQUI := M_NMPAST+'\POPREQ.TXT';
     If (fileexists(M_NMAQUI)) then
      begin
        try
          try
            M_FLFARM := True;
            //
            AssignFile ( M_ARQUIVO, M_NMAQUI );
            Reset ( M_ARQUIVO );
            // Número do cupom
            ReadLn ( M_ARQUIVO, M_LINHA );
            M_CUPOM_FARMA := M_LINHA;
            edtNRCUPO.Text := uFuncoes.StrZero(M_CUPOM_FARMA,6);
            //
            If (dmGerenciador.cdsDados.Active = False) Then
                dmGerenciador.cdsDados.Open;
            //
            dmGerenciador.cdsDados.EmptyDataSet;
            //
            While not Eof(M_ARQUIVO) do
              begin
                   //
                   ReadLn ( M_ARQUIVO, M_LINHA );
                   //
                   If not uFuncoes.Empty(M_LINHA) Then
                     begin
                          // Código de barras
                          M_CDBARR := Copy(M_LINHA,1,13);
                          // Qt. Produto
                          M_QTPROD := StrtoInt(Copy(M_LINHA,15,6));
                          // Vl. Produto
                          M_VLPROD := Copy(M_LINHA,22,12);
                          //
                          //M_QTPRES := inputbox('Digite a quantidade diária?',dmGerenciador.NOME_PRODUTO(M_CDBARR),'');
                          M_QTPRES := inputbox('Digite a quantidade diária?',dmGerenciador.GetNomeProduto(M_CDBARR),'');
                          If uFuncoes.Empty(M_QTPRES) Then
                             M_QTPRES := '1';
                          // Adiciona registro no cdsDados
                          With dmGerenciador.cdsDados do
                            Begin
                                 Append;
                                 FieldByName('PRO_CDBARR').AsString  := M_CDBARR;
                                 FieldByName('PRO_NMPROD').AsString  := dmGerenciador.GetNomeProduto(M_CDBARR);
                                 //FieldByName('PRO_NMPROD').AsString  := dmGerenciador.NOME_PRODUTO(M_CDBARR);
                                 FieldByName('PRO_QTPROD').AsFloat   := M_QTPROD;
                                 //W_VLPROD := StrtoFloat(Format('&10.2f',[M_VLPROD]));
                                 FieldByName('PRO_VLVEND').AsFloat   := StrtoFloat(M_VLPROD);
                                 //StrtoFloat(Format('&15.2f',[M_VLPROD]));     //FormatFloat('###,##0.#0',M_VLPROD);
                                 //FieldByName('PRO_VLVEND').AsCurrency  := StrtoFloat(M_VLPROD) * M_QTPROD;
                                 FieldByName('PRO_QTPRES').AsFloat   := StrtoFloat(M_QTPRES);
                                 Post;
                            End;
                            //
                            M_CDBARR := '';
                     End;
              End;   // Fim-do-enquanto
              //
              M_VLMOVI := VALOR_VENDA();
              lbl_TOTAL.Caption := FormatFloat('###,##0.#0',M_VLMOVI);
              //
              edtNRCPF.SetFocus; 
          Except
              on Exc:Exception do
                begin
                     Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                          + Exc.Message), 'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);

                End;
          End;
        Finally
             //   Fechar o arquivo
             CloseFile ( M_ARQUIVO );
             // Apaga arquivo popreq.txt
             APAGAR_ARQUIVO;
             //
             If not (dmGerenciador.cdsDados.IsEmpty) Then
                 btReceber.Enabled := True
             Else
                 btReceber.Enabled := False;
        End;
      End
      Else
      Begin
           Application.MessageBox(PChar('Arquivo POPREQ.TXT não existe!!!'),
                     'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           Exit;
      End;
end;

procedure TfrmVendas.GERAR_ARQUIVO;
Var
    M_ARQRETORNO, arqCupom : TextFile;
    linha: String;
    M_FILERET, M_LINHA, M_SEPARA : String;
    M_NRITEM : Integer;
    TextoCupom : TStringList;
begin
      try
            try
                 // Alteração 30/03/2011
                 TextoCupom := TStringList.Create;
                 TextoCupom.Text := '';
                 //
                 if FileExists(uInfoPrincipal.M_PASTA_RESP + 'cupomvin.txt') Then
                  begin
                       TextoCupom.LoadFromFile(uInfoPrincipal.M_PASTA_RESP + 'cupomvin.txt');
                       //
                       {AssignFile ( arqCupom, uInfoPrincipal.M_PASTA_RESP + 'cupomvin.txt' );
                       try
                           Reset ( arqCupom );
                           ReadLn ( arqCupom, linha );
                           ReadLn ( arqCupom, linha );
                           while not Eof ( arqCupom ) do
                           begin
                               if (uFuncoes.Alltrim(linha) <> '[FIM]') or (uFuncoes.Alltrim(linha) <> 'Recebimento confirmado com sucesso.') Then
                                  Writeln( M_ARQRETORNO, linha);
                               ReadLn ( arqCupom, linha );
                           end;
                       Finally
                           CloseFile ( arqCupom );
                       End;
                       DeleteFile(uInfoPrincipal.M_PASTA_RESP + 'cupomvin.txt');}
                  End;
                 //
                 M_SEPARA := ' ';
                 //M_FILERET := uInfoPrincipal.M_PASTA_RESP+'POPRESP.TXT';
                 M_FILERET := uInfoPrincipal.M_PASTA_RESP+'popresp.txt';
                 //M_NMPAST+'\POPRESP.TXT';
                 //
                 If (fileexists(M_FILERET)) Then
                    DeleteFile(M_FILERET);
                 //
                 AssignFile (M_ARQRETORNO , M_FILERET );
                 If Not(fileexists(M_FILERET)) Then
                     Rewrite ( M_ARQRETORNO );
                 // Situação
                 Writeln( M_ARQRETORNO, M_FLSITU);
                 // VALOR DO MS
                 If (M_MENSAGEM = 'SIMULACAO') Then
                     Writeln( M_ARQRETORNO, Format('%-12.2f',[VALOR_PAGAR_MS('S')]) )
                 Else
                     Writeln( M_ARQRETORNO, Format('%-12.2f',[VALOR_PAGAR_MS('N')]) );
                 //
                 Writeln( M_ARQRETORNO);
                 //
                 Writeln( M_ARQRETORNO, TextoCupom.text);
                 FreeAndNil(TextoCupom);
                 {Writeln( M_ARQRETORNO, Format('%-47s', ['TRANSACAO FARMACIA POPULAR']));
                 Writeln( M_ARQRETORNO, Format('%-47s', ['CLIENTE    :'+edtNMCLIE.Text]));
                 Writeln( M_ARQRETORNO, Format('%-47s', ['CPF        :'+uFuncoes.FormataCPF( edtNRCPF.text )]));
                 Writeln( M_ARQRETORNO, Format('%-47s', ['AUTORIZACAO:'+M_NRAUTO]));
                 //
                 Writeln( M_ARQRETORNO );
                 Writeln( M_ARQRETORNO, Format('%-47s', ['MEDICAMENTOS']));
                 Write( M_ARQRETORNO,   Format('%-5s',  ['ITEM']));
                 Writeln( M_ARQRETORNO, Format('%-42s', ['DESCRICAO']));
                 Write( M_ARQRETORNO,   Format('%-12s',  ['QUANT.']));
                 Write( M_ARQRETORNO,   Format('%-12s',  ['QT.AUTOR.']));
                 Write( M_ARQRETORNO,   Format('%-12s',  ['VALOR MS']));
                 Writeln( M_ARQRETORNO, Format('%-12s',  ['VL.PACIENTE']));
                 Writeln( M_ARQRETORNO, Format('%-47s',  [uFuncoes.Replicate('-',47)]));
                 // Produtos
                 dmGerenciador.cdsDados.First;
                 dmGerenciador.cdsDados.DisableControls;
                 //
                 M_NRITEM := 1;
                 While not (dmGerenciador.cdsDados.Eof) do
                  begin
                       // Item
                       Write( M_ARQRETORNO,   Format('%-5s',  [uFuncoes.StrZero(InttoStr(M_NRITEM),3)]));
                       // NOME MED.
                       Writeln( M_ARQRETORNO, Format('%-42s', [dmGerenciador.cdsDados.FieldByName('PRO_NMPROD').AsString+M_SEPARA]));
                       // QT.SOLICIDADO
                       Write( M_ARQRETORNO,   Format('%-12.0f',[dmGerenciador.cdsDados.FieldByName('PRO_QTPROD').AsFloat]));
                       If (M_MENSAGEM = 'SIMULACAO') Then
                       Begin
                           // QT.AUTOR.
                           Write( M_ARQRETORNO,   Format('%-12.0f',[dmGerenciador.cdsDados.FieldByName('PRO_QTPROD').AsFloat]));
                           // VALOR MS
                           Write( M_ARQRETORNO,   Format('%-12.2f',[dmGerenciador.cdsDados.FieldByName('PRO_VLVEND').AsFloat*0.9]));
                           //  VALOR PACIENTE
                           Writeln( M_ARQRETORNO, Format('%-12.2f',[dmGerenciador.cdsDados.FieldByName('PRO_VLVEND').AsFloat*0.1]));
                       End
                       Else
                       begin
                           // QT.AUTOR.
                           Write( M_ARQRETORNO,   Format('%-12.0f',[dmGerenciador.cdsDados.FieldByName('PRO_QTAUTORIZADA').AsFloat]));
                           // VALOR MS
                           Write( M_ARQRETORNO,   Format('%-12.2f',[dmGerenciador.cdsDados.FieldByName('PRO_VLPRECO_SUBSIDIADO').AsFloat]));
                           //  VALOR PACIENTE
                           Writeln( M_ARQRETORNO, Format('%-12.2f',[dmGerenciador.cdsDados.FieldByName('PRO_VLPRECO_SUBPACIENTE').AsFloat]));
                       End;
                       // Proximo
                       M_NRITEM := M_NRITEM + 1;
                       dmGerenciador.cdsDados.Next;
                  End;
                 dmGerenciador.cdsDados.EnableControls;
                 //
                 Writeln( M_ARQRETORNO);
                 Writeln( M_ARQRETORNO);
                 Writeln( M_ARQRETORNO);
                 Writeln( M_ARQRETORNO, Format('%-47s', [uFuncoes.Replicate(' ',3)+uFuncoes.Replicate('-',40)]));
                 Writeln( M_ARQRETORNO, Format('%-47s', [uFuncoes.Replicate(' ',18)+'ASSINATURA']));
                 Writeln( M_ARQRETORNO, Format('%-47s', ['ENDERECO :'+uFuncoes.Replicate('_',37)]));
                 Writeln( M_ARQRETORNO);  }

                 //  Apaga arquivo
                 CopyFile(uInfoPrincipal.M_PASTA_RESP + 'cupomvin.txt','C:\tmp',True);
                 DeleteFile(uInfoPrincipal.M_PASTA_RESP + 'cupomvin.txt');
                 APAGAR_ARQUIVO;
            Except
                on Exc:Exception do
                begin
                      Application.MessageBox(PChar('Erro ao tentar gerar arquivo de retorno!!!'
                          + Exc.Message),
                          'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                End;
            End;
      Finally
            CloseFile ( M_ARQRETORNO );
      End;
end;

procedure TfrmVendas.HABILITAR_CONTROLES;
begin
          pnlSuperior.Enabled := True;
          pnlGrid.Enabled     := True;
          pnlDados.Enabled    := True;
          pnlInferior.Enabled := True;
end;

procedure TfrmVendas.SIMULACAO;
begin
     frmVendaAprovada := TfrmVendaAprovada.create(application);
     try
         ufrmVendaAprovada.M_VLPAGA := M_VLMOVI*0.1;
         ufrmVendaAprovada.M_VLDESC := M_VLMOVI*0.9;
         //
         //ufrmVendaAprovada.M_NRVEND := uFuncoes.StrZero(InttoStr(W_NRSOLI),7);
         ufrmVendaAprovada.M_NRAUTO := M_NRAUTO;
         //
         frmVendaAprovada.showmodal;
     finally
         frmVendaAprovada.Free;
     end;
     //
     M_FLSITU   := '1';
     M_MENSAGEM := 'SIMULACAO';
     GERAR_ARQUIVO;
     //
     Close;
end;

procedure TfrmVendas.NAO_APROVADO;
Var
    M_ARQRETORNO : TextFile;
    M_FILERET, M_LINHA, M_SEPARA : String;
    M_NRITEM : Integer;
begin
      try
            try
                 M_SEPARA := '|';
                 //M_FILERET := uInfoPrincipal.M_PASTA_RESP+'POPRESP.TXT';
                 M_FILERET := uInfoPrincipal.M_PASTA_RESP+'popresp.txt';
                 //M_FILERET := M_NMPAST+'\POPRESP.TXT';

                 If (fileexists(M_FILERET)) Then
                     DeleteFile(M_FILERET);
                 //    
                 M_FLSITU := '0';
                 //
                 AssignFile (M_ARQRETORNO , M_FILERET );
                 If Not(fileexists(M_FILERET)) Then
                     Rewrite ( M_ARQRETORNO );
                 // SITUACAO
                 Writeln( M_ARQRETORNO, M_FLSITU);
                 //  Apaga arquivo
                 APAGAR_ARQUIVO; 
            Except
                on Exc:Exception do
                begin
                      Application.MessageBox(PChar('Erro ao tentar gerar arquivo de retorno!!!'
                          + Exc.Message),
                          'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                End;
            End;
      Finally
            CloseFile ( M_ARQRETORNO );
      End;
end;

procedure TfrmVendas.APAGAR_ARQUIVO;
begin
     M_NMAQUI := M_NMPAST+'\POPREQ.TXT';
     If (fileexists(M_NMAQUI)) Then
        DeleteFile(M_NMAQUI);
end;

function TfrmVendas.VALOR_PAGAR_MS( M_FLSITU : String ) : Real;
Var
    M_VLPAGA : Double;
begin
     M_VLPAGA := 0;
     With dmGerenciador.cdsDados do
     begin
          DisableControls;
          First;
          While not (Eof) do
            begin
                 If (M_FLSITU = 'S') Then
                     M_VLPAGA := M_VLPAGA + (fieldbyName('PRO_VLVEND').AsCurrency*0.9)
                 Else
                     M_VLPAGA := M_VLPAGA + fieldbyName('PRO_VLPRECO_SUBSIDIADO').AsCurrency;
                 //
                 // PRO_VLPRECO_SUBSIDIADO
                 //
                 Next;
            End;
          EnableControls;
     End;
     //
     result := M_VLPAGA;
end;

function TfrmVendas.GetDosOutput(const CommandLine: string): string;
var
    SA: TSecurityAttributes;
    SI: TStartupInfo;
    PI: TProcessInformation;
    StdOutPipeRead, StdOutPipeWrite: THandle;
    WasOK: Boolean;
    Buffer: array[0..255] of Char;
    BytesRead: Cardinal;
    WorkDir, Line: String;
begin
    Application.ProcessMessages;
    with SA do
    begin
        nLength := SizeOf(SA);
        bInheritHandle := True;
        lpSecurityDescriptor := nil;
    end;
    // create pipe for standard output redirection
    CreatePipe(StdOutPipeRead, // read handle
    StdOutPipeWrite, // write handle
    @SA, // security attributes
    0 // number of bytes reserved for pipe - 0 default
    );
    try
        // Make child process use StdOutPipeWrite as standard out,
        // and make sure it does not show on screen.
        with SI do
        begin
            FillChar(SI, SizeOf(SI), 0);
            cb := SizeOf(SI);
            dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
            wShowWindow := SW_HIDE;
            hStdInput := GetStdHandle(STD_INPUT_HANDLE); // don't redirect std input
            hStdOutput := StdOutPipeWrite;
            hStdError := StdOutPipeWrite;
        end;
        // launch the command line compiler
        WorkDir := ExtractFilePath(CommandLine);
        WasOK := CreateProcess(nil, PChar(CommandLine), nil, nil, True, 0, nil,
        PChar(WorkDir), SI, PI);
        // Now that the handle has been inherited, close write to be safe.
        // We don't want to read or write to it accidentally.
        CloseHandle(StdOutPipeWrite);
        // if process could be created then handle its output
        if not WasOK then
            raise Exception.Create('Could not execute command line!')
        else
        try
            // get all output until dos app finishes
          Line := '';
          repeat
            // read block of characters (might contain carriage returns and  line feeds)
            WasOK := ReadFile(StdOutPipeRead, Buffer, 255, BytesRead, nil);
            // has anything been read?
            if BytesRead > 0 then
            begin
                // finish buffer to PChar
                Buffer[BytesRead] := #0;
                // combine the buffer with the rest of the last run
                Line := Line + Buffer;
            end;
          until not WasOK or (BytesRead = 0);
          // wait for console app to finish (should be already at this point)
          WaitForSingleObject(PI.hProcess, INFINITE);
        finally
            // Close all remaining handles
            CloseHandle(PI.hThread);
            CloseHandle(PI.hProcess);
        end;
    finally
        result:=Line;
        CloseHandle(StdOutPipeRead);
    end;
end;

procedure TfrmVendas.CarregarVendedores;
begin
     uFuncoes.RefreshCDS(dmGerenciador.cdsListaVendedores);
     With dmGerenciador.cdsListaVendedores do
     begin
         if not (IsEmpty) Then
         begin
              First;
              cmbVendedores.Items.Clear;
              While not (Eof) do
                begin
                     cmbVendedores.Items.Add(FieldByName('VEN_NOME').AsString);
                     //
                     Next;
                End;
         End;
     End;
end;

procedure TfrmVendas.GERAR_ARQUIVO_NOVO(iVenda: Integer);
Var
    M_ARQRETORNO, arqCupom : TextFile;
    linha: String;
    M_FILERET, M_LINHA, M_SEPARA : String;
    M_NRITEM : Integer;
    TextoCupom : TStringList;
begin
      try
            try
                 // Alteração 30/03/2011
                 TextoCupom := TStringList.Create;
                 TextoCupom.Text := '';
                 //
                 if FileExists(uInfoPrincipal.M_PASTA_RESP + 'cupomvin.txt') Then
                  begin
                       TextoCupom.LoadFromFile(uInfoPrincipal.M_PASTA_RESP + 'cupomvin.txt');
                       //
                  End;
                 //
                 M_SEPARA := ' ';
                 //M_FILERET := uInfoPrincipal.M_PASTA_RESP+'POPRESP.TXT';
                 M_FILERET := uInfoPrincipal.M_PASTA_RESP+'popresp.txt';
                 //
                 If (fileexists(M_FILERET)) Then
                    DeleteFile(M_FILERET);
                 //
                 AssignFile (M_ARQRETORNO , M_FILERET );
                 If Not(fileexists(M_FILERET)) Then
                     Rewrite ( M_ARQRETORNO );
                 // Situação
                 Writeln( M_ARQRETORNO, M_FLSITU);
                 // VALOR DO MS
                 If (M_MENSAGEM = 'SIMULACAO') Then
                     Writeln( M_ARQRETORNO, Format('%-12.2f',[VALOR_PAGAR_MS('S')]) )
                 Else
                     Writeln( M_ARQRETORNO, Format('%-12.2f',[VALOR_PAGAR_MS('N')]) );
                 //
                 Writeln( M_ARQRETORNO);
                 //
                 Writeln( M_ARQRETORNO, TextoCupom.text);
                 FreeAndNil(TextoCupom);
                 //  Apaga arquivo
                 CopyFile(uInfoPrincipal.M_PASTA_RESP + 'cupomvin.txt','C:\tmp',True);
                 DeleteFile(uInfoPrincipal.M_PASTA_RESP + 'cupomvin.txt');
                 APAGAR_ARQUIVO;
            Except
                on Exc:Exception do
                begin
                      Application.MessageBox(PChar('Erro ao tentar gerar arquivo de retorno!!!'
                          + Exc.Message),
                          'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                End;
            End;
      Finally
            CloseFile ( M_ARQRETORNO );
            //
            If FileExists(M_FILERET) Then
            begin
                 // 02/01/2012
                 uFuncoes.FilterCDS(dmGerenciador.cdsVendas, fsInteger, IntToStr(iVenda));
                 //
                 If not (dmGerenciador.cdsVendas.IsEmpty) Then
                 begin
                      dmGerenciador.cdsVendas.Edit;
                      If FileExists(M_FILERET) Then
                         dmGerenciador.cdsVendasMOV_TEXTO_CUPOM.LoadFromFile(M_FILERET)
                      Else
                         dmGerenciador.cdsVendasMOV_TEXTO_CUPOM.AsString := 'ARQUIVO NÃO ENCONTADO';
                      dmGerenciador.cdsVendas.ApplyUpdates(0);
                      //
                      dmGerenciador.cdsVendas.Close;
                 End;
            End;
      End;
end;

function TfrmVendas.VALOR_VENDA_Novo(aCDSItens : TClientDataSet): Double;
Var
    M_TOTAL, fValorUnitario : double;
    fQuantApresentacao, fQuant : Double;
begin
      M_TOTAL := 0;
      fQuantApresentacao := 0;
      //
      With aCDSItens do
        begin
              DisableControls;
              First;
              While not (Eof) do
               Begin
                    fQuantApresentacao := dmGerenciador.GetQuantidadeApresentacaoNew(FieldBYName('PRO_CDBARR').AsString);
                    fValorUnitario     := FieldBYName('PRO_VLVEND').AsFloat;
                    fQuant             := uFuncoes.Arredondar(FieldBYName('PRO_QTPROD').AsFloat / fQuantApresentacao,2);
                    //
                    M_TOTAL := M_TOTAL + (fValorUnitario  * fQuant);
                    //
                    Next;
               End;
              First;
              EnableControls;
        End;
      //
      result := uFuncoes.Arredondar(M_TOTAL,2);
end;

procedure TfrmVendas.dsProdutosVendasDataChange(Sender: TObject;
  Field: TField);
begin
     If not (dsProdutosVendas.DataSet.IsEmpty) Then
        if not uFuncoes.Empty(dsProdutosVendas.DataSet.FieldByName('PRO_MENSAGEM').AsString) Then
           grdConsultar.Hint := dsProdutosVendas.DataSet.FieldByName('PRO_MENSAGEM').AsString
        Else
          grdConsultar.Hint := '';
end;

procedure TfrmVendas.edtCDPRODChange(Sender: TObject);
begin
      if uFuncoes.Empty(edtCDPROD.Text) Then
      begin
          edtNMDESC.Clear;
          edtValor.Clear;
      End;
end;

procedure TfrmVendas.edtNRCPFChange(Sender: TObject);
begin
    if uFuncoes.Empty(ufuncoes.RemoveChar(edtNRCPF.Text)) Then
         edtNMCLIE.Clear;
end;

procedure TfrmVendas.grdConsultarDrawColumnCell(Sender: TObject;
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

end.

