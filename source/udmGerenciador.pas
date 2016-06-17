unit udmGerenciador;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, DBTables, FMTBcd, Provider,
  DBClient, InvokeRegistry, Rio, SOAPHTTPClient, Forms, Dialogs,
  AppEvnts, Windows, FileCtrl, MidasLib, Graphics, ExtCtrls;

type
  TdmGerenciador = class(TDataModule)
    sqlConnGerenciador: TSQLConnection;
    qryProdutos: TQuery;
    dstConfig: TSQLDataSet;
    dstMedicos: TSQLDataSet;
    dstPacientes: TSQLDataSet;
    dstVendas: TSQLDataSet;
    dstProdutosVendas: TSQLDataSet;
    dstCancelamentos: TSQLDataSet;
    dspConfig: TDataSetProvider;
    dspMedicos: TDataSetProvider;
    dspPacientes: TDataSetProvider;
    dspVendas: TDataSetProvider;
    dspProdutosVendas: TDataSetProvider;
    dspCancelamento: TDataSetProvider;
    dstPacientesPAC_CPF: TStringField;
    dstCancelamentosCAN_CODSOLICITACAO: TIntegerField;
    dstCancelamentosCAN_CODBARRAS: TStringField;
    dstCancelamentosCAN_QUANT_DEVOLVIDA: TFMTBCDField;
    dstCancelamentosCAN_CODAUTORIZACAO: TIntegerField;
    dstCancelamentosCAN_COD_INDICADOR: TIntegerField;
    dstCancelamentosCAN_QUANTIDADE_ESTORNADA: TFMTBCDField;
    dstCancelamentosCAN_ESTORNO_ITEM: TIntegerField;
    cdsConfig: TClientDataSet;
    cdsConfigCFG_CNPJ_EMPRESA: TStringField;
    cdsConfigCFG_SEQUENCIA: TIntegerField;
    cdsConfigCFG_UF_EMPRESA: TStringField;
    cdsConfigCFG_LOGIN: TStringField;
    cdsConfigCFG_SENHA: TStringField;
    cdsMedicos: TClientDataSet;
    cdsPacientes: TClientDataSet;
    cdsVendas: TClientDataSet;
    cdsProdutosVendas: TClientDataSet;
    cdsCancelamento: TClientDataSet;
    cdsPacientesPAC_CPF: TStringField;
    cdsCancelamentoCAN_CODSOLICITACAO: TIntegerField;
    cdsCancelamentoCAN_CODBARRAS: TStringField;
    cdsCancelamentoCAN_QUANT_DEVOLVIDA: TFMTBCDField;
    cdsCancelamentoCAN_CODAUTORIZACAO: TIntegerField;
    cdsCancelamentoCAN_COD_INDICADOR: TIntegerField;
    cdsCancelamentoCAN_QUANTIDADE_ESTORNADA: TFMTBCDField;
    cdsCancelamentoCAN_ESTORNO_ITEM: TIntegerField;
    cdsDados: TClientDataSet;
    cdsDadosPRO_CDBARR: TStringField;
    cdsDadosPRO_NMPROD: TStringField;
    cdsDadosPRO_QTPROD: TFloatField;
    cdsDadosPRO_VLVEND: TCurrencyField;
    cdsDadosPRO_QTPRES: TFloatField;
    cdsDadosPRO_QTAUTO: TFloatField;
    cdsDadosPRO_TOTALPARCELA: TCurrencyField;
    cdsDadosPRO_TOTVENDA: TCurrencyField;
    cdsDadosPRO_PARCELAPACIENTE: TCurrencyField;
    cdsDadosPRO_CDINDICADOR: TIntegerField;
    cdsDadosPRO_QTCANC: TFloatField;
    qryProdutosPRO_CDBARR: TStringField;
    qryProdutosPRO_NMPROD: TStringField;
    qryProdutosPRO_VLVEND: TFloatField;
    cdsDadosPRO_SUBTOTAL: TCurrencyField;
    qryLocProduto: TQuery;
    qryIncMedico: TSQLQuery;
    qryIncPaciente: TSQLQuery;
    qryProcurar: TSQLQuery;
    HTTPRIO1: THTTPRIO;
    cdsDadosPRO_AUTOR_ESTORNO: TStringField;
    cdsDadosPRO_AUTORMEDICAMENTO: TStringField;
    cdsDadosPRO_QTAUTORIZADA: TFloatField;
    cdsDadosPRO_QTDEVOLVIDA: TFloatField;
    cdsDadosPRO_QTESTORNADA: TFloatField;
    cdsDadosPRO_QTPRESCRITA: TFloatField;
    cdsDadosPRO_QTSOLICITADA: TFloatField;
    cdsDadosPRO_STATUS: TStringField;
    cdsDadosPRO_VLPRECO_SUBSIDIADO: TFloatField;
    cdsDadosPRO_VLPRECO_SUBPACIENTE: TFloatField;
    cdsDadosPRO_VLPACIENTE_POSESTORNO: TFloatField;
    cdsDadosPRO_VLPRECO_VENDA: TFloatField;
    cdsDadosPRO_VLSUBMS_POSESTORNO: TFloatField;
    cdsDadosPRO_VLTOTAL_VENDA_POSESTORNO: TFloatField;
    cdsDadosPRO_FLESTO: TBooleanField;
    dstProdutosVendasPRV_CODSOLICITACAO: TIntegerField;
    dstProdutosVendasPRV_CODBARRAS: TStringField;
    dstProdutosVendasPRV_QUANTIDADE: TFMTBCDField;
    dstProdutosVendasPRV_VLVENDA: TFMTBCDField;
    dstProdutosVendasPRV_QUANTIDADE_PRESCRITA: TFMTBCDField;
    dstProdutosVendasPRV_QUANTIDADE_AUTORIZADA: TFMTBCDField;
    dstProdutosVendasPRV_VLPARCELA: TFMTBCDField;
    dstProdutosVendasPRV_VLTOTALPRECOVENDA: TFMTBCDField;
    dstProdutosVendasPRV_VLTOTALPARCELA: TFMTBCDField;
    dstProdutosVendasPRV_COD_INDICADOR: TIntegerField;
    dstProdutosVendasPRV_QUANT_CANCELADA: TFMTBCDField;
    dstProdutosVendasPRV_AUTORESTORNO: TStringField;
    dstProdutosVendasPRV_AUTORMEDICAMENTO: TStringField;
    dstProdutosVendasPRV_STATUS: TStringField;
    dstProdutosVendasPRV_QTDEVOLVIDA: TFMTBCDField;
    dstProdutosVendasPRV_QTPRESCRITA: TFMTBCDField;
    dstProdutosVendasPRV_VLPRECO_SUBSIDIADO: TFMTBCDField;
    dstProdutosVendasPRV_VLPRECO_SUBPACIENTE: TFMTBCDField;
    dstProdutosVendasPRV_VLPRECO_SUBPAC_POSESTORNO: TFMTBCDField;
    dstProdutosVendasPRV_VLSUBMS_POSESTORNO: TFMTBCDField;
    dstProdutosVendasPRV_VLTOTAL_POSESTORNO: TFMTBCDField;
    cdsProdutosVendasPRV_CODSOLICITACAO: TIntegerField;
    cdsProdutosVendasPRV_CODBARRAS: TStringField;
    cdsProdutosVendasPRV_QUANTIDADE: TFMTBCDField;
    cdsProdutosVendasPRV_VLVENDA: TFMTBCDField;
    cdsProdutosVendasPRV_QUANTIDADE_PRESCRITA: TFMTBCDField;
    cdsProdutosVendasPRV_QUANTIDADE_AUTORIZADA: TFMTBCDField;
    cdsProdutosVendasPRV_VLPARCELA: TFMTBCDField;
    cdsProdutosVendasPRV_VLTOTALPRECOVENDA: TFMTBCDField;
    cdsProdutosVendasPRV_VLTOTALPARCELA: TFMTBCDField;
    cdsProdutosVendasPRV_COD_INDICADOR: TIntegerField;
    cdsProdutosVendasPRV_QUANT_CANCELADA: TFMTBCDField;
    cdsProdutosVendasPRV_AUTORESTORNO: TStringField;
    cdsProdutosVendasPRV_AUTORMEDICAMENTO: TStringField;
    cdsProdutosVendasPRV_STATUS: TStringField;
    cdsProdutosVendasPRV_QTDEVOLVIDA: TFMTBCDField;
    cdsProdutosVendasPRV_QTPRESCRITA: TFMTBCDField;
    cdsProdutosVendasPRV_VLPRECO_SUBSIDIADO: TFMTBCDField;
    cdsProdutosVendasPRV_VLPRECO_SUBPACIENTE: TFMTBCDField;
    cdsProdutosVendasPRV_VLPRECO_SUBPAC_POSESTORNO: TFMTBCDField;
    cdsProdutosVendasPRV_VLSUBMS_POSESTORNO: TFMTBCDField;
    cdsProdutosVendasPRV_VLTOTAL_POSESTORNO: TFMTBCDField;
    dstVendasMOV_CODSOLICITACAO: TIntegerField;
    dstVendasMOV_CPFPACIENTE: TStringField;
    dstVendasMOV_DTEMISSAO: TDateField;
    dstVendasMOV_NRADM: TIntegerField;
    dstVendasMOV_NRCUPOM: TIntegerField;
    dstVendasMOV_VALOR: TFMTBCDField;
    dstVendasMOV_VLPAGO: TFMTBCDField;
    dstVendasMOV_VLDEBITO: TFMTBCDField;
    dstVendasMOV_NRAUTORIZACAO: TIntegerField;
    dstVendasMOV_CODINDICADOR: TIntegerField;
    dstVendasMOV_DTVENDA: TDateField;
    dstVendasMOV_AUTORIZACAO: TStringField;
    cdsVendasMOV_CODSOLICITACAO: TIntegerField;
    cdsVendasMOV_CPFPACIENTE: TStringField;
    cdsVendasMOV_DTEMISSAO: TDateField;
    cdsVendasMOV_NRADM: TIntegerField;
    cdsVendasMOV_NRCUPOM: TIntegerField;
    cdsVendasMOV_VALOR: TFMTBCDField;
    cdsVendasMOV_VLPAGO: TFMTBCDField;
    cdsVendasMOV_VLDEBITO: TFMTBCDField;
    cdsVendasMOV_NRAUTORIZACAO: TIntegerField;
    cdsVendasMOV_CODINDICADOR: TIntegerField;
    cdsVendasMOV_DTVENDA: TDateField;
    cdsVendasMOV_AUTORIZACAO: TStringField;
    dstProdutosVendasPRV_FLCANC: TStringField;
    cdsProdutosVendasPRV_FLCANC: TStringField;
    dstVendasMOV_AUTORESTORNO: TStringField;
    cdsVendasMOV_AUTORESTORNO: TStringField;
    dstVendasMOV_FLSITU: TStringField;
    cdsVendasMOV_FLSITU: TStringField;
    dstVendasMOV_DTCANCELAMENTO: TDateField;
    cdsVendasMOV_DTCANCELAMENTO: TDateField;
    dstProdutosVendasPRV_QTESTORNADA: TFMTBCDField;
    cdsProdutosVendasPRV_QTESTORNADA: TFMTBCDField;
    dstUsuarios: TSQLDataSet;
    dstUsuariosSEN_CODIGO: TIntegerField;
    dstUsuariosSEN_NOME: TStringField;
    dstUsuariosSEN_SNATUA: TStringField;
    dstUsuariosSEN_CARGO: TStringField;
    dstUsuariosSEN_IMPRESSORA: TIntegerField;
    dspUsuarios: TDataSetProvider;
    cdsUsuarios: TClientDataSet;
    cdsUsuariosSEN_CODIGO: TIntegerField;
    cdsUsuariosSEN_NOME: TStringField;
    cdsUsuariosSEN_SNATUA: TStringField;
    cdsUsuariosSEN_CARGO: TStringField;
    cdsUsuariosSEN_IMPRESSORA: TIntegerField;
    dstImpressora: TSQLDataSet;
    dspImpressora: TDataSetProvider;
    cdsImpressora: TClientDataSet;
    dstImpressoraIMP_CODIGO: TIntegerField;
    dstImpressoraIMP_DESCRICAO: TStringField;
    cdsImpressoraIMP_CODIGO: TIntegerField;
    cdsImpressoraIMP_DESCRICAO: TStringField;
    cdsUsuariosSEN_NMDESC: TStringField;
    dstConfigCFG_CNPJ_EMPRESA: TStringField;
    dstConfigCFG_SEQUENCIA: TIntegerField;
    dstConfigCFG_UF_EMPRESA: TStringField;
    dstConfigCFG_LOGIN: TStringField;
    dstConfigCFG_SENHA: TStringField;
    dstConfigCFG_USUARIO: TIntegerField;
    cdsConfigCFG_USUARIO: TIntegerField;
    qryUsuarios: TSQLQuery;
    qryUsuariosSEN_CODIGO: TIntegerField;
    qryUsuariosSEN_NOME: TStringField;
    qryUsuariosSEN_SNATUA: TStringField;
    dstConfigCFG_DATATUAL: TDateField;
    cdsConfigCFG_DATATUAL: TDateField;
    dstUsuariosSEN_DTATUAL: TDateField;
    cdsUsuariosSEN_DTATUAL: TDateField;
    qryUsuariosSEN_CARGO: TStringField;
    qryUsuariosSEN_IMPRESSORA: TIntegerField;
    dstConfigCFC_IMGLOGO: TBlobField;
    dstConfigCFG_FANTASIA: TStringField;
    dstConfigCFG_RAZAO: TStringField;
    dstConfigCFG_ENDERECO: TStringField;
    dstConfigCFG_CIDADE: TStringField;
    dstConfigCFG_MENSCUPOM: TStringField;
    dstConfigCFG_CEPEMPRESA: TStringField;
    dstConfigCFG_FONEEMPRESA: TStringField;
    cdsConfigCFC_IMGLOGO: TBlobField;
    cdsConfigCFG_FANTASIA: TStringField;
    cdsConfigCFG_RAZAO: TStringField;
    cdsConfigCFG_ENDERECO: TStringField;
    cdsConfigCFG_CIDADE: TStringField;
    cdsConfigCFG_CEPEMPRESA: TStringField;
    cdsConfigCFG_FONEEMPRESA: TStringField;
    cdsConfigCFG_MENSCUPOM: TStringField;
    cdsDadosPRO_FLSITUACAO: TStringField;
    dstConsultaVendas: TSQLDataSet;
    dspConsultaVendas: TDataSetProvider;
    cdsConsultaVendas: TClientDataSet;
    dstConsultaVendasMOV_CPFPACIENTE: TStringField;
    dstConsultaVendasMOV_NRCUPOM: TIntegerField;
    dstConsultaVendasMOV_VALOR: TFMTBCDField;
    dstConsultaVendasMOV_VLPAGO: TFMTBCDField;
    dstConsultaVendasMOV_NRAUTORIZACAO: TIntegerField;
    dstConsultaVendasMOV_NOMEPESSOA: TStringField;
    dstConsultaVendasMOV_DTVENDA: TDateField;
    dstConsultaVendasMOV_AUTORIZACAO: TStringField;
    dstConsultaVendasMOV_FLSITU: TStringField;
    dstConsultaVendasMOV_DTCANCELAMENTO: TDateField;
    cdsConsultaVendasMOV_CPFPACIENTE: TStringField;
    cdsConsultaVendasMOV_NRCUPOM: TIntegerField;
    cdsConsultaVendasMOV_VALOR: TFMTBCDField;
    cdsConsultaVendasMOV_VLPAGO: TFMTBCDField;
    cdsConsultaVendasMOV_NRAUTORIZACAO: TIntegerField;
    cdsConsultaVendasMOV_NOMEPESSOA: TStringField;
    cdsConsultaVendasMOV_DTVENDA: TDateField;
    cdsConsultaVendasMOV_AUTORIZACAO: TStringField;
    cdsConsultaVendasMOV_FLSITU: TStringField;
    cdsConsultaVendasMOV_DTCANCELAMENTO: TDateField;
    dstConsultaVendasMOV_CODSOLICITACAO: TIntegerField;
    cdsConsultaVendasMOV_CODSOLICITACAO: TIntegerField;
    cdsConsultaVendasMOV_SITUACAO: TStringField;
    cdsDadosPRO_MENSAGEM: TStringField;
    dstVendasMOV_CDUSUARIO: TIntegerField;
    cdsVendasMOV_CDUSUARIO: TIntegerField;
    dstProdutos: TSQLDataSet;
    dspProdutos: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    qryLocProdutos: TSQLQuery;
    dstProdutosPRO_BARRAS: TStringField;
    dstProdutosPRO_MEDICAMENTO: TStringField;
    dstProdutosPRO_VALORVENDA: TFMTBCDField;
    dstProdutosPRO_QUANTIDADE: TFMTBCDField;
    cdsProdutosPRO_BARRAS: TStringField;
    cdsProdutosPRO_MEDICAMENTO: TStringField;
    cdsProdutosPRO_VALORVENDA: TFMTBCDField;
    cdsProdutosPRO_QUANTIDADE: TFMTBCDField;
    dstUsuariosSEN_PASTA: TStringField;
    cdsUsuariosSEN_PASTA: TStringField;
    dstCadProdutos: TSQLDataSet;
    dspCadProdutos: TDataSetProvider;
    cdsCadProdutos: TClientDataSet;
    dstCadProdutosPRO_BARRAS: TStringField;
    dstCadProdutosPRO_MEDICAMENTO: TStringField;
    dstCadProdutosPRO_VALORVENDA: TFMTBCDField;
    dstCadProdutosPRO_QUANTIDADE: TFMTBCDField;
    cdsCadProdutosPRO_BARRAS: TStringField;
    cdsCadProdutosPRO_MEDICAMENTO: TStringField;
    cdsCadProdutosPRO_VALORVENDA: TFMTBCDField;
    cdsCadProdutosPRO_QUANTIDADE: TFMTBCDField;
    dsCadProdutos: TDataSource;
    qryNomeProduto: TSQLQuery;
    qryNomeProdutoPRO_BARRAS: TStringField;
    qryNomeProdutoPRO_MEDICAMENTO: TStringField;
    qryNomeProdutoPRO_VALORVENDA: TFMTBCDField;
    qryImportar: TQuery;
    qryDados: TSQLQuery;
    qryImportarPRO_CDBARR: TStringField;
    qryImportarPRO_NMPROD: TStringField;
    qryImportarPRO_VLVEND: TFloatField;
    SQLMonitor1: TSQLMonitor;
    dstConfigCFG_VINCULOFARMA: TStringField;
    dstConfigCFG_SIMULACAO: TStringField;
    cdsConfigCFG_VINCULOFARMA: TStringField;
    cdsConfigCFG_SIMULACAO: TStringField;
    ApplicationEvents1: TApplicationEvents;
    dstConfigCFG_FLPRODUCAO: TStringField;
    cdsConfigCFG_FLPRODUCAO: TStringField;
    dstPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsProdutoSelecionado: TClientDataSet;
    cdsProdutoSelecionadoPRO_BARRAS: TStringField;
    cdsProdutoSelecionadoPRO_MEDICAMENTO: TStringField;
    cdsProdutoSelecionadoPRO_VALORVENDA: TFMTBCDField;
    cdsProdutoSelecionadoPRO_QUANTIDADE: TFMTBCDField;
    dstDetalheProduto: TSQLDataSet;
    dspDetalheProduto: TDataSetProvider;
    cdsDetalheProduto: TClientDataSet;
    cdsDetalheProdutoPRV_CODSOLICITACAO: TIntegerField;
    cdsDetalheProdutoPRV_CODBARRAS: TStringField;
    cdsDetalheProdutoPRV_NOMEAPRESENTACAO: TStringField;
    cdsDetalheProdutoPRV_QUANTIDADE: TFMTBCDField;
    cdsDetalheProdutoPRV_VLVENDA: TFMTBCDField;
    cdsDetalheProdutoPRV_QUANTIDADE_PRESCRITA: TFMTBCDField;
    cdsDetalheProdutoPRV_QUANTIDADE_AUTORIZADA: TFMTBCDField;
    cdsDetalheProdutoPRV_VLPARCELA: TFMTBCDField;
    cdsDetalheProdutoPRV_VLTOTALPRECOVENDA: TFMTBCDField;
    cdsDetalheProdutoPRV_VLTOTALPARCELA: TFMTBCDField;
    cdsDetalheProdutoPRV_COD_INDICADOR: TIntegerField;
    cdsDetalheProdutoPRV_QUANT_CANCELADA: TFMTBCDField;
    cdsDetalheProdutoPRV_AUTORESTORNO: TStringField;
    cdsDetalheProdutoPRV_AUTORMEDICAMENTO: TStringField;
    cdsDetalheProdutoPRV_STATUS: TStringField;
    cdsDetalheProdutoPRV_QTDEVOLVIDA: TFMTBCDField;
    cdsDetalheProdutoPRV_QTPRESCRITA: TFMTBCDField;
    cdsDetalheProdutoPRV_VLPRECO_SUBSIDIADO: TFMTBCDField;
    cdsDetalheProdutoPRV_VLPRECO_SUBPACIENTE: TFMTBCDField;
    cdsDetalheProdutoPRV_VLPRECO_SUBPAC_POSESTORNO: TFMTBCDField;
    cdsDetalheProdutoPRV_VLSUBMS_POSESTORNO: TFMTBCDField;
    cdsDetalheProdutoPRV_VLTOTAL_POSESTORNO: TFMTBCDField;
    cdsDetalheProdutoPRV_FLCANC: TStringField;
    cdsDetalheProdutoPRV_QTESTORNADA: TFMTBCDField;
    dstUsuariosSEN_SENHA_VENDEDOR: TStringField;
    cdsUsuariosSEN_SENHA_VENDEDOR: TStringField;
    qryUsuario: TSQLQuery;
    qryUsuarioSEN_CODIGO: TIntegerField;
    qryUsuarioSEN_NOME: TStringField;
    qryUsuarioSEN_SNATUA: TStringField;
    qryUsuarioSEN_CARGO: TStringField;
    qryUsuarioSEN_IMPRESSORA: TIntegerField;
    qryUsuarioSEN_DTATUAL: TDateField;
    qryUsuarioSEN_PASTA: TStringField;
    qryUsuarioSEN_SENHA_VENDEDOR: TStringField;
    dstVendedores: TSQLDataSet;
    dstVendedoresVEN_CODIGO: TIntegerField;
    dstVendedoresVEN_NOME: TStringField;
    dstVendedoresVEN_CPF: TStringField;
    dstVendedoresVEN_LOGIN: TStringField;
    dstVendedoresVEN_SENHA: TStringField;
    dspVendedores: TDataSetProvider;
    cdsVendedores: TClientDataSet;
    cdsVendedoresVEN_CODIGO: TIntegerField;
    cdsVendedoresVEN_NOME: TStringField;
    cdsVendedoresVEN_CPF: TStringField;
    cdsVendedoresVEN_LOGIN: TStringField;
    cdsVendedoresVEN_SENHA: TStringField;
    dstConfigCFG_VENDEDORES: TIntegerField;
    cdsConfigCFG_VENDEDORES: TIntegerField;
    dstPadrao2: TSQLDataSet;
    dspPadrao2: TDataSetProvider;
    cdsListaVendedores: TClientDataSet;
    cdsListaVendedoresVEN_CODIGO: TIntegerField;
    cdsListaVendedoresVEN_NOME: TStringField;
    cdsListaVendedoresVEN_CPF: TStringField;
    dstVendasMOV_HOVENDA: TStringField;
    dstVendasMOV_CODVENDEDOR: TIntegerField;
    cdsVendasMOV_HOVENDA: TStringField;
    cdsVendasMOV_CODVENDEDOR: TIntegerField;
    dstVendasMOV_TEXTO_CUPOM: TMemoField;
    cdsVendasMOV_TEXTO_CUPOM: TMemoField;
    dstConsultaVendasMOV_TEXTO_CUPOM: TMemoField;
    cdsConsultaVendasMOV_TEXTO_CUPOM: TMemoField;
    dstConsultaVendasMOV_CUPOM_VINCULADO: TMemoField;
    cdsConsultaVendasMOV_CUPOM_VINCULADO: TMemoField;
    dstVendasMOV_CUPOM_VINCULADO: TMemoField;
    cdsVendasMOV_CUPOM_VINCULADO: TMemoField;
    qryPesProduto: TQuery;
    qryPesProdutoPRO_CDBARR: TStringField;
    qryPesProdutoPRO_NMPROD: TStringField;
    qryPesProdutoPRO_VLVEND: TFloatField;
    qryPesProdutoPRO_QTARMA: TFloatField;
    cdsDadosPRO_FLAUTO: TBooleanField;
    qryImportarPRO_QTARMA: TFloatField;
    cdsAtualizaDescProd: TClientDataSet;
    cdsAtualizaDescProdPRV_CODSOLICITACAO: TIntegerField;
    cdsAtualizaDescProdPRV_CODBARRAS: TStringField;
    cdsAtualizaDescProdPRV_NOMEAPRESENTACAO: TStringField;
    qryProdutosTAB_VLVEND: TFloatField;
    qryImportarTAB_VLVEND: TFloatField;
    dstVendasMOV_NOMEPESSOA: TStringField;
    cdsVendasMOV_NOMEPESSOA: TStringField;
    dstProdutosVendasPRV_NOMEAPRESENTACAO: TStringField;
    cdsProdutosVendasPRV_NOMEAPRESENTACAO: TStringField;
    dstPacientesPAC_NOME: TStringField;
    cdsPacientesPAC_NOME: TStringField;
    cdsVendaXML: TClientDataSet;
    cdsVendaXMLCDS_VENDA: TIntegerField;
    cdsVendaXMLCDS_CPFPACIENTE: TStringField;
    cdsVendaXMLCDS_CRM_MEDICO: TStringField;
    cdsVendaXMLCDS_DTEMISSAO: TDateField;
    cdsVendaXMLCDS_NRCUPOM: TStringField;
    cdsVendaXMLCDS_VALOR_TOTAL: TFloatField;
    cdsVendaXMLCDS_VLPAGO_MS: TFloatField;
    cdsVendaXMLCDS_VLPAGO_CLIENTE: TFloatField;
    cdsVendaXMLCDS_NOMEPESSOA: TStringField;
    cdsVendaXMLCDS_DTVENDA: TDateField;
    cdsVendaXMLCDS_HOVENDA: TStringField;
    cdsVendaXMLCDS_AUTORIZACAO: TStringField;
    cdsVendaXMLCDS_AUTORESTORNO: TStringField;
    cdsVendaXMLCDS_FLSITU: TStringField;
    cdsVendaXMLCDS_DTCANCELAMENTO: TDateField;
    cdsVendaXMLCDS_CDUSUARIO: TIntegerField;
    cdsVendaXMLCDS_CODVENDEDOR: TIntegerField;
    cdsVendaXMLCDS_TEXTO_CUPOM: TBlobField;
    cdsVendaXMLCDS_CUPOM_VINCULADO: TBlobField;
    cdsVendaXMLCDS_ITEM_NRITEM: TIntegerField;
    cdsVendaXMLCDS_ITEM_CODBARRAS: TStringField;
    cdsVendaXMLCDS_ITEM_NOMEPRODUTO: TStringField;
    cdsVendaXMLCDS_ITEM_VLVENDA: TFloatField;
    cdsVendaXMLCDS_ITEM_QTSOLICITADA: TFloatField;
    cdsVendaXMLCDS_ITEM_QT_AUTORIZADA: TFloatField;
    cdsVendaXMLCDS_ITEM_TOTAL: TFloatField;
    cdsVendaXMLCDS_ITEM_PGMS: TFloatField;
    cdsVendaXMLCDS_ITEM_PGCLIENTE: TFloatField;
    cdsVendaXMLCDS_ITEM_QTCANCELADA: TFloatField;
    cdsVendaXMLCDS_ITEM_QTPRESCRITA: TFloatField;
    dstMedicamentos: TSQLDataSet;
    dspMedicamentos: TDataSetProvider;
    cdsMedicamentos: TClientDataSet;
    cdsMedicamentosMOV_DTVENDA: TDateField;
    cdsMedicamentosMOV_FLSITU: TStringField;
    cdsMedicamentosPRV_CODSOLICITACAO: TIntegerField;
    cdsMedicamentosPRV_CODBARRAS: TStringField;
    cdsMedicamentosPRV_NOMEAPRESENTACAO: TStringField;
    cdsMedicamentosPRV_QUANTIDADE: TFMTBCDField;
    cdsMedicamentosPRV_QUANTIDADE_PRESCRITA: TFMTBCDField;
    cdsMedicamentosPRV_QUANTIDADE_AUTORIZADA: TFMTBCDField;
    dstPreSolicitacao: TSQLDataSet;
    dspPreSolicitacao: TDataSetProvider;
    cdsPreSolicitiacao: TClientDataSet;
    cdsDadosPRO_RETORNO: TStringField;
    dstPreSolicitacaoPRE_CPFPACIENTE: TStringField;
    dstPreSolicitacaoPRE_AUTORIZACAO: TStringField;
    dstPreSolicitacaoPRE_CUPOMFISCAL: TStringField;
    dstPreSolicitacaoPRE_CRM: TStringField;
    dstPreSolicitacaoPRE_CRM_UF: TStringField;
    dstPreSolicitacaoPRE_DTMOVIMENTO: TDateField;
    dstPreSolicitacaoPRE_HOMOVIMENTO: TStringField;
    dstPreSolicitacaoPRE_CODIGOBARRAS: TStringField;
    dstPreSolicitacaoPRE_NOME_MEDICAMENTO: TStringField;
    dstPreSolicitacaoPRE_QTSOLICITADA: TFMTBCDField;
    dstPreSolicitacaoPRE_QTPREESCRITA: TFMTBCDField;
    dstPreSolicitacaoPRE_QTAUTORIZADA: TFMTBCDField;
    dstPreSolicitacaoPRE_VALOR_VENDA: TFMTBCDField;
    dstPreSolicitacaoPRE_PARCELA_MS: TFMTBCDField;
    dstPreSolicitacaoPRE_VENDEDOR: TIntegerField;
    dstPreSolicitacaoPRE_STATUS: TStringField;
    dstPreSolicitacaoPRE_MOTIVO: TStringField;
    dstPreSolicitacaoPRE_CONFIRMADA: TStringField;
    cdsPreSolicitiacaoPRE_CPFPACIENTE: TStringField;
    cdsPreSolicitiacaoPRE_AUTORIZACAO: TStringField;
    cdsPreSolicitiacaoPRE_CUPOMFISCAL: TStringField;
    cdsPreSolicitiacaoPRE_CRM: TStringField;
    cdsPreSolicitiacaoPRE_CRM_UF: TStringField;
    cdsPreSolicitiacaoPRE_DTMOVIMENTO: TDateField;
    cdsPreSolicitiacaoPRE_HOMOVIMENTO: TStringField;
    cdsPreSolicitiacaoPRE_CODIGOBARRAS: TStringField;
    cdsPreSolicitiacaoPRE_NOME_MEDICAMENTO: TStringField;
    cdsPreSolicitiacaoPRE_QTSOLICITADA: TFMTBCDField;
    cdsPreSolicitiacaoPRE_QTPREESCRITA: TFMTBCDField;
    cdsPreSolicitiacaoPRE_QTAUTORIZADA: TFMTBCDField;
    cdsPreSolicitiacaoPRE_VALOR_VENDA: TFMTBCDField;
    cdsPreSolicitiacaoPRE_PARCELA_MS: TFMTBCDField;
    cdsPreSolicitiacaoPRE_VENDEDOR: TIntegerField;
    cdsPreSolicitiacaoPRE_STATUS: TStringField;
    cdsPreSolicitiacaoPRE_MOTIVO: TStringField;
    cdsPreSolicitiacaoPRE_CONFIRMADA: TStringField;
    dstPreSolicitacaoPRE_PARCELA_CLIENTE: TFMTBCDField;
    cdsPreSolicitiacaoPRE_PARCELA_CLIENTE: TFMTBCDField;
    dstAtualizarVenda: TSQLDataSet;
    dspAtualizarVenda: TDataSetProvider;
    cdsAtualizarVenda: TClientDataSet;
    dstAtualizarVendaMOV_CODSOLICITACAO: TIntegerField;
    dstAtualizarVendaMOV_CPFPACIENTE: TStringField;
    dstAtualizarVendaMOV_CRM_MEDICO: TStringField;
    dstAtualizarVendaMOV_DTEMISSAO: TDateField;
    dstAtualizarVendaMOV_NRADM: TIntegerField;
    dstAtualizarVendaMOV_NRCUPOM: TIntegerField;
    dstAtualizarVendaMOV_VALOR: TFMTBCDField;
    dstAtualizarVendaMOV_VLPAGO: TFMTBCDField;
    dstAtualizarVendaMOV_VLDEBITO: TFMTBCDField;
    dstAtualizarVendaMOV_NRAUTORIZACAO: TIntegerField;
    dstAtualizarVendaMOV_NOMEPESSOA: TStringField;
    dstAtualizarVendaMOV_CODINDICADOR: TIntegerField;
    dstAtualizarVendaMOV_DTVENDA: TDateField;
    dstAtualizarVendaMOV_HOVENDA: TStringField;
    dstAtualizarVendaMOV_AUTORIZACAO: TStringField;
    dstAtualizarVendaMOV_AUTORESTORNO: TStringField;
    dstAtualizarVendaMOV_FLSITU: TStringField;
    dstAtualizarVendaMOV_DTCANCELAMENTO: TDateField;
    dstAtualizarVendaMOV_CDUSUARIO: TIntegerField;
    dstAtualizarVendaMOV_CODVENDEDOR: TIntegerField;
    dstAtualizarVendaMOV_TEXTO_CUPOM: TMemoField;
    dstAtualizarVendaMOV_CUPOM_VINCULADO: TMemoField;
    cdsAtualizarVendaMOV_CODSOLICITACAO: TIntegerField;
    cdsAtualizarVendaMOV_CPFPACIENTE: TStringField;
    cdsAtualizarVendaMOV_CRM_MEDICO: TStringField;
    cdsAtualizarVendaMOV_DTEMISSAO: TDateField;
    cdsAtualizarVendaMOV_NRADM: TIntegerField;
    cdsAtualizarVendaMOV_NRCUPOM: TIntegerField;
    cdsAtualizarVendaMOV_VALOR: TFMTBCDField;
    cdsAtualizarVendaMOV_VLPAGO: TFMTBCDField;
    cdsAtualizarVendaMOV_VLDEBITO: TFMTBCDField;
    cdsAtualizarVendaMOV_NRAUTORIZACAO: TIntegerField;
    cdsAtualizarVendaMOV_NOMEPESSOA: TStringField;
    cdsAtualizarVendaMOV_CODINDICADOR: TIntegerField;
    cdsAtualizarVendaMOV_DTVENDA: TDateField;
    cdsAtualizarVendaMOV_HOVENDA: TStringField;
    cdsAtualizarVendaMOV_AUTORIZACAO: TStringField;
    cdsAtualizarVendaMOV_AUTORESTORNO: TStringField;
    cdsAtualizarVendaMOV_FLSITU: TStringField;
    cdsAtualizarVendaMOV_DTCANCELAMENTO: TDateField;
    cdsAtualizarVendaMOV_CDUSUARIO: TIntegerField;
    cdsAtualizarVendaMOV_CODVENDEDOR: TIntegerField;
    cdsAtualizarVendaMOV_TEXTO_CUPOM: TMemoField;
    cdsAtualizarVendaMOV_CUPOM_VINCULADO: TMemoField;
    qryImportarPRO_VLPOPU: TFloatField;
    dstMedicosMED_CRM: TStringField;
    dstMedicosMED_NOME: TStringField;
    cdsMedicosMED_CRM: TStringField;
    cdsMedicosMED_NOME: TStringField;
    dstVendasMOV_CRM_MEDICO: TStringField;
    cdsVendasMOV_CRM_MEDICO: TStringField;
    cdsConsultaVendasDIGITALIZACAO: TBooleanField;
    dstDocumentosVenda: TSQLDataSet;
    dstDocumentosVendaMOV_CODSOLICITACAO: TIntegerField;
    dstDocumentosVendaMOV_IMG_RECEITA: TGraphicField;
    dstDocumentosVendaMOV_IMG_CUPOM_FISCAL: TGraphicField;
    dstDocumentosVendaMOV_DOC_IDENTIFICACAO: TGraphicField;
    dstDocumentosVendaMOV_DOC_PROCURACAO: TGraphicField;
    dstDocumentosVendaMOV_DOC_CARTA: TGraphicField;
    dspDocumentosVenda: TDataSetProvider;
    cdsDocumentosVenda: TClientDataSet;
    cdsDocumentosVendaMOV_CODSOLICITACAO: TIntegerField;
    cdsDocumentosVendaMOV_IMG_RECEITA: TGraphicField;
    cdsDocumentosVendaMOV_IMG_CUPOM_FISCAL: TGraphicField;
    cdsDocumentosVendaMOV_DOC_IDENTIFICACAO: TGraphicField;
    cdsDocumentosVendaMOV_DOC_PROCURACAO: TGraphicField;
    cdsDocumentosVendaMOV_DOC_CARTA: TGraphicField;
    dstDocumentosVendas: TSQLDataSet;
    dstDocumentosVendasMOV_CODSOLICITACAO: TIntegerField;
    dstDocumentosVendasMOV_CPFPACIENTE: TStringField;
    dstDocumentosVendasMOV_DTVENDA: TDateField;
    dstDocumentosVendasMOV_FLSITU: TStringField;
    dstDocumentosVendasMOV_IMG_RECEITA: TGraphicField;
    dstDocumentosVendasMOV_IMG_CUPOM_FISCAL: TGraphicField;
    dstDocumentosVendasMOV_DOC_IDENTIFICACAO: TGraphicField;
    dstDocumentosVendasMOV_DOC_PROCURACAO: TGraphicField;
    dstDocumentosVendasMOV_DOC_CARTA: TGraphicField;
    dspDocumentosVendas: TDataSetProvider;
    cdsDocumentosVendas: TClientDataSet;
    cdsDocumentosVendasMOV_CODSOLICITACAO: TIntegerField;
    cdsDocumentosVendasMOV_CPFPACIENTE: TStringField;
    cdsDocumentosVendasMOV_DTVENDA: TDateField;
    cdsDocumentosVendasMOV_FLSITU: TStringField;
    cdsDocumentosVendasMOV_IMG_RECEITA: TGraphicField;
    cdsDocumentosVendasMOV_IMG_CUPOM_FISCAL: TGraphicField;
    cdsDocumentosVendasMOV_DOC_IDENTIFICACAO: TGraphicField;
    cdsDocumentosVendasMOV_DOC_PROCURACAO: TGraphicField;
    cdsDocumentosVendasMOV_DOC_CARTA: TGraphicField;
    dstDocumentosVendasMOV_NRCUPOM: TIntegerField;
    cdsDocumentosVendasMOV_NRCUPOM: TIntegerField;
    dstCliente: TSQLDataSet;
    dspCliente: TDataSetProvider;
    dstClientePAC_CPF: TStringField;
    dstClientePAC_NOME: TStringField;
    dstClientePAC_IMG_IDENTIDADE: TGraphicField;
    cdsCliente: TClientDataSet;
    cdsClientePAC_CPF: TStringField;
    cdsClientePAC_NOME: TStringField;
    cdsClientePAC_IMG_IDENTIDADE: TGraphicField;
    procedure dspConfigGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspMedicosGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure dspPacientesGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspVendasGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspProdutosVendasGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure dspCancelamentoGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure cdsDadosCalcFields(DataSet: TDataSet);
    procedure dspUsuariosGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspImpressoraGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdsConsultaVendasCalcFields(DataSet: TDataSet);
    procedure dspProdutosGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspCadProdutosGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure sqlConnGerenciadorBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    Transc : TTransactionDesc;
    procedure Start;
    procedure Comit(aTransc : TTransactionDesc);
    procedure Rollback;
    function PROCURAR_PRODUTO(M_CDPROD : String) : boolean;
    function PROCURAR_PRODUTO2(M_CDPROD : String) : boolean;
    function GetCodigoProduto(M_CDPROD : String) : boolean;
    function NOME_PRODUTO(M_CDPROD : String) : String;
    function VALOR_PRODUTO(M_CDPROD : String) : Double;
    Procedure Parametros;
    Function GetCPFCliente(aCPF : String) : Boolean;
    Function GetCPFVendedor(aCPF : String) : Boolean;
    Function GetNomeCliente(aCPF : String) : String;
    function GetNomeProduto(aCodigoBarras : String) : String;
    Function GetCRMMedico(aCRM : String) : Boolean;
    Function AddMedico(aCRM, aNome : String) : Boolean;
    Function AddPaciente(aCPF, aNomeCliente : String) : Boolean;
    Function GerardnaEstacao(aCPF, aCNPJ, aCRM,
            aUFCRM, aDataReceita : String): Boolean;
    function ExecutaDna(const CmdLine: string;const WindowState: Word): boolean;
    Procedure Hambiente();
    Function GetNomeVendedor(aNome : String) : Boolean;
    Function GetCodigoVendedorporNome(aNome : String) : Integer;
    Function GetCodVendedorVenda(iVenda : Integer): Integer;
    Function VALOR_PAGAR_MS(iVenda : Integer; aCDSItens : TClientDataSet) : Double;
    Function GetQuantidadeApresentacao(aProduto : String): Double;
    Function GetQuantidadeApresentacaoNew(aProduto : String): Double;
    Function AtualizarDescricaoProduto(iVenda : Integer; aProdutoBarras : String): Boolean;
    Procedure VerificarDescricaoVazia(iVenda : Integer; aCDSItens : TClientDataSet);
    Function GravarVendaXML(iVenda : Integer; aCDSItens : TClientDataSet;
          aCPF, aNoPaciente, aCRM, aCupom, aNumAutorizacao, aHora, aSituacao : String;
          aDataMov : TDateTime; fTotal, fValorMS, fValorPaciente : Double; iVendedor, iUsuario : Integer;
          aTextoCupom, aCupomVinculado : String): Boolean;
    Function AddPreSolicitacao(aCupom, aCPF, aCRM, aCRMUF, aHora : String;
                idVendedor: Integer; aCdsItens : TClientDataSet; aDtMovi : TDatetime): Boolean;
    Function AtualizarPreSolicitacao(aCupom, aHora : String; aDataMov : TDatetime): Boolean;
    Function AdicionarVenda(aCPFPACIENTE, aNOMEPESSOA, aCRM_MEDICO, aHOVENDA, aAUTORIZACAO, aFLSITU : String;
            aDTEMISSAO, aDTVENDA : TDatetime; iNRCUPOM, iCDUSUARIO, iCODVENDEDOR : INTEGER;
            fVALOR, fVLPAGO, fVLDEBITO : Double; aCDSItens : TClientDataSet): Integer;
    Function GetVerificaVendaAutorizacao(aNumAutorizacao : String): Boolean;
    Function SetAtualizaConfirmaPreSolicitacao(aAutorizacao : String): Boolean;
    Function EstornarVenda(iNumVenda : Integer; aNumAutorizacao : String): Boolean;
    Function ExcluirVenda(iNumVenda : Integer): Boolean;
    Function VerificarDocumentosVenda(idVenda: Integer): Boolean;
    Function AbrirVendaCliente(aCPF, aCodVenda : String; aDataIni, aDataFim : TDatetime): Boolean;
    Function GravarDocumentoIdentidadeBanco(aCPF : String; objImage : TImage): Boolean;
    { Public declarations }
  end;

var
  dmGerenciador: TdmGerenciador;


implementation

uses IniFiles, uFuncoes, uInfoPrincipal, ServicoSolicitacaoWS2;

{$R *.dfm}

procedure TdmGerenciador.dspConfigGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'CONFIGURACAO';
end;

procedure TdmGerenciador.dspMedicosGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'MEDICOS';
end;

procedure TdmGerenciador.dspPacientesGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'PACIENTES';
end;

procedure TdmGerenciador.dspVendasGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'VENDAS';
end;

procedure TdmGerenciador.dspProdutosVendasGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'PRODUTOS_VENDAS';
end;

procedure TdmGerenciador.dspCancelamentoGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'CANCELAMENTOS';
end;

function TdmGerenciador.PROCURAR_PRODUTO(M_CDPROD: String): boolean;
begin
     With dmGerenciador.qryProdutos do
     Begin
          Close;
          ParamByName('pBARRAS').AsString := M_CDPROD;
          Open;
     End;
     //
     If (dmGerenciador.qryProdutos.RecordCount = 0) Then
         result := False
     Else
         result := True;
end;

procedure TdmGerenciador.cdsDadosCalcFields(DataSet: TDataSet);
Var
    fValorUnitario : Double;
    fQuantApresentacao, fQuant : Double;
begin
     fQuantApresentacao := GetQuantidadeApresentacaoNew(cdsDadosPRO_CDBARR.AsString);
     fValorUnitario     := cdsDadosPRO_VLVEND.AsCurrency;
     //
     fQuant        := uFuncoes.Arredondar(cdsDadosPRO_QTPROD.AsFloat / fQuantApresentacao,2);
     cdsDadosPRO_SUBTOTAL.AsCurrency := fValorUnitario * fQuant;
     {    cdsDadosPRO_VLVEND.AsCurrency*
         cdsDadosPRO_QTPROD.AsCurrency;}
end;

procedure TdmGerenciador.dspUsuariosGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'USUARIOS';
end;

procedure TdmGerenciador.dspImpressoraGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'IMPRESSORA';
end;

procedure TdmGerenciador.Parametros;
begin
     cdsConfig.Close;
     cdsConfig.Open;
end;

procedure TdmGerenciador.DataModuleCreate(Sender: TObject);
Var
   CAMINHO, IP : String;
   Dir1, Dir2 : string;
begin
     //
     try
      {SQLMonitor1.FileName := ExtractFilePath( Application.ExeName )+'log.txt';
      SQLMonitor1.Active := True;}
      {With sqlConnGerenciador do
      begin
        if Connected then
          begin
               CloseDataSets;
               Connected := False;
          end;
        //
        IP := '';
        {// Se existi o arquivo com o IP do servidor
        If (fileexists(ExtractFilePath( Application.ExeName )+'ipservidor.txt')) then
           CAMINHO := uFuncoes.percorreArquivoTexto(ExtractFilePath( Application.ExeName )+'ipservidor.txt')
        Else
           CAMINHO := 'C:\INFOG2\VendaEletronica\INFOGERENCIADOR.FDB';}

        {If (fileexists(ExtractFilePath( Application.ExeName )+'ipservidor.txt')) then
        begin
            IP := uFuncoes.percorreArquivoTexto(ExtractFilePath( Application.ExeName )+'ipservidor.txt');
            CAMINHO := IP+':C:\INFOG2\VendaEletronica\INFOGERENCIADOR.FDB';
        End    
        Else
            CAMINHO := 'C:\INFOG2\VendaEletronica\INFOGERENCIADOR.FDB';
        //
        ConnectionName := 'Gerenciador';
        DriverName := 'Interbase';
        GetDriverFunc := 'getSQLDriverINTERBASE';
        Params.Clear;
        Params.Add('DriverName=Interbase');
        Params.Add('Database='+CAMINHO);
        Params.Add('RoleName=RoleName');
        Params.Add('User_Name=SYSDBA');
        Params.Add('Password=masterkey');
        Params.Add('ServerCharSet=WIN1252');
        Params.Add('SQLDialect=3');
        Params.Add('BlobSize=-1');
        Params.Add('CommitRetain=False');
        Params.Add('WaitOnLocks=True');
        Params.Add('ErrorResourceFile=');
        Params.Add('LocaleCode=0000');
        Params.Add('Interbase TransIsolation=ReadCommited');
        Params.Add('Trim Char=False');
        VendorLib := 'C:\Arquivos de programas\Firebird\Firebird_1_5\bin\fbclient.dll';
        //
        Connected := True;
       End;           }
       //
       Dir1 := 'C:\INFOG2\FARMA\POP_REQ';
       If not DirectoryExists(Dir1) then
          ForceDirectories(Dir1);
       Dir2 := 'C:\INFOG2\FARMA\POP_RESP';
       If not DirectoryExists(Dir2) then
          ForceDirectories(Dir2);
       { se o alias não existir... }
       if not Session.IsAlias('GERENCIADOR') then
         begin
              // Adiciona o alias
              Session.AddStandardAlias('GERENCIADOR', ExtractFilePath( Application.ExeName ), 'PARADOX');
              // Salva o arquivo de configuração do BDE
              Session.SaveConfigFile;
          end;
        //
        sqlConnGerenciador.Connected := false;
        sqlConnGerenciador.Connected := True;

        ufuncoes.aCorGridZebrado := stringtoColor('$00FFCA95');

        Parametros;
        If (cdsConfig.FieldByName('CFG_FLPRODUCAO').AsString = 'P') Then
           HTTPRIO1.WSDLLocation := 'https://200.214.130.55:9443/farmaciapopular/services/ServicoSolicitacaoWS?wsdl'
        Else
           HTTPRIO1.WSDLLocation := 'https://200.214.130.41:9443/farmaciahomologa/services/ServicoSolicitacaoWS?wsdl';
     Except
          on e: exception do
          begin
              ShowMessage('Erro na abertura do sistema! Erro:' + e.message);
              sqlConnGerenciador.Connected := false;
              Application.Terminate;
          End;
     End;
end;

procedure TdmGerenciador.DataModuleDestroy(Sender: TObject);
begin
      SQLMonitor1.Active := False;
      sqlConnGerenciador.Close;
end;

procedure TdmGerenciador.cdsConsultaVendasCalcFields(DataSet: TDataSet);
begin
    If (cdsConsultaVendas.State = dsInternalCalc) Then
     begin
        If (cdsConsultaVendas.FieldByName('MOV_FLSITU').AsString = 'F') Then
           cdsConsultaVendas.FieldByName('MOV_SITUACAO').AsString := 'FECHADA'
        Else
           cdsConsultaVendas.FieldByName('MOV_SITUACAO').AsString := 'CANCELADA';
        //
        cdsConsultaVendas.FieldByName('DIGITALIZACAO').AsBoolean :=
              VerificarDocumentosVenda(cdsConsultaVendas.FieldByName('MOV_CODSOLICITACAO').AsInteger);
     End;
end;

function TdmGerenciador.PROCURAR_PRODUTO2(M_CDPROD: String): boolean;
begin
     With qryLocProdutos do
     Begin
          Close;
          ParamByName('pCODIGO').AsString := M_CDPROD;
          Open;
     End;
     //
     If (qryLocProdutos.IsEmpty) Then
         result := False
     Else
         result := True;
end;

procedure TdmGerenciador.dspProdutosGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
      TableName := 'PRODUTOS';
end;

procedure TdmGerenciador.dspCadProdutosGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'PRODUTOS';
end;

function TdmGerenciador.NOME_PRODUTO(M_CDPROD: String): String;
begin
     With qryNomeProduto do
     Begin
          Close;
          ParamByName('pCODIGO').AsString := M_CDPROD;
          Open;
     End;
     //
     If not (qryNomeProduto.IsEmpty) Then
          result := qryNomeProduto.FieldByName('PRO_MEDICAMENTO').AsString;
end;

function TdmGerenciador.VALOR_PRODUTO(M_CDPROD: String): Double;
begin
     With qryNomeProduto do
     Begin
          Close;
          ParamByName('pCODIGO').AsString := M_CDPROD;
          Open;
     End;
     //
     If not (qryNomeProduto.IsEmpty) Then
         result := qryNomeProduto.FieldByName('PRO_VALORVENDA').AsCurrency;
end;

procedure TdmGerenciador.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
var
  NomeDoLog: string;
  Arquivo: TextFile;
begin
  NomeDoLog := ChangeFileExt(Application.Exename, '.log');
  AssignFile(Arquivo, NomeDoLog);
  if FileExists(NomeDoLog) then
    Append(arquivo) { se existir, apenas adiciona linhas }
  else
    ReWrite(arquivo); { cria um novo se não existir }
  try
    WriteLn(arquivo, DateTimeToStr(Now) + ':' + E.Message);
    WriteLn(arquivo, '----------------------------------------------------------------------');
    Application.ShowException(E);
  finally
    CloseFile(arquivo)
  end;
end;

procedure TdmGerenciador.sqlConnGerenciadorBeforeConnect(Sender: TObject);
Var 
	ConfigIni : TIniFile;
	Path, aFile : String;
Begin
  try
      aFile := ExtractFilePath(ParamStr(0)) + 'fbclient.dll';
      sqlConnGerenciador.VendorLib := aFile;
    	ConfigIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini');
    	sqlConnGerenciador.Params.Values['Database'] := ConfigIni.ReadString('CONFIG','DATABASE','');
      //
      {if not FileExists(sqlConnGerenciador.Params.Values['Database']) Then
           Application.MessageBox(PChar('Arquivo de banco de dados não encontrado!!!'),
                         'Atenção', MB_OK+MB_ICONSTOP+MB_APPLMODAL);    }
  Finally
    	ConfigIni.Free;
  End;
end;

function TdmGerenciador.GetCPFCliente(aCPF: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  Result := False;
  texto := 'Select PAC_CPF, PAC_NOME from PACIENTES Where (PAC_CPF = :pCPF)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmGerenciador.sqlConnGerenciador;
      sql.Add(texto);
      Params.ParamByName('pCPF').AsString  := aCPF;
      open;
      If Not (IsEmpty) Then
        result := True;
    finally
      free;
    end;
end;

function TdmGerenciador.GetNomeCliente(aCPF: String): String;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select PAC_CPF, PAC_NOME from PACIENTES Where (PAC_CPF = :pCPF)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmGerenciador.sqlConnGerenciador;
      sql.Add(texto);
      Params.ParamByName('pCPF').AsString  := aCPF;
      open;
      If Not (IsEmpty) Then
        result := fieldByName('PAC_NOME').AsString
      Else
        result := ' ';
    finally
      free;
    end;
end;

function TdmGerenciador.GetCodigoProduto(M_CDPROD: String): boolean;
var qraux : TSQLquery;
    texto : string;
begin
  Result := False;
  texto := 'Select * from PRODUTOS Where (PRO_BARRAS = :pCODIGO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmGerenciador.sqlConnGerenciador;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsString  := M_CDPROD;
      open;
      If Not (IsEmpty) Then
        result := True;
    finally
      free;
    end;
end;

function TdmGerenciador.GetNomeProduto(aCodigoBarras: String): String;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select * from PRODUTOS Where (PRO_BARRAS = :pCODIGO)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmGerenciador.sqlConnGerenciador;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsString  := aCodigoBarras;
      open;
      If Not (IsEmpty) Then
        result := FieldByName('PRO_MEDICAMENTO').AsString;
    finally
      free;
    end;
end;

function TdmGerenciador.AddMedico(aCRM, aNome: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Insert Into MEDICOS (MED_CRM, MED_NOME) VALUES (:pCRM, :pNOME)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmGerenciador.sqlConnGerenciador;
      sql.Add(texto);
      Params.ParamByName('pCRM').AsString  := aCRM;
      Params.ParamByName('pNOME').AsString := aNome;
      ExecSQL();
      result := True;
    finally
      free;
    end;
end;

function TdmGerenciador.GetCRMMedico(aCRM: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Select MED_CRM from MEDICOS Where (MED_CRM = :pCRM)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmGerenciador.sqlConnGerenciador;
      sql.Add(texto);
      Params.ParamByName('pCRM').AsString := aCRM;
      Open;
      if not (IsEmpty) Then
         result := True;
    finally
      free;
    end;
end;

function TdmGerenciador.AddPaciente(aCPF, aNomeCliente: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  result := False;
  texto := 'Insert Into PACIENTES (PAC_CPF, PAC_NOME) VALUES (:pCPF, :pNOME)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmGerenciador.sqlConnGerenciador;
      sql.Add(texto);
      Params.ParamByName('pCPF').AsString  := aCPF;
      Params.ParamByName('pNOME').AsString := aNomeCliente;
      ExecSQL();
      result := True;
    finally
      free;
    end;
end;

function TdmGerenciador.GerardnaEstacao(aCPF, aCNPJ, aCRM, aUFCRM,
  aDataReceita: String): Boolean;
Var
  aEspaco : String;
begin
     Result := false;
     aEspaco := ' ';
     try
         if (FileExists('DNA.TXT')) Then
             DeleteFile('DNA.TXT');
         winexec(PChar('gbasmsb.exe --solicitacao '+aCPF+ aEspaco + aCNPJ +aEspaco
            +aCRM+ aEspaco + aUFCRM + aEspaco + aDataReceita +' > DNA.TXT'),0);
         Result := true;
     Except

     End;    
end;

function TdmGerenciador.ExecutaDna(const CmdLine: string;
  const WindowState: Word): boolean;
var
   SUInfo: TStartupInfo;
   ProcInfo: TProcessInformation;
begin
   FillChar(SUInfo, SizeOf(SUInfo), #0);
   with SUInfo do
   begin
      cb := SizeOf(SUInfo);
      dwFlags := STARTF_USESHOWWINDOW;
      wShowWindow := WindowState;
   end;
   Result := CreateProcess(nil, PChar(CmdLine), nil, nil, false,
             CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
             Nil, SUInfo, ProcInfo);
   { Aguarda até ser finalizado }
   if Result then
   begin
      If FileExists('c:\windows\system32\ftp.exe') Then // gambiarra pra saber se é windows 98
         WaitForSingleObject(ProcInfo.hProcess, INFINITE);
      { Libera os Handles }
      CloseHandle(ProcInfo.hProcess);
      CloseHandle(ProcInfo.hThread);
   end;
end;

procedure TdmGerenciador.Hambiente;
begin
     RefreshCDS(cdsConfig);
     If (cdsConfig.FieldByName('CFG_FLPRODUCAO').AsString = 'P') Then
         HTTPRIO1.WSDLLocation := 'https://200.214.130.55:9443/farmaciapopular/services/ServicoSolicitacaoWS?wsdl'
     Else
         HTTPRIO1.WSDLLocation := 'https://200.214.130.41:9443/farmaciahomologa/services/ServicoSolicitacaoWS?wsdl';

end;

function TdmGerenciador.GetCPFVendedor(aCPF: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  Result := False;
  texto := 'Select VEN_CODIGO, VEN_CPF from VENDEDORES Where (VEN_CPF = :pCPF)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmGerenciador.sqlConnGerenciador;
      sql.Add(texto);
      Params.ParamByName('pCPF').AsString  := aCPF;
      open;
      If Not (IsEmpty) Then
        result := True;
    finally
      free;
    end;
end;

function TdmGerenciador.GetNomeVendedor(aNome: String): Boolean;
var qraux : TSQLquery;
    texto : string;
begin
  Result := False;
  texto := 'Select VEN_CODIGO, VEN_NOME from VENDEDORES Where (VEN_NOME = :pNome)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmGerenciador.sqlConnGerenciador;
      sql.Add(texto);
      Params.ParamByName('pNome').AsString  := aNome;
      open;
      If Not (IsEmpty) Then
         result := True;
    finally
      free;
    end;
end;

function TdmGerenciador.GetCodigoVendedorporNome(aNome: String): Integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select VEN_CODIGO, VEN_NOME from VENDEDORES Where (VEN_NOME = :pNome)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmGerenciador.sqlConnGerenciador;
      sql.Add(texto);
      Params.ParamByName('pNome').AsString  := aNome;
      open;
      If Not (IsEmpty) Then
         result := fieldByName('VEN_CODIGO').AsInteger;
    finally
      free;
    end;
end;

function TdmGerenciador.GetCodVendedorVenda(iVenda: Integer): Integer;
var qraux : TSQLquery;
    texto : string;
begin
  Result := 0;
  texto := 'Select MOV_CODSOLICITACAO, MOV_CODVENDEDOR from VENDAS Where (MOV_CODSOLICITACAO = :pVENDA)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmGerenciador.sqlConnGerenciador;
      sql.Add(texto);
      Params.ParamByName('pVENDA').AsInteger  := iVenda;
      open;
      If Not (IsEmpty) Then
        If not uFuncoes.Empty(fieldByName('MOV_CODVENDEDOR').AsString) Then
            result := fieldByName('MOV_CODVENDEDOR').AsInteger;
    finally
      free;
    end;
end;

function TdmGerenciador.VALOR_PAGAR_MS(iVenda: Integer;
  aCDSItens: TClientDataSet): Double;
Var
    M_VLPAGA : Double;
begin
     M_VLPAGA := 0;
     With aCDSItens do
     begin
          DisableControls;
          Close;
          Params[0].AsInteger := iVenda;
          Open;
          //
          If not (IsEmpty) Then
          begin
               First;
               While not (Eof) do
               begin
                    M_VLPAGA := M_VLPAGA + fieldbyName('PRO_VLPRECO_SUBSIDIADO').AsCurrency;
                    //
                    Next;
               End;
          End;
          EnableControls;
     End;
     //
     result := M_VLPAGA;
end;

function TdmGerenciador.GetQuantidadeApresentacao(
  aProduto: String): Double;
var qraux : TQuery;
    texto : string;
begin
  Result := 1;
  texto := 'Select PRO_CDBARR, PRO_NMPROD, PRO_VLVEND, PRO_QTARMA from "SACPRO.DBF" Where (PRO_CDBARR = :pBARRAS)';
  QrAux := TQuery.Create(nil);
  with QrAux do
    try
      DatabaseName := 'GERENCIADOR';
      sql.Add(texto);
      Params.ParamByName('pBARRAS').AsString := aProduto;
      open;
      If Not (IsEmpty) Then
        If not uFuncoes.Empty(fieldByName('PRO_QTARMA').AsString) Then
            result := fieldByName('PRO_QTARMA').AsFloat;
    finally
      free;
    end;
end;

function TdmGerenciador.GetQuantidadeApresentacaoNew(
  aProduto: String): Double;
var
    qraux : TSQLquery;
    texto : string;
begin
  Result := 1;
  texto := 'Select PRO_BARRAS, PRO_QUANTIDADE from PRODUTOS Where (PRO_BARRAS = :pBARRAS)';
  QrAux := TSQLquery.Create(nil);
  with QrAux do
    try
      SQLConnection := sqlConnGerenciador;
      sql.Add(texto);
      Params.ParamByName('pBARRAS').AsString := aProduto;
      open;
      If Not (IsEmpty) Then
        If not uFuncoes.Empty(fieldByName('PRO_QUANTIDADE').AsString)
          and (fieldByName('PRO_QUANTIDADE').AsFloat > 0 ) Then
             result := fieldByName('PRO_QUANTIDADE').AsFloat;
    finally
      free;
    end;
end;

function TdmGerenciador.AtualizarDescricaoProduto( iVenda : Integer;
  aProdutoBarras: String): Boolean;
var qraux : TQuery;
    texto, aDescricao : string;
begin
  Result := false;
  texto := 'Select PRO_CDBARR, PRO_NMPROD from "SACPRO.DBF" Where (PRO_CDBARR = :pBARRAS)';
  QrAux := TQuery.Create(nil);
  with QrAux do
    try
      DatabaseName := 'GERENCIADOR';
      sql.Add(texto);
      Params.ParamByName('pBARRAS').AsString := aProdutoBarras;
      open;
      If Not (IsEmpty) Then
       begin
            aDescricao := FieldByName('PRO_NMPROD').AsString;
            //
            cdsAtualizaDescProd.Close;
            cdsAtualizaDescProd.Params[0].AsInteger := iVenda;
            cdsAtualizaDescProd.Params[1].AsString  := aProdutoBarras;
            cdsAtualizaDescProd.Open;
            //
            if not (cdsAtualizaDescProd.IsEmpty) Then
            begin
                 With cdsAtualizaDescProd do
                 begin
                      Edit;
                      FieldByName('PRV_NOMEAPRESENTACAO').AsString := aDescricao;
                      ApplyUpdates(0);
                      Close;
                 End;
                 //
                 result := true;
            End;
       End;
    finally
      free;
    end;
end;

procedure TdmGerenciador.VerificarDescricaoVazia(iVenda: Integer;
  aCDSItens: TClientDataSet);
Var
   aProdutoBarras : String;
begin
     With aCDSItens do
       begin
            DisableControls;
            Close;
            Params[0].AsInteger := iVenda;
            Open;
            //
            if not (IsEmpty) Then
            begin
                 First;
                 While not (Eof) do
                 begin
                      if uFuncoes.Empty(FieldByName('PRV_NOMEAPRESENTACAO').AsString) Then
                      begin
                           aProdutoBarras := FieldByName('PRV_CODBARRAS').AsString;
                           AtualizarDescricaoProduto(iVenda, aProdutoBarras);
                      End;
                      //
                      Next;
                 End;
            End;
            //
            EnableControls;
       End;
end;

function TdmGerenciador.GravarVendaXML(iVenda: Integer; aCDSItens: TClientDataSet;
          aCPF, aNoPaciente, aCRM, aCupom, aNumAutorizacao, aHora, aSituacao : String;
          aDataMov : TDateTime; fTotal, fValorMS, fValorPaciente : Double; iVendedor, iUsuario : Integer;
          aTextoCupom, aCupomVinculado : String): Boolean;
Var
   aNrVenda, Dir , aNomeArquivo : String;
   iItem : Integer;
begin
     Result := False;
     aNrVenda := uFuncoes.StrZero(InttoStr(iVenda),7)+'.xml';
     Dir := ExtractFilePath( Application.ExeName )+'XML';
     if not DirectoryExists(Dir) then
        ForceDirectories(Dir);
     //
     aNomeArquivo := Dir+'\'+aNrVenda;
     try
            iItem := 1;
            RefreshCDS(cdsVendaXML);
            With cdsVendaXML do
            begin
                 aCDSItens.First;
                 While not (aCDSItens.Eof) do
                 begin
                      //
                      Append;
                      FieldByName('CDS_VENDA').AsInteger      := iVenda;
                      FieldByName('CDS_CPFPACIENTE').AsString := uFuncoes.RemoveChar(aCPF);
                      FieldByName('CDS_CRM_MEDICO').AsString  := aCRM;
                      FieldByName('CDS_DTEMISSAO').AsDateTime := aDataMov;
                      FieldByName('CDS_NRCUPOM').AsString     := aCupom;
                      FieldByName('CDS_VLPAGO_MS').AsFloat    := fValorMS;
                      FieldByName('CDS_VLPAGO_CLIENTE').AsFloat := aCDSItens.fieldByName('PRO_VLPRECO_SUBPACIENTE').AsFloat;
                      FieldByName('CDS_VALOR_TOTAL').AsFloat  := fValorMS + aCDSItens.fieldByName('PRO_VLPRECO_SUBPACIENTE').AsFloat;
                      FieldByName('CDS_NOMEPESSOA').AsString  := aNoPaciente;
                      FieldByName('CDS_DTVENDA').AsDateTime   := aDataMov;
                      FieldByName('CDS_HOVENDA').AsString     := aHora;
                      FieldByName('CDS_AUTORIZACAO').AsString := aNumAutorizacao;
                      FieldByName('CDS_FLSITU').AsString      := aSituacao;
                      FieldByName('CDS_CDUSUARIO').AsInteger  := iUsuario;
                      FieldByName('CDS_CODVENDEDOR').AsInteger := iVendedor;
                      FieldByName('CDS_TEXTO_CUPOM').Value    := aTextoCupom;
                      FieldByName('CDS_CUPOM_VINCULADO').Value := aCupomVinculado;
                      // Informações do item
                      FieldByName('CDS_ITEM_NRITEM').AsInteger     := iItem;
                      FieldByName('CDS_ITEM_CODBARRAS').AsString   := aCDSItens.fieldByName('PRO_CDBARR').AsString;
                      FieldByName('CDS_ITEM_NOMEPRODUTO').AsString := aCDSItens.fieldByName('PRO_NMPROD').AsString;
                      FieldByName('CDS_ITEM_VLVENDA').AsFloat      := aCDSItens.fieldByName('PRO_VLVEND').AsFloat;
                      FieldByName('CDS_ITEM_QTPRESCRITA').AsFloat  :=  aCDSItens.fieldByName('PRO_QTPRES').AsFloat;
                      FieldByName('CDS_ITEM_QTSOLICITADA').AsFloat := aCDSItens.fieldByName('PRO_QTPROD').AsFloat;
                      FieldByName('CDS_ITEM_QT_AUTORIZADA').AsFloat := aCDSItens.fieldByName('PRO_QTAUTORIZADA').AsFloat;
                      //FieldByName('CDS_ITEM_TOTAL').AsFloat := aCDSItens.fieldByName('PRO_TOTVENDA').AsFloat;
                      FieldByName('CDS_ITEM_PGMS').AsFloat         := aCDSItens.fieldByName('PRO_VLPRECO_SUBSIDIADO').AsFloat;
                      FieldByName('CDS_ITEM_PGCLIENTE').AsFloat    := aCDSItens.fieldByName('PRO_VLPRECO_SUBPACIENTE').AsFloat;
                      FieldByName('CDS_ITEM_TOTAL').AsFloat        := FieldByName('CDS_ITEM_PGMS').AsFloat + FieldByName('CDS_ITEM_PGCLIENTE').AsFloat;
                      //FieldByName('CDS_ITEM_AUTORMEDICAMENTO').AsString := aNumAutorizacao;
                      //
                      Post;
                      //
                      iItem := iItem + 1;
                      aCDSItens.Next;
                 End;
                 SaveToFile(aNomeArquivo, dfXML);
                 //
                 Result := True;
                 //
                 Close;
            End;
     Except

     End;
end;

function TdmGerenciador.AddPreSolicitacao(aCupom, aCPF, aCRM,
  aCRMUF, aHora : String; idVendedor: Integer; aCdsItens: TClientDataSet; aDtMovi : TDatetime): Boolean;
Var
    TD : TTransactionDesc;
begin
     Result := False;
     try
          With cdsPreSolicitiacao do
          begin
               Close;
               Params[0].AsString := aCupom;
               Open;
               //
             TD.TransactionID  := StrtoInt(uInfoPrincipal.M_CDUSUA);
             TD.IsolationLevel := xilREADCOMMITTED;
             sqlConnGerenciador.StartTransaction(TD);
             //
             Try
               aCdsItens.First;
               While not (aCdsItens.Eof) do
               begin
                    Append;
                    FieldByName('PRE_AUTORIZACAO').AsString := aCdsItens.FieldByName('PRO_AUTORMEDICAMENTO').AsString; // aAutorizacao;
                    FieldByName('PRE_CUPOMFISCAL').AsString := aCupom;
                    FieldByName('PRE_CPFPACIENTE').AsString := aCPF;
                    FieldByName('PRE_CRM').AsString         := aCRM;
                    FieldByName('PRE_CRM_UF').AsString      := aCRMUF;
                    FieldByName('PRE_DTMOVIMENTO').AsDateTime := aDtMovi;
                    FieldByName('PRE_HOMOVIMENTO').AsString   := aHora;
                    FieldByName('PRE_CODIGOBARRAS').AsString  := aCdsItens.FieldByName('PRO_CDBARR').AsString;
                    FieldByName('PRE_NOME_MEDICAMENTO').AsString := aCdsItens.FieldByName('PRO_NMPROD').AsString;
                    FieldByName('PRE_QTSOLICITADA').AsFloat   := aCdsItens.FieldByName('PRO_QTPROD').AsFloat;
                    FieldByName('PRE_QTPREESCRITA').AsFloat   := aCdsItens.FieldByName('PRO_QTPRES').AsFloat;
                    FieldByName('PRE_QTAUTORIZADA').asfloat   := aCdsItens.FieldByName('PRO_QTAUTORIZADA').AsFloat;
                    FieldByName('PRE_VALOR_VENDA').AsFloat    := aCdsItens.FieldByName('PRO_VLPRECO_VENDA').AsFloat;
                    FieldByName('PRE_PARCELA_MS').AsFloat     := aCdsItens.FieldByName('PRO_VLPRECO_SUBSIDIADO').AsFloat;
                    FieldByName('PRE_PARCELA_CLIENTE').AsFloat := aCdsItens.FieldByName('PRO_PARCELAPACIENTE').AsFloat;
                    // aCdsItens.FieldByName('PRO_VLPRECO_SUBPACIENTE').AsFloat;
                    FieldByName('PRE_VENDEDOR').AsInteger     := idVendedor;
                    FieldByName('PRE_STATUS').AsString        := aCdsItens.FieldByName('PRO_RETORNO').AsString;
                    FieldByName('PRE_MOTIVO').AsString        := aCdsItens.FieldByName('PRO_MENSAGEM').AsString;
                    //
                    Post;
                    //
                    aCdsItens.Next;
               End;      // fim-do-enquanto aCdsItens
               //
               cdsPreSolicitiacao.ApplyUpdates(0);
               //
               sqlConnGerenciador.Commit(TD);
               //
               Result := True;
             Except
                 on e: exception do
                 begin
                     ShowMessage('Erro ao tentar incluir pre-solicitação:' + e.message);
                     sqlConnGerenciador.Rollback(TD);
                 End;
             End;
          End;         // With-cdsPreSolicitiacao
     Except
          on e: exception do
          begin
              ShowMessage('Erro ao tentar incluir pre-solicitação:' + e.message);
          End;
     End;
end;

procedure TdmGerenciador.Comit(aTransc: TTransactionDesc);
begin
     sqlConnGerenciador.Commit(aTransc);
end;

procedure TdmGerenciador.Rollback;
begin
     sqlConnGerenciador.Rollback(Transc);
     raise Exception.Create(uFuncoes.MSG_ERROR);
end;

procedure TdmGerenciador.Start;
begin
     Transc.IsolationLevel := xilREADCOMMITTED;
     Transc.TransactionID  := StrToInt(IDTransation);
     sqlConnGerenciador.StartTransaction(Transc);
end;

function TdmGerenciador.AtualizarPreSolicitacao(aCupom, aHora: String;
  aDataMov: TDatetime): Boolean;
var
    qraux : TSQLquery;
    texto : string;
begin
  Result := False;
  texto := 'Update PRESOLICITACAO set PRE_CONFIRMADA = '+QuotedStr('S')+' Where (PRE_CUPOMFISCAL = :pCUPOM) ';
  texto := texto + ' AND (PRE_DTMOVIMENTO = :pDTMOVI) AND (PRE_HOMOVIMENTO = :pHOMOVI)';
  //
  QrAux := TSQLquery.Create(nil);
  with QrAux do
    try
      Start;
      Try
         SQLConnection := sqlConnGerenciador;
         sql.Add(texto);
         Params.ParamByName('pCUPOM').AsString := aCupom;
         Params.ParamByName('pDTMOVI').AsDate  := aDataMov;
         Params.ParamByName('pHOMOVI').AsString := aHora;
         ExecSQL();
         //
         Comit(Transc);
         result := True;
      Except
          Rollback;
      End;
    finally
      free;
    end;
end;

function TdmGerenciador.AdicionarVenda(aCPFPACIENTE, aNOMEPESSOA,
  aCRM_MEDICO, aHOVENDA, aAUTORIZACAO, aFLSITU: String; aDTEMISSAO,
  aDTVENDA: TDatetime; iNRCUPOM, iCDUSUARIO, iCODVENDEDOR: INTEGER; fVALOR,
  fVLPAGO, fVLDEBITO: Double; aCDSItens: TClientDataSet): Integer;
Var
    qraux, qrauxItens : TSQLquery;
    texto, aSQLtexto : string;
    idVenda, iItem : Integer;
begin
     Result := 0;
     //
     texto := 'Insert into VENDAS (MOV_CODSOLICITACAO, MOV_CPFPACIENTE, MOV_CRM_MEDICO, MOV_DTEMISSAO, MOV_NRCUPOM, MOV_VALOR, MOV_VLPAGO, ';
     texto := texto + ' MOV_VLDEBITO, MOV_NOMEPESSOA, MOV_DTVENDA, MOV_HOVENDA, MOV_AUTORIZACAO, MOV_FLSITU, MOV_CDUSUARIO, MOV_CODVENDEDOR) ';
     texto := texto + ' Values (:pCODSOLICITACAO, :pCPFPACIENTE, :pCRM_MEDICO, :pDTEMISSAO, :pNRCUPOM, :pVALOR, :pVLPAGO,  ';
     texto := texto + ' :pVLDEBITO, :pNOMEPESSOA, :pDTVENDA, :pHOVENDA, :pAUTORIZACAO, :pFLSITU, :pCDUSUARIO, :pCODVENDEDOR) ';
     //
     Try
         Start;
         QrAux := TSQLquery.Create(nil);
         with QrAux do
         Try
            cdsConfig.edit;
            cdsConfigCFG_SEQUENCIA.AsInteger := cdsConfigCFG_SEQUENCIA.AsInteger + 1;
            cdsConfig.post;
            //
            idVenda := cdsConfigCFG_SEQUENCIA.AsInteger;
            //
            SQLConnection := sqlConnGerenciador;
            sql.Add(texto);
            Params.ParamByName('pCODSOLICITACAO').AsInteger := idVenda;
            Params.ParamByName('pCPFPACIENTE').AsString     := aCPFPACIENTE;
            Params.ParamByName('pCRM_MEDICO').AsString      := aCRM_MEDICO;
            Params.ParamByName('pDTEMISSAO').AsDate         := aDTEMISSAO;
            Params.ParamByName('pNRCUPOM').AsInteger        := iNRCUPOM;
            Params.ParamByName('pVALOR').AsFloat            := fVALOR;
            Params.ParamByName('pVLPAGO').AsFloat           := fVLPAGO;
            Params.ParamByName('pVLDEBITO').AsFloat         := fVLDEBITO;
            Params.ParamByName('pNOMEPESSOA').AsString      := aNOMEPESSOA;
            Params.ParamByName('pDTVENDA').AsDate           := aDTVENDA;
            Params.ParamByName('pHOVENDA').AsString         := Copy(aHOVENDA,1,5);
            Params.ParamByName('pAUTORIZACAO').AsString     := aAUTORIZACAO;
            Params.ParamByName('pFLSITU').AsString          := aFLSITU;
            Params.ParamByName('pCDUSUARIO').AsInteger      := iCDUSUARIO;
            Params.ParamByName('pCODVENDEDOR').AsInteger    := iCODVENDEDOR;
            //
            ExecSQL();
            //
         Finally
            free;
         End;
         //     Itens da venda
         aCDSItens.First;
         aSQLtexto := 'Insert into PRODUTOS_VENDAS (PRV_CODSOLICITACAO, PRV_CODBARRAS, PRV_NRITEM, PRV_NOMEAPRESENTACAO, PRV_QUANTIDADE, PRV_VLVENDA, PRV_QUANTIDADE_PRESCRITA, PRV_QUANTIDADE_AUTORIZADA, ';
         aSQLtexto := aSQLtexto + 'PRV_VLPARCELA, PRV_STATUS, PRV_VLPRECO_SUBSIDIADO, PRV_VLPRECO_SUBPACIENTE) ';
         aSQLtexto := aSQLtexto + ' Values (:pCODSOLICITACAO, :pCODBARRAS, :pNRITEM, :pNOMEAPRESENTACAO, :pQUANTIDADE, :pVLVENDA, Null, :pQUANTIDADE_AUTORIZADA, ';
         aSQLtexto := aSQLtexto + ' :pVLPARCELA,  :pSTATUS, :pVLPRECO_SUBSIDIADO, :pVLPRECO_SUBPACIENTE) ';
         //
         iItem := 1;
         While not (aCDSItens.Eof) do
         begin
             QrauxItens := TSQLquery.Create(nil);
             with qrauxItens do
              Try
                   SQLConnection := sqlConnGerenciador;
                   sql.Add(aSQLtexto);
                   Params.ParamByName('pCODSOLICITACAO').AsInteger := idVenda;
                   Params.ParamByName('pCODBARRAS').AsString       := aCDSItens.FieldByName('PRE_CODIGOBARRAS').AsString;
                   Params.ParamByName('pNRITEM').AsInteger         := iItem;
                   Params.ParamByName('pNOMEAPRESENTACAO').AsString  := aCDSItens.FieldByName('PRE_NOME_MEDICAMENTO').AsString;
                   Params.ParamByName('pQUANTIDADE').AsFloat       := aCDSItens.FieldByName('PRE_QTSOLICITADA').AsFloat;
                   Params.ParamByName('pVLVENDA').AsFloat          := aCDSItens.FieldByName('PRE_VALOR_VENDA').AsFloat;
                   //Params.ParamByName('pQUANTIDADE_PRESCRITA').AsFloat           := fVLPAGO;
                   Params.ParamByName('pQUANTIDADE_AUTORIZADA').AsFloat := aCDSItens.FieldByName('PRE_QTAUTORIZADA').AsFloat;
                   Params.ParamByName('pVLPARCELA').AsFloat        := aCDSItens.FieldByName('PRE_PARCELA_MS').AsFloat;
                   Params.ParamByName('pSTATUS').AsString          := Copy(aCDSItens.FieldByName('PRE_MOTIVO').AsString,1,4);
                   Params.ParamByName('pVLPRECO_SUBSIDIADO').AsFloat  := aCDSItens.FieldByName('PRE_PARCELA_MS').AsFloat;
                   Params.ParamByName('pVLPRECO_SUBPACIENTE').AsFloat := aCDSItens.FieldByName('PRE_PARCELA_CLIENTE').AsFloat;
                   //
                   ExecSQL();
              Finally
                  free;
              End;
              //
             iItem := iItem + 1;
             aCDSItens.Next;
         End;
         //
         cdsConfig.ApplyUpdates(0);
         //
         Comit(Transc);
         //
         result := idVenda;
     Except
           Rollback;
     End;
end;

function TdmGerenciador.GetVerificaVendaAutorizacao(
  aNumAutorizacao: String): Boolean;
var
    qraux : TSQLquery;
    texto : string;
begin
  Result := False;
  texto := 'Select MOV_CODSOLICITACAO, MOV_AUTORIZACAO from VENDAS Where (MOV_AUTORIZACAO = :pAUTORIZACAO) ';
  texto := texto + ' ';
  //
  QrAux := TSQLquery.Create(nil);
  with QrAux do
      Try
         SQLConnection := sqlConnGerenciador;
         sql.Add(texto);
         Params.ParamByName('pAUTORIZACAO').AsString := aNumAutorizacao;
         Open;
         //
         if not (IsEmpty) Then
             result := True;
    finally
      free;
    end;
end;


function TdmGerenciador.EstornarVenda(iNumVenda: Integer; aNumAutorizacao : String): Boolean;
Var
    Service : ServicoSolicitacaoWS;
    ObjEstornar : EstornoDTO;
    ObjArrayMedicamento       : ArrayOfMedicamentoDTO;
    ObjConfirmacaoEstorno     : ConfirmacaoEstornoDTO;
    ObjAutorizacao            : AutorizacaoDTO;
    ObjConfirmaAutorizacao    : ConfirmacaoDTO;
    ObjUsuarioFarmacia        : UsuarioFarmaciaDTO;
    i : integer;
    TD : TTransactionDesc;
    ObjConfirmarRecebimento   : RecebimentoDTO;
    ObjRecebimento            : ConfirmacaoRecebimentoDTO;
    M_NRVEND, M_NRSOLI, M_NRERRO, M_MSERRO : String;
    Comando : String;
    TextoDna : TStringList;
    iCodVendedor : Integer;
    M_LOVEND, M_SEVEND, aMsgRetorno : String;
begin

    try
        // Screen.Cursor := crHourGlass;
        iCodVendedor := GetCodVendedorVenda(iNumVenda);
        uFuncoes.FilterCDS(cdsVendedores, fsInteger , InttoStr(iCodVendedor));
        //
        if not (cdsVendedores.IsEmpty) Then
        begin
            With cdsVendedores do
            begin
                 M_LOVEND := FieldByName('VEN_CPF').AsString;
                 M_SEVEND := FieldByName('VEN_SENHA').AsString;
            End;
        End
        Else
           raise Exception.Create('Erro ao tentar carregar dados do vendedor.');
        //
        try
             Parametros;
             //
             M_NRVEND := IntToStr(iNumVenda);
             M_NRSOLI := aNumAutorizacao;
             // Produto da Venda
             //dmGerenciador.cdsProdutosVendas.Close;
             With cdsProdutosVendas do
               begin
                    Close;
                    Params[0].AsInteger := iNumVenda;
                    Open;
               End;
              //
              Service := (dmGerenciador.HTTPRIO1 as ServicoSolicitacaoWS);
              i := 0;
              //
              cdsProdutosVendas.DisableControls;
              cdsProdutosVendas.First;
              While not (cdsProdutosVendas.Eof) do
                begin
                     SetLength(ObjArrayMedicamento,Length(ObjArrayMedicamento)+1);
                     ObjArrayMedicamento[i] := MedicamentoDTO.Create;
                     ObjArrayMedicamento[i].coCodigoBarra      := cdsProdutosVendas.FieldByName('PRV_CODBARRAS').AsString;                // Código de barras
                     ObjArrayMedicamento[i].qtDevolvida        := cdsProdutosVendas.FieldByName('PRV_QUANTIDADE_AUTORIZADA').AsFloat;     // Quantidade solicitada (em comprimidos)
                     // ObjArrayMedicamento[i].qtDevolvida        := cdsProdutosVendas.FieldByName('PRV_QUANTIDADE').AsFloat;
                     //
                     i := i + 1;
                     // Proximo
                     cdsProdutosVendas.Next;
                End;
              //
              ObjEstornar := EstornoDTO.Create;
              ObjEstornar.arrMedicamentoDTO := ObjArrayMedicamento;
              // CNPJ
              ObjEstornar.nuCnpj        := cdsConfigCFG_CNPJ_EMPRESA.AsString;
              // Solicitação
              ObjEstornar.nuAutorizacao := aNumAutorizacao;
              // Cria o Usuário da farmacia
              ObjUsuarioFarmacia := UsuarioFarmaciaDTO.Create;
              ObjUsuarioFarmacia.usuarioFarmacia := cdsConfigCFG_LOGIN.AsString;
              ObjUsuarioFarmacia.senhaFarmacia   := cdsConfigCFG_SENHA.AsString;
              // Alteração 29/03/2011
              ObjUsuarioFarmacia.usuarioVendedor := M_LOVEND;
              ObjUsuarioFarmacia.senhaVendedor   := M_SEVEND;
              //
              ObjConfirmacaoEstorno := Service.executarEstorno(ObjEstornar ,ObjUsuarioFarmacia);
              //
              If (ObjConfirmacaoEstorno.inSituacaoEstorno = '00E') Then
              Begin
                 // Inicia um transação no BD
                 TD.TransactionID  := StrtoInt(uInfoPrincipal.M_CDUSUA);
                 TD.IsolationLevel := xilREADCOMMITTED;
                 sqlConnGerenciador.StartTransaction(TD);
                 Try
                     // Grava
                     With cdsProdutosVendas do
                      begin
                         First;
                         i := 0;
                         While not (Eof) do
                         begin
                             Edit;
                             FieldByName('PRV_QUANT_CANCELADA').AsFloat := ObjEstornar.arrMedicamentoDTO[i].qtDevolvida;
                             FieldByName('PRV_QTESTORNADA').AsFloat     := ObjEstornar.arrMedicamentoDTO[i].qtEstornada;
                             FieldByName('PRV_AUTORESTORNO').AsString   := ObjEstornar.arrMedicamentoDTO[i].inAutorizacaoMedicamento;
                             FieldByName('PRV_FLCANC').AsString         := 'S';
                             Post;
                             ApplyUpdates(0);
                             //
                             i := i + 1;
                             Next;
                         End;
                      End;
                      //
                      FilterCDS(cdsAtualizarVenda, fsInteger, InttoStr(iNumVenda));
                      With cdsAtualizarVenda do
                        begin
                           Edit;
                           FieldByName('MOV_AUTORESTORNO').AsString := ObjConfirmacaoEstorno.nuEstorno;
                           FieldByName('MOV_FLSITU').AsString       := 'C';
                           FieldByName('MOV_DTCANCELAMENTO').AsDateTime := Date();
                           //
                           ApplyUpdates(0);
                        End;
                      //   Atualizar pré-solicitação - confirmada
                      SetAtualizaConfirmaPreSolicitacao(aNumAutorizacao);
                      //
                      sqlConnGerenciador.Commit(TD);
                      //
                      Application.MessageBox(PChar('Venda Nº. '+uFuncoes.StrZero(InttoStr(iNumVenda),7)+' cancelada com sucesso!!!'),
                           'CONCLUÍDO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                      //
                     cdsProdutosVendas.EnableControls;
                     //
                  Except
                     on Exc:Exception do
                       begin
                            Application.MessageBox(PChar('Erro ao tentar gravar dados!!!'
                              + Exc.Message), 'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                            sqlConnGerenciador.Rollback(TD);
                        End;
                  End;
              End
              Else
              Begin
                   aMsgRetorno := ObjConfirmacaoEstorno.descMensagemErro;
                   //
                   if (ObjConfirmacaoEstorno.inSituacaoEstorno = '29E')
                     and (aMsgRetorno = 'Estorno não autorizado. Número da Autorização inválido, inexistente ou não confirmada.') Then
                    begin
                         //
                         Application.MessageBox(PChar('Número da Autorização não foi confirmada no Farmácia Popular.'),
                             'ATENÇÃO', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
                         //
                         ExcluirVenda(iNumVenda);    
                    End
                   Else
                        ShowMessage(ObjConfirmacaoEstorno.inSituacaoEstorno + ' '+ObjConfirmacaoEstorno.descMensagemErro);
              End;
        Except
          on Exc:Exception do
          begin
                Application.MessageBox(PChar('Erro ao tentar estornar venda!!!'
                      + Exc.Message), 'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          End;
        End;
    Finally
          ObjEstornar.Free;
          //
          cdsProdutosVendas.Close;
          cdsVendas.Close;
          //Screen.Cursor := crDefault;
    End;
end;

function TdmGerenciador.ExcluirVenda(iNumVenda: Integer): Boolean;
Var
    qraux, qrauxItens : TSQLquery;
    texto, aSQLtexto : string;
    idVenda, iItem : Integer;
begin
     Result := False;
     //
     texto := 'Delete from VENDAS where (MOV_CODSOLICITACAO = :pVenda) ';
     //texto := 'Update VENDAS set MOV_FLSITU = '+QuotedStr('C')+' where (MOV_CODSOLICITACAO = :pVenda) ';
     //
     Start;
     Try
         QrAux := TSQLquery.Create(nil);
         with QrAux do
         Try
            //
            SQLConnection := sqlConnGerenciador;
            sql.Add(texto);
            Params.ParamByName('pVenda').AsInteger := iNumVenda;
            //
            ExecSQL();
            //     Itens da venda
            aSQLtexto := 'Delete from PRODUTOS_VENDAS where (PRV_CODSOLICITACAO = :pCODSOLICITACAO) ';
            //
            QrauxItens := TSQLquery.Create(nil);
             with qrauxItens do
              Try
                   SQLConnection := sqlConnGerenciador;
                   sql.Add(aSQLtexto);
                   Params.ParamByName('pCODSOLICITACAO').AsInteger := iNumVenda;
                   //
                   ExecSQL();
              Finally
                  free;
              End;
              //
         Finally
            free;
         End;
         //
         Comit(Transc);
         //
         result := True;
     Except
           Rollback;
     End;
end;

function TdmGerenciador.SetAtualizaConfirmaPreSolicitacao(aAutorizacao : String): Boolean;
var
    qraux : TSQLquery;
    texto : string;
begin
  Result := False;
  texto := 'Update PRESOLICITACAO set PRE_CONFIRMADA = :pCONFIRMADA ';
  texto := texto + ' Where (PRE_AUTORIZACAO = :pAUTORIZACAO)';
  //
  QrAux := TSQLquery.Create(nil);
  with QrAux do
      Try
         SQLConnection := sqlConnGerenciador;
         sql.Add(texto);
         Params.ParamByName('pAUTORIZACAO').AsString := aAutorizacao;
         Params.ParamByName('pCONFIRMADA').AsString  := 'S';
         ExecSQL();
         //
         Result := true;
    finally
      free;
    end;
end;

function TdmGerenciador.VerificarDocumentosVenda(
  idVenda: Integer): Boolean;
var
    qraux : TSQLquery;
    texto : string;
begin
  Result := False;
  texto := 'Select MOV_CODSOLICITACAO, MOV_IMG_RECEITA, MOV_IMG_CUPOM_FISCAL, ';
  texto := texto + ' MOV_DOC_IDENTIFICACAO, MOV_DOC_PROCURACAO, MOV_DOC_CARTA  ';
  texto := texto + ' from VENDAS where (MOV_CODSOLICITACAO = :pvenda) ';
  //
  QrAux := TSQLquery.Create(nil);
  with QrAux do
      Try
         SQLConnection := sqlConnGerenciador;
         sql.Add(texto);
         Params.ParamByName('pvenda').AsInteger := idVenda;
         Open;
         //
         if not (IsEmpty) Then
           if not (FieldByName('MOV_IMG_RECEITA').IsNull) Then
               Result := True;
    finally
      free;
    end;  
end;

function TdmGerenciador.AbrirVendaCliente(aCPF, aCodVenda: String; aDataIni,
  aDataFim: TDatetime): Boolean;
Var
   aTextoSQL : String;
begin
     Result := False;
     aTextoSQL := 'SELECT V.MOV_CODSOLICITACAO, V.MOV_CPFPACIENTE, V.MOV_DTVENDA, V.MOV_FLSITU, ';
     aTextoSQL := aTextoSQL + ' V.MOV_IMG_RECEITA, V.MOV_IMG_CUPOM_FISCAL, V.MOV_DOC_IDENTIFICACAO, V.MOV_DOC_PROCURACAO, ';
     aTextoSQL := aTextoSQL + ' V.MOV_DOC_CARTA, V.MOV_NRCUPOM ';
     aTextoSQL := aTextoSQL + ' FROM VENDAS V WHERE (V.mov_cpfpaciente = :pCPF) AND (V.MOV_FLSITU = '+QuotedStr('F')+') ';
     aTextoSQL := aTextoSQL + ' and (V.MOV_DTVENDA >= :pDTINIC) and (V.MOV_DTVENDA <= :pDTFINAL)  ';
     if not uFuncoes.Empty(aCodVenda) then
        aTextoSQL := aTextoSQL + ' and (V.MOV_CODSOLICITACAO <> '+QuotedStr( aCodVenda )+' ) ';
     aTextoSQL := aTextoSQL + ' ORDER BY V.MOV_CODSOLICITACAO DESC ';
     //
     With cdsDocumentosVendas do
     begin
          DisableControls;
          Close;
          CommandText := aTextoSQL;
          Params.ParamByName('pCPF').AsString       := aCPF;
          Params.ParamByName('pDTINIC').AsDateTime  := aDataIni;
          Params.ParamByName('pDTFINAL').AsDateTime := aDataFim;
          Open;
          //
          if not (IsEmpty) then
             Result := True;
          //
          EnableControls;
     End;
end;

function TdmGerenciador.GravarDocumentoIdentidadeBanco( aCPF : String;
  objImage: TImage): Boolean;
Var
   qraux : TSQLquery;
   texto : string;
   msFoto: TMemoryStream;
begin
     Result := false;
     //
     msFoto := TMemoryStream.Create;
     objImage.Picture.Graphic.SaveToStream(msFoto);
     msFoto.Position := 0;
     //
     texto := 'Update PACIENTES set PAC_IMG_IDENTIDADE = :pfoto where (PAC_CPF = :pcpf)';
     //
     dmGerenciador.Start;
     Try
       QrAux := TSQLquery.Create(nil);
       Try
           With QrAux do
           begin
                SQLConnection := dmGerenciador.sqlConnGerenciador;
                sql.Add(texto);
                Params.ParamByName('pcpf').AsString  := uFuncoes.RemoveChar(aCPF);
                Params.ParamByName('pfoto').LoadFromStream(msFoto, ftBlob);
                ExecSQL();
           End;
           // Grava dados
           dmGerenciador.Comit(dmGerenciador.Transc);

           Result := True;

       Except
            on e: exception do
             begin
                  Showmessage('Erro ao tentar gravar documento!'+#13+e.Message);
             End;
       End;
     Finally
          qraux.Free;
     End;
end;

end.
