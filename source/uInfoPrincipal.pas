// Sistema : InfoGereciador
// Empresa : InfoG2 Sistemas
// Objetivo: Sistema Gerenciador Farmacia Popular
// PROGRAMADOR : Roney Erdemann
// Data : 02/08/2006
// hora: 09:45


unit uInfoPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, ImgList, Buttons, ExtCtrls,
  QRCtrls, DB, UrlMon, DBClient, StdCtrls, Grids, DBGrids, DBCtrls,
  OleCtrls, SHDocVw, IdBaseComponent, IdComponent, IdTCPConnection,
          IdTCPClient, IdHTTP;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    mnuSairItem: TMenuItem;
    Info: TStatusBar;
    mnuAjuda: TMenuItem;
    mnuSobreItem: TMenuItem;
    ImageList1: TImageList;
    Cadastro1: TMenuItem;
    mnuVendaItem: TMenuItem;
    N3: TMenuItem;
    Utilitarios1: TMenuItem;
    mnuConfiguracoesSistemaItem: TMenuItem;
    mnuCancelamentoItem: TMenuItem;
    mnuPesquisaItem: TMenuItem;
    mnuUsuariosItem: TMenuItem;
    Panel1: TPanel;
    Image2: TImage;
    spVenda: TSpeedButton;
    sbCancelar: TSpeedButton;
    spPesquisa: TSpeedButton;
    spSair: TSpeedButton;
    Image3: TImage;
    mnuCadProdutosItem: TMenuItem;
    N1: TMenuItem;
    mnuSiteFarmaciaPopularItem: TMenuItem;
    Timer1: TTimer;
    imgLogon: TImage;
    mnuVendedoresSubItem: TMenuItem;
    mnuConsultarPreSolitacoesItem: TMenuItem;
    WebBrowser1: TWebBrowser;
    procedure mnuSairItemClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DespesasInternas1Click(Sender: TObject);
    procedure mnuSobreItemClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure spUsoTaxiClick(Sender: TObject);
    procedure Cascata1Click(Sender: TObject);
    procedure LadoaLado1Click(Sender: TObject);
    procedure MinimizarTodas1Click(Sender: TObject);
    procedure FecharTodas1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnuConfiguracoesSistemaItemClick(Sender: TObject);
    procedure mnuVendaItemClick(Sender: TObject);
    procedure mnuCancelamentoItemClick(Sender: TObject);
    procedure mnuPesquisaItemClick(Sender: TObject);
    procedure mnuUsuariosItemClick(Sender: TObject);
    procedure mnuCadProdutosItemClick(Sender: TObject);
    procedure mnuSiteFarmaciaPopularItemClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure mnuVendedoresSubItemClick(Sender: TObject);
    procedure mnuConsultarPreSolitacoesItemClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Status;
    procedure IMAGEM_LOGO;
    procedure SetJustify(Menu: TMenu; MenuItem: TMenuItem; Justify: Byte);
  public
    Function ExisteForm(pForm:TForm):boolean;
    procedure DisplayHint(Sender: TObject);
    function IsWebSiteUP( AURL: String): Boolean;
    Procedure TesteSite();
    { Public declarations }
  end;

Const
  M_USERMASTER = 'INFOG2';
  M_SNMASTER   = 'ADMG2';
  M_PASTA_REQ  = 'C:\INFOG2\FARMA\POP_REQ\';
  M_PASTA_RESP = 'C:\INFOG2\FARMA\POP_RESP\';
  //
  ScreenWidth: LongInt = 800; {I designed my form in 800x600 mode.}
  ScreenHeight: LongInt = 600;

var
  frmPrincipal: TfrmPrincipal;
  M_CDUSUA, M_NMUSUA, M_SNATUA, M_NMAQUI, M_FLVINC : String;

implementation

uses uSobre, uSplash, uVendas, ufrmConfig, uFrmPesquisa,
  uFrmCadUsuario, uLogon, uFuncoes, udmGerenciador, uFrmConsultaVendas,
  uFrmCancelaVendas, uFiscal, uFrmCadProdutos, uFrmCadVendedores,
  uFrmConsultaPreSolicitacoes;


{$R *.dfm}

procedure TfrmPrincipal.mnuSairItemClick(Sender: TObject);
begin
     If Application.MessageBox('Sair do Programa?',
         'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
          Application.Terminate;
end;

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose := False;
     If Application.MessageBox('Sair do Programa?',
         'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
     begin
          CanClose := True;
          Application.Terminate;
     End;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
Var
   aArquivo : String;
begin
    scaled := true;
    if (screen.width <> ScreenWidth) then
    begin
        height := longint(height) * longint(screen.height) DIV ScreenHeight;
        width := longint(width) * longint(screen.width) DIV ScreenWidth;
        scaleBy(screen.width, ScreenWidth);
    end;
     //If not(fileexists(ExtractFilePath( Application.ExeName )+'Infoweb.dat')) then
     {If not(fileexists('c:\windows\Infoweb.dat')) then
      begin
           Application.MessageBox('Copia não registrada!!!'+#13+'Entre em contato com InfoG2 : (86)3226-4510.',
             'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           Application.Terminate;
      End;}
     //
     ShortDateFormat := 'dd/mm/yyyy';
     //
     {Image1.Left := (FrmPrincipal.Width Div 2) - (Image1.Width Div 2);
     Image1.Top := (FrmPrincipal.Height Div 2) - (Image1.Height Div 2 + Info.Height);}
     //
     Application.OnHint := DisplayHint;
     //
     aArquivo := ExtractFilePath( Application.ExeName) +'logo.bmp';
      if FileExists(aArquivo) Then
           imgLogon.Picture.LoadFromFile(aArquivo);
end;

procedure TfrmPrincipal.DespesasInternas1Click(Sender: TObject);
begin
{  Try
      Application.CreateForm(TfrmRecibo, frmRecibo);
      frmRecibo.Caption := 'Despesas Internas';
      frmRecibo.ShowModal;
  Finally
      frmRecibo.Free;
  End;}
end;

procedure TfrmPrincipal.mnuSobreItemClick(Sender: TObject);
begin
  Try
      Application.CreateForm(TfrmSobre, frmSobre);
      frmSobre.ShowModal;
  Finally
      frmSobre.Free;
  End;
end;

procedure TfrmPrincipal.DisplayHint(Sender: TObject);
begin
      Info.Panels[1].Text := Application.Hint;
end;

procedure TfrmPrincipal.FormResize(Sender: TObject);
begin
     If not (dmGerenciador.cdsConfig.Active) Then
        dmGerenciador.cdsConfig.Open;
     //
     dmGerenciador.cdsConfig.Edit;
     {Image1.Picture.Assign(dmGerenciador.cdsConfigCFC_IMGLOGO);}
     dmGerenciador.cdsConfig.Cancel;
     //
     imgLogon.Left := (FrmPrincipal.Width Div 2) - (imgLogon.Width Div 2);
     imgLogon.Top := (FrmPrincipal.Height Div 2) - (imgLogon.Height Div 2 + Info.Height);
end;

procedure TfrmPrincipal.spUsoTaxiClick(Sender: TObject);
begin
{  Try
      Application.CreateForm(TfrmRecibo2, frmRecibo2);
      frmRecibo2.ShowModal;
  Finally
      frmRecibo2.Free;
  End;}
end;


function TfrmPrincipal.ExisteForm(pForm: TForm): boolean;
Var
    I:integer;
begin
    ExisteForm := False;
    For I:= 0 to Screen.FormCount -1 do
        If Screen.Forms[I] = pForm Then
        begin
            ExisteForm := True;
            Break;
        End;
end;


procedure TfrmPrincipal.Cascata1Click(Sender: TObject);
begin
      //Coloca todas as janelas abertas em cascata.
       Cascade;
end;

procedure TfrmPrincipal.LadoaLado1Click(Sender: TObject);
begin
      //Coloca todas as janelas abertas em lado a lado.
        Tile;
end;

procedure TfrmPrincipal.MinimizarTodas1Click(Sender: TObject);
//minimizar todas as janelas abertas.
Var
   I:integer;
begin
   For I:=MdiChildCount-1 downto 0 do
        MdiChildren[I].WindowState:=wsMinimized;
end;

procedure TfrmPrincipal.FecharTodas1Click(Sender: TObject);
//Fechar todas as janelas abertas.
var
  I: Integer;
begin
  with frmPrincipal do
    for I := MDIChildCount-1 downto 0 do
      MDIChildren[I].Close;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
     //
     Try
          Application.CreateForm(TfrmLogon, frmLogon);
          frmLogon.ShowModal;
     Finally
          frmLogon.Free;
     End;
     // Barra de status
     Info.Panels[0].Text := uFuncoes.StrZero(M_CDUSUA,3) + ' - '+ M_NMUSUA;
     //
     SetJustify(MainMenu1,mnuAjuda,1);
     //
     IMAGEM_LOGO;
     //
     imgLogon.Left := (FrmPrincipal.Width Div 2) - (imgLogon.Width Div 2);
     imgLogon.Top := (FrmPrincipal.Height Div 2) - (imgLogon.Height Div 2 + Info.Height);
     //
     Status;
     //
     // IsWebSiteUP('https://200.214.130.55:9443/farmaciapopular/services/ServicoSolicitacaoWS?wsdl');
     TesteSite();
end;

procedure TfrmPrincipal.mnuConfiguracoesSistemaItemClick(Sender: TObject);
begin
  with TfrmConfig.create(self) do
    try
      showmodal
    finally
      free;
      Status;
    end;
end;

procedure TfrmPrincipal.mnuVendaItemClick(Sender: TObject);
Var
    M_IMPRES : Integer;
begin
     {M_IMPRES := uFuncoes.IMPRESSORA(StrtoInt(M_CDUSUA));
     iRetorno := uFiscal.FISCAL('StatusEcf',M_IMPRES);}
     //
     dmGerenciador.Parametros;
     //
     If NOT  uFuncoes.Empty(uFuncoes.NOME_PASTA(uInfoPrincipal.M_CDUSUA)) Then
         M_NMPAST := uFuncoes.NOME_PASTA(uInfoPrincipal.M_CDUSUA)
     Else
         M_NMPAST := 'C:\';
     //
     M_FLVINC := dmGerenciador.cdsConfig.FieldByName('CFG_VINCULOFARMA').AsString;
     //
     M_NMAQUI := M_NMPAST+'\POPREQ.TXT';
     If not (fileexists(M_NMAQUI))
         and (M_FLVINC = 'S') then
      begin
           Application.MessageBox(PChar('Arquivo POPREQ.TXT não existe!!!'),
                     'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           Exit;
      End;
      //
      Timer1.Enabled := False;
      frmVendas := TfrmVendas.create(application);
      try
           frmVendas.showmodal;
      finally
           frmVendas.Release;
           frmVendas := nil;
           //
           Timer1.Enabled := true;
      end;
end;

procedure TfrmPrincipal.mnuCancelamentoItemClick(Sender: TObject);
begin
    frmCancelaVendas := TfrmCancelaVendas.create(application);
    try
        frmCancelaVendas.showmodal;
    finally
        frmCancelaVendas.Release;
        frmCancelaVendas := nil;
    end;

    {frmCancelaVenda := TfrmCancelaVenda.create(application);
    try
        frmCancelaVenda.showmodal;
    finally
        frmCancelaVenda.Release;
        frmCancelaVenda := nil;
    end;}
end;

procedure TfrmPrincipal.mnuPesquisaItemClick(Sender: TObject);
begin
    frmConsultaVendas := TfrmConsultaVendas.create(application);
    try
        frmConsultaVendas.showmodal;
    finally
        frmConsultaVendas.Release;
        frmConsultaVendas := nil;
    end;
{    frmPesquisa := TfrmPesquisa.create(application);
    try
        frmPesquisa.showmodal;
    finally
        frmPesquisa.Release;
        frmPesquisa := nil;
    end;}
end;

procedure TfrmPrincipal.mnuUsuariosItemClick(Sender: TObject);
begin
    frmCadUsuarios := TfrmCadUsuarios.create(application);
    try
        frmCadUsuarios.showmodal;
    finally
        frmCadUsuarios.Release;
        frmCadUsuarios := nil;
    end;
end;

procedure TfrmPrincipal.mnuCadProdutosItemClick(Sender: TObject);
begin
    frmCadProdutos := TfrmCadProdutos.create(application);
    try
          frmCadProdutos.showmodal;
    finally
        frmCadProdutos.Release;
        frmCadProdutos := nil;
    end;
end;

procedure TfrmPrincipal.mnuSiteFarmaciaPopularItemClick(Sender: TObject);
begin
        dmGerenciador.Parametros;
        If (dmGerenciador.cdsConfig.FieldByName('CFG_FLPRODUCAO').AsString = 'P') Then
             HlinkNavigateString(nil,'https://aplicacao.saude.gov.br/portalfarmacia/login.jsf')
            //HlinkNavigateString(nil,'https://200.214.130.55:9443/farmaciapopular/')
        Else
            HlinkNavigateString(nil,'http://189.28.128.37/portalfarmacia/login.jsf');
            //HlinkNavigateString(nil,'https://200.214.130.41:9443/farmaciahomologa/');
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
    If (Timer1.Enabled = True) Then
     begin
         If NOT  uFuncoes.Empty(uFuncoes.NOME_PASTA(uInfoPrincipal.M_CDUSUA)) Then
             M_NMPAST := uFuncoes.NOME_PASTA(uInfoPrincipal.M_CDUSUA)
         Else
             M_NMPAST := 'C:\';
         //
         M_NMAQUI := M_NMPAST+'\POPREQ.TXT';
         If (fileexists(M_NMAQUI)) then
          begin
             //Showwindow(application.handle,SW_SHOWMAXIMIZED);
             Showwindow(application.handle,SW_RESTORE);
             //application.BringToFront;
          End;
     End;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Timer1.Enabled := False;
     //
     Action := caFree;
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
     Timer1.Enabled := True;
     //
end;

procedure TfrmPrincipal.Status;
begin
     dmGerenciador.Parametros;
     If (dmGerenciador.cdsConfig.FieldByName('CFG_FLPRODUCAO').AsString = 'P') Then
         Info.Panels.Items[3].Text := 'Hambiente : PRODUÇÃO'
     Else
         Info.Panels.Items[3].Text := 'Hambiente : HOMOLOGAÇÃO';
end;

procedure TfrmPrincipal.IMAGEM_LOGO;
begin
    If FileExists(ExtractFilePath( Application.ExeName )+'\logo.bmp') Then
        imgLogon.Picture.LoadFromFile(ExtractFilePath( Application.ExeName )+'\logo.bmp');
end;

procedure TfrmPrincipal.SetJustify(Menu: TMenu; MenuItem: TMenuItem;
  Justify: Byte);
var
    ItemInfo: TMenuItemInfo;
    Buffer: array[0..80] of Char;
begin
     ItemInfo.cbSize := SizeOf(TMenuItemInfo);
     ItemInfo.fMask := MIIM_TYPE;
     ItemInfo.dwTypeData := Buffer;
     ItemInfo.cch := SizeOf(Buffer);
     //
     GetMenuItemInfo(MainMenu1.Handle, MenuItem.Command, False, ItemInfo);
     if Justify = 1 then
        ItemInfo.fType := ItemInfo.fType or MFT_RIGHTJUSTIFY;
     SetMenuItemInfo(MainMenu1.Handle, MenuItem.Command, False, ItemInfo);
end;

procedure TfrmPrincipal.mnuVendedoresSubItemClick(Sender: TObject);
begin
  frmCadVendedores := TfrmCadVendedores.create(application);
    try
        frmCadVendedores.showmodal;
    finally
        frmCadVendedores.Release;
        frmCadVendedores := nil;
    end;
end;

procedure TfrmPrincipal.mnuConsultarPreSolitacoesItemClick(
  Sender: TObject);
begin
    FrmConsultaPreSolicitacoes := TFrmConsultaPreSolicitacoes.create(application);
    try
        FrmConsultaPreSolicitacoes.showmodal;
    finally
        FrmConsultaPreSolicitacoes.Release;
        FrmConsultaPreSolicitacoes := nil;
    end;
end;

function TfrmPrincipal.IsWebSiteUP(AURL: String): Boolean;
var
  HTTP: TidHTTP;
begin
  Result := True;
  HTTP := TidHTTP.Create(nil);
  try
    HTTP.Get( AURL);
    // See the table below for standard HTTP response 
    // codes.
    // Modify this case statement to handle the others
    // that you want to catch.
    case HTTP.ResponseCode of
    400..505:
      begin
        Result := False;
      end;
    end; {case}
  finally
    HTTP.Free;
  end;
end;

procedure TfrmPrincipal.TesteSite;
begin
     WebBrowser1.Visible := False;
     WebBrowser1.Height := 0;
     WebBrowser1.Width  := 0;
     // WebBrowser1.Navigate('https://200.214.130.55:9443/farmaciapopular/services/ServicoSolicitacaoWS?wsdl');
     //
     WebBrowser1.Visible := False;
end;

end.
