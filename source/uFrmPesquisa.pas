unit uFrmPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, ToolEdit, XSBuiltIns;

type
  TfrmPesquisa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    edtDTINIC: TDateEdit;
    edtDTFINA: TDateEdit;
    Label2: TLabel;
    btFechar: TBitBtn;
    grdConsultar: TDBGrid;
    btLocalizar: TBitBtn;
    procedure btFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINAExit(Sender: TObject);
    procedure btLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisa: TfrmPesquisa;

implementation

uses ServicoSolicitacaoWS1, uFuncoes, udmGerenciador;

{$R *.dfm}

procedure TfrmPesquisa.btFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmPesquisa.FormShow(Sender: TObject);
begin
    edtDTINIC.Date := Date();
    edtDTFINA.Date := Date();
end;

procedure TfrmPesquisa.edtDTINICExit(Sender: TObject);
begin
    If (edtDTINIC.Text  <> '  /  /    ') Then
    Begin
        try
            StrToDate(edtDTINIC.Text);
            //
            If (edtDTINIC.Date > Date()) Then
              begin
                   edtDTINIC.SetFocus;
                   Exit;
              End;
        except
          on EConvertError do
          Begin
               ShowMessage ('Data Inv�lida!');
               edtDTINIC.SetFocus;
               Exit;
          End;
        end;
    End;
end;

procedure TfrmPesquisa.edtDTFINAExit(Sender: TObject);
begin
    If (edtDTFINA.Text  <> '  /  /    ') Then
    Begin
        try
            StrToDate(edtDTFINA.Text);
            //
            If (edtDTFINA.Date > Date())
            or (edtDTFINA.Date < edtDTINIC.date) Then
              begin
                   edtDTFINA.SetFocus;
                   Exit;
              End;
        except
          on EConvertError do
          Begin
               ShowMessage ('Data Inv�lida!');
               edtDTFINA.SetFocus;
               Exit;
          End;
        end;
    End;
end;

procedure TfrmPesquisa.btLocalizarClick(Sender: TObject);
Var
     Service             : ServicoSolicitacaoWS;
     ObjPesquisa         : PesquisaDTO;
     ObjRetornoPesquisa  : RetornoPesquisaDTO;
     ObjUsuarioFarmacia  : UsuarioFarmaciaDTO;
     i : integer;
     ObjItemPesquisa     : ItemPesquisaDTO;
     ObjArrayMedicamento : ArrayOfMedicamentoDTO;
begin
     Try
           Screen.Cursor := crHourGlass;
          try
                If (dmGerenciador.cdsConfig.Active = False) Then
                  dmGerenciador.cdsConfig.Open;
                //
                Service := (dmGerenciador.HTTPRIO1 as ServicoSolicitacaoWS);
                //
                ObjPesquisa := PesquisaDTO.Create;
                // CNPJ
                ObjPesquisa.nuCnpj       := dmGerenciador.cdsConfigCFG_CNPJ_EMPRESA.AsString;
                ObjPesquisa.nuCnpjMatriz := dmGerenciador.cdsConfigCFG_CNPJ_EMPRESA.AsString;
                // Data de in�cio do per�odo
                ObjPesquisa.dataInicio := DateTimeToXSDateTime(edtDTINIC.Date);
                // Data de t�rmino do per�odo.
                ObjPesquisa.dataFim    := DateTimeToXSDateTime(edtDTFINA.Date);
                // N�mero da p�gina a ser pesquisada. Caso n�o seja informado, ser� retornado a primeira p�gina.
                ObjPesquisa.numeroPagina    := 1;
                ObjPesquisa.statusTransacao := '3F';
                // Cria o Usu�rio da farmacia
                ObjUsuarioFarmacia := UsuarioFarmaciaDTO.Create;
                ObjUsuarioFarmacia.usuario := dmGerenciador.cdsConfigCFG_LOGIN.AsString;
                ObjUsuarioFarmacia.senha   := dmGerenciador.cdsConfigCFG_SENHA.AsString;
                //
                ObjRetornoPesquisa := Service.pesquisarAutorizacoes(ObjPesquisa, ObjUsuarioFarmacia);
                //
                Showmessage(ObjRetornoPesquisa.mensagemRetorno);
                //
                If (ObjRetornoPesquisa.codigoRetorno = 'OOP') Then
                  begin

                  End;
          Except
              on Exc:Exception do
              begin
                    Application.MessageBox(PChar('Erro ao tentar gerar pesquisa!!!'
                      + Exc.Message),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              End;
          End;
     Finally
            ObjPesquisa.Free;
            ObjItemPesquisa.Free;
            //
            Screen.Cursor := crDefault;
     End;
end;

End.
