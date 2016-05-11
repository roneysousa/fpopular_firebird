unit ufrmLocCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, FMTBcd, DB, DBClient,
  Provider, SqlExpr;

type
  TfrmLocCliente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    grdConsultar: TDBGrid;
    Label1: TLabel;
    edtNome: TEdit;
    dstConsulta: TSQLDataSet;
    dspConsulta: TDataSetProvider;
    cdsConsulta: TClientDataSet;
    dsConsulta: TDataSource;
    cdsConsultaPAC_CPF: TStringField;
    cdsConsultaPAC_NOME: TStringField;
    procedure edtNomeChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure grdConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure CONSULTA(M_NMCLIE : String);
    procedure CONFIRMAR;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocCliente: TfrmLocCliente;
  iOpcao : Integer;

implementation

uses udmGerenciador, uFuncoes, uVendas, uFrmConsultaPreSolicitacoes;

{$R *.dfm}

procedure TfrmLocCliente.CONFIRMAR;
begin
      If (cdsConsulta.Active) Then
        begin
              If (iOpcao = 1) Then
                  frmVendas.edtNRCPF.Text := cdsConsulta.FieldByName('PAC_CPF').AsString;
              If (iOpcao = 2) Then
                 FrmConsultaPreSolicitacoes.edtNRCPF.Text := cdsConsulta.FieldByName('PAC_CPF').AsString;
              //
              close;
        End;
end;

procedure TfrmLocCliente.CONSULTA(M_NMCLIE: String);
begin
      With cdsConsulta do
        begin
             Close;
             Params.ParamByName('pNOME').AsString := M_NMCLIE+'%';
             Open;
        End;
end;

procedure TfrmLocCliente.edtNomeChange(Sender: TObject);
begin
     If not uFuncoes.Empty(edtNome.Text) Then
          CONSULTA(edtNome.Text)
     Else
          cdsConsulta.Close;
end;

procedure TfrmLocCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     cdsConsulta.Close;
     //
     Action := caFree;
end;

procedure TfrmLocCliente.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
     If (key = #13) and
      not uFuncoes.Empty(edtNome.Text) Then
     begin
           Key := #0;
           CONFIRMAR;
     End;
     //
     If (key = #27) and
        uFuncoes.Empty(edtNome.Text) Then
     begin
          Key := #0;
          close;
     End;
end;

procedure TfrmLocCliente.grdConsultarDblClick(Sender: TObject);
begin
     If (cdsConsulta.Active) Then
          CONFIRMAR;
end;

procedure TfrmLocCliente.grdConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #27) Then
     begin
          Key := #0;
          close;
     End;
end;

procedure TfrmLocCliente.edtNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   If (cdsConsulta.Active = True) Then
   Begin
     IF (KEY = vk_Up) then // avalio se é seta para cima ou para baixo;
          cdsConsulta.Prior;
     //
     IF (key = vk_Down) then
          cdsConsulta.Next;
   End;
end;

end.
