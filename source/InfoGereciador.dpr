program InfoGereciador;

uses
  Forms,
  uInfoPrincipal in 'uInfoPrincipal.pas' {frmPrincipal},
  uSplash in 'uSplash.pas' {frmSplash},
  uSobre in 'uSobre.pas' {frmSobre},
  udmGerenciador in 'udmGerenciador.pas' {dmGerenciador: TDataModule},
  uVendas in 'uVendas.pas' {frmVendas},
  uFuncoes in 'uFuncoes.pas',
  uLocProduto in 'uLocProduto.pas' {frmLocProduto},
  ufrmConfig in 'ufrmConfig.pas' {frmConfig},
  uBematech in 'uBematech.pas',
  ServicoSolicitacaoWS1 in 'ServicoSolicitacaoWS1.pas',
  uFiscal in 'uFiscal.pas',
  uFrmPesquisa in 'uFrmPesquisa.pas' {frmPesquisa},
  uDaruma in 'uDaruma.pas',
  uFrmCadUsuario in 'uFrmCadUsuario.pas' {frmCadUsuarios},
  uLogon in 'uLogon.pas' {frmLogon},
  ufrmLocCliente in 'ufrmLocCliente.pas' {frmLocCliente},
  uFrmConsultaVendas in 'uFrmConsultaVendas.pas' {frmConsultaVendas},
  uLocProdutos2 in 'uLocProdutos2.pas' {frmLocProdutos2},
  ufrmVendaAprovada in 'ufrmVendaAprovada.pas' {frmVendaAprovada},
  uFrmCancelaVendas in 'uFrmCancelaVendas.pas' {frmCancelaVendas},
  uFrmCadastro in 'uFrmCadastro.pas' {frmCadastro},
  uFrmCadProdutos in 'uFrmCadProdutos.pas' {frmCadProdutos},
  uFrmDetalheVenda in 'uFrmDetalheVenda.pas' {frmDetalheVenda},
  ServicoSolicitacaoWS2 in 'ServicoSolicitacaoWS2.pas',
  uFrmCadVendedores in 'uFrmCadVendedores.pas' {frmCadVendedores},
  uFrmConfirmacaoVenda in 'uFrmConfirmacaoVenda.pas' {FrmConfirmacaoVenda},
  uFrmConsultaPreSolicitacoes in 'uFrmConsultaPreSolicitacoes.pas' {FrmConsultaPreSolicitacoes},
  ServicoSolicitacaoWS3 in 'ServicoSolicitacaoWS3.pas',
  uFrmDigitalizacao in 'uFrmDigitalizacao.pas' {FrmDigitalizacao};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmGerenciador, dmGerenciador);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Title := 'InfoFarmacia Popular';
  Application.Run;
end.
