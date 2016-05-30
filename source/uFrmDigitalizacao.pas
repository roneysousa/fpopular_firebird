unit uFrmDigitalizacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, AcquireImage, ClipBrd, Jpeg,
  FMTBcd, DB, SqlExpr, DBCtrls, frxClass, frxExportPDF;

type
  TFrmDigitalizacao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    Panel3: TPanel;
    lblVenda: TLabel;
    lblCliente: TLabel;
    btnImprimir: TBitBtn;
    BtSair: TBitBtn;
    TabSheet1: TTabSheet;
    rgDocumentos: TRadioGroup;
    spDigitalizar: TSpeedButton;
    aiScanearImagem: TAcquireImage;
    dbiDocumento: TDBImage;
    dsDocumento: TDataSource;
    frxReport1: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    spCopiaDocumento: TSpeedButton;
    dbeIdentidade: TDBImage;
    dsClienteIdentidade: TDataSource;
    pnlDocumentos: TPanel;
    Shape1: TShape;
    imgDocumento: TImage;
    procedure FormShow(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure spDigitalizarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aiScanearImagemTwainError(Sender: TObject; state,
      error: Integer);
    procedure rgDocumentosClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure spCopiaDocumentoClick(Sender: TObject);
  private
    { Private declarations }
    Function DigitalizarDocumento(): Boolean;
    Function GravarDocumentoBanco(): Boolean;
    Procedure CarregarDocumentoBanco();
    Procedure CopiarImagemClipBrd(imgOrigem :  TDBImage; imgDestino : TImage);
  public
    { Public declarations }
  end;

var
  FrmDigitalizacao: TFrmDigitalizacao;
  idVenda :Integer;
  aCPF, aNome, aData, aNumAutorizacao, aCupom : String;

implementation

uses uFuncoes, udmGerenciador, uFromCopiarDocumento;

{$R *.dfm}

procedure TFrmDigitalizacao.FormShow(Sender: TObject);
begin
     KeyPreview := True;
     lblVenda.Caption   := 'Venda: '+uFuncoes.StrZero(InttoStr(idVenda),7)+' :: Autoriza��o: '+aNumAutorizacao + ' :: Data: '+aData;
     lblCliente.Caption := 'CPF: '+uFuncoes.FormataCPF( aCPF)+' :: '+aNome;
     //
     CarregarDocumentoBanco;
end;

procedure TFrmDigitalizacao.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TFrmDigitalizacao.spDigitalizarClick(Sender: TObject);
begin
     spDigitalizar.Enabled := False;
     Try
         Try
                if (DigitalizarDocumento()) Then
                 begin
                      // Gravar dados
                      If (GravarDocumentoBanco()) Then
                      begin
                           CarregarDocumentoBanco;
                           Application.MessageBox('Documento gravado com sucesso!!!','ATEN��O',
                               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                      End;
                 End;
         Except
              on e: exception do
               begin
                    Application.MessageBox(Pchar('Erro ao tentar digitalizar documento!'+#13+e.Message),'ATEN��O',
                           MB_OK+MB_ICONERROR+MB_APPLMODAL);
               End;
         End;
     Finally
          spDigitalizar.Enabled := True;
     End;
     Application.ProcessMessages;
end;

procedure TFrmDigitalizacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Key = VK_F10) then
        spDigitalizarClick(Self);
     if (Key = VK_F11) then
        spCopiaDocumentoClick(Self);
end;

procedure TFrmDigitalizacao.aiScanearImagemTwainError(Sender: TObject;
  state, error: Integer);
begin
     raise Exception.Create('Error para estado: ' + IntToStr(State)
           + '. Error type: ' + IntToStr(Error));
end;

function TFrmDigitalizacao.DigitalizarDocumento: Boolean;
var
  Jpg                    : TJpegImage;
  Bmp                    : TBitmap;
  Flag                   : Boolean;
  S                      : string;
begin
  Result := False;
  Flag := False;
  with aiScanearImagem do
  begin
    if LoadTWainModule then
    begin
      try
        Try
            OpenSourceManager;
            S := GetSource(false);
            SelectSource(S);
            OpenSource;

            If (AcquireJpg(Jpg, 50) = 0) then
                 Flag := True;
        Except

        End;
      finally
        CloseTWainSession;
        UnloadTWainModule;
      end;
    end
    else
      MessageDlg('Erro ao carregar a biblioteca TWAIN_32.DLL', mtError, [mbOk], 0);
  end;

  if (Flag) then
   begin
        imgDocumento.Picture.Bitmap.Assign(Jpg);
        Result := True;
   end;
end;

procedure TFrmDigitalizacao.CarregarDocumentoBanco;
Var
  qraux : TSQLquery;
  texto : string;
  bTemDocumento : Boolean;
begin
     imgDocumento.Visible := false;
     dmGerenciador.cdsDocumentosVenda.Close;
     uFuncoes.FilterCDS(dmGerenciador.cdsDocumentosVenda, fsInteger, InttoStr(idVenda));
     if not (dmGerenciador.cdsDocumentosVenda.IsEmpty) Then
     begin
          bTemDocumento := false;
          imgDocumento.Picture.Assign(nil);
          Try
              Case rgDocumentos.ItemIndex of
                0 :
                 begin
                      if not (dmGerenciador.cdsDocumentosVendaMOV_IMG_RECEITA.IsNull) Then
                      begin
                          dbiDocumento.DataField := 'MOV_IMG_RECEITA';
                          imgDocumento.Picture.Assign(dbiDocumento.Picture);
                          bTemDocumento := True;
                      End;
                 End;
                1 :
                   begin
                      if not (dmGerenciador.cdsDocumentosVendaMOV_IMG_CUPOM_FISCAL.IsNull) Then
                      begin
                          dbiDocumento.DataField := 'MOV_IMG_CUPOM_FISCAL';
                          imgDocumento.Picture.Assign(dbiDocumento.Picture);
                          bTemDocumento := True;
                      End;
                   End;
                2 :
                   begin
                      if not (dmGerenciador.cdsDocumentosVendaMOV_DOC_PROCURACAO.IsNull) Then
                      begin
                          dbiDocumento.DataField := 'MOV_DOC_PROCURACAO';
                          imgDocumento.Picture.Assign(dbiDocumento.Picture);
                          bTemDocumento := True;
                      End;
                   End;
                3 :
                   begin
                      if not (dmGerenciador.cdsDocumentosVendaMOV_DOC_IDENTIFICACAO.IsNull) Then
                      begin
                          dbiDocumento.DataField := 'MOV_DOC_IDENTIFICACAO';
                          imgDocumento.Picture.Assign(dbiDocumento.Picture);
                          bTemDocumento := True;
                      End
                      Else
                      begin
                           // Busca cadastro de clientes
                           uFuncoes.FilterCDS(dmGerenciador.cdsCliente, fsString, aCPF);
                           if not (dmGerenciador.cdsCliente.IsEmpty) Then
                           begin
                                bTemDocumento := false;
                                imgDocumento.Picture.Assign(nil);
                                Try
                                    if not (dmGerenciador.cdsClientePAC_IMG_IDENTIDADE.IsNull) Then
                                     begin
                                          dbeIdentidade.DataField := 'PAC_IMG_IDENTIDADE';
                                          imgDocumento.Picture.Assign(dbeIdentidade.Picture);
                                          bTemDocumento := True;
                                     End;
                                     if (bTemDocumento) then
                                         imgDocumento.Visible := True;
                                Finally

                                End;
                           End;
                           //
                           dmGerenciador.cdsCliente.close;
                      End;
                   End;  
                4 :
                   begin
                      if not (dmGerenciador.cdsDocumentosVendaMOV_DOC_CARTA.IsNull) Then
                      begin
                          dbiDocumento.DataField := 'MOV_DOC_CARTA';
                          imgDocumento.Picture.Assign(dbiDocumento.Picture);
                          bTemDocumento := True;
                      End;
                   End;
              End;

              if (bTemDocumento) then
                   imgDocumento.Visible := True;
          Finally

          End;
     End;     //  if not (dmGerenciador.cdsDocumentosVenda.IsEmpty) Then
     //
     dmGerenciador.cdsDocumentosVenda.close;
end;

function TFrmDigitalizacao.GravarDocumentoBanco: Boolean;
Var
   aNomeCampo : String;
   qraux : TSQLquery;
   texto : string;
   msFoto: TMemoryStream;
begin
     Result := false;
     Case rgDocumentos.ItemIndex of
        0 : aNomeCampo := 'MOV_IMG_RECEITA';
        1 : aNomeCampo := 'MOV_IMG_CUPOM_FISCAL';
        2 : aNomeCampo := 'MOV_DOC_PROCURACAO';
        3 :
           begin
                aNomeCampo := 'MOV_DOC_IDENTIFICACAO';
                //
                If (dmGerenciador.GravarDocumentoIdentidadeBanco(aCPF, imgDocumento)) Then
                      begin
                           CarregarDocumentoBanco();
                           Application.MessageBox('Documento gravado com sucesso!!!','ATEN��O',
                               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                           Exit;
                      End;
           End;
        4 : aNomeCampo := 'MOV_DOC_CARTA';
     End;
     //
     msFoto := TMemoryStream.Create;
     imgDocumento.Picture.Graphic.SaveToStream(msFoto);
     msFoto.Position := 0;
     //
     texto := 'Update VENDAS set '+aNomeCampo+ ' = :pfoto where (MOV_CODSOLICITACAO = :pvenda)';
     //
     dmGerenciador.Start;
     Try
       QrAux := TSQLquery.Create(nil);
       Try
           With QrAux do
           begin
                SQLConnection := dmGerenciador.sqlConnGerenciador;
                sql.Add(texto);
                Params.ParamByName('pvenda').AsInteger := idVenda;
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

procedure TFrmDigitalizacao.rgDocumentosClick(Sender: TObject);
begin
    CarregarDocumentoBanco;
end;

procedure TFrmDigitalizacao.btnImprimirClick(Sender: TObject);
Var
    aFileReport, aFileDocImg, aNomeDocumento, aNomeDocumentoJpg : String;
    Jpg: TJpegImage;
    Stm: TMemoryStream;
    Bmp: TBitmap;
begin
     if not (imgDocumento.Visible) then
      begin
           Application.MessageBox(Pchar('N�o h� documento para impress�o!!!'+#13+
                                       'Por favor selecione um documento j� digitalizado.')
                      ,'ATEN��O', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
           Exit;
      End;
      //
      aFileReport := ExtractFilePath(ParamStr(0))+ 'relatorios\frDocumentos.fr3';
      if not FileExists(aFileReport) Then
        begin
           Application.MessageBox(Pchar('Arquivo de relat�rio n�o encontrado!!!')
                      ,'ATEN��O', MB_OK+MB_ICONEXCLAMATION+MB_APPLMODAL);
           Exit;
        End;
      //
      Case rgDocumentos.ItemIndex of
         0 : aNomeDocumento := 'DOCUMENTO - RECEITA';
         1 : aNomeDocumento := 'DOCUMENTO - CUPOM FISCAL';
         2 : aNomeDocumento := 'DOCUMENTO - PROCURA��O';
         3 : aNomeDocumento := 'DOCUMENTO - IDENTIFICA��O';
         4 : aNomeDocumento := 'OUTROS';
      End;
     btnImprimir.Enabled := False;
     //
     aFileDocImg := 'documento.bmp';
     if FileExists(aFileDocImg) Then
         DeleteFile( aFileDocImg );
     aNomeDocumentoJpg := 'documento.jpg';
     if FileExists(aNomeDocumentoJpg) Then
         DeleteFile( aNomeDocumentoJpg );
     //
     imgDocumento.Picture.SaveToFile(aFileDocImg);
      if FileExists(aFileDocImg) then
      begin
           Bmp := TBitmap.Create;
           Bmp.LoadFromFile(aFileDocImg);
           Jpg := TJpegImage.Create;
           Jpg.Assign(Bmp);
           Jpg.Compress;
           Stm := TMemoryStream.Create;
           Jpg.SaveToStream(Stm);
           Stm.Position := 0;
           Stm.SaveToFile(ChangeFileExt(aFileDocImg, '.jpg'));
           Stm.Free;
           Jpg.Free;
           Bmp.Free;
      end;
      //
     Try
            // TfrxPictureView(frxReport1.FindObject('Picture1')).Picture.LoadFromFile('infog2.bmp');
            With frxReport1 do
             begin
                  LoadFromFile(aFileReport) ;
                  TfrxPictureView(FindObject('Picture1')).Picture.LoadFromFile(aNomeDocumentoJpg);
                  //SetParameterValue('razao', 'INFOG2');
                  Variables['razao'] := QuotedStr( 'INFOG2 SISTEMA');
                  Variables['cupom'] := QuotedStr( 'CUPOM: '+ aCupom);
                  Variables['data']  := QuotedStr( 'DATA DA VENDA: '+ aData);
                  Variables['cliente'] := QuotedStr( 'CLIENTE: '+ ufuncoes.FormataCPF(aCPF) +' :: '+aNome);
                  Variables['documento'] := QuotedStr( aNomeDocumento);
                  //Pr�visualiza��o
                  //
                  ShowReport() ;
             End;  // frxReport1
     Finally
           btnImprimir.Enabled := True;
           if FileExists(aFileDocImg) Then
             DeleteFile( aFileDocImg );
     End;
     Application.ProcessMessages;
end;

procedure TFrmDigitalizacao.spCopiaDocumentoClick(Sender: TObject);
Var
  aNomeCampo : String;
begin
     if (rgDocumentos.ItemIndex = 3) and not (imgDocumento.Visible) then
     begin
         Application.MessageBox(Pchar('Documentos n�o pode ser copiado!!!'+#13+'Tente digitalizar este documento.')
                      ,'ATEN��O', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
         Exit;
     End;
     //uFuncoes.FilterCDS(dmGerenciador.cdsDocumentosVendas, fsString, aCPF);
     dmGerenciador.AbrirVendaCliente(aCPF, InttoStr(idVenda), Date()-180 ,Date());
     //
     {if (dmGerenciador.cdsDocumentosVendas.IsEmpty) Then
     begin
          Application.MessageBox(Pchar('N�o documentos digitalizados para este cliente!!!')
                      ,'ATEN��O', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
          Exit;
     End;  }
     //
     Case rgDocumentos.ItemIndex of
        0 : aNomeCampo := 'MOV_IMG_RECEITA';
        1 : aNomeCampo := 'MOV_IMG_CUPOM_FISCAL';
        2 : aNomeCampo := 'MOV_DOC_PROCURACAO';
        3 : aNomeCampo := 'MOV_DOC_IDENTIFICACAO';
        4 : aNomeCampo := 'MOV_DOC_CARTA';
     End;
     //
     Application.CreateForm(TFromCopiarDocumento, FromCopiarDocumento);
     Try
           uFromCopiarDocumento.aNomeCampo := aNomeCampo;
           uFromCopiarDocumento.aCPF       := aCPF;
           uFromCopiarDocumento.aNumeroVenda := InttoStr(idVenda);
           If (FromCopiarDocumento.ShowModal = mrOK) then
           begin
                Try
                    // Metodo de copia
                    CopiarImagemClipBrd(FromCopiarDocumento.dbiDocumento, imgDocumento);
                    //
                Except
                    on e: exception do
                    begin
                        ShowMessage('Erro na copia de documento! Erro:' + e.message);
                    End;
                End;
           End;
     Finally
           FromCopiarDocumento.free;
           dmGerenciador.cdsDocumentosVendas.close;
     End;
end;

procedure TFrmDigitalizacao.CopiarImagemClipBrd(imgOrigem :  TDBImage; imgDestino : TImage);
Var
     Bmp: TBitmap;
     JPGImage: TGraphic;
begin
     Clipboard.Clear;
     Clipboard.Assign(imgOrigem.Picture.Graphic);

     if Clipboard.HasFormat(CF_PICTURE) then
     begin
          Bmp := TBitmap.Create;
          JPGImage := TJPegImage.Create;
          try
               Bmp.Assign(Clipboard);
               JpgImage.Assign(Bmp) ;
               imgDestino.Picture.Bitmap.Assign(JPGImage);
               // imgDestino.Picture.SaveToFile('teste03.jpg');
               // Salva img no banco
               If (GravarDocumentoBanco()) Then
                 begin
                      CarregarDocumentoBanco;
                      Application.MessageBox('Documento gravado com sucesso!!!','ATEN��O',
                               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 End;
          finally
               JpgImage.Free;
               Bmp.Free;
          end;
     end;
end;

end.
