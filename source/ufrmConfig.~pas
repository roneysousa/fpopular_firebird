unit ufrmConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, ExtDlgs;

type
  TfrmConfig = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edtNMEMPR: TDBEdit;
    dsEmpresa: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    cmbUF: TDBComboBox;
    btGravar: TBitBtn;
    btCancelar: TBitBtn;
    btFechar: TBitBtn;
    btEditar: TBitBtn;
    Label5: TLabel;
    edtFantasia: TDBEdit;
    Label6: TLabel;
    edtRazao: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    imgLogo: TDBImage;
    btProcurar: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    chbFarma: TCheckBox;
    chbSimulacao: TCheckBox;
    DBRadioGroup1: TDBRadioGroup;
    procedure btFecharClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure dsEmpresaStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtNMEMPRExit(Sender: TObject);
    procedure btProcurarClick(Sender: TObject);
  private
    { Private declarations }
    procedure CHECK_BOX;
    procedure DESABILITAR_CHECKS;
  public
    { Public declarations } 
  end;

var
  frmConfig: TfrmConfig;

implementation

uses udmGerenciador, uFuncoes;

{$R *.dfm}

procedure TfrmConfig.btFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmConfig.btEditarClick(Sender: TObject);
begin
     dmGerenciador.cdsConfig.edit;
     btProcurar.Enabled := not btProcurar.Enabled;
     //
     chbFarma.Enabled     := True;
     chbSimulacao.Enabled := True;
     edtFantasia.SetFocus; 
end;

procedure TfrmConfig.btGravarClick(Sender: TObject);
begin
     If uFuncoes.Empty(edtFantasia.Text) Then
     begin
          Application.MessageBox(PChar('Digite o nome de fantasia da empressa!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtFantasia.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(edtRazao.Text) Then
     begin
          Application.MessageBox(PChar('Digite a razão social!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtRazao.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(edtNMEMPR.Text) Then
     begin
          Application.MessageBox(PChar('Digite o CNPJ da empressa!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          edtNMEMPR.SetFocus;
          Exit;
     End;
     //
     If uFuncoes.Empty(cmbUF.Text) Then
     begin
          Application.MessageBox(PChar('Selecione a UF da empressa!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cmbUF.SetFocus;
          Exit;
     End;
     //
     try
          // Vincular ao InfoG2 Farma
          If (chbFarma.Checked) Then
              dmGerenciador.cdsConfig.FieldByName('CFG_VINCULOFARMA').AsString := 'S'
          Else
              dmGerenciador.cdsConfig.FieldByName('CFG_VINCULOFARMA').AsString := 'N';
          // chbSimulacao
          If (chbSimulacao.Checked) Then
              dmGerenciador.cdsConfig.FieldByName('CFG_SIMULACAO').AsString := 'S'
          Else
              dmGerenciador.cdsConfig.FieldByName('CFG_SIMULACAO').AsString := 'N';
          //
          dmGerenciador.cdsConfig.Post;
          dmGerenciador.cdsConfig.ApplyUpdates(0);
          //
          btProcurar.Enabled := not btProcurar.Enabled;
          DESABILITAR_CHECKS;
      Except
          on Exc:Exception do
          begin
                Application.MessageBox(PChar('Erro ao tentar gravar dados!!!'
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          End;
      End;
end;

procedure TfrmConfig.btCancelarClick(Sender: TObject);
begin
     dmGerenciador.cdsConfig.Cancel;
     btProcurar.Enabled := not btProcurar.Enabled;
     //
     DESABILITAR_CHECKS;
end;

procedure TfrmConfig.dsEmpresaStateChange(Sender: TObject);
begin
    btGravar.Enabled   := dsEmpresa.State in [dsEdit];
    btCancelar.Enabled := dsEmpresa.State in [dsEdit];
    //
    btFechar.Enabled   := dsEmpresa.State in [dsBrowse];
    btEditar.Enabled   := dsEmpresa.State in [dsBrowse];
end;

procedure TfrmConfig.FormShow(Sender: TObject);
begin
     CHECK_BOX;
end;

procedure TfrmConfig.edtNMEMPRExit(Sender: TObject);
begin
    If (dmGerenciador.cdsConfig.State in [dsEdit]) Then
     If not uFuncoes.Empty(edtNMEMPR.Text) Then
        If uFuncoes.CGC(edtNMEMPR.Text) = False Then
        Begin
            Application.MessageBox('CNPJ inválido!!!',
               'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
            edtNMEMPR.SetFocus;
            Exit;
        End;
end;

procedure TfrmConfig.btProcurarClick(Sender: TObject);
begin
  If (dmGerenciador.cdsConfig.State in [dsEdit]) Then
  Begin
     Try
          If (OpenPictureDialog1.Execute) Then
             imgLogo.Picture.LoadFromFile(OpenPictureDialog1.FileName);
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar abrir imagem!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        End;
     End;
  End;
end;

procedure TfrmConfig.CHECK_BOX;
begin
     dmGerenciador.Parametros;
     // Vincular ao InfoG2 Farma
     If (dmGerenciador.cdsConfig.FieldByName('CFG_VINCULOFARMA').AsString = 'S') Then
         chbFarma.Checked := True
     Else
         chbFarma.Checked := False;
     // chbSimulacao
     If (dmGerenciador.cdsConfig.FieldByName('CFG_SIMULACAO').AsString = 'S') Then
         chbSimulacao.Checked := True
     Else
         chbSimulacao.Checked := False;
     //
     DESABILITAR_CHECKS;
end;

procedure TfrmConfig.DESABILITAR_CHECKS;
begin
     chbFarma.Enabled := False;
     chbSimulacao.Enabled := False;
end;


end.
