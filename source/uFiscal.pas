unit uFiscal;

interface

Uses uBematech, Forms, Windows, Messages, Dialogs, SysUtils, Variants, Controls,
  uDaruma;

function FISCAL(Comando : String ; Modelo : Integer;
Param1 : String = ''; Param2 : String = ''; Param3 : String = ''; Param4 : String = '';
Param5 : String = ''; Param6 : String = ''; Param7 : String = ''; Param8 : String = '';
Param9 : String = '') : integer;
function Retorno_Impressora(nComando : String; iRetorno : integer) : Integer;
function VerificaRetornoFuncaoImpressora(iRetorno, iModelo : Integer) : Boolean;

Var
     aNumeroCupom : String;

implementation

Uses uFuncoes;


function FISCAL(Comando : String; Modelo : Integer;
Param1 : String = ''; Param2 : String = ''; Param3 : String = ''; Param4 : String = '';
Param5 : String = ''; Param6 : String = ''; Param7 : String = ''; Param8 : String = '';
Param9 : String = '') : integer;
Var
    iRetorno, mRetorno : Integer;
    Status, NumeroCupom, aVersao, aFirmware, aNumeroSerie, aDataMovimento, cModeloImp : String;
begin
      iRetorno := 1;
      {Modelos
      0 = Sem ECF
      1 = Bematech
      2 = Daruma }
      Case Modelo of
        1 : begin   // BEMATECH
                If (Comando = 'ModeloECF') Then
                begin
                     // Verifica Impressora
                     iRetorno := uBematech.Bematech_FI_VerificaImpressoraLigada();
                     If (iRetorno = 1) Then
                       begin
                            SetLength( cModeloImp, 10 );
                           // iRetorno := uBematech.Bematech_FI_ModeloImpressora( cModeloImp );
                       End;
                End;
                //
                If (Comando = 'VersaoDll') Then
                begin
                     // Verifica Impressora
                     iRetorno := uBematech.Bematech_FI_VerificaImpressoraLigada();
                     If (iRetorno = 1) Then
                       begin
                            SetLength( aVersao, 9 );
                            //for iConta := 1 to 9 do aVersao := aVersao + ' ';
                            iRetorno := uBematech.Bematech_FI_VersaoDll( aVersao );
                       End;
                End;
                //
                If (Comando = 'VersaoFirmware') Then
                  begin
                      // Verifica Impressora
                      iRetorno := uBematech.Bematech_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                       begin
                            SetLength (aFirmware,4);
                            iRetorno := uBematech.Bematech_FI_VersaoFirmware( aFirmware );
                       End;
                  End;
                //
                If (Comando = 'NumeroSerie') Then
                 begin
                      // Verifica Impressora
                      iRetorno := uBematech.Bematech_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                       begin
                            SetLength( aNumeroSerie,  6);
                            iRetorno := uBematech.Bematech_FI_NumeroSerie( aNumeroSerie  );
                       End;
                 End;
                 //
                 If (Comando = 'DataMovimento') Then
                   begin
                      // Verifica Impressora
                      iRetorno := uBematech.Bematech_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                       begin
                            SetLength( aDataMovimento, 6);
                            iRetorno := uBematech.Bematech_FI_DataMovimento( aDataMovimento );
                       End;
                   End;
                //
                If (Comando = 'LeituraX') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uBematech.Bematech_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                          iRetorno := uBematech.Bematech_FI_LeituraX();
                      iRetorno := Retorno_Impressora('LeituraX',iRetorno);
                    End;
                    //
                If (Comando = 'ReducaoZ') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uBematech.Bematech_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                           iRetorno := uBematech.Bematech_FI_ReducaoZ(pchar(DateToStr(Date)),pchar(TimeToStr(Time)));
                      iRetorno := Retorno_Impressora('ReducaoZ',iRetorno);
                    End;
                If (Comando = 'MemoriaFiscal') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uBematech.Bematech_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                          iRetorno := uBematech.Bematech_FI_LeituraMemoriaFiscalData(
                                       pchar( Param1 ), pchar( Param2 ) );
                      iRetorno := Retorno_Impressora('MemoriaFiscal',iRetorno);
                    End;
                If (Comando = 'StatusEcf') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uBematech.Bematech_FI_VerificaImpressoraLigada();
                      mRetorno := 0;
                      If (iRetorno = 1) Then
                           iRetorno := uBematech.Bematech_FI_FlagsFiscais(mRetorno);
                      // Verifica mRetorno
                      IF mRetorno >= 128 Then
                           Begin
                              mRetorno := mRetorno - 128;
                              Status := 'Sem espaço de memoria';
                              ShowMessage('Sem espaço de memoria!!!');
                              iRetorno := 0;
                           END;
                      IF mRetorno >= 64  Then
                           begin
                              mRetorno := mRetorno - 64;
                              Status   := 'Não existe';
                           End;
                      IF mRetorno >= 32  Then
                           Begin
                              mRetorno := mRetorno - 32;
                              Status := 'Permitir cancelar cupom';
                           End;
                      IF mRetorno >= 16  Then
                           Begin
                              mRetorno := mRetorno - 16;
                              Status := 'Não Existe';
                           End;
                      IF mRetorno >= 8   Then
                           Begin
                              mRetorno := mRetorno - 8;
                              Status := 'Redução Z já emitida';
                              ShowMessage('Redução Z já emitida!!!');
                              iRetorno := 0;
                           End;
                      IF mRetorno >= 4   Then
                           Begin
                              mRetorno := mRetorno - 4;
                              Status := 'Horario de verão, selecionado = 1';
                           End;
                      IF mRetorno >= 2   Then
                           Begin
                              mRetorno := mRetorno - 2;
                              Status := 'Fechamento de formas de pagamento iniciado';
                           End;
                      IF mRetorno >= 1   Then
                           Begin
                              mRetorno := mRetorno - 1;
                              Status := 'Cupom fiscal em Aberto';
                              uBematech.Bematech_FI_CancelaCupom;
                          End;
                      //
                      //iRetorno := VerificaRetornoFuncaoImpressora(iRetorno, Modelo);
                      Retorno_Impressora('StatusEcf',iRetorno);
                    End;
                If (Comando = 'AbriCupom') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uBematech.Bematech_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                          iRetorno := uBematech.Bematech_FI_AbreCupom( pchar( '' ) );
                      iRetorno := Retorno_Impressora('AbriCupom',iRetorno);
                      uBematech.Analisa_iRetorno;
                    End;
                If (Comando = 'CancelaCupom') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uBematech.Bematech_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                          iRetorno := uBematech.Bematech_FI_CancelaCupom;
                      iRetorno := Retorno_Impressora('CancelaCupom',iRetorno);
                    End;
                 If (Comando = 'CancelaItemGenerico') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uBematech.Bematech_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                          iRetorno := uBematech.Bematech_FI_CancelaItemGenerico(PChar(Param1)) ;
                      iRetorno := Retorno_Impressora('CancelaItemGenerico',iRetorno);
                    End;
                If (Comando = 'CancelaItemAnterior') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uBematech.Bematech_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                          iRetorno := uBematech.Bematech_FI_CancelaItemAnterior;
                      iRetorno := Retorno_Impressora('CancelaItemAnterior',iRetorno);
                    End;
                If (Comando = 'VendaItem') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uBematech.Bematech_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                           iRetorno := uBematech.Bematech_FI_VendeItem
                                 ( pchar( Param1 ),     // Codigo (13)
                                   pchar( Param2 ),     // Descricao (29)
                                   pchar( Param3 ),     // Aliquota (2)  Indice da ECF
                                   pchar( Param4 ),     // Tipo Qtde (1) I - Inteira e F - Fracionária.
                                   pchar( Param5 ),     // Quantidade (7)  3 são fração
                                   StrtoInt(Param6),    // Casa Decimais (Valores validos : 2 ou 3)
                                   pchar( Param7 ),     // Valor (8)
                                   pchar( Param8 ),     // Tipo desconto (Valores validos : % ou $)
                                   pchar( Param9 ) );   // Desconto (8 para valor e 4 p/ percentual)
                      iRetorno := Retorno_Impressora('VendaItem',iRetorno);
                    End;
                If (Comando = 'TotalCupom') Then
                    begin
                      // Verifica Impressora
                      iRetorno := 0;
                      While iRetorno = 0 do
                      begin
                           iRetorno := uBematech.Bematech_FI_VerificaImpressoraLigada();
                           If (iRetorno = 0) Then
                                 If Application.MessageBox('Impressora fiscal não responde, tenta novamente?',
                                       'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idNo then
                                         break;
                      End;
                      If (iRetorno = 1) Then
                          iRetorno := uBematech.Bematech_FI_IniciaFechamentoCupom(
                              pchar( Param1 ),    // Acrescimo/Desconto (Valores validos : A ou D)
                              pchar( Param2 ),    // TipoAcrescimoDesconto (Valores validos : % ou $)
                              pchar( Param3 ) );  // Valor AcrescimoDesconto (14 por valor ou 4 percentual)
                      iRetorno := Retorno_Impressora('TotalCupom',iRetorno);
                    End;
                If (Comando = 'Pagamento') Then
                    begin
                      // Verifica Impressora
                      iRetorno := 0;
                      While iRetorno = 0 do
                      begin
                           iRetorno := uBematech.Bematech_FI_VerificaImpressoraLigada();
                           If (iRetorno = 0) Then
                                 If Application.MessageBox('Impressora fiscal não responde, tenta novamente?',
                                       'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idNo then
                                         break;
                      End;
                      If (iRetorno = 1) Then
                       begin
                           iRetorno := uBematech.Bematech_FI_EfetuaFormaPagamento(
                                    pchar( Param1 ),    // forma de pagamento com no máximo 16 caracteres.
                                    pchar( Param2 ) );  // valor da forma de pagamento com até 14 dígitos.
                           If (iRetorno <> 1) Then
                               VerificaRetornoFuncaoImpressora(iRetorno, Modelo);
                       End;
                       // iRetorno := Retorno_Impressora('Pagamento',iRetorno);
                    End;
                If (Comando = 'FecharCupom') Then
                    begin
                      // Verifica Impressora
                      iRetorno := 0;
                      While iRetorno = 0 do
                      begin
                           iRetorno := uBematech.Bematech_FI_VerificaImpressoraLigada();
                           If (iRetorno = 0) Then
                                 If Application.MessageBox('Impressora fiscal não responde, tenta novamente?',
                                       'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idNo then
                                         break;
                      End;
                      If (iRetorno = 1) Then
                          iRetorno := uBematech.Bematech_FI_TerminaFechamentoCupom(
                                  pchar( Param1 ) );  // STRING com a mensagem promocional com
                                                      //até 384 caracteres (8 linhas X 48 colunas),
                                                      //para a impressora fiscal MP-20 FI II, e
                                                      //320 caracteres (8 linhas X 40 colunas),
                                                      //para a impressora fiscal MP-40 FI II.
                      iRetorno := Retorno_Impressora('FecharCupom',iRetorno);
                    End;
                If (Comando = 'NumeroCupom') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uBematech.Bematech_FI_VerificaImpressoraLigada();
                      // NumeroCupom := uFuncoes.Replicate(' ',6);
                      SetLength( aNumeroCupom, 6 );
                      If (iRetorno = 1) Then
                       begin
                           //iRetorno := uBematech.Bematech_FI_NumeroCupom( NumeroCupom );
                           iRetorno := uBematech.Bematech_FI_NumeroCupom( aNumeroCupom );
                       End;
                      //iRetorno := Retorno_Impressora('NumeroCupom',iRetorno);
                      mRetorno := Retorno_Impressora('NumeroCupom',iRetorno);
                    End;
                If (Comando = 'AbreComprovanteNaoFiscalVinculado') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uBematech.Bematech_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                           iRetorno := uBematech.Bematech_FI_AbreComprovanteNaoFiscalVinculado(pchar( Param1 ), pchar( Param2 ), pchar( Param3 ));
                      iRetorno := Retorno_Impressora('AbreComprovanteNaoFiscalVinculado',iRetorno);
                    End;
                If (Comando = 'UsaComprovanteNaoFiscalVinculado') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uBematech.Bematech_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                           iRetorno := uBematech.Bematech_FI_UsaComprovanteNaoFiscalVinculado(pchar( Param1 ));
                      iRetorno := Retorno_Impressora('UsaComprovanteNaoFiscalVinculado',iRetorno);
                    End;
                If (Comando = 'FechaComprovanteNaoFiscalVinculado') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uBematech.Bematech_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                           iRetorno := uBematech.Bematech_FI_FechaComprovanteNaoFiscalVinculado();
                      iRetorno := Retorno_Impressora('FechaComprovanteNaoFiscalVinculado',iRetorno);
                    End;
                If (Comando = 'RelatorioGerencial') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uBematech.Bematech_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                           iRetorno := uBematech.Bematech_FI_RelatorioGerencial(pchar( Param1 ));
                      iRetorno := Retorno_Impressora('RelatorioGerencial',iRetorno);
                    End;
                If (Comando = 'FechaRelatorioGerencial') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uBematech.Bematech_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                           iRetorno := uBematech.Bematech_FI_FechaRelatorioGerencial();
                      iRetorno := Retorno_Impressora('FechaRelatorioGerencial',iRetorno);
                    End;
                // Alteração TEF : 07/05/2010
                If (Comando = 'IniciaModoTEF') then
                  begin
                       // Bloqueia o teclado e o mouse para a impressão do TEF.
                       iRetorno := uBematech.Bematech_FI_IniciaModoTEF();
                  End;
                If (Comando = 'FinalizaModoTEF') then
                  begin
                       // Desbloqeia o teclado e o mouse.
                       iRetorno := uBematech.Bematech_FI_FinalizaModoTEF();
                  End;
            End;
        2 : begin    // DARUMA
                If (Comando = 'ModeloECF') Then
                begin
                     // Verifica Impressora
                     iRetorno := uDaruma.Daruma_FI_VerificaImpressoraLigada();
                     If (iRetorno = 1) Then
                       begin
                            iRetorno := uDaruma.Daruma_FI_VerificaModeloECF();
                       End;
                End;
                //
                If (Comando = 'VersaoDll') Then
                begin
                     // Verifica Impressora
                     iRetorno := uDaruma.Daruma_FI_VerificaImpressoraLigada();
                     SetLength (aVersao,10);
                     //iRetorno := uDaruma.Daruma_FI_RetornarVersaoDll(aVersao);
                End;
                //
                If (Comando = 'VersaoFirmware') Then
                  begin
                       iRetorno := uDaruma.Daruma_FI_VerificaImpressoraLigada();
                       SetLength (aFirmware,4);
                       iRetorno := uDaruma.Daruma_FI_VersaoFirmware(aFirmware);
                  End;
                //
                If (Comando = 'NumeroSerie') Then
                 begin
                      // Verifica Impressora
                      iRetorno := uDaruma.Daruma_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                       begin
                            SetLength (aDataMovimento,6);
                            iRetorno := uDaruma.Daruma_FI_DataMovimento( aDataMovimento  );
                       End;
                 End;
                 //
                 If (Comando = 'DataMovimento') Then
                   begin

                   End;
                //
                If (Comando = 'LeituraX') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uDaruma.Daruma_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                          iRetorno := uDaruma.Daruma_FI_LeituraX();
                    End;
                If (Comando = 'ReducaoZ') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uDaruma.Daruma_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                           iRetorno := uDaruma.Daruma_FI_ReducaoZ();
                    End;
                If (Comando = 'MemoriaFiscal') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uDaruma.Daruma_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                          iRetorno := uDaruma.Daruma_FI_LeituraMemoriaFiscalData(
                                       pchar( Param1 ), pchar( Param2 ) );
                      iRetorno := Retorno_Impressora('MemoriaFiscal',iRetorno);
                    End;
                If (Comando = 'StatusEcf') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uDaruma.Daruma_FI_VerificaImpressoraLigada();
                      //
                      mRetorno := 0;
                      If (iRetorno = 1) Then
                           iRetorno := uDaruma.Daruma_FI_FlagsFiscais(mRetorno)
                      Else
                          raise Exception.Create('Impressora Desligada !!');
                      // Verifica mRetorno
                      IF mRetorno >= 128 Then
                           Begin
                              mRetorno := mRetorno - 128;
                              Status := 'Sem espaço de memoria';
                              ShowMessage('Sem espaço de memoria!!!');
                              iRetorno := 0;
                           END;
                      IF mRetorno >= 64  Then
                           begin
                              mRetorno := mRetorno - 64;
                              Status   := 'Não existe';
                           End;
                      IF mRetorno >= 32  Then
                           Begin
                              mRetorno := mRetorno - 32;
                              Status := 'Permitir cancelar cupom';
                           End;
                      IF mRetorno >= 16  Then
                           Begin
                              mRetorno := mRetorno - 16;
                              Status := 'Não Existe';
                           End;
                      IF mRetorno >= 8   Then
                           Begin
                              mRetorno := mRetorno - 8;
                              Status := 'Redução Z já emitida';
                              ShowMessage('Redução Z já emitida!!!');
                              iRetorno := 0;
                           End;
                      IF mRetorno >= 4   Then
                           Begin
                              mRetorno := mRetorno - 4;
                              Status := 'Horario de verão, selecionado = 1';
                           End;
                      IF mRetorno >= 2   Then
                           Begin
                              mRetorno := mRetorno - 2;
                              Status := 'Fechamento de formas de pagamento iniciado';
                           End;
                      IF mRetorno >= 1   Then
                           Begin
                              mRetorno := mRetorno - 1;
                              Status := 'Cupom fiscal em Aberto';
                              uDaruma.Daruma_FI_CancelaCupom;
                          End;
                      //
                    End;
                If (Comando = 'AbriCupom') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uDaruma.Daruma_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                          iRetorno := uDaruma.Daruma_FI_AbreCupom( pchar( '' ) );
                    End;
                If (Comando = 'CancelaCupom') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uDaruma.Daruma_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                          iRetorno := uDaruma.Daruma_FI_CancelaCupom;
                    End;
                If (Comando = 'CancelaItemGenerico') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uDaruma.Daruma_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                          iRetorno := uDaruma.Daruma_FI_CancelaItemGenerico(PChar(Param1)) ;
                    End;
                If (Comando = 'CancelaItemAnterior') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uDaruma.Daruma_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                          iRetorno := uDaruma.Daruma_FI_CancelaItemAnterior;
                   End;
                If (Comando = 'VendaItem') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uDaruma.Daruma_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                           iRetorno := uDaruma.Daruma_FI_VendeItem
                                 ( pchar( Param1 ),     // Codigo (13)
                                   pchar( Param2 ),     // Descricao (29)
                                   pchar( Param3 ),     // Aliquota (2)  Indice da ECF
                                   pchar( Param4 ),     // Tipo Qtde (1) I - Inteira e F - Fracionária.
                                   pchar( Param5 ),     // Quantidade (7)  3 são fração
                                   StrtoInt(Param6),    // Casa Decimais (Valores validos : 2 ou 3)
                                   pchar( Param7 ),     // Valor (8)
                                   pchar( Param8 ),     // Tipo desconto (Valores validos : % ou $)
                                   pchar( Param9 ) );   // Desconto (8 para valor e 4 p/ percentual)
                      //
                      //VerificaRetornoFuncaoImpressora(iRetorno, Modelo);
                      //
                    End;
                If (Comando = 'TotalCupom') Then
                    begin
                      // Verifica Impressora
                      iRetorno := 0;
                      While iRetorno = 0 do
                      begin
                           iRetorno := uDaruma.Daruma_FI_VerificaImpressoraLigada();
                           If (iRetorno = 0) Then
                                 If Application.MessageBox('Impressora fiscal não responde, tenta novamente?',
                                       'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idNo then
                                         break;
                      End;
                      If (iRetorno = 1) Then
                          iRetorno := uDaruma.Daruma_FI_IniciaFechamentoCupom(
                              pchar( Param1 ),    // Acrescimo/Desconto (Valores validos : A ou D)
                              pchar( Param2 ),    // TipoAcrescimoDesconto (Valores validos : % ou $)
                              pchar( Param3 ) );  // Valor AcrescimoDesconto (14 por valor ou 4 percentual)
                    End;
                If (Comando = 'Pagamento') Then
                    begin
                      // Verifica Impressora
                      iRetorno := 0;
                      While iRetorno = 0 do
                      begin
                           iRetorno := uDaruma.Daruma_FI_VerificaImpressoraLigada();
                           If (iRetorno = 0) Then
                                 If Application.MessageBox('Impressora fiscal não responde, tenta novamente?',
                                       'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idNo then
                                         break;
                      End;
                      If (iRetorno = 1) Then
                           iRetorno := uDaruma.Daruma_FI_EfetuaFormaPagamento(
                                    pchar( Param1 ),    // forma de pagamento com no máximo 16 caracteres.
                                    pchar( Param2 ) );  // valor da forma de pagamento com até 14 dígitos.
                    End;
                If (Comando = 'FecharCupom') Then
                    begin
                      // Verifica Impressora
                      iRetorno := 0;
                      While iRetorno = 0 do
                      begin
                           iRetorno := uDaruma.Daruma_FI_VerificaImpressoraLigada();
                           If (iRetorno = 0) Then
                                 If Application.MessageBox('Impressora fiscal não responde, tenta novamente?',
                                       'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idNo then
                                         break;
                      End;
                      If (iRetorno = 1) Then
                          iRetorno := uDaruma.Daruma_FI_TerminaFechamentoCupom(
                                  pchar( Param1 ) );  // STRING com a mensagem promocional com
                                                      //até 384 caracteres (8 linhas X 48 colunas),
                                                      //para a impressora fiscal MP-20 FI II, e
                                                      //320 caracteres (8 linhas X 40 colunas),
                                                      //para a impressora fiscal MP-40 FI II.
                    End;
                If (Comando = 'NumeroCupom') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uDaruma.Daruma_FI_VerificaImpressoraLigada();
                      //NumeroCupom := uFuncoes.Replicate(' ',6);
                      SetLength (aNumeroCupom, 6);
                      If (iRetorno = 1) Then
                           iRetorno := uDaruma.Daruma_FI_NumeroCupom( aNumeroCupom );
                    End;
                If (Comando = 'AbreComprovanteNaoFiscalVinculado') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uDaruma.Daruma_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                           iRetorno := uDaruma.Daruma_FI_AbreComprovanteNaoFiscalVinculado(pchar( Param1 ), pchar( Param2 ), pchar( Param3 ));
                    End;
                If (Comando = 'UsaComprovanteNaoFiscalVinculado') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uDaruma.Daruma_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                           iRetorno := uDaruma.Daruma_FI_UsaComprovanteNaoFiscalVinculado(pchar( Param1 ));
                    End;
                If (Comando = 'FechaComprovanteNaoFiscalVinculado') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uDaruma.Daruma_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                           iRetorno := uDaruma.Daruma_FI_FechaComprovanteNaoFiscalVinculado();
                    End;
                If (Comando = 'RelatorioGerencial') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uDaruma.Daruma_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                           iRetorno := uDaruma.Daruma_FI_RelatorioGerencial(pchar( Param1 ));
                    End;
                If (Comando = 'FechaRelatorioGerencial') Then
                    begin
                      // Verifica Impressora
                      iRetorno := uDaruma.Daruma_FI_VerificaImpressoraLigada();
                      If (iRetorno = 1) Then
                           iRetorno := uDaruma.Daruma_FI_FechaRelatorioGerencial();
                    End;
                // Alteração TEF : 07/05/2010
                If (Comando = 'IniciaModoTEF') then
                  begin
                       // Bloqueia o teclado e o mouse para a impressão do TEF.
                       iRetorno := uDaruma.Daruma_TEF_TravarTeclado('1');
                  End;
                If (Comando = 'FinalizaModoTEF') then
                  begin
                       // Desbloqeia o teclado e o mouse.
                       iRetorno := uDaruma.Daruma_TEF_TravarTeclado('0');
                  End;
            End;
      End;
      // retorno
      result := iRetorno;
End;

// **********************************************************************
// -------------------- Analisa Retorno da impressora ---------------------
function Retorno_Impressora( nComando : String; iRetorno : integer) : Integer;
Var
   iACK, iST1, iST2: Integer;
   Status : String;
Begin
    if (iRetorno = 1) then
       begin
         iACK := 0; iST1 := 0; iST2 := 0;
         result := 0;
         Bematech_FI_RetornoImpressora(iACK, iST1, iST2);
         if (iACK = 6) and (iST1 = 0) and (iST2 = 0) then
            result :=1;

         If iACK = 6 then                    // Byte indicativo de Recebimento Correto.
         Begin
               // Verifica ST1

               IF iST1 >= 128 Then
                    Begin
                    iST1 := iST1 - 128;
                    Status := 'Fim de Papel';
                    ShowMessage('Fim de Papel!!!'+ nComando );
               END;
               IF iST1 >= 64  Then
               begin
                    iST1 := iST1 - 64;
                    Status := 'Pouco Papel';
                    ShowMessage('Pouco Papel!!! '+nComando);
               End;
               IF iST1 >= 32  Then
               Begin
                    iST1 := iST1 - 32;
                    Status := 'Erro no Relógio';
                    ShowMessage('Erro no Relógio!!! '+nComando);
               End;
               IF iST1 >= 16  Then
               Begin
                    iST1 := iST1 - 16;
                    Status := 'Impressora em ERRO';
                    ShowMessage('Impressora em ERRO!!! '+nComando);
               End;
               IF iST1 >= 8   Then
               Begin
                    iST1 := iST1 - 8;
                    Status := 'CMD não iniciado com ESC';
                    ShowMessage('CMD não iniciado com ESC!!! '+nComando);
               End;
               IF iST1 >= 4   Then
               Begin
                     iST1 := iST1 - 4;
                     Status := 'Comando Inexistente';
                     ShowMessage('Comando Inexistente!!! '+nComando);
               End;
               IF iST1 >= 2   Then
               Begin
                    iST1 := iST1 - 2;
                    Status := 'Cupom Aberto';
                    ShowMessage('Cupom Aberto!!! '+nComando);
               End;
               IF iST1 >= 1   Then
               Begin
                    iST1 := iST1 - 1;
                    Status := 'Nº de Parâmetros Inválidos';
                    ShowMessage('Nº de Parâmetros Inválidos!!! '+nComando);
              End;

               // Verifica ST2

               IF iST2 >= 128 Then
               Begin
                    iST2 := iST2 - 128;
                    Status := 'Tipo de Parâmetro Inválido';
                    ShowMessage('Tipo de Parâmetro Inválido!!! '+nComando);
               End;
               IF iST2 >= 64  Then
               Begin
                    iST2 := iST2 - 64;
                    Status := 'Memória Fiscal Lotada';
                    ShowMessage('Memória Fiscal Lotada!!! '+nComando);
               END;
               IF iST2 >= 32  Then
               Begin
                    iST2 := iST2 - 32;
                    Status := 'CMOS não Volátil';
                    ShowMessage('CMOS não Volátil!!! '+nComando);
               END;
               IF iST2 >= 16  Then
               Begin
                    iST2 := iST2 - 16;
                    Status := 'Alíquota Não Programada';
                    ShowMessage('Alíquota Não Programada!!! '+nComando);
               END;
               IF iST2 >= 8   Then
               Begin
                    iST2 := iST2 - 8;
                    Status := 'Alíquotas lotadas';
                    ShowMessage('Alíquota lotadas!!! '+nComando);
               End;
               IF iST2 >= 4   Then
               Begin
                    iST2 := iST2 - 4;
                    Status := 'Cancelamento não Permitido';
                    ShowMessage('Cancelamento não Permitido!!! '+nComando);
               END;
               IF iST2 >= 2   Then
               Begin
                    iST2 := iST2 - 2;
                    Status := 'CGC/IE não Programados';
                    ShowMessage('CGC/IE não Programados!!! '+nComando);
               END;
               IF iST2 >= 1   Then
               Begin
                    iST2 := iST2 - 1;
                    Status := 'Comando não Executado!!! '+nComando;
                    ShowMessage(Status);
               END;
         End;

         If iACK = 21 Then
            Begin                     // Byte indicativo de Recebimento incorreto.
                 Application.MessageBox( 'Atenção!!!' + #13 + #10 +
                        'A Impressora retornou NAK. O programa será abortado.',
                        'Atenção', MB_IconInformation + MB_OK);
                 Application.Terminate;
                 Exit;
            End;
       End
       Else
           ShowMessage('Erro ao tentar se comunicar com ECF');
      //
end;

////////////////////////////////////////////////////////////////////////////////
// Função: VerificaRetornoFuncaoImpressora
// Objetivo: Verificar o retorno da impressora e da função utilizada
// Retorno: True para OK ou False para não OK
////////////////////////////////////////////////////////////////////////////////
function VerificaRetornoFuncaoImpressora(iRetorno, iModelo : Integer) : Boolean;
var
     cMSGErro: string;
     iACK, iST1, iST2: Integer;
     //
     Daruma_ACK,Daruma_ST1,Daruma_ST2:Integer;
begin
     cMSGErro := '';
     result := False;
     //
     Case iModelo of
        1 : begin   // BEMATECH
             case iRetorno of
                     0: cMSGErro := 'Erro de Comunicação !';
                    -1: cMSGErro := 'Erro de execução na Função !';
                    -2: cMSGErro := 'Parâmetro inválido na Função !';
                    -3: cMSGErro := 'Alíquota não Programada !';
                    -4: cMSGErro := 'Arquivo BEMAFI32.INI não Encontrado !';
                    -5: cMSGErro := 'Erro ao abrir a Porta de Comunicação !';
                    -6: cMSGErro := 'Impressora Desligada ou Cabo de Comunicação Desconectado!';
                    -7: cMSGErro := 'Código do Banco não encontrado no arquivo BEMAFI32.INI !';
                    -8: cMSGErro := 'Erro ao criar arquivo STATUS.TXT ou RETORNO.TXT!';
                   -27: cMSGErro := 'Status diferente de 6, 0, 0 !';
                   -30: cMSGErro := 'Função incompatível com a impressora fiscal YANCO !';
             end;
             //
             if ( cMSGErro <> '' ) then
                begin
                   Application.MessageBox( pchar( cMSGErro ), 'Atenção', MB_IconError + MB_OK );
                   result := False;
                end;
             //
             cMSGErro := '';
             if ( iRetorno = 1 ) then
                begin
                   uBematech.Bematech_FI_RetornoImpressora( iACK, iST1, iST2 );
                   if ( iACK = 21 ) then
                      begin
                         Application.MessageBox( 'A Impressora retornou NAK !' + #13 +
                            'Erro de Protocolo de Comunicação !', 'Atenção', MB_IconError + MB_OK );
                         result := False;
                      end
                   else
                   if ( iST1 <> 0 ) or ( iST2 <> 0 ) then
                      begin
                         // Analisa ST1
                         if ( iST1 >= 128 ) then
                            begin
                               iST1 := iST1 - 128;
                               cMSGErro := cMSGErro + 'Fim de Papel' + #13;
                            end;
                         if ( iST1 >= 64 ) then
                            begin
                               iST1 := iST1 - 64;
                               cMSGErro := cMSGErro + 'Pouco Papel' + #13;
                            end;
                         if ( iST1 >= 32 ) then
                            begin
                               iST1 := iST1 - 32;
                               cMSGErro := cMSGErro + 'Erro no Relógio' + #13;
                            end;
                         if ( iST1 >= 16 ) then
                            begin iST1 := iST1 - 16;
                               cMSGErro := cMSGErro + 'Impressora em Erro' + #13;
                            end;
                         if ( iST1 >= 8 ) then
                            begin
                               iST1 := iST1 - 8;
                               cMSGErro := cMSGErro + 'Primeiro Dado do Comando não foi ESC'+ #13;
                            end;
                         if iST1 >= 4 then
                            begin
                               iST1 := iST1 - 4;
                               cMSGErro := cMSGErro + 'Comando Inexistente' + #13;
                            end;
                         if iST1 >= 2 then
                            begin
                               iST1 := iST1 - 2;
                               cMSGErro := cMSGErro + 'Cupom Fiscal Aberto' + #13;
                            end;
                         if iST1 >= 1 then
                            begin
                               iST1 := iST1 - 1;
                               cMSGErro := cMSGErro + 'Número de Parâmetros Inválidos' + #13;
                            end;
                         // Analisa ST2
                         if iST2 >= 128 then
                            begin
                               iST2 := iST2 - 128;
                               cMSGErro := cMSGErro + 'Tipo de Parâmetro de Comando Inválido'
                               + #13;
                            end;
                         if iST2 >= 64 then
                            begin iST2 := iST2 - 64;
                               cMSGErro := cMSGErro + 'Memória Fiscal Lotada' + #13;
                            end;
                         if iST2 >= 32 then
                            begin
                               iST2 := iST2 - 32;
                               cMSGErro := cMSGErro + 'Erro na CMOS' + #13;
                            end;
                         if iST2 >= 16 then
                            begin
                               iST2 := iST2 - 16;
                               cMSGErro := cMSGErro + 'Alíquota não Programada' + #13;
                            end;
                         if iST2 >= 8 then
                            begin iST2 := iST2 - 8;
                               cMSGErro := cMSGErro + 'Capacidade de Alíquota Programáveis Lotada' + #13;
                            end;
                         if iST2 >= 4 then
                            begin
                               iST2 := iST2 - 4;
                               cMSGErro := cMSGErro + 'Cancelamento não permitido' + #13;
                            end;
                         if iST2 >= 2 then
                            begin iST2 := iST2 - 2;
                               cMSGErro := cMSGErro + 'CGC/IE do Proprietário não Programados' + #13;
                            end;
                         if iST2 >= 1 then
                            begin iST2 := iST2 - 1;
                               cMSGErro := cMSGErro + 'Comando não executado' + #13;
                            end;
                         if ( cMSGErro <> '' ) then
                            begin
                               {Application.MessageBox( pchar( cMSGErro ), 'Atenção',
                                  MB_IconError + MB_OK );}
                               result := False;
                            end;
                      end
                else
                    result := True;
             end;
             //
            End;
        2 : begin  // Daruma
                 Daruma_Ack := 0;
                 Daruma_ST1 := 0;
                 Daruma_ST2 := 0;
                 iRetorno:= uDaruma.Daruma_FI_RetornoImpressora( Daruma_ACK, iST1, iST2 );
                 //
                 if ( iST1 <> 0 ) or ( iST2 <> 0 ) then
                   begin
                        // Analisa ST1
                        If iSt1 >= 128 Then // bit 7
                         begin
                             iSt1 := iSt1 - 128;
                             cMSGErro := 'O papel acabou'+ #13;
                         End;
                         If iSt1 >= 64 Then // bit 6
                         Begin
                             iSt1 := iSt1 - 64;
                             cMSGErro := 'O papel esta acabando'+ #13;
                         End;
                         If iSt1 >= 32 Then // bit 5
                         Begin
                             iSt1 := iSt1 - 32;
                             cMSGErro := 'Erro no relógio da impressora'+ #13;
                         End;
                         If iSt1 >= 16 Then // bit 4
                         Begin
                             iSt1 := iSt1 - 16;
                             cMSGErro := 'Impressora em erro'+ #13;
                         End;
                         If iSt1 >= 8 Then // bit 3
                         begin
                              iSt1 := iSt1 - 8;
                              cMSGErro := 'Primeiro dado do método não foi ESC'+ #13;
                         End;
                         If iSt1 >= 4 Then // bit 2
                         Begin
                              iSt1 := iSt1 - 4;
                              cMSGErro := 'Método inexistente'+ #13;
                         End;
                         If iSt1 >= 2 Then // bit 1
                         Begin
                             iSt1 := iSt1 - 2;
                             cMSGErro := 'Cupom fiscal aberto'+ #13;
                         End;
                         If iSt1 >= 1 Then // bit 0
                         Begin
                              iSt1 := iSt1 - 1;
                              cMSGErro := 'Número de parâmetro(s) inválido(s)'+ #13;
                         End;
                         // Analisa ST2
                         If iSt2 >= 128 Then // bit 7
                         begin
                             iSt2 := iSt2 - 128;
                             cMSGErro := 'Tipo de parâmetro do método inválido'+ #13;
                         End;
                         If iSt2 >= 64 Then // bit 6
                         begin
                             iSt2 := iSt2 - 64;
                             cMSGErro := 'Memória fiscal cheia' +#13;
                         End;
                         If iSt2 >= 32 Then // bit 5
                         begin
                             iSt2 := iSt2 - 32;
                             cMSGErro := 'Erro na memória RAM' + #13;
                         End;
                         If iSt2 >= 16 Then // bit 4
                         begin
                             iSt2 := iSt2 - 16;
                             cMSGErro := 'Alíquota não definida'+#13;
                         End;
                         If iSt2 >= 8 Then // bit 3
                         begin
                             iSt2 := iSt2 - 8;
                             cMSGErro := 'Capacidade de alíquotas esgotada' + #13;
                         End;
                         If iSt2 >= 4 Then // bit 2
                         begin
                             iSt2 := iSt2 - 4;
                             cMSGErro := 'Este cancelamento não é permitido'+#13;
                         End;
                         If iSt2 >= 2 Then // bit 1
                         begin
                             iSt2 := iSt2 - 2;
                             cMSGErro := 'CNPJ/IE do Proprietário não definidos'+#13;
                         End;
                         If iSt2 >= 1 Then // bit 0
                         begin
                             iSt2 := iSt2 - 1;
                             cMSGErro := 'Método não executado'+#13;
                         End;
                         //
                         if ( cMSGErro <> '' ) then
                            begin
                               Application.MessageBox( pchar( cMSGErro ), 'Atenção',
                                  MB_IconError + MB_OK );
                               result := False;
                            end;
                   End; // fim-se ( iST1 <> 0 ) or ( iST2 <> 0 )
            End;
     End;
End;

end.
