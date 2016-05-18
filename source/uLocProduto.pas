unit uLocProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, DB;

type
  TfrmLocProduto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    grdConsultar: TDBGrid;
    edtConsultar: TEdit;
    dsLocProdutos: TDataSource;
    procedure edtConsultarChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure grdConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure edtConsultarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure grdConsultarDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocProduto: TfrmLocProduto;
  M_NRFROM : Integer;

implementation

uses uFuncoes, udmGerenciador, uVendas;

{$R *.dfm}

procedure TfrmLocProduto.edtConsultarChange(Sender: TObject);
begin
   If not uFuncoes.Empty(edtConsultar.Text) Then
   Begin
        with dmGerenciador.qryLocProduto do
        begin
            //
            Close;
            Params[0].AsString := edtConsultar.Text + '%';
            Params[1].AsString := '0000000000000';
            Open;
            //
        End;
   End
   Else
       dmGerenciador.qryLocProduto.Close;
end;

procedure TfrmLocProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    If not uFuncoes.Empty(edtConsultar.Text) Then
      If (M_NRFROM = 1) Then
         uVendas.W_CDPROD :=
              dmGerenciador.qryLocProduto.FieldByName('PRO_CDBARR').AsString;
    //
    dmGerenciador.qryLocProduto.Close; 
    Action := caFree;          
end;

procedure TfrmLocProduto.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
    If (Key = #13)
      and (dmGerenciador.qryLocProduto.Active)
      and (dmGerenciador.qryLocProduto.RecordCount > 0) Then
    Begin
         Key := #0;
         Close;
   End;
end;

procedure TfrmLocProduto.FormShow(Sender: TObject);
begin
     dmGerenciador.qryLocProduto.Close;
end;

procedure TfrmLocProduto.grdConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
    If (Key = #13) and (dmGerenciador.qryLocProduto.RecordCount > 0) Then
    Begin
         Key := #0;
         Close;
         ModalResult := mrOK;
    End;
end;

procedure TfrmLocProduto.edtConsultarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   If (dmGerenciador.qryLocProduto.Active = True) Then
   Begin
     IF (KEY = vk_Up) then // avalio se é seta para cima ou para baixo;
          dmGerenciador.qryLocProduto.Prior;
     //
     IF (key = vk_Down) then
          dmGerenciador.qryLocProduto.Next;
   End;
end;

procedure TfrmLocProduto.grdConsultarDblClick(Sender: TObject);
begin
     If (dmGerenciador.qryLocProduto.Active = True) Then
        Close;
end;

procedure TfrmLocProduto.grdConsultarDrawColumnCell(Sender: TObject;
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
