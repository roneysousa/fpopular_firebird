unit uFrmClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, DBClient, Provider, DB, SqlExpr, Buttons,
  Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, ClipBrd, Jpeg,
  AcquireImage;

type
  TfrmCadClientes = class(TfrmCadastro)
    Label1: TLabel;
    dbeCPF: TDBEdit;
    dsCadastro: TDataSource;
    Label2: TLabel;
    dbeNome: TDBEdit;
    Label3: TLabel;
    dbiDocumento: TDBImage;
    cdsConsultarPAC_CPF: TStringField;
    cdsConsultarPAC_NOME: TStringField;
    Shape1: TShape;
    btnDigitalizar: TBitBtn;
    imgDocumento: TImage;
    aiScanearImagem: TAcquireImage;
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure dbeCPFExit(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnDigitalizarClick(Sender: TObject);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
     procedure tratabotoes;
     procedure buscar(aCPF : String);
     procedure REGISTRO;
     Function VerificarCPF(aCPF : String): Boolean;
     Function ValidarCPF(): Boolean;
     //
     Function DigitalizarDocumento(): Boolean;
     //Function GravarDocumentoIdentidadeBanco(objImage : TImage): Boolean;
     Procedure CarregarDocumentoBanco();
  public
    { Public declarations }
  end;

var
  frmCadClientes: TfrmCadClientes;

implementation

uses udmGerenciador, uFuncoes;

{$R *.dfm}

procedure TfrmCadClientes.dsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
      dbeCPF.Enabled := (dsCadastro.DataSet.State = dsInsert);
      btnDigitalizar.Enabled := not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0);
end;

procedure TfrmCadClientes.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
  begin
       with cdsConsultar do
       begin
         Close;
         CommandText := 'select PAC_CPF, PAC_NOME from PACIENTES ';
         case rgConsultar.ItemIndex of
            0: CommandText := CommandText + ' where PAC_CPF = ' + edtConsultar.Text;
            1: CommandText := CommandText + ' where UPPER(PAC_NOME) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
         end;
         CommandText := CommandText + ' order by PAC_NOME';
         Open;
       end;
  End
  else
      cdsConsultar.close;
end;

procedure TfrmCadClientes.btnAlterarClick(Sender: TObject);
begin
  inherited;
    if not (cdsConsultar.IsEmpty) then
     begin
         buscar(cdsConsultarPAC_CPF.AsString);
         PageControl1.ActivePageIndex := 0;
     End;
end;

procedure TfrmCadClientes.buscar(aCPF : String);
begin
     uFuncoes.FilterCDS(dmGerenciador.cdsCliente, fsString, aCPF);
     //
     if not (dmGerenciador.cdsCliente.IsEmpty) Then
        CarregarDocumentoBanco;
end;

procedure TfrmCadClientes.REGISTRO;
Var
   aUltimoCPF : String;
begin
    aUltimoCPF := '9999999999';
    buscar(aUltimoCPF);
end;

procedure TfrmCadClientes.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled    := not BtEditar.Enabled;
   BtExcluir.Enabled   := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled  := not BtCancelar.Enabled;
   BtGravar.Enabled    := not BtGravar.Enabled;
   BtSair.Enabled      := not BtSair.Enabled;
end;

procedure TfrmCadClientes.BtAdicionarClick(Sender: TObject);
begin
  inherited;
    tratabotoes;
    dsCadastro.DataSet.Append;
    dbeCPF.SetFocus;
end;

procedure TfrmCadClientes.BtEditarClick(Sender: TObject);
begin
    if not (dsCadastro.DataSet.IsEmpty) then
    begin
        inherited;
        tratabotoes;
        dsCadastro.DataSet.Edit;
        dbeNome.SetFocus;
    End;
end;

procedure TfrmCadClientes.BtCancelarClick(Sender: TObject);
begin
  inherited;
      tratabotoes;
      //
      dsCadastro.DataSet.Cancel;
end;

procedure TfrmCadClientes.dbeCPFExit(Sender: TObject);
begin
  inherited;
      if (dsCadastro.DataSet.State = dsInsert) and NOT uFuncoes.Empty(dbeCPF.Text) Then
      begin
           ValidarCPF();
      End;
end;

function TfrmCadClientes.VerificarCPF(aCPF: String): Boolean;
begin
    Result := dmGerenciador.GetCPFCliente(aCPF);
end;

procedure TfrmCadClientes.BtGravarClick(Sender: TObject);
begin

      If  uFuncoes.Empty(dbeCPF.Text) Then
      begin
           Application.MessageBox('Digite o CPF!!!','ATENÇÃO',
                      MB_OK+MB_ICONWARNING+MB_APPLMODAL);
           dbeCPF.SetFocus;
           Exit;
      End;
      //
      If  uFuncoes.Empty(dbeNome.Text) Then
      begin
           Application.MessageBox('Digite o nome do paciente!!!','ATENÇÃO',
                      MB_OK+MB_ICONWARNING+MB_APPLMODAL);
           dbeNome.SetFocus;
           Exit;
      End;
      //
      if (dsCadastro.DataSet.State = dsInsert)  Then
      begin
           if not ValidarCPF() Then
                Exit;
      End;
      // Grava dados
      dmGerenciador.Start;

      Try
            TClientDataSet(dsCadastro.DataSet).ApplyUpdates(0);
            //
            dmGerenciador.Comit(dmGerenciador.Transc);
            tratabotoes;
      Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            dsCadastro.DataSet.Cancel;
            dmGerenciador.Rollback;
        End;
      End;
      inherited;
end;

procedure TfrmCadClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
       dsCadastro.DataSet.Close;
end;

procedure TfrmCadClientes.FormShow(Sender: TObject);
begin
  inherited;
      REGISTRO;
end;

function TfrmCadClientes.ValidarCPF: Boolean;
begin
     Result := False;
           if Length(dbeCPF.Text) < 11 Then
            begin
                 Application.MessageBox('Quantidade de digitos inválida.','ATENÇÃO',
                      MB_OK+MB_ICONSTOP+MB_APPLMODAL);
                 dbeCPF.SetFocus;
                 Exit;
            End;
            //
            If uFuncoes.CPF(dbeCPF.Text) = False Then
             Begin
                Application.MessageBox('CPF inválido!!!',
                   'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
               dbeCPF.SetFocus;
               Exit;
            End;
            //

           if (VerificarCPF(dbeCPF.Text)) Then
            begin
                 Application.MessageBox('CPF já cadastrado.','ATENÇÃO',
                      MB_OK+MB_ICONWARNING+MB_APPLMODAL);
                 dbeCPF.SetFocus;
                 Exit;
            End;
       Result := True;     
end;

procedure TfrmCadClientes.CarregarDocumentoBanco;
Var
  qraux : TSQLquery;
  texto : string;
  bTemDocumento : Boolean;
begin
     imgDocumento.Visible := false;
     if not (dsCadastro.DataSet.IsEmpty) Then
     begin
          bTemDocumento := false;
          imgDocumento.Picture.Assign(nil);
          Try
              if not (dmGerenciador.cdsClientePAC_IMG_IDENTIDADE.IsNull) Then
               begin
                    dbiDocumento.DataField := 'PAC_IMG_IDENTIDADE';
                    imgDocumento.Picture.Assign(dbiDocumento.Picture);
                    bTemDocumento := True;
               End;
               if (bTemDocumento) then
                   imgDocumento.Visible := True;
          Finally

          End;
     End;     //   if not (dsCadastro.DataSet.IsEmpty) Then
end;

function TfrmCadClientes.DigitalizarDocumento: Boolean;
var
  Jpg                    : TJpegImage;
  Bmp                    : TBitmap;
  Flag                   : Boolean;
  S                      : string;
begin
  Result := False;
  Flag := False;
  with aiScanearImagem do
  begin
    if LoadTWainModule then
    begin
      try
        Try
            OpenSourceManager;
            S := GetSource(false);
            SelectSource(S);
            OpenSource;

            If (AcquireJpg(Jpg, 50) = 0) then
                 Flag := True;
        Except

        End;
      finally
        CloseTWainSession;
        UnloadTWainModule;
      end;
    end
    else
      MessageDlg('Erro ao carregar a biblioteca TWAIN_32.DLL', mtError, [mbOk], 0);
  end;

  if (Flag) then
   begin
        imgDocumento.Picture.Bitmap.Assign(Jpg);
        Result := True;
   end;
end;

{function TfrmCadClientes.GravarDocumentoIdentidadeBanco(objImage : TImage): Boolean;
begin
end;    }

procedure TfrmCadClientes.btnDigitalizarClick(Sender: TObject);
Var
    aCPf : String;
begin
     btnDigitalizar.Enabled := False;
     aCPf := uFuncoes.RemoveChar(dsCadastro.DataSet.FieldByName('PAC_CPF').AsString);
     Try
         Try
                if (DigitalizarDocumento()) Then
                 begin
                      // Gravar dados
                      If (dmGerenciador.GravarDocumentoIdentidadeBanco(aCPf, imgDocumento)) Then
                      begin
                           buscar(aCPf);
                           Application.MessageBox('Documento gravado com sucesso!!!','ATENÇÃO',
                               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                      End;
                 End;
         Except
              on e: exception do
               begin
                    Application.MessageBox(Pchar('Erro ao tentar digitalizar documento!'+#13+e.Message),'ATENÇÃO',
                           MB_OK+MB_ICONERROR+MB_APPLMODAL);
               End;
         End;
     Finally
          btnDigitalizar.Enabled := True;
     End;
     Application.ProcessMessages;
  inherited;
end;

procedure TfrmCadClientes.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
       if (key = #13) and not (dsCadastro.DataSet.IsEmpty) Then
       begin
           key := #0;
           if (btnAlterar.Enabled)then
              btnAlterar.SetFocus;
       End;
end;

end.
