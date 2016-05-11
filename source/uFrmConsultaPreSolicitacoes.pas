unit uFrmConsultaPreSolicitacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, Buttons, DB, StdCtrls, Mask, ToolEdit,
  FMTBcd, DBClient, Provider, SqlExpr, uInfoPrincipal;

type
  TFrmConsultaPreSolicitacoes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    sbProximo: TSpeedButton;
    sbUltimo: TSpeedButton;
    sbAnterior: TSpeedButton;
    sbPrimeiro: TSpeedButton;
    grdConsultar: TDBGrid;
    BtSair: TBitBtn;
    dsDados: TDataSource;
    Label1: TLabel;
    edtDTINIC: TDateEdit;
    Label2: TLabel;
    edtDTFINA: TDateEdit;
    btLocalizar: TBitBtn;
    Label3: TLabel;
    edtNRCPF: TMaskEdit;
    spLocCliente: TSpeedButton;
    edtNMCLIE: TEdit;
    Label8: TLabel;
    dstConsultar: TSQLDataSet;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    cdsConsultarPRE_SEQUENCIA: TIntegerField;
    cdsConsultarPRE_CPFPACIENTE: TStringField;
    cdsConsultarPRE_AUTORIZACAO: TStringField;
    cdsConsultarPRE_CUPOMFISCAL: TStringField;
    cdsConsultarPRE_CRM_UF: TStringField;
    cdsConsultarPRE_DTMOVIMENTO: TDateField;
    cdsConsultarPRE_HOMOVIMENTO: TStringField;
    cdsConsultarPRE_CODIGOBARRAS: TStringField;
    cdsConsultarPRE_NOME_MEDICAMENTO: TStringField;
    cdsConsultarPRE_QTSOLICITADA: TFMTBCDField;
    cdsConsultarPRE_QTPREESCRITA: TFMTBCDField;
    cdsConsultarPRE_QTAUTORIZADA: TFMTBCDField;
    cdsConsultarPRE_VALOR_VENDA: TFMTBCDField;
    cdsConsultarPRE_PARCELA_MS: TFMTBCDField;
    cdsConsultarPRE_PARCELA_CLIENTE: TFMTBCDField;
    cdsConsultarPRE_VENDEDOR: TIntegerField;
    cdsConsultarPRE_STATUS: TStringField;
    cdsConsultarPRE_MOTIVO: TStringField;
    cdsConsultarPRE_CONFIRMADA: TStringField;
    rgConfirmada: TRadioGroup;
    Label4: TLabel;
    lblRegistros: TLabel;
    dstItensVendas: TSQLDataSet;
    dspItensVenda: TDataSetProvider;
    cdsItensVenda: TClientDataSet;
    cdsItensVendaPRE_SEQUENCIA: TIntegerField;
    cdsItensVendaPRE_CPFPACIENTE: TStringField;
    cdsItensVendaPRE_AUTORIZACAO: TStringField;
    cdsItensVendaPRE_CUPOMFISCAL: TStringField;
    cdsItensVendaPRE_CRM_UF: TStringField;
    cdsItensVendaPRE_DTMOVIMENTO: TDateField;
    cdsItensVendaPRE_HOMOVIMENTO: TStringField;
    cdsItensVendaPRE_CODIGOBARRAS: TStringField;
    cdsItensVendaPRE_NOME_MEDICAMENTO: TStringField;
    cdsItensVendaPRE_QTSOLICITADA: TFMTBCDField;
    cdsItensVendaPRE_QTPREESCRITA: TFMTBCDField;
    cdsItensVendaPRE_QTAUTORIZADA: TFMTBCDField;
    cdsItensVendaPRE_VALOR_VENDA: TFMTBCDField;
    cdsItensVendaPRE_PARCELA_MS: TFMTBCDField;
    cdsItensVendaPRE_PARCELA_CLIENTE: TFMTBCDField;
    cdsItensVendaPRE_VENDEDOR: TIntegerField;
    cdsItensVendaPRE_STATUS: TStringField;
    cdsItensVendaPRE_MOTIVO: TStringField;
    cdsItensVendaPRE_CONFIRMADA: TStringField;
    btnVerificar: TBitBtn;
    lblMsg: TLabel;
    cdsConsultarPRE_CRM: TStringField;
    cdsItensVendaPRE_CRM: TStringField;
    procedure BtSairClick(Sender: TObject);
    procedure dsDadosDataChange(Sender: TObject; Field: TField);
    procedure edtNRCPFExit(Sender: TObject);
    procedure edtNRCPFKeyPress(Sender: TObject; var Key: Char);
    procedure spLocClienteClick(Sender: TObject);
    procedure edtNRCPFChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDTFINAExit(Sender: TObject);
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINAKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTINICKeyPress(Sender: TObject; var Key: Char);
    procedure btLocalizarClick(Sender: TObject);
    procedure rgConfirmadaClick(Sender: TObject);
    procedure sbPrimeiroClick(Sender: TObject);
    procedure sbAnteriorClick(Sender: TObject);
    procedure sbProximoClick(Sender: TObject);
    procedure sbUltimoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnVerificarClick(Sender: TObject);
  private
    { Private declarations }
    Function ConsultaPeriodo(aDtInicio, aDtFinal : TDatetime; aCPF: String): Boolean;
  public
    { Public declarations }
  end;

var
  FrmConsultaPreSolicitacoes: TFrmConsultaPreSolicitacoes;

implementation

uses uFuncoes, udmGerenciador, ufrmLocCliente;

{$R *.dfm}

procedure TFrmConsultaPreSolicitacoes.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TFrmConsultaPreSolicitacoes.dsDadosDataChange(Sender: TObject;
  Field: TField);
begin
  sbPrimeiro.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Bof);
  sbAnterior.Enabled := sbPrimeiro.Enabled;
  sbUltimo.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Eof);
  sbProximo.Enabled := sbUltimo.Enabled;
  //
  if ((Sender as TDataSource).DataSet.Active) and not ((Sender as TDataSource).DataSet.IsEmpty) Then
      lblRegistros.Caption := InttoStr(dsDados.DataSet.RecNo)+'/'+ InttoStr(dsDados.DataSet.RecordCount)
  Else
      lblRegistros.Caption := '';
end;

procedure TFrmConsultaPreSolicitacoes.edtNRCPFExit(Sender: TObject);
begin
  If not uFuncoes.Empty(edtNRCPF.Text) Then
     begin
        If uFuncoes.CPF(edtNRCPF.Text) = False Then
        Begin
            Application.MessageBox('CPF inválido!!!',
               'ATENÇÃO', MB_OK+MB_ICONQUESTION+MB_APPLMODAL);
            edtNRCPF.SetFocus;
            Exit;
        End;
        //
        If (dmGerenciador.GetCPFCliente(edtNRCPF.Text)) Then
            edtNMCLIE.Text := dmGerenciador.GetNomeCliente(edtNRCPF.Text)
         Else
            edtNMCLIE.Clear;
     End;
end;

procedure TFrmConsultaPreSolicitacoes.edtNRCPFKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and uFuncoes.Empty(edtNRCPF.Text) Then
      begin
           Key := #0;
           spLocClienteClick(Sender);
      End;
      //
     If (key = #13)
        and not uFuncoes.Empty(edtNRCPF.Text) Then
      begin
           Key := #0;
           edtNMCLIE.SetFocus;
      End;
end;

procedure TFrmConsultaPreSolicitacoes.spLocClienteClick(Sender: TObject);
begin
    frmLocCliente := TfrmLocCliente.create(application);
    try
        edtNMCLIE.Clear ;
        edtNRCPF.SetFocus;
        ufrmLocCliente.iOpcao := 2;
        frmLocCliente.showmodal;
    finally
        If not (frmLocCliente.cdsConsulta.IsEmpty) Then
           edtNRCPF.Text := frmLocCliente.cdsConsultaPAC_CPF.AsString;
        //
        frmLocCliente.Release;
        frmLocCliente := nil;
        //
        If not uFuncoes.Empty(edtNRCPF.Text) Then
             btLocalizar.SetFocus;
    end;
end;

procedure TFrmConsultaPreSolicitacoes.edtNRCPFChange(Sender: TObject);
begin
    if uFuncoes.Empty(ufuncoes.RemoveChar(edtNRCPF.Text)) Then
         edtNMCLIE.Clear;
end;

procedure TFrmConsultaPreSolicitacoes.FormShow(Sender: TObject);
begin
     edtDTINIC.Date := Date();
     edtDTFINA.Date := Date();
     //
     btLocalizar.SetFocus;
end;

procedure TFrmConsultaPreSolicitacoes.edtDTFINAExit(Sender: TObject);
begin
    If not uFuncoes.Empty (uFuncoes.RemoveChar(edtDTFINA.Text)) Then
    Begin
        try
            StrToDate(edtDTFINA.Text);
            edtDTFINA.Date := StrToDate(edtDTFINA.Text);
            //
            If (edtDTFINA.Date > Date()) Then
             begin
                   ShowMessage ('Data não pode ser superior a atual!');
                   edtDTFINA.SetFocus;
                   Exit;
              End;
            //
            If (edtDTFINA.Date < edtDTINIC.date) Then
              begin
                   edtDTFINA.SetFocus;
                   Exit;
              End;
        except
          on EConvertError do
          Begin
               ShowMessage ('Data Inválida!');
               edtDTFINA.SetFocus;
               Exit;
          End;
        end;
    End;
end;

procedure TFrmConsultaPreSolicitacoes.edtDTINICExit(Sender: TObject);
begin
  If not uFuncoes.Empty (uFuncoes.RemoveChar(edtDTINIC.Text)) Then
    Begin
        try
            StrToDate(edtDTINIC.Text);
            edtDTINIC.Date := StrToDate(edtDTINIC.Text);
            //
            If (edtDTINIC.Date > Date()) Then
              begin
                   ShowMessage ('Data não pode ser superior a atual!');
                   edtDTINIC.SetFocus;
                   Exit;
              End;
        except
          on EConvertError do
          Begin
               ShowMessage ('Data Inválida!');
               edtDTINIC.SetFocus;
               Exit;
          End;
        end;
    End;
end;

procedure TFrmConsultaPreSolicitacoes.edtDTFINAKeyPress(Sender: TObject;
  var Key: Char);
begin
    If (key = #13) and not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTFINA.Text)) Then
      begin
           Key := #0;
           edtNRCPF.SetFocus;
      End;
end;

procedure TFrmConsultaPreSolicitacoes.edtDTINICKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTINIC.Text)) Then
      begin
           Key := #0;
           edtDTFINA.SetFocus;
      End;
end;

function TFrmConsultaPreSolicitacoes.ConsultaPeriodo(aDtInicio,
  aDtFinal: TDatetime; aCPF: String): Boolean;
Var
  aSQLTexto, aSituacao : String;
begin
     Result := False;
     case rgConfirmada.ItemIndex of
         0 : aSituacao := 'S';
         1 : aSituacao := 'N';
     End;
     //
     aSQLTexto := 'Select P.PRE_SEQUENCIA, P.PRE_CPFPACIENTE, P.PRE_AUTORIZACAO, ';
     aSQLTexto := aSQLTexto + 'P.PRE_CUPOMFISCAL, P.PRE_CRM, P.PRE_CRM_UF, P.PRE_DTMOVIMENTO, ';
     aSQLTexto := aSQLTexto + 'P.PRE_HOMOVIMENTO, P.PRE_CODIGOBARRAS, P.PRE_NOME_MEDICAMENTO, ';
     aSQLTexto := aSQLTexto + 'P.PRE_QTSOLICITADA, P.PRE_QTPREESCRITA, P.PRE_QTAUTORIZADA, P.PRE_VALOR_VENDA, ';
     aSQLTexto := aSQLTexto + 'P.PRE_PARCELA_MS, P.PRE_PARCELA_CLIENTE, P.PRE_VENDEDOR, P.PRE_STATUS, ';
     aSQLTexto := aSQLTexto + 'P.PRE_MOTIVO, P.PRE_CONFIRMADA from PRESOLICITACAO P ';
     aSQLTexto := aSQLTexto + 'Where (P.PRE_DTMOVIMENTO >= :pDTINICIO) and (P.PRE_DTMOVIMENTO  <= :pDTFINAL) ';
     If not uFuncoes.Empty(aCPF) Then
          aSQLTexto := aSQLTexto + ' and (P.PRE_CPFPACIENTE = '+QuotedStr(uFuncoes.RemoveChar(aCPF))+') ';
     aSQLTexto := aSQLTexto + ' and (P.PRE_CONFIRMADA = '+QuotedStr(aSituacao)+')';
     aSQLTexto := aSQLTexto + 'ORDER BY P.PRE_DTMOVIMENTO, P.PRE_HOMOVIMENTO ';
     //
     btLocalizar.Enabled := False;
     try
         With cdsConsultar do
         begin
              Close;
              CommandText := aSQLTexto;
              Params[0].AsDate := aDtInicio;
              Params[1].AsDate := aDtFinal;
              Open;
              //
              if not (IsEmpty) Then
                 Result := True;
         End;
     Finally
           btLocalizar.Enabled := true;
     End;
     Application.ProcessMessages;
end;

procedure TFrmConsultaPreSolicitacoes.btLocalizarClick(Sender: TObject);
begin
    if uFuncoes.Empty(uFuncoes.RemoveChar(edtDTINIC.Text)) Then
    begin
         Application.MessageBox(Pchar('Digite o período inicial.'),
               'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
         edtDTINIC.SetFocus;
         Exit;
    End;
    //
    if uFuncoes.Empty(uFuncoes.RemoveChar(edtDTFINA.Text)) Then
    begin
         Application.MessageBox(Pchar('Digite o período final.'),
               'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
         edtDTFINA.SetFocus;
         Exit;
    End;
    //
    if not (ConsultaPeriodo(edtDTINIC.Date, edtDTFINA.Date, edtNRCPF.Text)) Then
    begin
         Application.MessageBox(Pchar('Há pré-solicitações no período indicado.'),
               'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
         edtDTINIC.SetFocus;
         Exit;
    End;
end;

procedure TFrmConsultaPreSolicitacoes.rgConfirmadaClick(Sender: TObject);
begin
      btLocalizarClick(Sender);
end;

procedure TFrmConsultaPreSolicitacoes.sbPrimeiroClick(Sender: TObject);
begin
   If (cdsConsultar.Active ) Then
      dsDados.DataSet.First;
end;

procedure TFrmConsultaPreSolicitacoes.sbAnteriorClick(Sender: TObject);
begin
     If (cdsConsultar.Active ) Then
        dsDados.DataSet.Prior;
end;

procedure TFrmConsultaPreSolicitacoes.sbProximoClick(Sender: TObject);
begin
   If (cdsConsultar.Active ) Then
       dsDados.DataSet.Next;
end;

procedure TFrmConsultaPreSolicitacoes.sbUltimoClick(Sender: TObject);
begin
     If (cdsConsultar.Active ) Then
        dsDados.DataSet.Last;
end;

procedure TFrmConsultaPreSolicitacoes.Button1Click(Sender: TObject);
Var
   iRetorno : Integer;
   aNomePaciente : String;
begin
   
end;

procedure TFrmConsultaPreSolicitacoes.btnVerificarClick(Sender: TObject);
Var
   iRetorno : Integer;
   aNomePaciente : String;
begin
     if (rgConfirmada.ItemIndex = 0 ) Then
         Exit;
     //
     lblMsg.Caption := 'Aguarde retorno do Farmácia Popular.';
     Application.ProcessMessages;
     btnVerificar.Enabled := false;
     try
          if not (dmGerenciador.GetVerificaVendaAutorizacao(cdsConsultarPRE_AUTORIZACAO.AsString)) Then
           begin
               aNomePaciente := dmGerenciador.GetNomeCliente(cdsConsultarPRE_CPFPACIENTE.AsString);
               With cdsItensVenda do
               begin
                    Close;
                    Params[0].AsString := cdsConsultarPRE_AUTORIZACAO.AsString;
                    Params[1].AsDate   := cdsConsultarPRE_DTMOVIMENTO.AsDateTime;
                    Params[2].AsString := cdsConsultarPRE_HOMOVIMENTO.AsString;
                    Open;
               End;
               //
               iRetorno := dmGerenciador.AdicionarVenda(cdsConsultarPRE_CPFPACIENTE.AsString,
                 aNomePaciente, cdsConsultarPRE_CRM.AsString, cdsConsultarPRE_HOMOVIMENTO.AsString,
                 cdsConsultarPRE_AUTORIZACAO.AsString, 'F', cdsConsultarPRE_DTMOVIMENTO.AsDateTime,
                 cdsConsultarPRE_DTMOVIMENTO.AsDateTime, cdsConsultarPRE_CUPOMFISCAL.AsInteger,
                 StrtoInt(uInfoPrincipal.M_CDUSUA), cdsConsultarPRE_VENDEDOR.AsInteger,
                 cdsConsultarPRE_VALOR_VENDA.AsFloat, cdsConsultarPRE_PARCELA_CLIENTE.AsFloat,
                 cdsConsultarPRE_PARCELA_MS.AsFloat, cdsItensVenda);
                //
                lblMsg.Caption := 'Aguarde retorno do Farmácia Popular..';
                Application.ProcessMessages;
                //
                if (iRetorno > 0) Then
                   dmGerenciador.EstornarVenda(iRetorno, cdsConsultarPRE_AUTORIZACAO.AsString);
                //
                lblMsg.Caption := 'Aguarde retorno do Farmácia Popular...';
                Application.ProcessMessages;
           End
           Else
                ShowMessage('Venda já cadastrada.');
           //
           btLocalizarClick(nil);     
     Finally
          btnVerificar.Enabled := true;
          lblMsg.Caption := '';
     End;
     Application.ProcessMessages;
end;

end.
