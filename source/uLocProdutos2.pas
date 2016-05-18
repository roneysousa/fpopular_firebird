unit uLocProdutos2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TfrmLocProdutos2 = class(TForm)
    Panel1: TPanel;
    edtConsultar: TEdit;
    Panel2: TPanel;
    grdConsultar: TDBGrid;
    dsProdutos: TDataSource;
    Label1: TLabel;
    procedure edtConsultarChange(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure edtConsultarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure grdConsultarDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocProdutos2: TfrmLocProdutos2;
  M_NRFROM : integer;

implementation

uses udmGerenciador, uFuncoes, uVendas;

{$R *.dfm}

procedure TfrmLocProdutos2.edtConsultarChange(Sender: TObject);
begin
   If not uFuncoes.Empty(edtConsultar.Text) Then
   Begin
        with dmGerenciador.cdsprodutos do
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
       dmGerenciador.cdsprodutos.Close;
end;

procedure TfrmLocProdutos2.grdConsultarDblClick(Sender: TObject);
begin
     If (dmGerenciador.cdsprodutos.Active = True) Then
        Close;
end;

procedure TfrmLocProdutos2.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
    If (Key = #13)
      and (dmGerenciador.cdsprodutos.Active)
      and not (dmGerenciador.cdsprodutos.IsEmpty) Then
    Begin
         Key := #0;
         Close;
   End;

end;

procedure TfrmLocProdutos2.edtConsultarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   If (dmGerenciador.cdsProdutos.Active = True) Then
   Begin
     IF (KEY = vk_Up) then // avalio se é seta para cima ou para baixo;
          dmGerenciador.cdsProdutos.Prior;
     //
     IF (key = vk_Down) then
          dmGerenciador.cdsProdutos.Next;
   End;
end;

procedure TfrmLocProdutos2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    If not uFuncoes.Empty(edtConsultar.Text) Then
      If (M_NRFROM = 1) Then
         uVendas.W_CDPROD :=
              dmGerenciador.cdsProdutos.FieldByName('PRO_BARRAS').AsString;
    //
    dmGerenciador.cdsProdutos.Close;
    Action := caFree;
end;

procedure TfrmLocProdutos2.grdConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
   If (Key = #13)
      and (dmGerenciador.cdsprodutos.Active)
      and not (dmGerenciador.cdsprodutos.IsEmpty) Then
    Begin
         Key := #0;
         Close;
   End;
end;

procedure TfrmLocProdutos2.grdConsultarDrawColumnCell(Sender: TObject;
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
