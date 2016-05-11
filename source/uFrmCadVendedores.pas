unit uFrmCadVendedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, DBClient, Provider, DB, SqlExpr, Buttons,
  Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls;

type
  TfrmCadVendedores = class(TfrmCadastro)
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    dbeNome: TDBEdit;
    dsCadastro: TDataSource;
    Label3: TLabel;
    dbeCPF: TDBEdit;
    Label4: TLabel;
    dbeLogin: TDBEdit;
    Label5: TLabel;
    dbeSenha: TDBEdit;
    cdsConsultarVEN_CODIGO: TIntegerField;
    cdsConsultarVEN_NOME: TStringField;
    cdsConsultarVEN_CPF: TStringField;
    procedure BtAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure dbeCPFExit(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeNomeExit(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
     procedure tratabotoes;
     procedure buscar(aCodigo : String);
     procedure Registro;
  public
    { Public declarations }
  end;

var
  frmCadVendedores: TfrmCadVendedores;

implementation

uses udmGerenciador, uFuncoes;

{$R *.dfm}

{ TfrmCadVendedores }

procedure TfrmCadVendedores.buscar(aCodigo: String);
begin
     uFuncoes.FilterCDS(dmGerenciador.cdsVendedores, fsInteger, aCodigo);
end;

procedure TfrmCadVendedores.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   //
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadVendedores.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  TabSheet2.TabVisible := False;
  dmGerenciador.Parametros;
  //
  dmGerenciador.cdsVendedores.Append;
  dmGerenciador.cdsVendedoresVEN_CODIGO.AsInteger :=
       dmGerenciador.cdsConfigCFG_VENDEDORES.AsInteger+1;
  dbeNome.SetFocus;
end;

procedure TfrmCadVendedores.FormShow(Sender: TObject);
begin
  inherited;
      if (dmGerenciador.cdsConfigCFG_VENDEDORES.AsInteger > 0) Then
          uFuncoes.FilterCDS(dmGerenciador.cdsVendedores, fsInteger, dmGerenciador.cdsConfigCFG_VENDEDORES.AsString)
      Else
      begin
          uFuncoes.FilterCDS(dmGerenciador.cdsVendedores, fsInteger, '-1');
          BtAdicionarClick(Sender);
      End;
      PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadVendedores.BtEditarClick(Sender: TObject);
begin
  inherited;
   if (dmGerenciador.cdsVendedores.Active)
    and (dmGerenciador.cdsVendedores.RecordCount > 0) then
     Begin
         tratabotoes;
         TabSheet2.TabVisible := False;
         dmGerenciador.cdsVendedores.Edit;
         dbeNome.SetFocus;
     End;
end;

procedure TfrmCadVendedores.dbeCPFExit(Sender: TObject);
begin
  inherited;
  if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
   begin
     If not uFuncoes.Empty(dbeCPF.Text) Then
     begin
        If uFuncoes.CPF(dbeCPF.Text) = False Then
        Begin
            Application.MessageBox('CPF inválido!!!',
               'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
            dbeCPF.SetFocus;
            Exit;
        End;
     End;
   End;
   //
  if (dsCadastro.DataSet.State in [dsInsert]) Then
   begin
        If (dmGerenciador.GetCPFVendedor(dbeCPF.Text)) Then
        begin
              Application.MessageBox('CPF já cadastrado!',
               'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
            dbeCPF.SetFocus;
            Exit;
        End;
   End;
end;

procedure TfrmCadVendedores.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if (dmGerenciador.cdsVendedores.Active)
    and (dmGerenciador.cdsVendedores.RecordCount > 0) then
   begin
     If Application.MessageBox('Deseja excluir este vendedor?', 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
         dmGerenciador.cdsVendedores.Delete;
         dmGerenciador.cdsVendedores.ApplyUpdates(0);
         //
         Registro;
     end
     else
       Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
          MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;
end;

procedure TfrmCadVendedores.Registro;
begin
     uFuncoes.FilterCDS(dmGerenciador.cdsVendedores, fsInteger, InttoStr(uFuncoes.Maxmvcodigo('VEN_CODIGO','VENDEDORES')));
end;

procedure TfrmCadVendedores.BtCancelarClick(Sender: TObject);
begin
  inherited;
     tratabotoes;
     dmGerenciador.cdsVendedores.Cancel;
     //
     TabSheet2.TabVisible := True;
end;

procedure TfrmCadVendedores.BtGravarClick(Sender: TObject);
begin
  inherited;
  If uFuncoes.Empty(dbeNome.Text) Then
  Begin
       Application.MessageBox('Digite o nome do vendedor!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeNome.SetFocus;
       Exit;
  End;
  //
  If uFuncoes.Empty(dbeCPF.Text) Then
  Begin
       Application.MessageBox('Digite o CPF','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeCPF.SetFocus;
       Exit;
  End;
  //
  If uFuncoes.Empty(dbeSenha.Text) Then
  Begin
       Application.MessageBox('Digite a senha do site do vendedor!!!','ATENÇÃO',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       dbeSenha.SetFocus;
       Exit;
  End;
  //
  Try
    //
    dmGerenciador.Parametros;
    //
    If (dmGerenciador.cdsVendedores.State in [dsInsert] ) Then
    begin
         dmGerenciador.CdsConfig.Edit;
         dmGerenciador.cdsConfigCFG_VENDEDORES.AsInteger  := dmGerenciador.cdsConfigCFG_VENDEDORES.AsInteger+1;
         dmGerenciador.CdsConfig.ApplyUpdates(0);
    end;
    //
    dmGerenciador.cdsVendedores.Post;
    dmGerenciador.cdsVendedores.ApplyUpdates(0);
    //
    tratabotoes;
    TabSheet2.TabVisible := True;
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           BtCancelarClick(Sender);
        End;
  End;
end;

procedure TfrmCadVendedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
     dmGerenciador.cdsVendedores.Close;
     //
     Action := caFree;
end;

procedure TfrmCadVendedores.dbeNomeExit(Sender: TObject);
begin
  inherited;
    If (dmGerenciador.cdsVendedores.State in [dsInsert] ) Then
    begin
      If (dmGerenciador.GetNomeVendedor(dbeNome.Text)) Then
        begin
              Application.MessageBox('Nome já cadastrado!',
               'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
            dbeNome.SetFocus;
            dbeNome.Clear;
            Exit;
        End;
    End;
end;

procedure TfrmCadVendedores.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
   begin
      with cdsConsultar do
      begin
        Close;
        CommandText := 'Select VEN_CODIGO, VEN_NOME, VEN_CPF from VENDEDORES ';
        case rgConsultar.ItemIndex of
          0: CommandText := CommandText + ' where VEN_CODIGO = ' + edtConsultar.Text;
          1: CommandText := CommandText + ' where UPPER(VEN_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
        end;
        CommandText := CommandText + 'order by VEN_NOME';
        Open;
      end;
   end
   Else
       cdsConsultar.close;
End;

procedure TfrmCadVendedores.btnAlterarClick(Sender: TObject);
begin
  inherited;
     if not (cdsConsultar.IsEmpty) Then
      begin
           buscar(cdsConsultarVEN_CODIGO.AsString);
           PageControl1.ActivePageIndex := 0;
      End;
end;

end.

