unit uFrmConfirmacaoVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, ToolEdit,
  CurrEdit, DB, DBClient, DBCtrls, ImgList;

type
  TFrmConfirmacaoVenda = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    btnConfirma: TBitBtn;
    btnCancelar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    edtValorMS: TCurrencyEdit;
    edtValorCliente: TCurrencyEdit;
    ClientDataSet1: TClientDataSet;
    Label3: TLabel;
    edtTotalVenda: TCurrencyEdit;
    Panel3: TPanel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    ImageList1: TImageList;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure Totais(aCDS : TDataSet);
  public
    { Public declarations }
  end;

var
  FrmConfirmacaoVenda: TFrmConfirmacaoVenda;

implementation

uses uVendas, udmGerenciador, uFuncoes;

{$R *.dfm}

{ TFrmConfirmacaoVenda }

procedure TFrmConfirmacaoVenda.Totais(aCDS: TDataSet);
Var
    fValorMS, fValorCliente, fValorVenda, fValorUnitario : Double;
    fQuantApresentacao, fQuant : Double;
begin
     fValorMS      := 0;
     fValorCliente := 0;
     fValorVenda   := 0;
     fQuantApresentacao := 0;
     //
     With aCDS do
     begin
          DisableControls;
          First;
          While not (EOF) do
          begin
               fValorMS      := fValorMS + FieldBYName('PRO_VLPRECO_SUBSIDIADO').AsFloat;
               fValorCliente := fValorCliente + FieldByName('PRO_VLPRECO_SUBPACIENTE').AsFloat;
               fQuantApresentacao := dmGerenciador.GetQuantidadeApresentacaoNew(FieldBYName('PRO_CDBARR').AsString);
               fValorUnitario := FieldBYName('PRO_VLVEND').AsFloat;
               //FieldBYName('PRO_VLPRECO_VENDA').AsFloat;
               fQuant        := uFuncoes.Arredondar(FieldByName('PRO_QTPROD').AsFloat / fQuantApresentacao,2);
               fValorVenda   := fValorVenda + (fValorUnitario * fQuant);
               // fValorVenda + fValorUnitario;
               // (fValorUnitario * fQuant);
               //
               Next;
          End;
          EnableControls;
     End;
     //
     edtTotalVenda.Value   := fValorVenda;
     edtValorMS.Value      := fValorMS;
     edtValorCliente.Value := fValorVenda - fValorMS;
     //fValorCliente;
end;

procedure TFrmConfirmacaoVenda.FormShow(Sender: TObject);
Var
   idVendedor : Integer;
begin
     Totais(frmVendas.dsProdutosVendas.DataSet);
     //
     idVendedor := dmGerenciador.GetCodigoVendedorporNome(frmVendas.cmbVendedores.Text);
     //
     dmGerenciador.AddPreSolicitacao(frmVendas.edtNRCUPO.Text, frmVendas.edtNRCPF.Text,
         frmVendas.edtNRCRM.Text, frmVendas.cmbUF.Text, uVendas.M_HOVEND, idVendedor, dmGerenciador.cdsDados, uVendas.M_DTVEND);
end;

procedure TFrmConfirmacaoVenda.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Icon: TBitmap;
begin
    if not odd(TDBGrid(Sender).DataSource.DataSet.RecNo) then
      if not (gdSelected in State) then
       begin
            DBGrid1.Canvas.Brush.Color := ufuncoes.aCorGridZebrado;
            DBGrid1.Canvas.FillRect(Rect);
            DBGrid1.DefaultDrawDataCell(rect,Column.Field,state);
       end;

  Icon := TBitmap.Create;
  if (Column.FieldName = 'PRO_FLAUTO') then
  begin
    with DBGrid1.Canvas do
    begin
      Brush.Color := clWhite;
      FillRect(Rect);
      if (frmVendas.dsProdutosVendas.DataSet.FieldByName('PRO_FLAUTO').AsBoolean) then
        ImageList1.GetBitmap(0, Icon)
      else
        ImageList1.GetBitmap(1, Icon);
      Draw(round((Rect.Left + Rect.Right - Icon.Width) / 2), Rect.Top, Icon);
    end;
  end;

end;

end.
