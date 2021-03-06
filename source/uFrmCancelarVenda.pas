unit uFrmCancelarVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, DB, Buttons, DBXpress,
  DBCtrls;

type
  TfrmCancelaVenda = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    edtNRVENDA: TEdit;
    Label2: TLabel;
    edtNRCUPOM: TEdit;
    grdConsultar: TDBGrid;
    dsProdutos: TDataSource;
    btEstornar: TBitBtn;
    btFechar: TBitBtn;
    btLocalizar: TBitBtn;
    dsVenda: TDataSource;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure edtNRVENDAKeyPress(Sender: TObject; var Key: Char);
    procedure edtNRCUPOMKeyPress(Sender: TObject; var Key: Char);
    procedure btFecharClick(Sender: TObject);
    procedure btEstornarClick(Sender: TObject);
    procedure edtNRVENDAExit(Sender: TObject);
    procedure edtNRCUPOMExit(Sender: TObject);
    procedure btLocalizarClick(Sender: TObject);
    procedure edtNRVENDAEnter(Sender: TObject);
    procedure edtNRCUPOMEnter(Sender: TObject);
    procedure edtNRVENDAChange(Sender: TObject);
    procedure edtNRCUPOMChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure CONSULTA;
    { Private declarations }
  public
    { Public declarations }
  end;

const
    ScreenWidth: LongInt = 800; {I designed my form in 800x600 mode.}
    ScreenHeight: LongInt = 600;

var
  frmCancelaVenda: TfrmCancelaVenda;

implementation

uses udmGerenciador, ServicoSolicitacaoWS1, uFuncoes, DBClient;

{$R *.dfm}

procedure TfrmCancelaVenda.edtNRVENDAKeyPress(Sender: TObject;
  var Key: Char);
begin
      If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

procedure TfrmCancelaVenda.edtNRCUPOMKeyPress(Sender: TObject;
  var Key: Char);
begin
      If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

procedure TfrmCancelaVenda.btFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmCancelaVenda.btEstornarClick(Sender: TObject);
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
    M_NRVEND, M_NRSOLI : String;
begin
  If (Application.MessageBox('Confirma cancelamento de venda?',
    'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes) Then
  begin
    try
        Screen.Cursor := crHourGlass;
        try
             If (dmGerenciador.cdsConfig.Active = False) Then
               dmGerenciador.cdsConfig.Open;
             //
             M_NRVEND := dmGerenciador.cdsVendas.FieldByName('MOV_CODSOLICITACAO').AsString;
             M_NRSOLI := dmGerenciador.cdsVendas.FieldByName('MOV_AUTORIZACAO').AsString;
             //
             Service := (dmGerenciador.HTTPRIO1 as ServicoSolicitacaoWS);
             i := 0;
             //
              dmGerenciador.cdsProdutosVendas.DisableControls;
              dmGerenciador.cdsProdutosVendas.First;
              While not (dmGerenciador.cdsProdutosVendas.Eof) do
                begin
                     SetLength(ObjArrayMedicamento,Length(ObjArrayMedicamento)+1);
                     ObjArrayMedicamento[i] := MedicamentoDTO.Create;
                     ObjArrayMedicamento[i].coCodigoBarra      := dmGerenciador.cdsProdutosVendas.FieldByName('PRV_CODBARRAS').AsString;    // C�digo de barras
                     // PRV_QUANTIDADE_AUTORIZADA
                     ObjArrayMedicamento[i].qtDevolvida        := dmGerenciador.cdsProdutosVendas.FieldByName('PRV_QUANTIDADE').AsFloat;     // Quantidade solicitada (em comprimidos)
                     //
                     i := i + 1;
                     //
                     dmGerenciador.cdsProdutosVendas.Next;
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
              ObjUsuarioFarmacia.usuario := dmGerenciador.cdsConfigCFG_LOGIN.AsString;
              ObjUsuarioFarmacia.senha   := dmGerenciador.cdsConfigCFG_SENHA.AsString;
              //
              ObjConfirmacaoEstorno := Service.executarEstorno(ObjEstornar ,ObjUsuarioFarmacia);
              //
              If (ObjConfirmacaoEstorno.inSituacaoEstorno = '00E') Then
              Begin
                 // Inicia um transa��o no BD
                 TD.TransactionID  := 1;
                 TD.IsolationLevel := xilREADCOMMITTED;
                 dmGerenciador.sqlConnGerenciador.StartTransaction(TD);
                // Grava
                With dmGerenciador.cdsProdutosVendas do
                  begin
                     While not (Eof) do
                     begin
                         i := 0;
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
                  With dmGerenciador.cdsVendas do
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
                   dmGerenciador.cdsProdutosVendas.EnableControls;
                   edtNRVENDA.Clear;
                   edtNRVENDA.SetFocus;
              End
              Else
              begin
                   ShowMessage(ObjAutorizacao.inAutorizacaoSolicitacao+' '+ ObjAutorizacao.descMensagemErro);
                   //
                   i := 0;
                   dmGerenciador.cdsProdutosVendas.DisableControls;
                   dmGerenciador.cdsProdutosVendas.First;
                   //  Carregar os produtos
                   While not (dmGerenciador.cdsProdutosVendas.eof) do
                      begin
                            dmGerenciador.cdsProdutosVendas.edit;
                            dmGerenciador.cdsProdutosVendas.FieldByName('PRV_AUTORESTORNO').AsString :=
                                                   ObjConfirmacaoEstorno.arrMedicamentoDTO[i].inAutorizacaoEstorno;
                            dmGerenciador.cdsProdutosVendas.FieldByName('PRV_AUTORMEDICAMENTO').AsString :=
                                                   ObjAutorizacao.arrMedicamentoDTO[i].inAutorizacaoMedicamento;
                            //
                            dmGerenciador.cdsProdutosVendas.Post;
                            //
                            i := i + 1;
                            dmGerenciador.cdsProdutosVendas.Next;
                      End;
                      dmGerenciador.cdsProdutosVendas.EnableControls;
              End;
        Except
          on Exc:Exception do
          begin
                Application.MessageBox(PChar('Erro ao tentar estornar venda!!!'
                      + Exc.Message),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               dmGerenciador.sqlConnGerenciador.Rollback(TD);
          End;
        End;
    Finally
          ObjEstornar.Free;
          btEstornar.Enabled := False;
          //
          dmGerenciador.cdsProdutosVendas.Close;
          dmGerenciador.cdsVendas.Close;
          //
          Screen.Cursor := crDefault;
    End;
  End;
end;

procedure TfrmCancelaVenda.CONSULTA;
begin
    If not uFuncoes.Empty(edtNRVENDA.Text)
     or not uFuncoes.Empty(edtNRCUPOM.Text) Then
    begin
          dmGerenciador.cdsVendas.Close;
          With dmGerenciador.dstVendas do
               begin
                    Active := False;
                    If not uFuncoes.Empty(edtNRVENDA.Text) Then
                    begin
                        CommandText := 'Select * from VENDAS Where (MOV_CODSOLICITACAO = :pSOLICITACAO)';
                        Params.ParamByName('pSOLICITACAO').AsInteger := StrtoInt(edtNRVENDA.Text);
                    End;
                    //
                    If not uFuncoes.Empty(edtNRCUPOM.Text) Then
                    begin
                        CommandText := 'Select * from VENDAS Where (MOV_NRCUPOM = :pNRCUPOM)';
                        Params.ParamByName('pNRCUPOM').AsInteger := StrtoInt(edtNRCUPOM.Text);
                    End;
                    //
                    Active := True;
               End;
               dmGerenciador.cdsVendas.Open;
               //
               If not (dmGerenciador.cdsVendas.IsEmpty) then
                  begin
                       If (dmGerenciador.cdsVendas.FieldByName('MOV_FLSITU').AsString <> 'C') Then
                        begin
                           dmGerenciador.cdsProdutosVendas.Close;
                           With dmGerenciador.dstProdutosVendas do
                             begin
                                  Active := False;
                                  CommandText := 'select * from PRODUTOS_VENDAS where (PRV_CODSOLICITACAO = :pSOLICITACAO)';
                                  Params.ParamByName('pSOLICITACAO').AsInteger := dmGerenciador.cdsVendas.FieldByName('MOV_CODSOLICITACAO').AsInteger;
                                  Active := True;
                             End;
                             dmGerenciador.cdsProdutosVendas.Open;
                             //
                           btEstornar.Enabled := True;
                        End
                        Else
                        Begin
                             Application.MessageBox(PChar('Venda j� cancelada!!!'),
                                 'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                             btEstornar.Enabled := False;
                             edtNRVENDA.Clear; 
                             edtNRVENDA.SetFocus;
                             Exit;
                        End;
                  End
                  Else
                  begin
                       Application.MessageBox(PChar('Venda n�o encontrada!!!'),
                             'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                       btEstornar.Enabled := False;
                       Exit;
                  End;
        //
    End;
end;

procedure TfrmCancelaVenda.edtNRVENDAExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtNRVENDA.Text) Then
        edtNRVENDA.Text := uFuncoes.StrZero(edtNRVENDA.Text,7);
end;

procedure TfrmCancelaVenda.edtNRCUPOMExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtNRCUPOM.Text) Then
        edtNRCUPOM.Text := uFuncoes.StrZero(edtNRCUPOM.Text,6);
end;

procedure TfrmCancelaVenda.btLocalizarClick(Sender: TObject);
begin
     If not uFuncoes.Empty(edtNRVENDA.Text)
        or not uFuncoes.Empty(edtNRCUPOM.Text) Then
          CONSULTA;
end;

procedure TfrmCancelaVenda.edtNRVENDAEnter(Sender: TObject);
begin
     dmGerenciador.cdsProdutosVendas.Close;
     edtNRCUPOM.Clear;  
end;

procedure TfrmCancelaVenda.edtNRCUPOMEnter(Sender: TObject);
begin
     dmGerenciador.cdsProdutosVendas.Close;
     edtNRVENDA.Clear;
end;

procedure TfrmCancelaVenda.edtNRVENDAChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtNRVENDA.Text) Then
     begin
          btEstornar.Enabled := False;
          //
          dmGerenciador.cdsVendas.Close;
          dmGerenciador.cdsProdutosVendas.Close;
     End;
end;

procedure TfrmCancelaVenda.edtNRCUPOMChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtNRCUPOM.Text) Then
     begin
          btEstornar.Enabled := False;
          //
          dmGerenciador.cdsVendas.Close;
          dmGerenciador.cdsProdutosVendas.Close;
     End;
end;

procedure TfrmCancelaVenda.FormCreate(Sender: TObject);
begin
    scaled := true;
    if (screen.width <> ScreenWidth) then
    begin
        height := longint(height) * longint(screen.height) DIV ScreenHeight;
        width := longint(width) * longint(screen.width) DIV ScreenWidth;
        scaleBy(screen.width, ScreenWidth);
    end;
end;

end.
