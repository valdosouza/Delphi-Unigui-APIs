unit uLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.Threading,zLib, FMX.ListBox,TypesCollection,TypesObjectsCollection,
  base_form,  REST.Json,System.Generics.Collections,
  FMX.StdCtrls, System.SyncObjs,  FMX.Types, System.UIConsts,
  FMX.Edit, System.ImageList, FMX.ImgList, FMX.Objects,
  FMX.Controls, FMX.Controls.Presentation, FMX.Ani, FMX.Layouts,
  prm_auth_login, prm_entity,tbladdress, tblphone, ctrl_mob_institution, uDataCM,
  prm_stock_list,ctrl_mob_salesman_has_stock,tblSalesmanHasStock,
  ctrl_mob_salesman,ObjSalesMan,tblSalesman,ctrl_mob_order_sale,
  objOrderSale, ObjInstitution,
  ObjEntityFiscal, uAuthCM, FMX.DialogService,tblInstitution, prm_institution,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, System.Actions, FMX.ActnList,
  prm_salesman, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView;

type

  TLogin = class(TBaseForm)
    LayoutLogin: TLayout;
    lb_email: TLabel;
    lb_password: TLabel;
    chbx_trust_it: TCheckBox;
    Image1: TImage;
    E_Email: TEdit;
    E_Password: TEdit;
    Image2: TImage;
    Ly_btn_login: TLayout;
    Ly_forgot_pass: TLayout;
    Ly_thrus_device: TLayout;
    Ly_password: TLayout;
    Rc_password: TRectangle;
    Ly_Label_password: TLayout;
    Ly_login: TLayout;
    Rc_login: TRectangle;
    Ly_label_Login: TLayout;
    Ly_logo: TLayout;
    Im_logo: TImage;
    Ly_tittle: TLayout;
    Label1: TLabel;
    Ly_login_area: TLayout;
    sb_Login: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure sb_LoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function setAuthentication:Boolean;
    function validAuthentication:Boolean;
    procedure handleCodeInstitution(InstitutionID:Integer);

    function setLasOrderSale(InstitutionID:Integer):Boolean;
   function getVendedor(institutionID,userID:integer):Boolean;
    procedure getSalesmanHasStock;


  protected
    Par: TPrmAuthLogin;
    FSessaoCritica : TCriticalSection;
    function validaGetInstitution:Boolean;
    procedure GetInstitution;
    procedure SaveInstitution(institution:TInstitution);
    function ValidateDevice(Id:Integer):Boolean;
    function posAuthentication:boolean;Virtual;
    procedure setVariables;

  public
    { Public declarations }
  end;

var
  Login: TLogin;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$ZEROBASEDSTRINGS OFF}

uses uMain, UnFunctions, ctrl_mob_entity_fiscal, MainModule, Network;

procedure TLogin.FormCreate(Sender: TObject);
begin
  FSessaoCritica := TCriticalSection.Create;
  Par := TPrmAuthLogin.Create;
end;

procedure TLogin.FormShow(Sender: TObject);
begin
  chbx_trust_it.IsChecked := (GetConfigINI('MOBILE','TRUST') = 'S');
  if ( chbx_trust_it.IsChecked ) then
  Begin
    E_Email.Text := GetConfigINI('MOBILE','EMAIL');
    E_Password.Text := GetConfigINI('MOBILE','PASS');
  End;
  {$IFDEF DEBUG}
  E_Email.Text := '@';
  E_Password.Text := '12345';
  {$ENDIF}
  CloseSplash;
end;

procedure TLogin.GetInstitution;
Var
  LcInstituion : TCtrlMobInstitution;
  LcPar : TPrmInstitution;
  LcStrJSon : String;
  LcLista : TListInstitution;
  Lc_I:Integer;
  LcStrDateTime : String;
  LcLasUpdate : TDateTime;
  Lc_final : Integer;
  I : Integer;
begin
  Try
    Try
      //PArametros da Consulta
      LcInstituion := TCtrlMobInstitution.create(self);
      LcPar := TPrmInstitution.create;
      LcPar.Usuario := GbUser;
      //Lc_par_inst.UltimaAtualizacao := getLastUpdate('tb_institution','E');
      LcPar.UltimaAtualizacao := '2016-01-01 16:21:56';
      LcStrJSon := TJson.ObjectToJsonString(LcPar);
      FSessaoCritica.Enter;
      LcStrJson := DataCM.SMInstitutionClient.getListByUser(LcStrJSon);
      FSessaoCritica.Leave;
      LcLista := TListInstitution.create;
      LcLista := TJson.JsonToObject<TListInstitution>( ZDecompressString(LcStrJson ) );
      if LcLista.Count > 0 then
      Begin
        updateProcess('Baixando dados dos Estabelecimentos');
        Lc_final := LcLista.Count - 1;
        LcPar := TPrmInstitution.create;
        for Lc_I := 0 to  Lc_final do
        Begin
          with UMM.GInstitution do
          Begin

            assign(  LcLista[Lc_I], Obj.Institution );

            handleCodeInstitution( Obj.Institution.Codigo );

            LcPar.Estabelecimento := Obj.Institution.Codigo;
            LcStrJSon := TJson.ObjectToJsonString(LcPar);

            LcStrJson := DataCM.SMInstitutionClient.getByKey( LcStrJSon );

            LcInstituion.Obj := TJson.JsonToObject<TObjInstitution>( ZDecompressString(LcStrJson ) ) ;
            LcInstituion.saveDataObjeto( LcInstituion.Obj);

          End;

          LcStrDateTime := formatdatetime('yyyy-mm-dd hh:nn:ss', LcLista[Lc_I].RegistroAlterado);
          LcLasUpdate := StrToDateTimeDef( LcStrDateTime , Now );

          //if LcLasUpdate > 0 then
          //  setLastUpdate('tb_institution','E',LcLista[Lc_I].Codigo, LcLasUpdate);
        End;
      End;
    Except
      on E: Exception do
        GeralogCrashlytics('TLogin.GetInstitution',E.Message);
    End;
  Finally
    //LcLista.Free;
    updateProcess( 'Dados dos Estabelecimentos Baixados.' );
  End;
end;

procedure TLogin.getSalesmanHasStock;
Var
  LcParam : TPrmStockList;
  LcObj : TCtrlMobSalesmanHasStock;
  LcLista : TSalesmanHasStock;
  LcStrJSon : String;
  indice : Integer;
  LcMsg : String;
begin
  Try
    LcObj := TCtrlMobSalesmanHasStock.Create(Self);
    //PArametros da Consulta
    LcParam := TPrmStockList.Create;
    LcParam.Usuario := GbUser;
    LcParam.Vendedor := GbSalesMan;
    LcParam.Tabela.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcParam.UltimaAtualizacao := '0';
    LcStrJSon := TJson.ObjectToJsonString(LcParam);
    LcStrJSon := DataCM.SMStockListClient.getSalesmanStock(LcStrJSon);
    LcLista := TSalesmanHasStock.Create;
    LcLista := TJson.JsonToObject<TSalesmanHasStock>( ZDecompressString( LcStrJSon ) );
    if LcLista.Vendedor > 0 then
    Begin
      Try
        LcObj.ClonarObj(LcLista,LcObj.Registro);
        LcObj.save;
      Except
        on E: Exception do
        Begin
          GeralogCrashlytics('TUpdateTables.UpdateStockSalesman - ',e.Message);
        End;
      end;
    End;
  Finally

  End;
end;

function TLogin.getVendedor(institutionID, userID: integer): Boolean;
Var
  LcObj : TCtrlMobSalesman;
  LcStrJson : String;
  LcObjSalesMan: TObjSalesMan;

begin
  Try
    LcObjSalesMan := TObjSalesMan.create;

    LcObj := TCtrlMobSalesman.Create(Self);
    LcObj.Parametro.Vendedor.Estabelecimento := institutionID;
    LcObj.Parametro.Vendedor.Codigo := userID;
    LcStrJson := TJson.ObjectToJsonString( LcObj.Parametro );

    LcStrJSon := DataCM.SMSalesManClient.getbyKey(LcStrJson);
    LcStrJSon := ZDecompressString(LcStrJSon);
    LcObjSalesMan := TJson.JsonToObject<TObjSalesMan>( LcStrJSon );
    if LcObjSalesMan.Vendedor.Codigo > 0 then
    Begin
      Result := True;
      GbSalesMan := LcObjSalesMan.Vendedor.Codigo;
      //Fiscal
      LcObj.MColaborador.MFiscal.saveDataObjeto(LcObjSalesMan.Fiscal);
      //Colaborador
      LcObj.ClonarObj(LcObjSalesMan.Colaborador,LcObj.MColaborador.Registro);
      LcObj.MColaborador.save;
      //Vendedor
      LcObj.ClonarObj(LcObjSalesMan.Vendedor,LcObj.Registro);
      LcObj.MColaborador.save;
      //SetConfigINI('MOBILE','VENDEDOR',GbSalesMan.ToString);
    End
    else
    Begin
      Result := False;
      SetConfigINI('MOBILE','VENDEDOR','0');
      TDialogService.ShowMessage(
            concat('A T E N Ç Ã O!',
                   Char(10),Char(13),Char(10),Char(13),
                   'Este usuário não foi registrado como vendedor.',
                   Char(10),Char(13),
                   'Verifique e tente novamente.',
                   char(10),Char(13)
                  )
            );
    End;
  Finally

  End;


end;

procedure TLogin.handleCodeInstitution(InstitutionID: Integer);
begin
  with UMM.GInstitution.MFiscal do
  Begin
    Registro.Codigo := InstitutionID;
    delete;
    MFisica.Registro.Codigo := InstitutionID;
    MFisica.delete;
    MJuridica.Registro.Codigo := InstitutionID;
    MJuridica.delete;
    MEndereco.Registro.Codigo := InstitutionID;
    MEndereco.deleteAll;
    MTelefone.Registro.Codigo := InstitutionID;
    MTelefone.deleteAll;
    MEntityHasMailing.Registro.Entidade := InstitutionID;
    MEntityHasMailing.deleteAll;
    MMidiaSocial.Registro.Codigo := InstitutionID;
    MMidiaSocial.deleteAll;
  End;
end;



function TLogin.posAuthentication: boolean;
var
  I:Integer;
  LcObj : TCtrlMobSalesman;
  LcStrJson : String;
  LcObjSalesMan: TObjSalesMan;

  LcCtrlOrder : TCtrlMobOrderSale;
  LcObjOrder : TObjOrderSale;

  LcCtrlInstitution : TCtrlMobInstitution;
  LcCountInts : Integer;
begin
  Result := true;
  updateProcess('Verificando Vendedor');

  LcObjSalesMan := TObjSalesMan.create;

  LcObj := TCtrlMobSalesman.Create(Self);
  LcObj.Parametro.Vendedor.Estabelecimento  := par.Estabelecimento;
  LcObj.Parametro.Vendedor.Codigo           := par.Usuario;

  LcStrJson := TJson.ObjectToJsonString( LcObj.Parametro );
  FSessaoCritica.Enter;
  LcStrJSon := DataCM.SMSalesManClient.getbyKey(LcStrJson);
  FSessaoCritica.Leave;
  LcStrJSon := ZDecompressString(LcStrJSon);
  LcObjSalesMan := TJson.JsonToObject<TObjSalesMan>( LcStrJSon );
  if LcObjSalesMan.Vendedor.Codigo > 0 then
  Begin
    GbSalesMan := LcObjSalesMan.Vendedor.Codigo;
    //Fiscal
    LcObj.MColaborador.MFiscal.saveDataObjeto(LcObjSalesMan.Fiscal);
    //Colaborador
    LcObj.ClonarObj(LcObjSalesMan.Colaborador, LcObj.MColaborador.Registro);
    LcObj.MColaborador.save;
    //Vendedor
    LcObj.ClonarObj(LcObjSalesMan.Vendedor, LcObj.Registro);
    LcObj.save;

    SetConfigINI('MOBILE','VENDEDOR',GbSalesMan.ToString);

    updateProcess('Identificando Estoque');
    getSalesmanHasStock;
  End;
  //Regsitra o Ultimo pedido enviado para a internet;
  LcCtrlOrder := TCtrlMobOrderSale.Create(Self);
  LcCtrlInstitution := TCtrlMobInstitution.Create(self);

  LcCtrlInstitution.getList;
  updateProcess('Consultando Última Venda');
  Result := True;
  //Regsitra o Ultimo pedido enviado para a internet;
  I := 0;
  for I := 0 to (LcCtrlInstitution.Lista.Count - 1) do
  Begin
    Try
      Try
        LcCtrlOrder.clear;
        LcCtrlOrder.Registro.Codigo := LcCtrlInstitution.Lista[I].Codigo;
        if LcCtrlOrder.evazio then
        Begin
          LcCtrlOrder.Parametro.OrdemVenda.Estabelecimento := LcCtrlInstitution.Lista[I].Codigo;
          LcCtrlOrder.Parametro.OrdemVenda.Vendedor        := GbSalesMan;
          LcCtrlOrder.Parametro.OrdemVenda.Terminal        := GbTerminal;
          LcCtrlOrder.Parametro.UltimaAtualizacao          := '';
          LcStrJSon := TJson.ObjectToJsonString( LcCtrlOrder.Parametro );
          LcStrJSon := DataCM.SMOrderSaleClient.getLastOrder(LcStrJSon);

          LcObjOrder := TJson.JsonToObject<TObjOrderSale>( ZDecompressString( LcStrJSon ) );
          updateProcess(concat('Atualizando pedido  - Estb.',LcCtrlOrder.Registro.Codigo.ToString));
          LcCtrlOrder.saveDataObjeto( LcObjOrder );
          //setLastUpdate('tb_order_sale','S', LcCtrlInstitution.Lista[I].Codigo ,now);
        End;
      Except
        on E: Exception do
          GeralogCrashlytics('TLoginApp.setLasOrderSale',E.Message );
      End;
    Finally
      SetConfigINI('MOBILE','LASTORDERID',LcCtrlInstitution.Lista[I].Codigo.ToString);
    End;
  End;
end;

procedure TLogin.SaveInstitution( institution: TInstitution);
Var
  LcStrJSon : String;
begin
  UMM.GInstitution.Parametro.Estabelecimento := institution.Codigo;
  LcStrJSon := TJson.ObjectToJsonString(UMM.GInstitution.Parametro);
  LcStrJson := DataCM.SMInstitutionClient.getByKey( LcStrJSon );

  UMM.GInstitution.Obj := TJson.JsonToObject<TObjInstitution>( ZDecompressString(LcStrJson ));

  UMM.GInstitution.MFiscal.saveDataObjeto(UMM.GInstitution.Obj.Fiscal);
  UMM.GInstitution.ClonarObj(UMM.GInstitution.Obj.Institution,UMM.GInstitution.Registro);
  UMM.GInstitution.save;
end;

procedure TLogin.sb_LoginClick(Sender: TObject);
begin
  if validAuthentication then
  Begin
    if setAuthentication then
    Begin
      LoadMainForm;
    End;
  End;
end;

function TLogin.setAuthentication:boolean;
Var
  LcJSon : String;
begin
  Try
    Result := False;
    //Desabilita o Botão
    Par.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    Par.email           := E_Email.Text;
    Par.password        := E_Password.Text;
    Par.NomeUsuario     := GbNameUser;
    Par.NomeEmpresa     := GbNameEmpresa;
    Par.Usuario         := GbUser;

    LcJSon := TJson.ObjectToJsonString(Par);
    FSessaoCritica.Enter;
    LcJSon := AuthCM.SMClient.GetAuthentication(LcJSon);
    FSessaoCritica.Leave;
    Par := TJson.JsonToObject<TPrmAuthLogin>(LcJson);
    Result := Par.Resultado;
    if Par.Resultado then
    begin
      setVariables;
      updateProcess('Validando dispositivo');
      if ValidateDevice(Par.Dispositivo) then
      Begin
        //Consulta quantos estabelecimentos o usuario está registrado
        updateProcess('Consultando Estabelecimentos');
        if validaGetInstitution then
          GetInstitution;
        posAuthentication;
      End;
    end
    else
    BEgin
      TDialogService.PreferredMode := TDialogService.TPreferredMode.Platform;
      TDialogService.ShowMessage(
            concat('A T E N Ç Ã O!',
                   Char(10),Char(13),Char(10),Char(13),
                   'Usuário ou senha inválidos.',
                   Char(10),Char(13),
                  'Verifique e tente novamente'
                  )
            );
    End;
  Except
    on E: Exception do
      GeralogCrashlytics('TLogin.setAuthentication',E.Message);
  End;
end;

function TLogin.setLasOrderSale(InstitutionID: Integer): Boolean;
Var
  LcObj : TCtrlMobOrderSale;
  LcStrJSon : String;
  Lc_obj_order : TObjOrderSale;
begin
  Try
    Try
     //Regsitra o Ultimo pedido enviado para a internet;
      LcObj := TCtrlMobOrderSale.Create(Self);
      LcObj.Registro.Codigo := InstitutionID;
      if LcObj.evazio then
      Begin
        LcObj.Parametro.OrdemVenda.Estabelecimento := InstitutionID;
        LcObj.Parametro.OrdemVenda.Vendedor        := GbSalesMan;
        LcObj.Parametro.OrdemVenda.Terminal        := GbTerminal;
        LcObj.Parametro.UltimaAtualizacao          := '';
        LcStrJSon := TJson.ObjectToJsonString( LcObj.Parametro );
        LcStrJSon := DataCM.SMOrderSaleClient.getLastOrder(LcStrJSon);

        Lc_obj_order := TObjOrderSale.Create;
        Lc_obj_order := TJson.JsonToObject<TObjOrderSale>( ZDecompressString( LcStrJSon ) );


        Lc_obj_order.OrderSale.Vendedor := GbSalesMan;
        updateProcess(concat('Atualizando pedido  - Estb.',IntToStr(InstitutionID)));
        LcObj.saveDataObjeto( Lc_obj_order );
        //setLastUpdate('tb_order_sale','S', LcObj.Obj.Estabelecimento,now);
      End;
    Except
      on E: Exception do
        GeralogCrashlytics('TLoginApp.setLasOrderSale',E.Message );
    End;
  Finally
    SetConfigINI('MOBILE','LASTORDERID',IntToStr(InstitutionID));
  End;
end;

procedure TLogin.setVariables;
begin
  GbUser := Par.Usuario;
  UMM.GInstitution.Registro.Codigo := Par.Estabelecimento;
  GbTerminal := Par.Dispositivo;
  GbNameUser := Par.NomeUsuario;
  GbNameEmpresa := Par.NomeEmpresa;
  SetConfigINI('MOBILE','LOGADO','S');
  if chbx_trust_it.IsChecked then
  Begin
    SetConfigINI('MOBILE','EMAIL',E_Email.Text);
    SetConfigINI('MOBILE','PASS',E_Password.Text);
    SetConfigINI('MOBILE','TRUST','S');
    SetConfigINI('MOBILE','NAMEUSER',GbNameUser);
    SetConfigINI('MOBILE','GBUSER',IntToStr(GbUser));
    SetConfigINI('MOBILE','GInstitution',IntToStr(UMM.GInstitution.Registro.Codigo));
    SetConfigINI('MOBILE','GBNAMEEMPRESA',Par.NomeEmpresa);
    SetConfigINI('MOBILE','GBTERMINAL',IntToStr(GbTerminal));
  End
  else
  Begin
    SetConfigINI('MOBILE','EMAIL','');
    SetConfigINI('MOBILE','PASS','');
    SetConfigINI('MOBILE','TRUST','N');
    SetConfigINI('MOBILE','NAMEUSER','0');
    SetConfigINI('MOBILE','GBUSER','0');
    SetConfigINI('MOBILE','GInstitution','0');
    SetConfigINI('MOBILE','GBTERMINAL','0');
    SetConfigINI('MOBILE','GBNAMEEMPRESA','');
  End;

end;

function TLogin.validaGetInstitution: Boolean;
begin
  Result := True;
  if GbUser = 0 then
  Begin
    TDialogService.PreferredMode := TDialogService.TPreferredMode.Platform;
    TDialogService.ShowMessage(
          concat('A T E N Ç Ã O!',
                 Char(10),Char(13),Char(10),Char(13),
                 'Não foi possivel localizar o usuário',
                 Char(10),Char(13),
                 'Feche o aplicativo e acesse novamente.',
                 char(10),Char(13)
                )
          );
  End;
end;

function TLogin.ValidateDevice(Id: Integer): Boolean;
begin
  Result := True;
  if ID = 0 then
  Begin
    Result := False;
    TDialogService.PreferredMode := TDialogService.TPreferredMode.Platform;
    TDialogService.ShowMessage(
          concat('A T E N Ç Ã O!',
                 Char(10),Char(13),Char(10),Char(13),
                 'Não foi registrado o dispotivo no Servidor',
                 Char(10),Char(13),
                 'Solicite ao Administrador este registro.',
                 char(10),Char(13)
                )
          );
  End;
end;

function TLogin.validAuthentication: Boolean;
begin
  Result := True;
  if not verificaConexaoServidor then
  BEgin
    Result := False;
    exit;
  End;

  TDialogService.PreferredMode := TDialogService.TPreferredMode.Platform;
  //Valida o conteudo do campo email
  if (E_Email.Text = '') then
  begin
    TDialogService.ShowMessage(
            concat('A T E N Ç Ã O!',
                  Char(10),Char(13),Char(10),Char(13),
                  'Campo e-mail não informado.',
                  Char(10),Char(13),
                  'Verifique e tente novamente'
            )
    );
    Result := False;
    exit;
  end;

  //Valida o conteudo do campo Senha
  if (E_Password.Text = '') then
  Begin
    TDialogService.ShowMessage(
           concat('A T E N Ç Ã O!',
                  Char(10),Char(13),Char(10),Char(13),
                  'Campo senha não informado.',
                  Char(10),Char(13),
                  'Verifique e tente novamente'
                 )
    );
    Result := False;
    exit;
  end;

  if not showProcess('Efetuando o Login') then
  Begin
    Result := False;
    exit;
  End;
end;



end.


