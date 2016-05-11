unit uLogon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, RxLookup, FMTBcd, DB,
  SqlExpr, jpeg;

type
  TfrmLogon = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_SENHA: TEdit;
    edtCDUSUA: TEdit;
    Image1: TImage;
    qryLogado: TSQLQuery;
    Image2: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btCancelarClick(Sender: TObject);
    procedure edt_SENHAExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_SENHAKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDUSUAExit(Sender: TObject);
    procedure edtCDUSUAKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
     M_FECHA: Boolean;
     procedure ACESSO(W_CDUSUA, W_SNATUA : String);
     procedure CONSULTA;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogon: TfrmLogon;
  M_QTTENT: Integer;


implementation

uses uFuncoes, uInfoPrincipal, udmGerenciador;

{$R *.DFM}

Function GetStateK (Key: integer): boolean;
begin
  Result := Odd (GetKeyState (Key));
end;

procedure TfrmLogon.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      If Not M_FECHA Then
          Action := caNone
      Else
          Action := caFree;
     //
     // Se estiver em branco sai do programa
     If uFuncoes.Empty(edtCDUSUA.Text) or
        uFuncoes.Empty(edt_SENHA.text) Then
     Begin
          Application.Terminate;
          dmGerenciador.qryUsuarios.Close;
     End;
     //
     Action := caFree;
end;

procedure TfrmLogon.btCancelarClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmLogon.edt_SENHAExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edt_Senha.text) Then
        edt_Senha.text := edt_Senha.text+uFuncoes.Replicate('_',6-uFuncoes.ContaCaracs(edt_Senha.text));
end;

procedure TfrmLogon.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      If GetStateK (VK_LMENU) And (Key = VK_F4) Then
          M_FECHA := False;
end;

procedure TfrmLogon.edt_SENHAKeyPress(Sender: TObject; var Key: Char);
begin
     If (key = #27) Then
     Begin
         key:=#0;
         Application.Terminate;
     End;
     //
     If (Key =#13) and not uFuncoes.Empty(edtCDUSUA.Text)
        and not uFuncoes.Empty(edt_SENHA.Text) Then
     begin
          Key := #0;
          ACESSO(edtCDUSUA.Text, edt_SENHA.Text);
     End;
end;

procedure TfrmLogon.ACESSO(W_CDUSUA, W_SNATUA: String);
Var
   M_ACHOU :boolean;
begin
     // SE nome do usuario estiver vazio
     If uFuncoes.Empty(edtCDUSUA.Text) Then
     begin
          Application.MessageBox('Digite o c�digo de usu�rio.',
          'ATEN��O', MB_OK+MB_ICONINFORMATION);
          edtCDUSUA.SetFocus;
          Exit;
     end;
     //
     // Se a senha do usuario estiver vazio
     If uFuncoes.Empty(edt_SENHA.Text) Then
     begin
          Application.MessageBox('Digite sua senha de usu�rio.',
               'ATEN��O', MB_OK+MB_ICONINFORMATION);
          edt_SENHA.SetFocus;
          Exit;
     end;
     //
  Try
     M_QTTENT:=M_QTTENT+1;
     W_CDUSUA := edtCDUSUA.Text;
     W_SNATUA := edt_SENHA.Text;
     W_SNATUA := W_SNATUA+uFuncoes.Replicate('_',6-uFuncoes.ContaCaracs(W_SNATUA));
     W_SNATUA := uFuncoes.Codifica(W_SNATUA);
     //
     If (dmGerenciador.CdsConfig.Active = False) Then
        dmGerenciador.CdsConfig.Open;
     // Se Super-Usu�rio
     If (edtCDUSUA.Text = '000') and (M_QTTENT<=3) Then
     begin
          If (edt_SENHA.Text = uInfoPrincipal.M_SNMASTER) Then
          Begin
              uInfoPrincipal.M_CDUSUA := '001';
              uInfoPrincipal.M_NMUSUA := 'USERMASTER';
              //
              Close;
              Exit;
          End
          Else
          Begin
              Application.MessageBox('Senha inv�lida!!!',
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              edt_SENHA.Clear;
              edt_SENHA.SetFocus;
              Exit;
          End;
     End
     Else
     begin
         //
         With dmGerenciador.qryUsuarios do
         Begin
              Close;
              //
              Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDUSUA.Text);
              //
              Open;
         End;
         // Procura usu�rio
         If (M_QTTENT<=3) Then
         begin
            If (dmGerenciador.qryUsuarios.FieldByName('SEN_SNATUA').AsString <> W_SNATUA) Then
            begin
                  Application.MessageBox('Senha inv�lida!!!',
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 edt_SENHA.Clear;
                 edt_SENHA.SetFocus;
                 Exit;
            end
            else
            begin
                 uInfoPrincipal.M_CDUSUA := dmGerenciador.qryUsuarios.FieldByName('SEN_CODIGO').AsString;
                 uInfoPrincipal.M_NMUSUA := dmGerenciador.qryUsuarios.FieldByName('SEN_NOME').AsString;
                 uInfoPrincipal.M_SNATUA := dmGerenciador.qryUsuarios.FieldByName('SEN_SNATUA').AsString;
                 //
                 dmGerenciador.cdsUsuarios.Close;
                 With dmGerenciador.dstUsuarios do
                 Begin
                      Active := False;
                      CommandText := 'Select * from USUARIOS Where (SEN_CODIGO = :pCODIGO)';
                      Params.ParamByName('pCODIGO').AsInteger := StrtoInt(uInfoPrincipal.M_CDUSUA);
                      Active := True;
                 End;
                 dmGerenciador.cdsUsuarios.Open;
                 dmGerenciador.cdsUsuarios.Edit;
                 //
                 dmGerenciador.cdsUsuariosSEN_DTATUAL.AsDateTime := Date();
                 dmGerenciador.cdsUsuarios.Post;
                 dmGerenciador.cdsUsuarios.ApplyUpdates(0);
                 //
                 Close;
            end;
            //
         End
         Else
         begin
              Application.MessageBox('O Sistema ser� Fechado!',
                    'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              Application.Terminate;
         End;
     End;
   Except
        on Exc:Exception do
        begin
              Application.MessageBox(PChar('Erro ao acessar o sistema!!!'
                      + Exc.Message),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              //
             Close;
        End;
   End;
end;

procedure TfrmLogon.CONSULTA;
begin
     With dmGerenciador.qryUsuarios do
     Begin
          Close;
          //
          Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDUSUA.Text);
          //
          Open;
     End;
     //
     If (dmGerenciador.qryUsuarios.IsEmpty) Then
     Begin
          Application.MessageBox('Registro de usu�rio n�o cadastrado!!!','ATEN��O',
                              MB_OK+MB_ICONSTOP+MB_APPLMODAL);
          dmGerenciador.qryUsuarios.Close;
          edtCDUSUA.Clear;
          edtCDUSUA.SetFocus;
          Exit;
     End
     Else
         edt_SENHA.SetFocus;
end;

procedure TfrmLogon.edtCDUSUAExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDUSUA.Text) Then
       edtCDUSUA.Text := uFuncoes.StrZero(edtCDUSUA.Text,3);
     //
   {  With qryLogado do
     Begin
          Close;
          //
          Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDUSUA.Text);
          //
          Open;
     End;
     //
     If not (qryLogado.IsEmpty) Then
     Begin
          If not uFuncoes.Empty(qryLogado.FieldByName('SEN_DTATUAL').AsString) Then
          Begin
              Application.MessageBox('Usu�rio j� est� acessando o sistema!!!' ,
                   'ATEN��O', MB_OK+MB_ICONINFORMATION);
              qryLogado.Close;
              edtCDUSUA.Clear;
              edtCDUSUA.SetFocus;
              Exit;
          End;
          //
          qryLogado.Close;
     End;}
end;

procedure TfrmLogon.edtCDUSUAKeyPress(Sender: TObject; var Key: Char);
begin
    If not( key in['0'..'9',#8, #13, #27] ) then
        key:=#0;
    //
    If (key = #27) Then
    Begin
         key:=#0;
         Application.Terminate;
    End;
    //
    If (key = #13) and uFuncoes.Empty(edtCDUSUA.Text) Then
    Begin
         key:=#0;
         //
         edtCDUSUA.Text := '000';
         edt_SENHA.SetFocus; 
    End;
    //
    If (key = #13) and not uFuncoes.Empty(edtCDUSUA.Text) Then
    Begin
         key:=#0;
         //
         CONSULTA;
    End;
end;

procedure TfrmLogon.FormShow(Sender: TObject);
begin
     dmGerenciador.sqlConnGerenciador.Connected := True;
     //
     dmGerenciador.parametros;
     dmGerenciador.CdsConfig.Edit;
     dmGerenciador.CdsConfigCFG_DATATUAL.AsDateTime := Date();
     dmGerenciador.CdsConfig.Post;
     dmGerenciador.CdsConfig.ApplyUpdates(0);
     //
     M_QTTENT := 0;
     //
     edtCDUSUA.SetFocus;
end;

End.
