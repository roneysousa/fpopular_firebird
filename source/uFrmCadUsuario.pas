unit uFrmCadUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, DBCtrls, Mask, DB,
  FMTBcd, DBClient, Provider, SqlExpr, Grids, DBGrids;

type
  TfrmCadUsuarios = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    dsUsuarios: TDataSource;
    Label2: TLabel;
    dbeNMUSUA: TDBEdit;
    lbl_senha: TLabel;
    Label4: TLabel;
    cmbImpressora: TDBLookupComboBox;
    DBText1: TDBText;
    edtSenha: TEdit;
    lbl_Confirma: TLabel;
    edt_Confirma: TEdit;
    dsConsultar: TDataSource;
    datasetConsultar: TSQLDataSet;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    cdsConsultarSEN_CODIGO: TIntegerField;
    cdsConsultarSEN_NOME: TStringField;
    Panel3: TPanel;
    lblConsultar: TLabel;
    rgConsultar: TRadioGroup;
    edtConsultar: TEdit;
    btnConsultar: TBitBtn;
    grdConsultar: TDBGrid;
    Panel4: TPanel;
    sbProximo: TSpeedButton;
    sbUltimo: TSpeedButton;
    sbAnterior: TSpeedButton;
    sbPrimeiro: TSpeedButton;
    btnAlterar: TBitBtn;
    Panel1: TPanel;
    BtAdicionar: TBitBtn;
    BtEditar: TBitBtn;
    BtExcluir: TBitBtn;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    edtNMPAST: TDBEdit;
    Label6: TLabel;
    dbeSenhaVendedor: TDBEdit;
    procedure BtSairClick(Sender: TObject);
    procedure edtSenhaExit(Sender: TObject);
    procedure edt_ConfirmaExit(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsultarClick(Sender: TObject);
    procedure sbPrimeiroClick(Sender: TObject);
    procedure sbAnteriorClick(Sender: TObject);
    procedure sbProximoClick(Sender: TObject);
    procedure sbUltimoClick(Sender: TObject);
    procedure rgConsultarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure btnAlterarClick(Sender: TObject);
    procedure dsConsultarStateChange(Sender: TObject);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
    procedure TabSheet2Show(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
  private
     procedure tratabotoes;
     procedure buscar;
     procedure Exibir_edites;
     procedure Ocultar_edites;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUsuarios: TfrmCadUsuarios;

implementation

uses udmGerenciador, uFuncoes, uInfoPrincipal;

{$R *.dfm}

procedure TfrmCadUsuarios.BtSairClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmCadUsuarios.buscar;
begin
  dmGerenciador.cdsUsuarios.Close;
  With dmGerenciador.dstUsuarios do
  Begin
       Active := False;
       CommandText := 'Select * from USUARIOS '+
                      'Where (SEN_CODIGO = :pCODIGO)';
       ParamByName('pCODIGO').AsInteger := cdsConsultar.FieldByName('SEN_CODIGO').AsInteger;
       Active := True;
  End;
  dmGerenciador.cdsUsuarios.Open;
  //
end;

procedure TfrmCadUsuarios.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   //
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
   //
end;

procedure TfrmCadUsuarios.edtSenhaExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtSenha.Text) Then
        edtSenha.Text := edtSenha.Text+uFuncoes.Replicate('_',6-uFuncoes.ContaCaracs(edtSenha.Text));
end;

procedure TfrmCadUsuarios.edt_ConfirmaExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edt_Confirma.Text) Then
     Begin
       edt_Confirma.Text := edt_Confirma.Text+uFuncoes.Replicate('_',6-uFuncoes.ContaCaracs(edt_Confirma.Text));
       //
       If ( edt_Confirma.Text = edtSenha.Text) Then
            dmGerenciador.cdsUsuariosSEN_SNATUA.AsString := uFuncoes.Codifica(edt_Confirma.Text)
       Else
       begin
            Application.MessageBox( 'A senha incorreta!','ATENÇÃO',
                          MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
            edt_Confirma.Clear;
            edt_Confirma.SetFocus;
            Exit;
       End;
  End;
end;

procedure TfrmCadUsuarios.BtAdicionarClick(Sender: TObject);
begin
  tratabotoes;
  dmGerenciador.Parametros;
  //
  dmGerenciador.cdsUsuarios.Append;
  dmGerenciador.cdsUsuariosSEN_CODIGO.Value := dmGerenciador.CdsConfigCFG_USUARIO.Value+1;
  dbeNMUSUA.SetFocus;
  //
  Exibir_edites;
end;

procedure TfrmCadUsuarios.Exibir_edites;
begin
     lbl_senha.Visible    := True;
     edtSenha.Visible     := True;
     edtSenha.Clear;
     lbl_confirma.Visible := True;
     edt_Confirma.Visible := True;
     edt_Confirma.Clear; 

end;

procedure TfrmCadUsuarios.Ocultar_edites;
begin
     lbl_senha.Visible    := False;
     edtSenha.Visible     := False;
     lbl_confirma.Visible := False;
     edt_Confirma.Visible := False;
end;

procedure TfrmCadUsuarios.BtEditarClick(Sender: TObject);
begin
  if (dmGerenciador.cdsUsuarios.Active)
    and (dmGerenciador.cdsUsuarios.RecordCount > 0) then
  Begin
       tratabotoes;
       dmGerenciador.cdsUsuarios.Edit;
       //
       If (uInfoPrincipal.M_NMUSUA <> 'USERMASTER') Then
       begin
           If (dmGerenciador.cdsUsuarios.FieldByName('SEN_CODIGO').AsInteger <> StrtoInt(uInfoPrincipal.M_CDUSUA)) Then
           begin
                Application.MessageBox(Pchar(uInfoPrincipal.M_NMUSUA+  ' você não pode editar este usuário!!!'),'ATENÇÃO',
                  MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                dmGerenciador.cdsUsuarios.Cancel;
                tratabotoes;
                Exit;
           End;
       End;
       //
       Exibir_edites;
       dbeNMUSUA.SetFocus;
  End;
end;

procedure TfrmCadUsuarios.BtExcluirClick(Sender: TObject);
begin
  if dmGerenciador.cdsUsuarios.RecordCount > 0 then
     If Application.MessageBox('Deseja excluir este usuário?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       dmGerenciador.cdsUsuarios.Delete;
       dmGerenciador.cdsUsuarios.ApplyUpdates(0);
     end
  else
      Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadUsuarios.BtCancelarClick(Sender: TObject);
begin
     tratabotoes;
     dmGerenciador.cdsUsuarios.Cancel;
     //
     Ocultar_edites;
end;

procedure TfrmCadUsuarios.BtGravarClick(Sender: TObject);
begin
  If uFuncoes.Empty(dbeNMUSUA.Text) Then
  Begin
       Application.MessageBox('Digite o nome do usuário!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeNMUSUA.SetFocus;
       Exit;
  End;
  //
  If uFuncoes.Empty(cmbImpressora.Text) Then
  Begin
       Application.MessageBox('Selecione a impressora!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       cmbImpressora.SetFocus;
       Exit;
  End;
  //
  If (dmGerenciador.cdsUsuarios.State in [dsInsert] ) AND
    uFuncoes.Empty(edtSenha.Text) Then
  Begin
       Application.MessageBox('Digite sua senha!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       edtSenha.SetFocus;
       Exit;
  End;
  //
  If uFuncoes.Empty(edtNMPAST.Text) Then
  Begin
       Application.MessageBox('Digite nome da pasta!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       edtNMPAST.SetFocus;
       Exit;
  End;
  //
  If (dmGerenciador.cdsUsuarios.State in [dsInsert] ) AND
      uFuncoes.Empty(edt_Confirma.Text) Then
  Begin
       Application.MessageBox('Digite a confirmação da senha!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       edt_Confirma.SetFocus;
       Exit;
  End;
  //
  If not uFuncoes.Empty(edt_Confirma.text) Then
  begin
       edt_Confirma.Text := edt_Confirma.Text+uFuncoes.Replicate('_',6-uFuncoes.ContaCaracs(edt_Confirma.Text));
       //
       If ( edt_Confirma.Text = edtSenha.Text) Then
            dmGerenciador.cdsUsuariosSEN_SNATUA.AsString := uFuncoes.Codifica(edt_Confirma.Text)
       Else
       begin
            Application.MessageBox( 'A senha incorreta!','ATENÇÃO',
                          MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
            edt_Confirma.Clear;
            edt_Confirma.SetFocus;
            Exit;
       End;
  End;     
  //
  Try
    //
    tratabotoes;
    dmGerenciador.Parametros;
    if dmGerenciador.cdsUsuarios.State in [dsinsert] then
    begin
      dmGerenciador.CdsConfig.Edit;
      dmGerenciador.CdsConfigCFG_USUARIO.Value  := dmGerenciador.CdsConfigCFG_USUARIO.Value+1;
      dmGerenciador.cdsUsuariosSEN_CODIGO.Value := dmGerenciador.CdsConfigCFG_USUARIO.Value;
      dmGerenciador.CdsConfig.ApplyUpdates(0);
    end;
    //
    dmGerenciador.cdsUsuarios.Post;
    dmGerenciador.cdsUsuarios.ApplyUpdates(0);
    //
    Ocultar_edites;
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dmGerenciador.cdsUsuarios.Cancel;
        End;
  End;
end;

procedure TfrmCadUsuarios.FormShow(Sender: TObject);
begin
      dmGerenciador.cdsUsuarios.close;
      dmGerenciador.cdsUsuarios.Open;
      dmGerenciador.cdsUsuarios.First;
      PageControl1.ActivePageIndex := 0;
      Ocultar_edites;
end;

procedure TfrmCadUsuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmGerenciador.cdsUsuarios.Close;
     //
     Action := caFree;
end;

procedure TfrmCadUsuarios.btnConsultarClick(Sender: TObject);
begin
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select SEN_CODIGO, SEN_NOME from USUARIOS';
    case rgConsultar.ItemIndex of
      0: CommandText := CommandText + ' where SEN_CODIGO = ' + edtConsultar.Text;
      1: CommandText := CommandText + ' where UPPER(SEN_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
    end;
    CommandText := CommandText + 'order by SEN_NOME';
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

procedure TfrmCadUsuarios.sbPrimeiroClick(Sender: TObject);
begin
     If (cdsConsultar.Active) Then
        cdsConsultar.First;
end;

procedure TfrmCadUsuarios.sbAnteriorClick(Sender: TObject);
begin
     If (cdsConsultar.Active) Then
         cdsConsultar.Prior;
end;

procedure TfrmCadUsuarios.sbProximoClick(Sender: TObject);
begin
     If (cdsConsultar.Active) Then
        cdsConsultar.Next;
end;

procedure TfrmCadUsuarios.sbUltimoClick(Sender: TObject);
begin
     If (cdsConsultar.Active) Then
         cdsConsultar.Last;
end;

procedure TfrmCadUsuarios.rgConsultarClick(Sender: TObject);
begin
  case rgConsultar.ItemIndex of
    0:
    begin
      lblConsultar.Caption := 'Código:';
      edtConsultar.Clear;
    end;
    1:
    begin
      lblConsultar.Caption := 'Nome/Descrição:';
      edtConsultar.Clear;
    end;
  end;
  if edtConsultar.CanFocus then
    edtConsultar.SetFocus;
end;

procedure TfrmCadUsuarios.edtConsultarChange(Sender: TObject);
begin
  btnConsultar.Enabled := (edtConsultar.Text <> '');
  If uFuncoes.Empty(edtConsultar.Text) Then
    cdsConsultar.Close;
end;

procedure TfrmCadUsuarios.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
  If (key = #37) Then
    key :=#0;
  //
  if (Key =#13) and not uFuncoes.Empty(edtConsultar.Text)then
  begin
      key :=#0;
      Perform(Wm_NextDlgCtl,0,0);
  end;  
  //
  if rgConsultar.ItemIndex = 0 then
  begin
    if not( key in['0'..'9', #8] ) then
    begin
      beep;
      key:=#0;
    end;
  end;
end;

procedure TfrmCadUsuarios.btnAlterarClick(Sender: TObject);
begin
       //tratabotoes;
    If not (cdsConsultar.IsEmpty) Then
    begin
       buscar;
       PageControl1.ActivePageIndex := 0;
       //
       dbeNMUSUA.SetFocus;
    End;
end;

procedure TfrmCadUsuarios.dsConsultarStateChange(Sender: TObject);
begin
  btnAlterar.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty);
end;

procedure TfrmCadUsuarios.dsConsultarDataChange(Sender: TObject;
  Field: TField);
begin
  sbPrimeiro.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Bof);
  sbAnterior.Enabled := sbPrimeiro.Enabled;
  sbUltimo.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Eof);
  sbProximo.Enabled := sbUltimo.Enabled;
end;

procedure TfrmCadUsuarios.TabSheet2Show(Sender: TObject);
begin
      dsConsultar.DataSet.Close;
      edtConsultar.Clear;
      edtConsultar.SetFocus;
end;

procedure TfrmCadUsuarios.grdConsultarDblClick(Sender: TObject);
begin
     btnAlterarClick(Sender);
end;

end.
