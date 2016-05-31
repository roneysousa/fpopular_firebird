unit uFrmCadProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, DBClient, Provider, DB, SqlExpr, Buttons,
  Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, DBXpress,
  BmsXPProgressBar;

type
  TfrmCadProdutos = class(TfrmCadastro)
    Label1: TLabel;
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    Label3: TLabel;
    dbeVLVENDA: TDBEdit;
    Label4: TLabel;
    dbeQTAPRES: TDBEdit;
    dbeCDBARRAS: TDBEdit;
    datasetConsultarPRO_BARRAS: TStringField;
    datasetConsultarPRO_MEDICAMENTO: TStringField;
    qryLocalizar: TSQLQuery;
    btImportar: TBitBtn;
    pnlProgressao: TPanel;
    lblPercentual: TLabel;
    lbl_QTREGI: TLabel;
    BmsXPProgressBar1: TBmsXPProgressBar;
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeCDBARRASKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCDBARRASExit(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure btImportarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure rgConsultarClick(Sender: TObject);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
  private
     procedure tratabotoes;
     procedure buscar;
     procedure REGISTRO;
     function VALIDAR_CODBARRAS(M_CDBARRAS : String) : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProdutos: TfrmCadProdutos;

implementation

uses udmGerenciador, uFuncoes, uInfoPrincipal;

{$R *.dfm}

{ TfrmCadProdutos }

procedure TfrmCadProdutos.buscar;
begin
     dmGerenciador.cdsCadProdutos.Close;
     With dmGerenciador.dstCadProdutos do
     Begin
          Active := False;
          CommandText := 'Select * from PRODUTOS Where (PRO_BARRAS = :pBARRAS)';
          ParamByName('pBARRAS').AsString := cdsConsultar.FieldByName('PRO_BARRAS').AsString;
          Active := True;
     End;
     dmGerenciador.cdsCadProdutos.FetchParams;
     dmGerenciador.cdsCadProdutos.Open;
end;

procedure TfrmCadProdutos.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled    := not BtEditar.Enabled;
   BtExcluir.Enabled   := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   btImportar.Enabled  := not btImportar.Enabled; 
   BtCancelar.Enabled  := not BtCancelar.Enabled;
   BtGravar.Enabled    := not BtGravar.Enabled;
   BtSair.Enabled      := not BtSair.Enabled;
end;

procedure TfrmCadProdutos.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  { BtAdicionar.Enabled := False;
   BtEditar.Enabled    := False;
   BtExcluir.Enabled   := False;
   BtPesquisar.Enabled := False;
   BtCancelar.Enabled  := True;
   BtGravar.Enabled    := True;
   BtSair.Enabled      := False;}
  //
  dmGerenciador.parametros;
  dmGerenciador.cdsCadProdutos.Append;
  dbeCDBARRAS.Enabled := True;
  dbeCDBARRAS.SetFocus;
end;

procedure TfrmCadProdutos.BtGravarClick(Sender: TObject);
begin
  inherited;
    If uFuncoes.Empty(dbeDescricao.Text) Then
    Begin
         Application.MessageBox('Digite a descrição do medicamento!!!','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         dbeDescricao.SetFocus;
         Exit;
    End;
    //
    If uFuncoes.Empty(dbeVLVENDA.Text) Then
    Begin
         Application.MessageBox('Digite o valor de venda!!!','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         dbeVLVENDA.SetFocus;
         Exit;
    End;
    //
    If (dmGerenciador.dsCadProdutos.State in [dsInsert])
    and uFuncoes.Empty(dbeCDBARRAS.Text) Then
    Begin
         Application.MessageBox('Digite o código de barras do medicamento!!!','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
         dbeCDBARRAS.SetFocus;
         Exit;
    End;
    //
    try
         tratabotoes;
         //
         dmGerenciador.cdsCadProdutos.Post;
         dmGerenciador.cdsCadProdutos.ApplyUpdates(0);
         //
         dbeCDBARRAS.Enabled := False;
    Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dmGerenciador.cdsCadProdutos.Cancel;
        End;
    End;
end;

procedure TfrmCadProdutos.BtEditarClick(Sender: TObject);
begin
  inherited;
    if (dmGerenciador.cdsCadProdutos.RecordCount > 0) then
    Begin
        tratabotoes;
        //
        dmGerenciador.cdsCadProdutos.Edit;
        dbeCDBARRAS.Enabled := False;
        dbeDescricao.SetFocus;
    End;
end;

procedure TfrmCadProdutos.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if (dmGerenciador.cdsCadProdutos.Active)
   and (dmGerenciador.cdsCadProdutos.RecordCount > 0) then
    Begin
       If Application.MessageBox('Deseja excluir este bairro?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            //tratabotoes;
            dmGerenciador.cdsCadProdutos.Delete;
            dmGerenciador.cdsCadProdutos.ApplyUpdates(0);
            //
            REGISTRO;
            //
       end
       else
           Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
    End;
end;

procedure TfrmCadProdutos.FormShow(Sender: TObject);
begin
  inherited;
      REGISTRO;
end;

procedure TfrmCadProdutos.btnConsultarClick(Sender: TObject);
begin
  inherited;
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select PRO_BARRAS, PRO_MEDICAMENTO from PRODUTOS';
    case rgConsultar.ItemIndex of
      0: CommandText := CommandText + ' where PRO_BARRAS = ' + uFuncoes.StrZero(edtConsultar.Text,5);
      1: CommandText := CommandText + ' where UPPER(PRO_MEDICAMENTO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
    end;
    CommandText := CommandText + 'order by PRO_MEDICAMENTO';
    Open;
    if IsEmpty then
    begin
      MessageDlg('Nenhum registro encontrado!' + #13 + 'Refaça a pesquisa', mtInformation, [mbOk], 0);
      edtConsultar.Clear;
      if edtConsultar.CanFocus then
        edtConsultar.SetFocus;
    end;
  end;

end;

procedure TfrmCadProdutos.btnAlterarClick(Sender: TObject);
begin
  inherited;
    if not (cdsConsultar.IsEmpty) then
     begin
         buscar;
         PageControl1.ActivePageIndex := 0;
     End;
end;

procedure TfrmCadProdutos.BtCancelarClick(Sender: TObject);
begin
  inherited;
      tratabotoes;
      //
      dmGerenciador.cdsCadProdutos.Cancel;
      dbeCDBARRAS.Enabled := False;
end;

procedure TfrmCadProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
       dmGerenciador.cdsCadProdutos.CLOSE;
end;

procedure TfrmCadProdutos.REGISTRO;
begin
     dmGerenciador.parametros;
         dmGerenciador.cdsCadProdutos.Close;
         With dmGerenciador.dstCadProdutos do
         begin
              Active := False;
              CommandText := 'Select * from PRODUTOS Where (PRO_BARRAS  = :pBARRAS)';
              ParamByName('pBARRAS').AsString := uFuncoes.mscodigo('PRO_BARRAS','PRODUTOS');
              Active := True;
         End;
         dmGerenciador.cdsCadProdutos.FetchParams;
         dmGerenciador.cdsCadProdutos.Open;
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadProdutos.dbeCDBARRASKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    If (Key = #27) Then
      begin
           key:=#0;
           BtCancelarClick(Sender);
      End;
    If not( key in['0'..'9',#8, #13, #27] ) then
      key:=#0;
end;

function TfrmCadProdutos.VALIDAR_CODBARRAS(M_CDBARRAS : String) : Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select PRO_BARRAS from PRODUTOS Where (PRO_BARRAS = :pBARRAS)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmGerenciador.sqlConnGerenciador;
      sql.Add(texto);
      Params.ParamByName('pBARRAS').AsString := M_CDBARRAS;
      Open;
      if (IsEmpty) Then
         result := False
      Else
         result := True;
    finally
      free;
    end;

{     With qryLocalizar do
      begin
           Close;
           Params.ParamByName('pBARRAS').AsString := M_CDBARRAS;
           Open;
           //
           If (IsEmpty) Then
              result := False
           Else
              result := True;
      End;    }
end;

procedure TfrmCadProdutos.dbeCDBARRASExit(Sender: TObject);
begin
  inherited;
       If (dmGerenciador.dsCadProdutos.State in [dsInsert])
        and not uFuncoes.Empty(dbeCDBARRAS.Text) Then
        begin
             If (VALIDAR_CODBARRAS(dbeCDBARRAS.Text) = True) Then
              begin
                   Application.MessageBox('Código de barras já cadastro!!!','ATENÇÃO',
                      MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   dbeCDBARRAS.Clear;
                   dbeCDBARRAS.SetFocus;
                   Exit;
              End
              Else
                  dbeDescricao.SetFocus; 
        End;
end;

procedure TfrmCadProdutos.grdConsultarDblClick(Sender: TObject);
begin
  inherited;
     If (cdsConsultar.Active)
      and not (cdsConsultar.IsEmpty ) Then
        btnAlterarClick(Sender);
end;

procedure TfrmCadProdutos.btImportarClick(Sender: TObject);
Var
    TD : TTransactionDesc;
    W_CDBARR, W_NMPROD : String;
    W_VLVEND, W_QTAPRE, W_VLPOPU : DOUBLE;
    I, Cont, Total : Integer;
    aTexto : String;
    qraux, qraux2 : TSQLquery;
    bPrecoTabela2 : Boolean;
begin
  inherited;
 try
     bPrecoTabela2 := False;
     If Application.MessageBox('Importar preço da tabela B ?',
         'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1+MB_APPLMODAL) = idYes then
            bPrecoTabela2 := True;
     // TAB_VLVEND
     Panel1.Enabled := False;
     pnlProgressao.Visible := true;
     Screen.Cursor := crHourGlass;
     //
     BmsXPProgressBar1.Visible := True;
     lblPercentual.Visible     := True;
     //
     TD.TransactionID  := StrtoInt(uInfoPrincipal.M_CDUSUA);
     TD.IsolationLevel := xilREADCOMMITTED;
     dmGerenciador.sqlConnGerenciador.StartTransaction(TD);
     Try
          // Inicio
          dmGerenciador.cdsCadProdutos.Close;
          //
          dmGerenciador.qryImportar.Open;
          //
          Total := dmGerenciador.qryImportar.RecordCount;
          BmsXPProgressBar1.Position := 0;
          Cont  := 0;
          //
          If (dmGerenciador.qryImportar.RecordCount > 0) Then
            begin
               dmGerenciador.qryImportar.First;
               While not(dmGerenciador.qryImportar.eof) do
               begin
                 //
               If not uFuncoes.Empty(dmGerenciador.qryImportar.FieldByName('PRO_CDBARR').AsString) Then
                begin
                 if FileExists('barras.txt') Then
                     W_CDBARR := uFuncoes.StrZero(uFuncoes.RemoveChar(Copy(dmGerenciador.qryImportar.FieldByName('PRO_CDBARR').AsString,2,13)),13)
                 Else
                 begin
                     W_CDBARR := uFuncoes.StrZero(uFuncoes.RemoveChar(Copy(dmGerenciador.qryImportar.FieldByName('PRO_CDBARR').AsString,1,13)),13);
                     //uFuncoes.RemoveChar(dmGerenciador.qryImportar.FieldByName('PRO_CDBARR').AsString);
                     {if (W_CDBARR = '7896015516543') then
                        ShowMessage(dmGerenciador.qryImportar.FieldByName('PRO_CDBARR').AsString+' '+ W_CDBARR); }
                 End;
                     //uFuncoes.StrZero(uFuncoes.RemoveChar(Copy(dmGerenciador.qryImportar.FieldByName('PRO_CDBARR').AsString,1,13)),13);
                     //
                 //
                 //W_CDBARR := uFuncoes.StrZero(uFuncoes.RemoveChar(dmGerenciador.qryImportar.FieldByName('PRO_CDBARR').AsString), 13);
                 W_NMPROD := dmGerenciador.qryImportar.FieldByName('PRO_NMPROD').AsString;
                 W_VLPOPU := dmGerenciador.qryImportar.FieldByName('PRO_VLPOPU').AsFloat;
                 if not (bPrecoTabela2) Then
                  Begin
                       If (W_VLPOPU > 0) then
                           W_VLVEND := W_VLPOPU
                       Else
                           W_VLVEND := dmGerenciador.qryImportar.FieldByName('PRO_VLVEND').AsCurrency;
                  End
                 Else
                 begin
                      if (dmGerenciador.qryImportar.FieldByName('TAB_VLVEND').AsCurrency > 0) Then
                           W_VLVEND := dmGerenciador.qryImportar.FieldByName('TAB_VLVEND').AsCurrency
                      Else
                           W_VLVEND := dmGerenciador.qryImportar.FieldByName('PRO_VLVEND').AsCurrency;
                 End;
                 //
                 W_QTAPRE := dmGerenciador.qryImportar.FieldByName('PRO_QTARMA').AsFloat;
                 //
                 atexto := 'Select PRO_BARRAS from PRODUTOS Where (PRO_BARRAS = :pBARRAS)';
                 QrAux := TSqlquery.Create(nil);
                 with QrAux do
                   try
                     SQLConnection := dmGerenciador.sqlConnGerenciador;
                     sql.Add(atexto);
                     Params.ParamByName('pBARRAS').AsString  := W_CDBARR;
                     open;
                     //
                     If (IsEmpty) and not uFuncoes.Empty(W_CDBARR) Then
                       begin
                             aTexto := 'INSERT INTO PRODUTOS (PRO_BARRAS, PRO_MEDICAMENTO, PRO_VALORVENDA, PRO_QUANTIDADE)';
                             aTexto := aTexto + 'VALUES (:pBARRAS, :pMEDICAMENTO, :pVALORVENDA, :pPRO_QUANTIDADE)';
                             QrAux2 := TSqlquery.Create(nil);
                             with QrAux2 do
                               try
                                 SQLConnection := dmGerenciador.sqlConnGerenciador;
                                 sql.Add(aTexto);
                                 Params.ParamByName('pBARRAS').AsString      := W_CDBARR;
                                 Params.ParamByName('pMEDICAMENTO').AsString := W_NMPROD;
                                 Params.ParamByName('pVALORVENDA').AsFloat   := W_VLVEND;
                                 Params.ParamByName('pPRO_QUANTIDADE').AsFloat := W_QTAPRE;
                                 ExecSQL;
                               finally
                                 free;
                               end;
                             // Incluir
                             {With dmGerenciador.qryDados do
                              begin
                                   SQL.Clear;
                                   Close;
                                   SQL.Add('INSERT INTO PRODUTOS (PRO_BARRAS, PRO_MEDICAMENTO, PRO_VALORVENDA)');
                                   SQL.Add('VALUES (:pBARRAS, :pMEDICAMENTO, :pVALORVENDA)');
                                   Params.ParamByName('pBARRAS').AsString      := W_CDBARR;
                                   Params.ParamByName('pMEDICAMENTO').AsString := W_NMPROD;
                                   Params.ParamByName('pVALORVENDA').AsFloat   := W_VLVEND;
                                   ExecSQL;
                              End;}
                       End
                       Else     // se não - Altera
                       begin
                             aTexto := 'UPDATE PRODUTOS SET PRO_VALORVENDA = :pVALORVENDA, PRO_QUANTIDADE = :pQUANT ';
                             aTexto := aTexto + 'Where (PRO_BARRAS = :pBARRAS )';
                             QrAux2 := TSqlquery.Create(nil);
                             with QrAux2 do
                               try
                                 SQLConnection := dmGerenciador.sqlConnGerenciador;
                                 sql.Add(aTexto);
                                 Params.ParamByName('pBARRAS').AsString      := W_CDBARR;
                                 Params.ParamByName('pVALORVENDA').AsFloat   := W_VLVEND;
                                 Params.ParamByName('pQUANT').AsFloat        := W_QTAPRE;
                                 ExecSQL;
                               finally
                                 free;
                               end;

                             {With dmGerenciador.qryDados do
                              begin
                                   SQL.Clear;
                                   Close;
                                   SQL.Add('UPDATE PRODUTOS SET PRO_VALORVENDA = :pVALORVENDA');
                                   SQL.Add('Where (PRO_BARRAS = :pBARRAS ) ');
                                   Params.ParamByName('pBARRAS').AsString      := W_CDBARR;
                                   Params.ParamByName('pVALORVENDA').AsFloat   := W_VLVEND;
                                   ExecSQL;
                              End; }
                       End;
                   finally
                       free;
                   end;
                End;
                 {With dmGerenciador.qryLocProdutos do
                  begin
                       Close;
                       Params.ParamByName('pCODIGO').AsString := W_CDBARR;
                       Open;
                       //
                       W_NMPROD := dmGerenciador.qryImportar.FieldByName('PRO_NMPROD').AsString;
                       W_VLVEND := dmGerenciador.qryImportar.FieldByName('PRO_VLVEND').AsCurrency;
                       //
                       If (dmGerenciador.qryLocProdutos.IsEmpty) and not uFuncoes.Empty(W_CDBARR) Then
                        begin
                             // Incluir
                             With dmGerenciador.qryDados do
                              begin
                                   SQL.Clear;
                                   Close;
                                   SQL.Add('INSERT INTO PRODUTOS (PRO_BARRAS, PRO_MEDICAMENTO, PRO_VALORVENDA)');
                                   SQL.Add('VALUES (:pBARRAS, :pMEDICAMENTO, :pVALORVENDA)');
                                   Params.ParamByName('pBARRAS').AsString      := W_CDBARR;
                                   Params.ParamByName('pMEDICAMENTO').AsString := W_NMPROD;
                                   Params.ParamByName('pVALORVENDA').AsFloat   := W_VLVEND;
                                   ExecSQL;
                              End;
                        End
                        Else     // se não - Altera
                        begin
                             With dmGerenciador.qryDados do
                              begin
                                   SQL.Clear;
                                   Close;
                                   SQL.Add('UPDATE PRODUTOS SET PRO_VALORVENDA = :pVALORVENDA');
                                   SQL.Add('Where (PRO_BARRAS = :pBARRAS ) ');
                                   Params.ParamByName('pBARRAS').AsString      := W_CDBARR;
                                   Params.ParamByName('pVALORVENDA').AsFloat   := W_VLVEND;
                                   ExecSQL;
                              End;
                        End;
                  End;  // fim-with    dmGerenciador.qryLocProdutos}
                  // Proximo
                  dmGerenciador.qryImportar.Next;
                  //
                  Cont := Cont + 1;
                  BmsXPProgressBar1.Position := (Cont * 100) div Total;
                  lblPercentual.Caption := InttoStr(BmsXPProgressBar1.Position)+'%';
                  Application.ProcessMessages;
               End;   // Fim-do-Enquanto
            End;
          dmGerenciador.sqlConnGerenciador.Commit(TD);
          //
          Application.MessageBox(PChar('Importação concluída com sucesso.'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar importar registros.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dmGerenciador.sqlConnGerenciador.Rollback(TD);
        End;
     End;
  Finally
         Screen.Cursor := crDefault;
         pnlProgressao.Visible := False;
         Panel1.Enabled := True;
         //
         REGISTRO;
  End;
  Application.ProcessMessages;
end;

procedure TfrmCadProdutos.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
  begin
       with cdsConsultar do
       begin
         Close;
         CommandText := 'Select PRO_BARRAS, PRO_MEDICAMENTO from PRODUTOS';
         case rgConsultar.ItemIndex of
            0: CommandText := CommandText + ' where PRO_BARRAS = ' + uFuncoes.StrZero(edtConsultar.Text,5);
            1: CommandText := CommandText + ' where UPPER(PRO_MEDICAMENTO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
         end;
         CommandText := CommandText + 'order by PRO_MEDICAMENTO';
         Open;
       end;
  End
  else
      cdsConsultar.close;
end;

procedure TfrmCadProdutos.rgConsultarClick(Sender: TObject);
begin
  inherited;
       if not (cdsConsultar.IsEmpty) Then
           cdsConsultar.Close;
end;

procedure TfrmCadProdutos.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
       if (key = #13) and not (dsConsultar.DataSet.IsEmpty) Then
       begin
           key := #0;
           if (btnAlterar.Enabled)then
              btnAlterar.SetFocus;
       End;
end;

end.
