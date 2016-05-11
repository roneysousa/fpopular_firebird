unit ufrmVendaAprovada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, RXCtrls, Gradient, ExtCtrls, Grids, DBGrids;

type
  TfrmVendaAprovada = class(TForm)
    Panel1: TPanel;
    Gradiente1: TGradiente;
    RxLabel1: TRxLabel;
    lbl_valor: TRxLabel;
    lbl_Desconto: TRxLabel;
    btConfirma: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btConfirmaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendaAprovada: TfrmVendaAprovada;
  M_VLPAGA, M_VLDESC : Double;
  M_NRVEND, M_NRAUTO : String;

implementation

uses uVendas;

const
    ScreenWidth: LongInt = 800; {I designed my form in 800x600 mode.}
    ScreenHeight: LongInt = 600;

{$R *.dfm}

procedure TfrmVendaAprovada.FormShow(Sender: TObject);
begin
     lbl_valor.Caption    := 'Valor a Pagar R$ '+FormatFloat('###,##0.#0',M_VLPAGA);
     lbl_Desconto.Caption := 'Você economizou R$ '+FormatFloat('###,##0.#0',M_VLDESC);
     //
     btConfirma.SetFocus;
end;

procedure TfrmVendaAprovada.FormCreate(Sender: TObject);
begin
     { scaled := true;
      if (screen.width <> ScreenWidth) then
      begin
            height := longint(height) * longint(screen.height) DIV ScreenHeight;
            width := longint(width) * longint(screen.width) DIV ScreenWidth;
            scaleBy(screen.width, ScreenWidth);
      end;}
end;

procedure TfrmVendaAprovada.btConfirmaClick(Sender: TObject);
begin
     Close;
end;

end.
